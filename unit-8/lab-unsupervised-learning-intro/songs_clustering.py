import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import pandas as pd
import time 
from dotenv import load_dotenv
import os
import warnings
warnings.filterwarnings("ignore")

### Set up spotify credentials
# Get dotenv environment
load_dotenv() 

# Set up id & secret key
client_id = os.getenv("client_id")
client_secret = os.getenv("client_secret")

# Initialize SpotiPy with user credentials
sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id=client_id, client_secret=client_secret))

########## PART I: GET FEATURES | PREPARE DATA ##########

### Create functions to retrive audio features
def get_audio_features(playlist_id):
    
    """
    This function returns audio features from the given a playlist_id on spotify
    """
    # Get 50 tracks from playlist
    playlist = sp.user_playlist_tracks("spotify", playlist_id)
    
    # Extract track_id, title, artist_id, artist_name
    track_ids = [playlist['items'][i]['track']['id'] for i in range(playlist['total'])]
    title = [playlist['items'][i]['track']['name'] for i in range(playlist['total'])]
    
    artist_id = [playlist['items'][i]['track']['artists'][0]['id'] for i in range(playlist['total'])]
    artist_name = [playlist['items'][i]['track']['artists'][0]['name'] for i in range(playlist['total'])]
    
    # extract the audio features
    audio_features = sp.audio_features(track_ids)
    
    # store audio features in a dataframe
    df = pd.DataFrame(audio_features)
    df['title'] = title
    df['artist_id'] = artist_id
    df['artist_name'] = artist_name
    
    return df

def audio_features_multiple_playlist_to_df(playlist_id_list):
    """
    In case you have multiple playlist,
    this function takes an argument of a list of playlist_id &
    return audio features dataframe
    """
    
    df_results = []
    df_result = pd.DataFrame()
    
    for playlist_id in playlist_id_list:
        playlist_id = get_audio_features(playlist_id)
        # df_result = pd.concat([df_result, playlist_id])
        df_results.append(playlist_id)
        time.sleep(10)
    
    for result in df_results:
        df_result = df_result.append(result)
        
    return df_result



### Set up multiple playlists that we will retrieve the data
viral50 = "37i9dQZEVXbLiRSasKsNU9"
top50_daily = "37i9dQZEVXbMDoHDwVN2tF"
top50_weekly = "37i9dQZEVXbNG2KDcFcKOF"
playlist_list = [viral50, top50_daily, top50_weekly]

# Calling the function & get a dataframe of audio features
df_result = audio_features_multiple_playlist_to_df(playlist_list)


### Load dataset from other sources (previous lab) to get more songs
df = pd.concat(map(pd.read_csv, ['audio_features_249.csv', 
                                 'audio_features_viralhits_200.csv',
                                 'audio_features_viralhits_75.csv']))
df.reset_index(drop=True)

# Concat the dataset we have got from the previous lab together
df = pd.concat([df, df_result]).reset_index(drop=True)

# Drop duplicated rows
df = df.drop_duplicates().reset_index(drop=True)
print(f"We have total {len(df)} songs with audio_features for clustering")




#### EXTRA PART: WRITE A FUNCTION TO GET AUDIO FEATURES FROM A LIST OF SONGS ####
# Get dataframe from billboard hot 100 list
df_bb_hot100 = pd.read_csv("billboard_hot100.csv")

# Create a function to retrieve audio features from list of songs
def get_audio_features_from_song_list(song_list):
    
    """
    This function returns audio features from the given a list of songs
    """
    
    track_ids =[]
    title = []
    artist_id =[]
    artist_name = []
    df = pd.DataFrame()
    
    # Search & retrieve track_id for each song
    for song in song_list:
        results = sp.search(q=f'track{song}', limit=1)
        time.sleep(5)
            
        track_ids += [results['tracks']['items'][0]['id']]
        title += [results['tracks']['items'][0]['name']]
        artist_id += [results['tracks']['items'][0]['artists'][0]['id']]
        artist_name += [results['tracks']['items'][0]['artists'][0]['name']]
    
    for track_id in track_ids:
        features = sp.audio_features(track_id)
        df_features = pd.DataFrame(features)
        df = pd.concat([df, df_features]).reset_index(drop=True)
        time.sleep(5)
        
    df['title'] = title
    df['artist_id'] = artist_id
    df['artist_name'] = artist_name
        
    return df

# Calling the function and get the audio features dataframe
df_bb_features = get_audio_features_from_song_list(df_bb_hot100['Song'])



########## PART II: SONGS CLUSTERING ##########
# Import Libraries
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import pairwise_distances_argmin_min
from sklearn.metrics import silhouette_score
from yellowbrick.cluster import KElbowVisualizer, SilhouetteVisualizer
from matplotlib import pyplot as plt


# Define function to check silhouette score --> we'll use this later on
def silhouette_check(df, n_cluster_range):
    """
    This function gives silhouette score from the kmeans model,
    helps to find out the best number of the cluster to apply in the model
    """
    for n in n_cluster_range:
        km = KMeans(n_clusters=n, random_state=42)
        km.fit(df)
        clusters = km.predict(df)
        score = round(silhouette_score(df, km.labels_, metric='euclidean'), 4)
        print(f"silhouette_score for {n} clusters", score)


# Define function to find optimal number of clusters for KMeans model
def finding_optimal_number_of_cluster(df, range_begin_to_end):
    
    """

    This function take a dataframe and a range of n_cluster.
    It returns Elbow plot, Silhouette score, and Silhouette plot.
    
    Note: data will be automatically scaled using StandardScaler()

    """
    # select columns (features) for clustering
    X = df[df.columns[:11]]  # or df.iloc[:, :11]

    # Standardize the data
    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)
    X_scaled = pd.DataFrame(X_scaled, columns=X.columns)
    
    print("_____________________", "\n")
    print("ELBOW ANALYSIS: ", "\n")
    
    ### Elbow analysis
    visualizer = KElbowVisualizer(KMeans(random_state=42), k=range(2,16))
    visualizer.fit(X_scaled)    # Fit the data to the visualizer
    visualizer.poof()   # Draw/show/poof the data
    
    print("_____________________", "\n")
    print("SILHOUETTE ANALYSIS: ", "\n")
    
    # Calling function to check Silhouette score
    silhouette_score = silhouette_check(X_scaled, range_begin_to_end)
    print(silhouette_score)
    
    import math
    n_axes = len(range_begin_to_end)
    rows_subplot = math.ceil(n_axes/2)
    height = rows_subplot*2
    width = (height/2)*1.5
    
    fig, ax = plt.subplots(rows_subplot, 2, figsize=(width, height))
    for i in range_begin_to_end:
        '''
        Create KMeans instance for different number of clusters
        '''
        km = KMeans(n_clusters=i, init='k-means++', n_init=10, max_iter=100, random_state=42)
        q, mod = divmod(i, 2)
        '''
        Create SilhouetteVisualizer instance with KMeans instance
        Fit the visualizer
        '''
        visualizer = SilhouetteVisualizer(km, colors='yellowbrick', ax=ax[q-1][mod])
        visualizer.fit(X_scaled)


# Calling the function for the Billboard dataset
finding_optimal_number_of_cluster(df_bb_features, range(2, 16))



##### APPLY KMEANS CLUSTERING MODEL WITH OPTIMAL NUMBER OF CLUSTERS (K) #####
# From previous step, we could already have 

# Clustering songs using Kmeans
kmeans = KMeans(n_clusters=3, random_state=42)
kmeans.fit(X_scaled)
clusters = kmeans.predict(X_scaled)

#create new dataframe with title, artist and cluster assigned
df_clustered = pd.DataFrame(X_scaled)
df_clustered['song_name'] = df['title']
df_clustered['artist'] = df['artist_name']
df_clustered['cluster'] = clusters




##### PART III: BUILDING A SIMPLE SONG RECOMMENDER PROTOTYPE ##### 

def recommend_song():
    
    """
    This function will recommend a song for the user.
    If it's on Billboard hot 100, you'll get a random song on the Billboard,
    if not, you'll get a song in the same cluster from spotify 
    """
    
    input_h = input("Pick your favorite song: ")
    
    # Try random song on billboard hot 100
    try: 
        if df_bb_hot100['Song'].str.contains(input_h, case=False).any():
            rec = df_bb_hot100.sample(1)
            song_title = rec['Song'].tolist()[0]
            artist = rec['Artist'].tolist()[0]
            print("[RECOMMEND SONG]")
            return ' - '.join([song_title, artist])
    except:
        return input_h
    
    # If not on the Billboard, find similar taste on spotify
    else:
        # get song id from user
        song_name = input_h
        results = sp.search(q=f'track:{song_name}', limit=1)
        track_id = results['tracks']['items'][0]['id']

        # get song features with the obtained id
        audio_features = sp.audio_features(track_id)

        # converting it into a dataframe
        df_ = pd.DataFrame(audio_features)
        new_features = df_[X.columns]

        # scaling the audio features
        scaled_x = scaler.transform(new_features)

        # assign the cluster to the given song
        cluster = kmeans.predict(scaled_x)

        # take another close song in the same cluster to recommend
        filtered_df = df_clustered[df_clustered['cluster'] == cluster[0]][X.columns]
        closest, _ = pairwise_distances_argmin_min(scaled_x, filtered_df)

        # return it in a readable way
        print('\n [RECOMMENDED SONG]')
        return ' - '.join([df_clustered.loc[closest]['song_name'].values[0], df_clustered.loc[closest]['artist'].values[0]])

# Calling function 
recommend_song()


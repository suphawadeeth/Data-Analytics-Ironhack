# Instructions: set-up

## 1. Upload streamlitmola.yml and Instructions.md


## 2. Go to the terminal
On your PyCharm editor, go to the terminal icon on the lower left bar.

## 3. Create file main.py

```bash
touch main.py
```

## 4. Creating an environment from a yml file
```bash
 conda env create -f streamlitmola.yml
```

## 5. Activating environment
```bash
conda activate streamlitmola
```

## 6. Making it work
```bash
streamlit run main.py
```
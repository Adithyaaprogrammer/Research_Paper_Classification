# Research_Paper_Classification
## IIT KGP Machine Learning Hackathon

## Overview
This project was completed as part of the **IIT KGP Machine Learning Hackathon**. The challenge consisted of two tasks: 
1. **Research Paper Publishability Assessment** – Predict whether a research paper is publishable or not.
2. **Conference Selection** – Determine the most suitable conference for publishable research papers.

---

## Task 1: Research Paper Publishability Assessment

### Approach
1. **Data Preparation**:
   - Converted the provided dataset into a DataFrame.
   - Paraphrased the dataset to create 177 samples labeled `1` (publishable) or `0` (non-publishable).
   - Split the dataset into train and test sets using Stratified Shuffle Split.

2. **Model Implementations**:
   - **ModerBERT**:
     - Attempted to use `MoritzLaurer/mDeBERTa-v3-base-xnli-multilingual-nli-2mil7`.
     - Achieved high F1 scores during training but faced inconsistent results on unseen data.
   - **BiLSTM RNN**:
     - Used to capture the sequence information.
     - Faced limitations due to insufficient data.
   - **Linear SVC**:
     - Selected as the final model due to its simplicity and effectiveness for small datasets.
     - Text preprocessing included removing stopwords using NLTK and applying TF-IDF vectorization.
     - Achieved a Precision of 0.5 and an F1 Score of 0.667.
     - Predictions were saved in a CSV file (`Prediction.csv`).

---

## Task 2: Conference Selection

### Approach
1. **Data Processing**:
   - Used predictions from Task 1 to filter publishable papers.
   - Extracted and preprocessed text data from research papers using bash commands and TF-IDF vectorization.

2. **Model Implementation**:
   - Developed an SVC model with a “linear” kernel and balanced weights.
   - Generated a DataFrame (`final_df`) containing:
     - PDF File Name
     - Prediction (publishable or not)
     - Suggested Conference

### Results
- Conferences predicted:
  - CVPR: 50 papers
  - EMNLP: 46 papers
  - NeurIPS: 18 papers
  - KDD: 1 paper
- No results for TMLR due to overlaps with other conferences.

---

## Prerequisites

### Requirements
1. Install Python (version 3.8 or later).
2. Install the required dependencies using the command:
   ```bash
   pip install -r requirements.txt
   ```
   Ensure libraries like `scikit-learn`, `nltk`, `torch`, and `transformers` are included.

#### 3. **Docker Setup**
   - Build the Docker image:
     ```bash
     docker build -t hackathon-project .
     ```
   - Run the Docker container:
     ```bash
     docker run -v $(pwd):/app -it hackathon-project
     ```

---

## Challenges & Future Work
1. Limited dataset size impacted the performance of complex models like BiLSTM.
2. Integration issues with Pathway Google Drive Connector in Docker.
3. Future enhancements:
   - Explore ensemble models like KNN, Naive Bayes, and XGBoost for better results.
   - Develop a web interface for user interaction.

---

## Technologies & Libraries Used
- **Programming Languages**: Python
- **Libraries**:
  - NLP: NLTK, Transformers, TF-IDF Vectorizer
  - Machine Learning: scikit-learn, PyTorch
- **Other Tools**:
  - Pathway Framework
  - Docker
  - gdown for Google Drive integration

---

## File Structure
- `Prediction.csv`: Contains predictions for publishable papers.
- Code files for preprocessing, model training, and evaluation.

---

## Conclusion
- Successfully classified 115 papers as publishable and 20 as non-publishable.
- Identified conferences for 115 publishable papers with a focus on CVPR, EMNLP, and NeurIPS.

---

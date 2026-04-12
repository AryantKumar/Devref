import '../models/snippet.dart';

List<Snippet> getMlSnippets() {
  return [
    // 1. Introduction to ML (3)
    Snippet()..snippetId='ml_001'..topicId='ml'..title='What is Machine Learning'..description='Field of AI where computers learn from data without explicit programming.'..code='''"ML is the science of getting computers to act without being explicitly programmed." - Andrew Ng'''..language='text'..difficulty='very_easy'..section='Introduction to ML'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_002'..topicId='ml'..title='Types of ML'..description='Supervised (labeled), Unsupervised (unlabeled), Reinforcement (rewards).'..code='''- Supervised: Classification, Regression
- Unsupervised: Clustering, PCA
- Reinforcement: Reward-based learning'''..language='text'..difficulty='very_easy'..section='Introduction to ML'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_003'..topicId='ml'..title='ML Pipeline'..description='Workflow: Collection -> Prep -> Train -> Eval -> Deploy.'..code='''1. Data Collection
2. Cleaning & Prep
3. Model Selection
4. Training
5. Evaluation
6. Deployment'''..language='text'..difficulty='very_easy'..section='Introduction to ML'..isSaved=false..lastViewedAt=null,

    // 2. Data Preprocessing (4)
    Snippet()..snippetId='ml_004'..topicId='ml'..title='Missing Values'..description='Imputing missing data using Mean/Median/Mode strategy.'..code='''from sklearn.impute import SimpleImputer
imputer = SimpleImputer(strategy='mean')
X = imputer.fit_transform(X)'''..language='python'..difficulty='easy'..section='Data Preprocessing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_005'..topicId='ml'..title='Encoding (One-Hot)'..description='Converting categorical variables into binary vectors.'..code='''import pandas as pd
df = pd.get_dummies(df, columns=['category'])'''..language='python'..difficulty='easy'..section='Data Preprocessing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_006'..topicId='ml'..title='Feature Scaling'..description='Normalization (0-1) and Standardization (mean 0, std 1).'..code='''from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)'''..language='python'..difficulty='easy'..section='Data Preprocessing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_007'..topicId='ml'..title='Train/Test Split'..description='Splitting data to evaluate model performance.'..code='''from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)'''..language='python'..difficulty='easy'..section='Data Preprocessing'..isSaved=false..lastViewedAt=null,

    // 3. Feature Engineering (3)
    Snippet()..snippetId='ml_008'..topicId='ml'..title='Feature Selection'..description='Selecting most relevant features using SelectKBest.'..code='''from sklearn.feature_selection import SelectKBest, f_classif
selector = SelectKBest(score_func=f_classif, k=10)
X_new = selector.fit_transform(X, y)'''..language='python'..difficulty='medium'..section='Feature Engineering'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_009'..topicId='ml'..title='Feature Extraction (Polynomial)'..description='Generating interaction and polynomial features.'..code='''from sklearn.preprocessing import PolynomialFeatures
poly = PolynomialFeatures(degree=2)
X_poly = poly.fit_transform(X)'''..language='python'..difficulty='medium'..section='Feature Engineering'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_010'..topicId='ml'..title='Dimensionality Reduction (PCA)'..description='Reducing feature count while preserving variance.'..code='''from sklearn.decomposition import PCA
pca = PCA(n_components=2)
X_reduced = pca.fit_transform(X)'''..language='python'..difficulty='medium'..section='Feature Engineering'..isSaved=false..lastViewedAt=null,

    // 4. Regression Models (3)
    Snippet()..snippetId='ml_011'..topicId='ml'..title='Linear Regression'..description='Predicting continuous values.'..code='''from sklearn.linear_model import LinearRegression
model = LinearRegression().fit(X, y)'''..language='python'..difficulty='easy'..section='Regression Models'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_012'..topicId='ml'..title='Polynomial Regression'..description='Fitting non-linear data using polynomial features.'..code='''from sklearn.pipeline import make_pipeline
model = make_pipeline(PolynomialFeatures(2), LinearRegression())
model.fit(X, y)'''..language='python'..difficulty='medium'..section='Regression Models'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_013'..topicId='ml'..title='Ridge/Lasso Regression'..description='Regularization to prevent overfitting.'..code='''from sklearn.linear_model import Ridge, Lasso
ridge = Ridge(alpha=1.0).fit(X, y)
lasso = Lasso(alpha=0.1).fit(X, y)'''..language='python'..difficulty='medium'..section='Regression Models'..isSaved=false..lastViewedAt=null,

    // 5. Classification Models (5)
    Snippet()..snippetId='ml_014'..topicId='ml'..title='Logistic Regression'..description='Binary classification using sigmoid function.'..code='''from sklearn.linear_model import LogisticRegression
clf = LogisticRegression().fit(X, y)'''..language='python'..difficulty='easy'..section='Classification Models'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_015'..topicId='ml'..title='Decision Tree'..description='Classification based on feature splits.'..code='''from sklearn.tree import DecisionTreeClassifier
tree = DecisionTreeClassifier().fit(X, y)'''..language='python'..difficulty='medium'..section='Classification Models'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_016'..topicId='ml'..title='Random Forest'..description='Ensemble of decision trees.'..code='''from sklearn.ensemble import RandomForestClassifier
rf = RandomForestClassifier(n_estimators=100).fit(X, y)'''..language='python'..difficulty='medium'..section='Classification Models'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_017'..topicId='ml'..title='SVM (Support Vector Machine)'..description='Finding optimal hyperplane for separation.'..code='''from sklearn.svm import SVC
svm = SVC(kernel='linear').fit(X, y)'''..language='python'..difficulty='hard'..section='Classification Models'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_018'..topicId='ml'..title='KNN (K-Nearest Neighbors)'..description='Classification based on closest neighbors.'..code='''from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(n_neighbors=5).fit(X, y)'''..language='python'..difficulty='easy'..section='Classification Models'..isSaved=false..lastViewedAt=null,

    // 6. Clustering (3)
    Snippet()..snippetId='ml_019'..topicId='ml'..title='K-Means'..description='Partitioning data into K clusters.'..code='''from sklearn.cluster import KMeans
kmeans = KMeans(n_clusters=3).fit(X)'''..language='python'..difficulty='medium'..section='Clustering'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_020'..topicId='ml'..title='Hierarchical Clustering'..description='Building a hierarchy of clusters.'..code='''from sklearn.cluster import AgglomerativeClustering
agg = AgglomerativeClustering(n_clusters=3).fit(X)'''..language='python'..difficulty='hard'..section='Clustering'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_021'..topicId='ml'..title='DBSCAN'..description='Density-based spatial clustering.'..code='''from sklearn.cluster import DBSCAN
db = DBSCAN(eps=0.5, min_samples=5).fit(X)'''..language='python'..difficulty='hard'..section='Clustering'..isSaved=false..lastViewedAt=null,

    // 7. Model Evaluation (4)
    Snippet()..snippetId='ml_022'..topicId='ml'..title='Accuracy Score'..description='Fraction of correct predictions.'..code='''from sklearn.metrics import accuracy_score
score = accuracy_score(y_true, y_pred)'''..language='python'..difficulty='very_easy'..section='Model Evaluation'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_023'..topicId='ml'..title='Precision/Recall'..description='Evaluating classification quality.'..code='''from sklearn.metrics import precision_score, recall_score
p = precision_score(y_true, y_pred)
r = recall_score(y_true, y_pred)'''..language='python'..difficulty='medium'..section='Model Evaluation'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_024'..topicId='ml'..title='Confusion Matrix'..description='Table showing true vs predicted classes.'..code='''from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_true, y_pred)'''..language='python'..difficulty='easy'..section='Model Evaluation'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_025'..topicId='ml'..title='Cross Validation'..description='Testing model stability.'..code='''from sklearn.model_selection import cross_val_score
scores = cross_val_score(model, X, y, cv=5)'''..language='python'..difficulty='medium'..section='Model Evaluation'..isSaved=false..lastViewedAt=null,

    // 8. Deep Learning (4)
    Snippet()..snippetId='ml_026'..topicId='ml'..title='Neural Network (Keras)'..description='Building a sequential model.'..code='''from tensorflow.keras import layers, Sequential
model = Sequential([layers.Dense(64, activation='relu'), layers.Dense(1, activation='sigmoid')])'''..language='python'..difficulty='hard'..section='Deep Learning'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_027'..topicId='ml'..title='Activation Functions'..description='ReLU, Sigmoid, Softmax and Tanh.'..code='''layers.Dense(64, activation='relu')
layers.Dense(10, activation='softmax')'''..language='python'..difficulty='medium'..section='Deep Learning'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_028'..topicId='ml'..title='Loss Functions'..description='Binary Crossentropy, MSE, Categorical Crossentropy.'..code='''model.compile(loss='binary_crossentropy', optimizer='adam')'''..language='python'..difficulty='medium'..section='Deep Learning'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_029'..topicId='ml'..title='Backpropagation'..description='Gradient descent to minimize loss function.'..code='''# Core concept: chain rule to calculate gradients.
optimizer = tf.keras.optimizers.Adam(learning_rate=0.01)'''..language='python'..difficulty='very_hard'..section='Deep Learning'..isSaved=false..lastViewedAt=null,

    // 9. NLP (3)
    Snippet()..snippetId='ml_030'..topicId='ml'..title='Tokenization'..description='Breaking text into tokens.'..code='''from nltk.tokenize import word_tokenize
tokens = word_tokenize("Hello ML")'''..language='python'..difficulty='easy'..section='NLP'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_031'..topicId='ml'..title='TF-IDF'..description='Weighting words by importance.'..code='''from sklearn.feature_extraction.text import TfidfVectorizer
v = TfidfVectorizer().fit_transform(corpus)'''..language='python'..difficulty='medium'..section='NLP'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_032'..topicId='ml'..title='Word Embeddings'..description='Dense vector representation of words.'..code='''from gensim.models import Word2Vec
model = Word2Vec(sentences, vector_size=100)'''..language='python'..difficulty='hard'..section='NLP'..isSaved=false..lastViewedAt=null,

    // 10. Time Series (2)
    Snippet()..snippetId='ml_033'..topicId='ml'..title='ARIMA'..description='Autoregressive Integrated Moving Average.'..code='''from statsmodels.tsa.arima.model import ARIMA
model = ARIMA(data, order=(5,1,0)).fit()'''..language='python'..difficulty='hard'..section='Time Series'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_034'..topicId='ml'..title='Forecasting Basics'..description='Predicting future points in a series.'..code='''pred = model.forecast(steps=10)'''..language='python'..difficulty='medium'..section='Time Series'..isSaved=false..lastViewedAt=null,

    // 11. Model Deployment (3)
    Snippet()..snippetId='ml_035'..topicId='ml'..title='Saving Model (Pickle)'..description='Serializing for production.'..code='''import pickle
pickle.dump(model, open('model.pkl', 'wb'))'''..language='python'..difficulty='easy'..section='Model Deployment'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_036'..topicId='ml'..title='REST API (Flask)'..description='Serving model predictions via HTTP.'..code='''@app.route('/predict', methods=['POST'])
def predict(): return {'res': model.predict(request.json)}'''..language='python'..difficulty='medium'..section='Model Deployment'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_041'..topicId='ml'..title='Docker Basics'..description='Containerizing ML applications for consistent deployment.'..code='''# Dockerfile
FROM python:3.9
COPY . /app
RUN pip install -r requirements.txt
CMD ["python", "app.py"]'''..language='dockerfile'..difficulty='medium'..section='Model Deployment'..isSaved=false..lastViewedAt=null,

    // 12. Hyperparameter Tuning (3)
    Snippet()..snippetId='ml_037'..topicId='ml'..title='Grid Search'..description='Exhaustive search over parameters.'..code='''from sklearn.model_selection import GridSearchCV
gs = GridSearchCV(model, param_grid={'C': [1, 10]}).fit(X, y)'''..language='python'..difficulty='medium'..section='Hyperparameter Tuning'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_038'..topicId='ml'..title='Random Search'..description='Random samples over parameter space.'..code='''from sklearn.model_selection import RandomizedSearchCV
rs = RandomizedSearchCV(model, params, n_iter=10).fit(X, y)'''..language='python'..difficulty='medium'..section='Hyperparameter Tuning'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_042'..topicId='ml'..title='Bayesian Optimization'..description='Efficient global optimization of black-box functions.'..code='''from skopt import BayesSearchCV
opt = BayesSearchCV(model, search_spaces, n_iter=32)
opt.fit(X, y)'''..language='python'..difficulty='hard'..section='Hyperparameter Tuning'..isSaved=false..lastViewedAt=null,

    // 13. Advanced Topics (3)
    Snippet()..snippetId='ml_039'..topicId='ml'..title='Reinforcement Learning'..description='Agent learning via rewards and penalties.'..code='''# Q-Learning key update rule:
Q[s,a] = Q[s,a] + lr * (r + gamma * max(Q[s',:]) - Q[s,a])'''..language='python'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_040'..topicId='ml'..title='Transfer Learning'..description='Using pre-trained models for new tasks.'..code='''base_model = tf.keras.applications.MobileNetV2(include_top=False)
base_model.trainable = False'''..language='python'..difficulty='hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ml_043'..topicId='ml'..title='AutoML (PyCaret)'..description='Automating the ML workflow.'..code='''from pycaret.classification import *
setup(data, target='label')
best = compare_models()'''..language='python'..difficulty='medium'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
  ];
}

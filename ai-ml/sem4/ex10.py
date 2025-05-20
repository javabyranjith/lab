# Implement EM for Bayesian networks

from sklearn.cluster import KMeans
from sklearn.datasets import load_iris
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# Load dataset
dataset = load_iris()
X = pd.DataFrame(dataset.data, columns=['Sepal_Length', 'Sepal_Width', 'Petal_Length', 'Petal_Width'])
y = pd.DataFrame(dataset.target, columns=['Targets'])

# Setup for plotting
plt.figure(figsize=(14, 7))
colormap = np.array(['red', 'lime', 'black'])

# Data Distribution Plot
plt.subplot(1, 2, 1)
plt.scatter(X.Petal_Length, X.Petal_Width, c=colormap[y.Targets], s=40)
plt.title('Data Distribution')

# Training the KMeans model
plt.subplot(1, 2, 2)
model = KMeans(n_clusters=3, random_state=42)
model.fit(X)

# KMeans Cluster Plot
predY = np.choose(model.labels_, [0, 1, 2]).astype(np.int64)
plt.scatter(X.Petal_Length, X.Petal_Width, c=colormap[predY], s=40)
plt.title('KMeans Clustering')

plt.show()

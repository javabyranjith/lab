# Implementation Of Neural Network Model

# pip install numpy
# pip install tensorflow



from __future__ import print_function
import numpy as np
import tensorflow as tf
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation
from keras.optimizers import Adam
from keras.utils import np_utils
from emnist import list_datasets, extract_training_samples, extract_test_samples
import matplotlib.pyplot as plt

# Set random seed for reproducibility
np.random.seed(1671)

# Network and training parameters
NB_EPOCH = 30
BATCH_SIZE = 256
VERBOSE = 2
NB_CLASSES = 256  # Number of character classes in EMNIST ByClass
OPTIMIZER = Adam()
N_HIDDEN = 512
VALIDATION_SPLIT = 0.2
DROPOUT = 0.2

# List available datasets
print("Available EMNIST datasets:", list_datasets())

# Load EMNIST ByClass data
X_train, y_train = extract_training_samples('byclass')
X_test, y_test = extract_test_samples('byclass')

print("Train shape:", X_train.shape)
print("Train labels:", y_train.shape)
print("Test shape:", X_test.shape)
print("Test labels:", y_test.shape)

# Reshape images to flat vector
RESHAPED = X_train.shape[1] * X_train.shape[2]
X_train = X_train.reshape(X_train.shape[0], RESHAPED).astype('float32')
X_test = X_test.reshape(X_test.shape[0], RESHAPED).astype('float32')

# Normalize data
X_train /= 255
X_test /= 255

print(X_train.shape[0], 'train samples')
print(X_test.shape[0], 'test samples')

# Convert labels to categorical (one-hot encoding)
Y_train = np_utils.to_categorical(y_train, NB_CLASSES)
Y_test = np_utils.to_categorical(y_test, NB_CLASSES)

# Build model
model = Sequential()
model.add(Dense(N_HIDDEN, input_shape=(RESHAPED,)))
model.add(Activation('relu'))
model.add(Dropout(DROPOUT))

model.add(Dense(256))
model.add(Activation('relu'))
model.add(Dropout(DROPOUT))

model.add(Dense(256))
model.add(Activation('relu'))
model.add(Dropout(DROPOUT))

model.add(Dense(256))
model.add(Activation('relu'))
model.add(Dropout(DROPOUT))

model.add(Dense(NB_CLASSES))
model.add(Activation('softmax'))

# Compile model
model.compile(loss='categorical_crossentropy', optimizer=OPTIMIZER, metrics=['accuracy'])

# Train model
history = model.fit(X_train, Y_train,
                    batch_size=BATCH_SIZE, epochs=NB_EPOCH,
                    verbose=VERBOSE, validation_split=VALIDATION_SPLIT)

# Evaluate model
score = model.evaluate(X_test, Y_test, verbose=VERBOSE)
print("\nTest score:", score[0])
print("Test accuracy:", score[1])

# Plot accuracy
plt.figure(figsize=(12, 5))
plt.subplot(1, 2, 1)
plt.plot(history.history['accuracy'])
plt.plot(history.history['val_accuracy'])
plt.title('Model Accuracy')
plt.ylabel('Accuracy')
plt.xlabel('Epoch')
plt.legend(['Train', 'Validation'], loc='upper left')

# Plot loss
plt.subplot(1, 2, 2)
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.title('Model Loss')
plt.ylabel('Loss')
plt.xlabel('Epoch')
plt.legend(['Train', 'Validation'], loc='upper left')

plt.tight_layout()
plt.show()
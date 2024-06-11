

# read CSV file
import pandas as pd
import pickle
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_squared_error, r2_score
data = pd.read_csv('static/dataset/bctestmew.csv')

# split data into features and target
X = data.drop(columns=['Labels'])
y = data['Labels']

# split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# create Random Forest Regressor with default hyperparameters
rfr = RandomForestRegressor()

# train the model on the training data
rfr.fit(X_train, y_train)

with open("rfmodel.pkl", "wb") as f:
    pickle.dump(rfr,f)
 
# some time later...
 
# load the model from disk
# with open("rfmodel.pkl", "rb") as f:
#     loaded_model = pickle.load(f)
pickled_model = pickle.load(open('rfmodel.pkl', 'rb'))

# make predictions on the test data
y_pred = rfr.predict(X_test)

# calculate accuracy of the model
mse = mean_squared_error(y_test, y_pred)
r2 = r2_score(y_test, y_pred)

# print the accuracy
print(f"Mean Squared Error: {mse}")
print(f"R^2 Score: {r2}")

# ////////////////////////////////////////////////////ANN////////////////////////////////////////////////


import pandas as pd
import numpy as np
import pickle
from sklearn.model_selection import train_test_split
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from sklearn.metrics import mean_squared_error

# read CSV file
data = pd.read_csv('static/dataset/bctestmew.csv')

# split data into features and target
X = data.drop(columns=['Labels'])
y = data['Labels']

# split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# create an ANN model with one hidden layer
model = Sequential()
model.add(Dense(64, activation='relu', input_shape=(X_train.shape[1],)))
model.add(Dense(1))

# compile the model with a mean squared error loss function
model.compile(optimizer='adam', loss='mse')

# train the model on the training data
model.fit(X_train, y_train, epochs=100, batch_size=32)

# with open("annmodel.pkl", "wb") as f:
#     pickle.dump(model,f)
 
# some time later...
 
# load the model from disk
# with open("annmodel.pkl", "rb") as f:
#     loaded_model = pickle.load(f)
# pickled_model = pickle.load(open('annmodel.pkl', 'rb'))


# make predictions on the test data
y_pred = model.predict(X_test)

# calculate mean squared error of the model
mse = mean_squared_error(y_test, y_pred)

# print the mean squared error
print(f"Mean Squared Error: {mse}")

r2 = r2_score(y_test, y_pred)
print(f"R^2 Score: {r2}")


# ///////////////////////////////////////////////////////////// CNN  ////////////////////////////////////////////


from keras.models import Sequential
from keras.layers import Dense
from keras.utils.np_utils import to_categorical

from keras.layers import Conv2D, MaxPooling2D, AveragePooling2D
from keras.layers import Dense, Activation, Dropout, Flatten

import numpy
import csv
#####################################CNN #######################################
dataset = numpy.loadtxt("static/dataset/bctestmews.csv", delimiter=",",skiprows=1)

# split into input (X) and output (Y) variables
# Train Set
X = dataset[:, 0:4]
print(X)
y_int = dataset[:, 4:]
# print("==================outs",y_int)
Y = to_categorical(y_int)
print("===========",type(Y))

# # Test Set
# XTest = datasets[0:200, 0:10]
# ytest_int = datasets[0:200, 10:]
XTest=X
# print(ytest_int)
# yTest = to_categorical(ytest_int)
yTest=Y
# create model
model = Sequential()

model.add(Dense(output_dim=100, init='uniform', activation='relu'   , input_dim=4))
model.add(Dense(output_dim=100 , init='uniform', activation='relu'   , input_dim=100))
model.add(Dense(output_dim=30   , init='uniform', activation='softmax', input_dim=100))
# Compile model
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])


# Fit the model
model.fit(X, Y, nb_epoch=25, batch_size=30)
# evaluate the model
print(yTest)

scores = model.evaluate(XTest, yTest)
print("\n%s: %.2f%%" % (model.metrics_names[1], scores[1] * 100))

# print(dataset[:2200, 0:13])
# # Train Set
# X = dataset[:2200, 0:13]
# y_int = dataset[:2200, 14:]
# Y = to_categorical(y_int)
# # Test Set
# # XTest = dataset[2080:, 0:10]
# # ytest_int = dataset[2080:, 10:]
# # print(ytest_int)
# # yTest = to_categorical(ytest_int)
# XTest=X

# yTest=Y
# # Fit the model
# model.fit(X, Y, nb_epoch=25, batch_size=6)
# # evaluate the model
# scores = model.evaluate(XTest, yTest)
# print("\n%s: %.2f%%" % (model.metrics_names[1], scores[1] * 100))

cnnaccu=scores[1] * 100
# # #Only code needed to save model
# model_json = model.to_json()
# with open("model.json", "w") as json_file:
#     json_file.write(model_json)
# model.save_weights("model.h5")
# /////////////////////////////////////////// LSTM ////////////////////

import numpy as np
from keras.utils.np_utils import to_categorical
import keras
from keras.models import Sequential
from keras.layers import Dense, LSTM
from keras.utils import to_categorical
import pandas as pd

dataset = np.loadtxt("static/dataset/bctestmew.csv", delimiter=",",skiprows=1)

# split into input (X) and output (Y) variables
# Train Set
X = dataset[:, 0:4]
print((X))
y_int = dataset[:, 4:]
# print("==================outs",y_int)
Y = to_categorical(y_int)
print("===========",(Y))
X = np.reshape(X, (X.shape[0], 1, X.shape[1]))


model = Sequential()
model.add(LSTM(32, input_shape=(X.shape[1],X.shape[2])))
model.add(Dense(10, activation='softmax'))

# # Compile model
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])

# # Fit model on training data
model.fit(X, Y, epochs=200, batch_size=70)

# # Evaluate model on validation data
loss, lstmaccuracy = model.evaluate(X, Y)
# print("Validation Loss: ", loss)
print("Validation Accuracy: ", lstmaccuracy)

# # Use model to make predictions on new data
# predictions = model.predict(X)
# print(predictions)
# print(y)
# predicted = np.array(predictions)

# //////////////////////////////////////////  BI LSTM  //////////////////////////////////////////////////


# import numpy as np
# import pandas as pd
# from tensorflow.keras.models import Sequential
# from tensorflow.keras.layers import Embedding, Bidirectional, LSTM, Dense
# from tensorflow.keras.preprocessing.sequence import pad_sequences
# from tensorflow.keras.preprocessing.text import Tokenizer
# from sklearn.model_selection import train_test_split

# # Set the parameters for the model
# max_features = 174991   # Number of words to consider as features
# max_length = 14      # Maximum sequence length
# embedding_dim = 50    # Dimensionality of word embeddings
# hidden_units = 64     # Number of units in the hidden layer
# dropout_rate = 0.5    # Dropout rate for regularization

# # Load the data from the CSV file
# data = pd.read_csv('ndtv_data_finalss.csv')


# x = data.drop(columns=['label'])
# y = data['label']

# # Split the data into train and test sets
# x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)

# # Build the BiLSTM model
# model = Sequential()
# model.add(Embedding(max_features, embedding_dim, input_length=max_length))
# model.add(Bidirectional(LSTM(hidden_units, dropout=dropout_rate, return_sequences=True)))
# model.add(Bidirectional(LSTM(hidden_units, dropout=dropout_rate)))
# model.add(Dense(1, activation='sigmoid'))

# # Compile the model
# model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# # Train the model
# model.fit(x_train, y_train, batch_size=64, epochs=10, validation_data=(x_test, y_test))

# # Evaluate the model
# loss, accuracy = model.evaluate(x_test, y_test)
# print(f'Test Loss: {loss:.4f}')
# print(f'Test Accuracy: {accuracy:.4f}')



# Accuracy

print("Accuracy")


print("Validation Accuracy CNN : ", cnnaccu)
print("Validation Accuracy LSTM: ", lstmaccuracy)
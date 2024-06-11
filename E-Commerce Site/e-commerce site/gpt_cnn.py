import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler
from keras.models import Sequential
from keras.layers import Dense

# Load the CSV dataset
dataset = pd.read_csv('bctestmew.csv')

# Split the dataset into features (X) and labels (y)
X = dataset.drop('Labels', axis=1).values
y = dataset['Labels'].values

# Scale the features between 0 and 1
scaler = MinMaxScaler()
X_scaled = scaler.fit_transform(X)

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.2, random_state=42)

# Create a feedforward neural network model
model = Sequential()
model.add(Dense(64, input_dim=X_train.shape[1], activation='relu'))
model.add(Dense(32, activation='relu'))
model.add(Dense(1, activation='linear'))

# Compile the model
model.compile(loss='mean_squared_error', optimizer='adam')

# Train the model
model.fit(X_train, y_train, epochs=50, batch_size=32, verbose=1)

# Evaluate the model
loss = model.evaluate(X_test, y_test)
print("Mean Squared Error (MSE):", loss)

# Make predictions
predictions = model.predict(X_test)

# Print the predicted sales and actual sales
for i in range(len(predictions)):
    print("Predicted Sales:", predictions[i][0], "Actual Sales:", y_test[i])






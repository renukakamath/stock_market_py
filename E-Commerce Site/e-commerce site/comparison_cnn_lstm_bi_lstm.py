import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler
from keras.models import Sequential
from keras.layers import Conv1D, MaxPooling1D, Flatten, Dense, LSTM, Bidirectional
from keras.models import save_model


def comparison():
    # Load the CSV dataset
    dataset = pd.read_csv('bctestmew.csv')

    # Split the dataset into features (X) and labels (y)
    X = dataset.drop('Labels', axis=1).values
    y = dataset['Labels'].values

    # Scale the features between 0 and 1
    scaler = MinMaxScaler()
    X_scaled = scaler.fit_transform(X)

    # Reshape the input data to 3D for CNN, LSTM, and Bi-LSTM
    X_cnn = X_scaled.reshape(X_scaled.shape[0], X_scaled.shape[1], 1)
    X_lstm = np.reshape(X_scaled, (X_scaled.shape[0], 1, X_scaled.shape[1]))
    X_bilstm = np.reshape(X_scaled, (X_scaled.shape[0], 1, X_scaled.shape[1]))

    # Split the dataset into training and testing sets
    X_cnn_train, X_cnn_test, y_train, y_test = train_test_split(X_cnn, y, test_size=0.2, random_state=42)
    X_lstm_train, X_lstm_test, _, _ = train_test_split(X_lstm, y, test_size=0.2, random_state=42)
    X_bilstm_train, X_bilstm_test, _, _ = train_test_split(X_bilstm, y, test_size=0.2, random_state=42)

    # Create CNN model
    cnn_model = Sequential()
    cnn_model.add(Conv1D(32, 3, activation='relu', input_shape=(X_cnn_train.shape[1], X_cnn_train.shape[2])))
    cnn_model.add(MaxPooling1D(2))
    cnn_model.add(Flatten())
    cnn_model.add(Dense(64, activation='relu'))
    cnn_model.add(Dense(1, activation='linear'))
    cnn_model.compile(loss='mean_squared_error', optimizer='adam')
    cnn_model.fit(X_cnn_train, y_train, epochs=2000, batch_size=32, verbose=0)
    cnn_loss = cnn_model.evaluate(X_cnn_test, y_test)
    print("CNN Mean Squared Error (MSE):", cnn_loss)

    # Create LSTM model
    lstm_model = Sequential()
    lstm_model.add(LSTM(64, input_shape=(X_lstm_train.shape[1], X_lstm_train.shape[2])))
    lstm_model.add(Dense(1, activation='linear'))
    lstm_model.compile(loss='mean_squared_error', optimizer='adam')
    lstm_model.fit(X_lstm_train, y_train, epochs=2000, batch_size=32, verbose=0)
    lstm_loss = lstm_model.evaluate(X_lstm_test, y_test)
    print("LSTM Mean Squared Error (MSE):", lstm_loss)

    # Create Bi-LSTM model
    bilstm_model = Sequential()
    bilstm_model.add(Bidirectional(LSTM(64), input_shape=(X_bilstm_train.shape[1], X_bilstm_train.shape[2])))
    bilstm_model.add(Dense(1, activation='linear'))
    bilstm_model.compile(loss='mean_squared_error', optimizer='adam')
    bilstm_model.fit(X_bilstm_train, y_train, epochs=2000, batch_size=32, verbose=0)
    bilstm_loss = bilstm_model.evaluate(X_bilstm_test, y_test)
    print("Bi-LSTM Mean Squared Error (MSE):", bilstm_loss)

    return(cnn_loss,lstm_loss,bilstm_loss)

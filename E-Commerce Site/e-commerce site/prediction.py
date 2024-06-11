import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, Conv1D, MaxPooling1D, LSTM, Bidirectional, Dense, concatenate
from keras.layers import Dense, Activation, Flatten

# Load the CSV file into a Pandas DataFrame
data = pd.read_csv('static/dataset/bctestmew.csv')

# Split the dataset into input parameters and corresponding labels
X = data[['Price','Open','High','Low']].values
y = data['Labels'].values



X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 3. Vectorize your data

# Vectorize your data (e.g., word embedding or image resizing and normalization)

# 4. Build your CNN model

model = Sequential()
model.add(Conv1D(filters=32, kernel_size=3, activation='relu', input_shape=4))
model.add(MaxPooling1D(pool_size=2))
model.add(Flatten())
model.add(Dense(units=64, activation='relu'))
model.add(Dense(units=num_classes, activation='softmax'))
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
model.summary()

# 5. Train your CNN model

model.fit(X_train, y_train, epochs=10, batch_size=32, validation_data=(X_test, y_test))

# 6. Evaluate your CNN model

loss, accuracy = model.evaluate(X_test, y_test)
print('Test Loss:', loss)
print('Test Accuracy:', accuracy)

# 7. Make predictions

predictions = model.predict(X_new_data)

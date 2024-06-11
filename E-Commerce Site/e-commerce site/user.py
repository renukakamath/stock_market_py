from flask import Flask,Blueprint,render_template,request,url_for,session,redirect,flash 
from database import*

user=Blueprint('user',__name__)


@user.route('/user_home')
def user_home():

	

	return render_template('user_home.html')




from tensorflow.keras.models import load_model
from sklearn.preprocessing import MinMaxScaler
import numpy as np


@user.route('/predict',methods=['get','post'])
def predict():
	data = {}

	if 'submit' in request.form:
		opens = request.form['open']
		closes = request.form['close']
		high = request.form['high']
		low = request.form['low']

		# Load the model from the h5 file
		model = load_model('bi_lstm_model.h5')

		# Convert input data to a 2D array
		ss = [[int(opens), int(closes), int(high), int(low), 0]]

		scaler = MinMaxScaler()
		X_scaled = scaler.fit_transform(ss)

		# Reshape the input data to 3D for Bi-LSTM (samples, time steps, features)
		X_reshaped = np.reshape(X_scaled, (X_scaled.shape[0], 1, X_scaled.shape[1]))

		predictions = model.predict(X_reshaped)
		print(" predictions : ",predictions[0])
		pp=predictions[0]
		data['predictions']=pp[0]

	return render_template('predict.html', data=data)




@user.route('/comparison',methods=['get','post'])
def comparison():
	data = {}
	from comparison_cnn_lstm_bi_lstm import comparison

	print(comparison())
	print(type(comparison()))
	
	# Python code to convert list of tuples into list

	# List of tuple initialization
	lt = [comparison()]

	# using list comprehension
	out = [item for t in lt for item in t]

	# printing output
	print(out[0])


	data['comp']=out[0]
	data['comp1']=out[1]
	data['comp2']=out[2]

	
	return render_template('comparison.html',data=data)






@user.route('/user_sendcomplaints' ,methods=['post','get'])	
def user_sendcomplaints():

	data={}
	q="select * from complaints inner join users using (user_id)"
	res=select(q)
	data['comp']=res

	if "complaint" in request.form:
		uid=session['user_id']
		c=request.form['comp']
		q="insert into complaints values(null,'%s','%s','pending',now())"%(uid,c)
		insert(q)
		flash('successfully')
		return redirect(url_for('user.user_sendcomplaints'))

	return render_template('user_sendcomplaints.html',data=data)








	


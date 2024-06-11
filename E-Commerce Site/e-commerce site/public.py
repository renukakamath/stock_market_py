from flask import Flask,Blueprint,render_template,request,redirect,url_for,session,flash 
from database import*


public=Blueprint('public',__name__)

@public.route('/')
def home():
	return render_template('home.html')


@public.route('/user_registration',methods=['post','get'])	
def user_registration():
	if "userreg" in request.form:
		f=request.form['fname']
		l=request.form['lname']
		a=request.form['add']
		p=request.form['place']
		m=request.form['lmark']
		pi=request.form['pincode']
		ph=request.form['phone']
		e=request.form['email']
		u=request.form['uname']
		pa=request.form['pwd']
		q="select * from login where username='%s' and password='%s'"%(u,pa)
		res=select(q)
		if res:

			flash('already exist')

		else:
			q="insert into login values(null,'%s','%s','user')"%(u,pa)
			id=insert(q)
			q="insert into users values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(id,f,l,a,p,m,pi,ph,e)
			insert(q)
			flash('successfully')
			return redirect(url_for('public.user_registration'))

	return render_template('user_registration.html')

@public.route('/login',methods=['post','get'])	
def login():
	if "login" in request.form:
		u=request.form['uname']
		pa=request.form['pwd']
		q="select * from login where username='%s' and password='%s'"%(u,pa)
		res=select(q)
		if res:
			session['login_id']=res[0]['login_id']
			lid=session['login_id']
			if res[0]['user_type']=="admin":
				return redirect(url_for('admin.admin_home'))

			elif res[0]['user_type']=="user":
				q="select * from users where login_id='%s'"%(lid)
				res=select(q)
				if res:
					session['user_id']=res[0]['user_id']
					uid=session['user_id']
				return redirect(url_for('user.user_home'))

			# elif res[0]['user_type']=="shop":
			# 	q="select * from shops where login_id='%s'"%(lid)
			# 	res=select(q)
			# 	if res:
			# 		session['shop_id']=res[0]['shop_id']
			# 		sid=session['shop_id']

				return redirect(url_for('shop.shop_home'))

	return render_template('login.html')
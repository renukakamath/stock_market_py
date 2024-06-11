from flask import Flask,Blueprint,render_template,request,redirect,url_for,flash 
from database import*



admin=Blueprint('admin',__name__)

@admin.route('/admin_home')
def admin_home():

	return render_template('admin_home.html')



@admin.route('/admin_viewuser')	
def admin_viewuser():
	data={}

	q="select * from users"
	res=select(q)
	data['us']=res

	return render_template('admin_viewuser.html',data=data)

@admin.route('/admin_viewcomplaint')
def admin_viewcomplaint():
	data={}
	q="select * from complaints inner join users using (user_id)"
	res=select(q)
	data['us']=res
	return render_template('admin_viewcomplaint.html',data=data)

@admin.route('/admin_sendreply',methods=['post','get'])	
def admin_sendreply():
	if "reply" in request.form:
		cid=request.args['cid']
		r=request.form['rep']
		q="update complaints set reply='%s' where complaint_id='%s'"%(r,cid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_viewcomplaint'))
	return render_template('admin_sendreply.html')


	



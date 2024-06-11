from flask import Flask 
from public import public
from admin import admin

from user import user




app=Flask(__name__)

app.secret_key='key'

app.register_blueprint(public)
app.register_blueprint(admin,url_prefix='/admin')

app.register_blueprint(user,url_prefix='/user')







app.run(debug=False,port=5036,host='0.0.0.0')

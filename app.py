from flask import render_template, flash, request, redirect, url_for, session, Flask
from flask_mysqldb import MySQL
import pandas as pd
import MySQLdb.cursors
import re
from mysql import connector
import pickle
from pickle import dump, load
from nltk.stem import PorterStemmer
import string
from nltk.stem import WordNetLemmatizer
import nltk
from nltk.corpus import stopwords
from sklearn.feature_extraction.text import TfidfVectorizer
import pymysql
import pymysql.cursors

app = Flask(__name__)
app.secret_key = 'random string'


app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='register'

mysql=MySQL(app)
#----------------------------------------------------------------------------------------------------------------------
#                                    LOGIN PAGE
#----------------------------------------------------------------------------------------------------------------------
@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
        email = request.form['email']
        password = request.form['password']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE email = %s AND password = %s', (email, password))
        reg = cursor.fetchone()
        if reg:
            session['loggedin'] = True
            session['userid'] = reg['userid']
            session['name'] = reg['name']
            return redirect(url_for('index'))
        else:
            msg = 'Incorrect name/password!'
    return render_template('login.html', msg='')

#----------------------------------------------------------------------------------------------------------------------
#                                       LOGOUT PAGE
#----------------------------------------------------------------------------------------------------------------------
@app.route('/logout')
def logout():
    session['loggedin'] = False
    return redirect(url_for('login'))
#----------------------------------------------------------------------------------------------------------------------
#                                   REGISTRATION PAGE
#----------------------------------------------------------------------------------------------------------------------
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method=='POST':
        userdata=request.form
        name=userdata['name']
        email=userdata['email']
        password=userdata['password']
        cur=mysql.connection.cursor()
        cur.execute("INSERT INTO user(name,email,password) VALUES(%s,%s,%s)",(name,email,password))
        mysql.connection.commit()
        cur.close()
        return  render_template("login.html")
    return render_template('registration.html')
#----------------------------------------------------------------------------------------------------------------------
#                                   INDEX PAGE
#----------------------------------------------------------------------------------------------------------------------
@app.route('/index')
def index():
    return render_template('index.html')
#----------------------------------------------------------------------------------------------------------------------
#                                   Abourt PAGE
#----------------------------------------------------------------------------------------------------------------------
@app.route('/about')
def about():
    return render_template('about.html')
#----------------------------------------------------------------------------------------------------------------------
#                                   Prediction PAGE
#----------------------------------------------------------------------------------------------------------------------
@app.route('/prediction', methods=['GET', 'POST'])
def prediction():
    if request.method == "POST":
        df = pd.read_csv('finalop.csv', encoding='utf-8')

        from sklearn.feature_extraction.text import TfidfVectorizer
        Tfidf_vect = TfidfVectorizer(max_features=5000, sublinear_tf=True, encoding='utf-8', decode_error='ignore')
        Tfidf_vect.fit(df['text_final'])

        tweet = request.form['name']
        tf2=Tfidf_vect.transform([tweet])

        with open('svm_pickle','rb') as f:
            mp=pickle.load(f)
            red=mp.predict(tf2)
        if red==0 :
            flash("Negative review detected ")
        elif red == 1:
            flash("Neutral review detected")
        elif red==2:
            flash("Positive review detected")
        elif red==3:
            flash("Unknown review detected")
        else:
            flash("Somthing went wrong detected")

        return render_template('prediction.html')
    else:
        return render_template('prediction.html')
    return render_template('prediction.html')
#----------------------------------------------------------------------------------------------------------------------
#                                   Contact PAGE
#----------------------------------------------------------------------------------------------------------------------
@app.route('/contact')
def contact():
    return render_template('contact.html')


if __name__ == '__main__':
    app.run(debug=True)
    #app.run()
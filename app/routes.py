from app import app, login, admin
from flask import render_template, flash, redirect, url_for, request, session, \
    g, current_app, abort, jsonify
from flask_login import current_user, login_user, logout_user
from flask_login import login_required
import sys
import os
from werkzeug.urls import url_parse
from werkzeug.utils import secure_filename
from shutil import copyfile
from app.forms import LoginForm

@login.user_loader
def load_user(user_id):
    """
    adds wrapper to user in oder for it to interact properly with flask extensions
    """
    # user = user_details.query.get(user_id)
    user = None
    if user:
        # return DbUser(user)
        pass
    else:
        return None

@app.route('/')
@app.route('/home')
def home():
    """
    Home page, content can be added currently just a template for navigation bar at the top of the screen and footer
    """

    return render_template('home.html', page='home')


@app.route('/login', methods=['GET', 'POST'])
def login():
    """
    route of website which handles user login and other things
    """
    # checks if the user is authenticated , if they are it redirects the user
    # to the index page

    if current_user.is_authenticated:
        return redirect(url_for('home'))
    form = LoginForm()

    # checks the form validation, if the user does not validate it returns
    # them to the login page and tells them invalid password or username
    if form.validate_on_submit():
        """
        if form validates then uses UserAccessManager to check credentials and then logs the user in using built-in 
        flask function
        """

        # um = UserAccessManager(connect_yaml=connect_yaml)
        # pw = um.get_user_password(user_email=form.user_email.data)
        # user = DbUser(user_details.query.filter_by(
        #     email=form.user_email.data).first())

        # if user and form.password.data == pw:
        #     if form.remember_me.data:
        #         login_user(user, remember=True)
        #     else:
        #         login_user(user, remember=False)
        # else:
        #     flash('Invalid username or password')
        #     return redirect(url_for('login'))
        # next_page = request.args.get('next')
        #
        # if not next_page or url_parse(next_page).netloc != '':
        #     next_page = url_for('home')
        # return redirect(next_page)

    return render_template('login.html', title='Sign In',
                           form=form, page='login')
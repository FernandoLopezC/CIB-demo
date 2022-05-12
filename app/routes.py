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
from app.forms import LoginForm, PermissionsForm
from app.models import users_tbl, DbUser

@login.user_loader
def load_user(user_id):
    """
    adds wrapper to user in oder for it to interact properly with flask extensions
    """
    user = users_tbl.query.get(user_id)
    if user:
        return DbUser(user)
        pass
    else:
        return None

@app.route('/')
@app.route('/home')
@login_required
def home():
    """
    Home page, content can be added currently just a template for navigation bar at the top of the screen and footer
    """

    return render_template('Admin - SystemOverview', page='home')

@app.route('/brief')
@login_required
def brief():
    """
    Home page, content can be added currently just a template for navigation bar at the top of the screen and footer
    """

    return render_template('Service Desk - Breifing', page='brief')


@app.route('/permissions')
@login_required
def permissions():
    """
    Home page, content can be added currently just a template for navigation bar at the top of the screen and footer
    """
    form =PermissionsForm()
    return render_template('Admin - Permission Management', page='Permissions', form=form)

@app.route('/SystemOverview')
@login_required
def SystemOverview():
    """
    Home page, content can be added currently just a template for navigation bar at the top of the screen and footer
    """

    return render_template('Admin - SystemOverview', page='System Overview')

@app.route('/admin_report')
@login_required
def admin_report():
    """
    Home page, content can be added currently just a template for navigation bar at the top of the screen and footer
    """

    return render_template('Admin report page', page='admin report')


@app.route('/reports')
@login_required
def reports():
    """
    Home page, content can be added currently just a template for navigation bar at the top of the screen and footer
    """

    return render_template('Service Desk - Reports page', page='reports')


@app.route('/task_management')
@login_required
def task_management():
    """
    Home page, content can be added currently just a template for navigation bar at the top of the screen and footer
    """

    return render_template('Service Desk - Task management page', page='task management')

@app.route('/asset_management')
@login_required
def asset_management():
    """
    Home page, content can be added currently just a template for navigation bar at the top of the screen and footer
    """

    return render_template('Admin - Asset Management Page', page='asset_management')


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

        user = DbUser(users_tbl.query.filter_by(users_username=form.username.data).first())
        pw = user.get_password()

        if form.validate_on_submit():
            if user and form.password.data == pw:
                if form.remember_me.data:
                    login_user(user, remember=True)
                else:
                    login_user(user, remember=False)
            else:
                flash('Invalid username or password')
                return redirect(url_for('login'))
            next_page = request.args.get('next')

            if not next_page or url_parse(next_page).netloc != '':
                next_page = url_for('home')
            return redirect(next_page)

    return render_template('login.html', title='Sign In',
                           form=form, page='login')


@app.route('/logout')
def logout():
    """
        Logs user out
    """
    logout_user()
    flash('You have logged out')

    return redirect(url_for('login'))

from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField, \
    IntegerField, DateField, SelectField, FileField
from wtforms.validators import DataRequired, ValidationError, Email, EqualTo,\
    Optional
from flask_wtf.file import FileField, FileRequired, FileAllowed
from werkzeug.utils import secure_filename
from app.models import users_tbl


class LoginForm(FlaskForm):

    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Remember Me')
    submit = SubmitField('Sign In')


class PermissionsForm(FlaskForm):

    users = SelectField("User", choices=[o[0] for o in users_tbl.query.with_entities(users_tbl.users_username).all()])
    permissions = SelectField("Permissions", choices=["Service Desk", "Management", "Technician"])



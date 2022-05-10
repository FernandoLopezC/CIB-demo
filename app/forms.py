from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField, \
    IntegerField, DateField, SelectField, FileField
from wtforms.validators import DataRequired, ValidationError, Email, EqualTo,\
    Optional
from flask_wtf.file import FileField, FileRequired, FileAllowed
from werkzeug.utils import secure_filename
# from app.models import organisation, user_details


class LoginForm(FlaskForm):

    user_email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Remember Me')
    submit = SubmitField('Sign In')

    def validate_email(self, user_email):
        user = None # user_details.query.filter_by(user_email=user_email).first()
        if not user:
            raise ValidationError(
                'User email does not exists, please use a '
                'valid email')

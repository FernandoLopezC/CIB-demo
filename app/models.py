from app import db, admin
import sqlalchemy as sqa
from flask_admin.contrib.sqla.form import QuerySelectField, \
    QuerySelectMultipleField
from flask_admin.contrib.sqla import ModelView
from flask_login import current_user
from flask import redirect, url_for
from sqlalchemy.orm import relationship, object_session
from wtforms import Form
import os
import sys


class asset_tbl(db.Model):

    __table__ = db.Model.metadata.tables['asset_tbl']


class location_tbl(db.Model):

    __table__ = db.Model.metadata.tables['location_tbl']


class software_tbl(db.Model):

    __table__ = db.Model.metadata.tables['software_tbl']


class status_tbl(db.Model):

    __table__ = db.Model.metadata.tables['status_tbl']


class users_tbl(db.Model):

    __table__ = db.Model.metadata.tables['users_tbl']

class asset_count(db.Model):

    __tablename__ = "asset_count"

    location_code = sqa.Column(sqa.String, primary_key=True)
    asset_count = sqa.Column(sqa.Integer)


class asset_loc_status(db.Model):

    __tablename__ = "asset_loc_status"

    loc_code = sqa.Column(sqa.String, primary_key=True)
    status_status = sqa.Column(sqa.String)
    count = sqa.Column(sqa.Integer)


class asset_user_loc(db.Model):

    __tablename__ = "asset_user_loc"

    asset_id = sqa.Column(sqa.String, primary_key=True)
    loc_code = sqa.Column(sqa.String)
    users_id = sqa.Column(sqa.String)
    status_status = sqa.Column(sqa.String)

class DbUser(object):
    """Wraps User object for Flask-Login and added functionality for permissions and dynamic forms"""
    def __init__(self, user):
        self._user = user

    def get_id(self):
        return self._user.users_id

    def is_active(self):
        return self._user.enabled

    def is_anonymous(self):
        return False

    def is_authenticated(self):
        return True

    def get_password(self):

        return self._user.users_password
    def get_role(self):

        return self._user.users_role


class MyModelView(ModelView):
    # only gives admins permission to access certain pages
    can_delete = True
    can_edit = True
    column_display_pk = True
    column_hide_backrefs = False
    can_search = True

    def inaccessible_callback(self, name, **kwargs):
        # redirect to login page if user doesn't have access
        return redirect(url_for('home'))

    def is_accessible(self):
        try:
            # if current_user.has_subproduct_permission('GET_META'):
            #     return current_user.is_authenticated
            # else:
            #     return False
            return True
        except AttributeError:
            return self.inaccessible_callback(name='')


class MyModelAdminView(ModelView):
    # only gives admins permission to access certain pages

    def inaccessible_callback(self, name, **kwargs):
        # redirect to login page if user doesn't have access
        return redirect(url_for('home'))

    def is_accessible(self):
        try:
            # if current_user.has_subproduct_permission('PUT_META'):
            #     return current_user.is_authenticated
            # else:
            #     return False
            return True
        except AttributeError:
            return self.inaccessible_callback(name='')


admin.add_view(MyModelView(asset_tbl, db.session))
admin.add_view(MyModelView(location_tbl, db.session))
admin.add_view(MyModelView(software_tbl, db.session))
admin.add_view(MyModelView(status_tbl, db.session))
admin.add_view(MyModelView(users_tbl, db.session))
admin.add_view(MyModelView(asset_count, db.session))
admin.add_view(MyModelView(asset_loc_status, db.session))
admin.add_view(MyModelView(asset_user_loc, db.session))



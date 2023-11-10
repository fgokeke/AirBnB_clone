#!/usr/bin/python3
''' This module contain the User class '''


import models.BaseModel as BaseModel


class User(BaseModel):
    ''' A class that defines a user by
    email, password, first_name and last_name '''
    email = ""
    password = ""
    first_name = ""
    last_name = ""

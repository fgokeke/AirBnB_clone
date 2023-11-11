#!/usr/bin/python3
''' This module contain the User class '''


import models.base_model


class User(models.base_model.BaseModel):
    ''' A class that defines a user by
    email, password, first_name and last_name '''
    email = ""
    password = ""
    first_name = ""
    last_name = ""

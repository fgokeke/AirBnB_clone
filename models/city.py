#!/usr/bin/python3
''' This module is for City class model '''


import models.BaseModel as BaseModel


class City(BaseModel):
    ''' A class that defines city by state_id and name '''
    state_id = ""
    name = ""

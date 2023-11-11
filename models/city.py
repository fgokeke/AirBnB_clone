#!/usr/bin/python3
''' This module is for City class model '''


import models.base_model as base_model


class City(base_model.BaseModel):
    ''' A class that defines city by state_id and name '''
    state_id = ""
    name = ""

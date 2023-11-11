#!/usr/bin/python3
''' This module is for Review class model '''


import models.base_model as base_model 


class Review(base_model.BaseModel):
    ''' A class that defines Review by place_id, user_id and text'''
    place_id = ""
    user_id = ""
    text = ""

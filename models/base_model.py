#!/usr/bin/pyhton3
'''This is a base class for all classes'''


import uuid
import datetime


class BaseModel():
    ''' Defines all common attributes/methods for other classes '''

    def __init__(self):
        ''' Instantiation of id,  '''
        self.id = str(uuid.uuid4())
        self.created_at = datetime.datetime.now()
        self.updated_at = datetime.datetime.now()

    def __str__(self):
        '''return [<class name>] (<self.id>) <self.__dict__>'''
        return f"[{self.__class__.__name__}] ({self.id}) {self.__dict__}"

    def save(self):
        '''updates the public instance attribute updated_at
        with the current datetime'''
        self.updated_at = datetime.datetime.now()

    def to_dict(self):
        '''returns a dictionary containing all keys/values of the instance'''
        mydict = self.__dict__
        mydict["__class__"] = self.__class__.__name__
        mydict["created_at"] = self.created_at.isoformat()
        mydict["updated_at"] = self.updated_at.isoformat()
        return mydict

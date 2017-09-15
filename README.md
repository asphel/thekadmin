# The K Admin
Admin application to handle guest lists for event based on QRCode

# How it works 
With the K admin app, the admins/eventOwner can add new events, add new keyType, send key to users, scan the K (QRCode), etc.

# SDK
* Firebase (Auth, Storage, Database)
* Facebook (Core, Login, Share)
* SwiftyJSON

# TODO 

## Global 
* Handle error messages displayed to user ( use UIAlertController)
* Handle image import into Firebase Storage (profile picture, cover event, etc.)


## User 
* Implement different level of rights for user (Admin, eventOwner, simpleUser)
* Refactor the Facebook init : we do not need to insitantiate the user with Graph API information when the user is already registered into Firebase
* Update description
* Handle images

## Key 
* Change the key logic : Keys must be referenced under events/_eventId_/keyTypes/_keyTypeId_/keys/ and under users/_userId_/keys/. Key information need to be stored under events/_eventId_/keyTypes/_keyTypeId_/
* Change init mehtod : since Key informations are under events/_eventId_/keyTypes/_keyTypeId_, init need to be refactored
* Change moveKeyToAnotherUser method : same as above
* Handle images


## Event 
* TBD



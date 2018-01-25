## Auth Microservice

This is a rails Micro Auth service which is utilizing [Knock](https://github.com/nsarno/knock) gem for **signin**, **token generation** and **identify the user when token provided**


### Installation

after downloading the repository do the following steps:
```
change the database credentials in config/database.yml
```
```
$ bundle install
```
```
$ db:setup
```

### Running the instance
```
$ rails server -p 4000
```
### Testing end points
#### Signin request
```
URL:
POST http://localhost:4000/v1/signin

Request Header:
content-type: application/json

Request body:
{
	"auth":
	{
		"email": "sample@sample.com",
		"password": "mHdaWjcM"
	}
}
```
#### Possbile Signin response
```
{"jwt":"****************TOKEN******************"} 200
```

```
returns HTTP Status 404 on providing wrong credentials
```

### Identify request
```
URL:
POST http://localhost:4000/v1/identify

Request Header:
content-type: application/json
authorization: Bearer **********TOKEN**********

```

#### Possible response
```
{"user":{"id":1}} 200
```

```
returns HTTP status 404 on providing invalid token
```

### TODOs

 1. Instead of returning 404 HTTP status, user identity returns 401 Unauthorized (Knock gem is returning 404 response when wrong credentials are provided)
 2. Testing of timing attack used to brute force tokens.
 3. User Sign up module

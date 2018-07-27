
1、
query{
  users{
    id,
    email
  }
}


2、
mutation users{
  updateUserPassword(id:"2",password:"123456"){
    id,
    email
  }
}


3、
mutation users{
  updateUserEmail(id:"2",email:"456@test.com"){
    id,
    email
  }
}


4、
query FetchUserByID($id: String){
  users(id: $id){
    id,
    email
  }
}

5、
query FetchUserByID($id: String){
  users(id: $id){
    id
    email
    comments {
      id
      content
    }
  }
}

{"id": "1"}


6、
query FetchUserByID($id: String){
  users(id: $id){
    id
    email
    comments {
      id
      content
      status
    }
  }
}


7、
mutation SignupMutation{
  createUser(name: "graphqlUser01",email: "graphqlUser01@test.com",password:"123456"){
    id
    name
    email
  }
}


8、
mutation LoginMutation{
  login(email: "auth01@test.com",password:"1234567890"){
    id
    name
    email
    token
  }
}

测试返回值：
{
  "data": {
    "login": {
      "id": "4",
      "name": "auth01",
      "email": "auth01@test.com",
      "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQsImlzcyI6Imh0dHA6Ly9kZW1vLmxhcmF2ZWxibG9nLmNvbS9ncmFwaHFsIiwiaWF0IjoxNTMyNjU3ODExLCJleHAiOjE1MzI2NjE0MTEsIm5iZiI6MTUzMjY1NzgxMSwianRpIjoicTZTTDJoTHVIdFF4NkFHZSJ9.tqgl0FOznsf4nZr7F4Mew-pXJ5yPANvOrjx2sL92eKk"
    }
  }
}
真正接口返回值：
{"data":{
    "login":{
	"id":"4",
	"name":"auth01",
	"email":"auth01@test.com",
	"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQsImlzcyI6Imh0dHA6Ly9kZW1vLmxhcmF2ZWxibG9nLmNvbS9ncmFwaHFsIiwiaWF0IjoxNTMyNjU5MDQ4LCJleHAiOjE1MzI2NjI2NDgsIm5iZiI6MTUzMjY1OTA0OCwianRpIjoiR2gzcVFSSWZYRFZmc21QcyJ9.xgX8rov1m7NDJcv0qqAaSBag2t1naBa8iqkS5bQ4msk",
	"__typename":"User"
    }
}}


9、
query AllUserQuery{
  users{
    id
    name
    email
  }
}


10、
query QueryUserById($id: String){
  user(id: $id){
    id
    name
    email
    posts{
      id
      title
    }
  }
}

{"id": "30"}


11、
query QueryArticles{
  allPosts{
    id
    title
    user{
      name
    }
  }
}
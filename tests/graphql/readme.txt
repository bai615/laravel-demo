
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
import gql from 'graphql-tag'

export const SIGNUP_MUTATION = gql`
  mutation SignupMutation($name: String!, $email: String!, $password: String!) {
    createUser(
      name: $name,
        email: $email,
          password: $password
    ){
       id
       name
       email
    }
  }
`

export const LOGIN_MUTATION = gql`
    mutation LoginMutation($email: String!, $password: String!) {
        login(
            email: $email,
            password: $password
        ) {
            id
            name
            email
            token
        }
    }
`

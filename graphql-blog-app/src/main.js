// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

// 设置 Vue Apollo
import {ApolloClient} from 'apollo-client'
import {HttpLink} from 'apollo-link-http'
import {InMemoryCache} from 'apollo-cache-inmemory'
import VueApollo from 'vue-apollo'
import { setContext } from 'apollo-link-context'

Vue.config.productionTip = false

/**
 * 通过 GraphQL 服务端 URL 创建了一个新的 httpLink 实例，然后使用这个 httpLink 实例创建 Apollo 客户端，并指定使用内存缓存，最后安装 Vue Apollo 插件
 */
const httpLink = new HttpLink({
  // GraphQL 服务器 URL，需要使用绝对路径
  // uri: 'http://apidemo.test/graphql'
  uri: 'http://demo.laravelblog.com/graphql'
})

const authLink = setContext((_, { headers }) => {
  // 从 LocalStorage 中获取认证 token（如果存在的话）
  const token = localStorage.getItem('blog-app-token')

  console.log(token)

  // return the headers to the context so httpLink can read them
  return {
    headers: {
      ...headers,
      authorization: token ? `Bearer ${token}` : null
    }
  }
})

// 创建 apollo client
/*
const apolloClient = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache()
})
*/

// 更新 apollo client 如下
const apolloClient = new ApolloClient({
  link: authLink.concat(httpLink),
  cache: new InMemoryCache()
})

// 安装 vue plugin
Vue.use(VueApollo)

// 创建一个 apolloProvider 对象并将其传入应用根组件
const apolloProvider = new VueApollo({
  defaultClient: apolloClient
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  apolloProvider,
  components: {App},
  template: '<App/>'
})

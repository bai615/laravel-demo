
基于 Laravel + Vue + GraphQL 实现前后端分离的博客应用

http://laravelacademy.org/post/9283.html
http://laravelacademy.org/post/9298.html

npm install -g vue  // 已全局安装过 vue 略过此步骤
vue init webpack graphql-blog-app

cd graphql-blog-app
npm install --save vue-apollo@next graphql apollo-client apollo-link apollo-link-context apollo-link-http apollo-cache-inmemory graphql-tag

vue-apollo：在 Vue 中集成 Apollo/GraphQL 支持；
graphql：JavaScript 中的 GraphQL 实现；
apollo-client：Apollo GraphQL 客户端，允许你轻松构建通过 GraphQL 获取数据的 UI 组件；
apollo-link：获取/修改 GraphQL 请求和结果控制流的接口
apollo-link-context：用于设置操作上下文
apollo-link-http：基于 HTTP 通过网络请求获取 GraphQL 结果
apollo-cache-inmemory：Apollo 客户端缓存实现
graphql-tag：用于解析 GraphQL 查询的 JavaScript 模板语义标签
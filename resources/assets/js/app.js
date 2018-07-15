import Vue from 'vue';
import VueRouter from 'vue-router';
import axios from 'axios';
import VueAxios from 'vue-axios';
import App from './App.vue';
import Dashboard from './components/Dashboard.vue';
import Home from './components/Home.vue';
import Register from './components/Register.vue';
import Login from './components/Login.vue';
Vue.use(VueRouter);
Vue.use(VueAxios, axios);
axios.defaults.baseURL = 'http://demo.laravelblog.com/api';
const router = new VueRouter({
    routes: [{
        path: '/',
        name: 'home',
        component: Home
    },{
        path: '/register',
        name: 'register',
        component: Register
    },{
        path: '/login',
        name: 'login',
        component: Login
    }]
});

new Vue({
    el: '#app',
    router: router,
    render: app => app(App)
});
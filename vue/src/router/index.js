import { createRouter, createWebHistory } from 'vue-router'
import Layout from '../layout/Layout.vue'

const routes = [
  {
    path: '/',
    name: 'Layout',
    component: Layout,
    redirect:"user",
    children:[
      {
        path: 'user',
        name: 'User',
        component: () => import("@/views/User")
      },{
        path: 'person',
        name: 'Person',
        component: () =>import("@/views/Person")
      },
      {
        path: 'book',
        name: 'Book',
        component: () =>import("@/views/Book")
      },
      {
        path: 'news',
        name: 'News',
        component: () =>import("@/views/News")
      },
      {
        path: 'bookshelf',
        name: 'BookShelf',
        component: () =>import("@/views/BookShelf")
      }
    ]
  },
  {
    path: '/login',
    name: 'Login',
    component: () =>import("@/views/Login")
  },
  {
    path:'/',
    redirect: '/login'
  },
  {
    path: '/register',
    name: 'Register',
    component: () =>import("@/views/Register")
  }

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router

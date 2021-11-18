
import VueRouter from 'vue-router'

import VersionIndex from './pages/version/Index'
import VersionCreate from './pages/version/Create'

import QuizClassIndex from './pages/quiz_class/Index'
import QuizClassCreate from './pages/quiz_class/Create'

import SubjectIndex from './pages/subject/Index'
import SubjectCreate from './pages/subject/Create'

import QuizIndex from './pages/quiz/Index'
import QuizCreate from './pages/quiz/Create'
// Routes
const routes = [
  {
    path: '/',
    name: 'home',
    component: QuizIndex
  },
    {
    path: '/version',
    name: 'version',
    component: VersionIndex,
  },
    {
    path: '/version/create',
    name: 'version_create',
    component: VersionCreate,
  },
    {
    path: '/quiz_class',
    name: 'quiz_class',
    component: QuizClassIndex,
  },
    {
    path: '/quiz_class/create',
    name: 'quiz_class_create',
    component: QuizClassCreate,
  },
    {
    path: '/subject',
    name: 'subject',
    component: SubjectIndex,
  },
    {
    path: '/subject/create',
    name: 'subject_create',
    component: SubjectCreate,
  },
    {
    path: '/quiz/create',
    name: 'quiz_create',
    component: QuizCreate,
  },
]
const router = new VueRouter({
  history: true,
  mode: 'history',
  routes,
})
export default router



<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <router-link :to="{name: 'home'}" class="navbar-brand">Quiz Management</router-link>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto" v-if="$auth.check(1)">
          <li class="nav-item" v-for="(route, key) in routes.user" v-bind:key="route.path">
            <router-link :to="{ name : route.path }" :key="key" class="nav-link">{{route.name}}</router-link>
          </li>
      </ul>
      <ul class="navbar-nav mr-auto" v-if="$auth.check(2)">
          <li class="nav-item" v-for="(route, key) in routes.user" v-bind:key="route.path">
            <router-link :to="{ name : route.path }" :key="key" class="nav-link">{{route.name}}</router-link>
          </li>
      </ul>
      <ul class="navbar-nav ml-auto" v-if="!$auth.check()">
          <li class="nav-item" v-for="(route, key) in routes.unlogged" v-bind:key="route.path">
            <router-link :to="{ name : route.path }" :key="key" class="nav-link">{{route.name}}</router-link>
          </li>
      </ul>
    </div>
  </nav>
</template>
<script>
  export default {
    data() {
      return {
        routes: {
          unlogged: [
            { name: 'Version', path: 'version' },
            { name: 'Class', path: 'quiz_class' },
            { name: 'Subject', path: 'subject' },
            { name: 'Quiz', path: 'home' },
          ],
        }
      }
    },
    mounted() {
      //
    }
  }
</script>
<style>
.navbar {
  margin-bottom: 30px;
}
</style>

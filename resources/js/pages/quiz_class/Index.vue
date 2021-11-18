<template>
    <div class="container">
        <div class="card card-default">
            <div class="card-header">
                <div class="row">
                    <div class="col-sm-6">
                        Class list
                    </div>
                    <div class="col-sm-6 text-right">
                        <router-link :to="{ name :'quiz_class_create' }" class="btn btn-primary">Create Class</router-link>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Version</th>
                        <th scope="col">Name</th>
                    </tr>
                    <tr v-for="quiz_class in quiz_classs" v-bind:key="quiz_class.id" style="margin-bottom: 5px;">
                        <td>{{ quiz_class.id }}</td>
                        <td>{{ quiz_class.version.name }}</td>
                        <td>{{ quiz_class.name }}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                quiz_classs: null
            }
        },
        mounted() {
            this.getClass()
        },
        methods: {
            getClass() {
                this.$http({
                    url: `api/quiz_class`,
                    method: 'GET'
                })
                    .then((response) => {
                        this.quiz_classs = response.data
                    }, () => {
                    })
            }
        }
    }
</script>





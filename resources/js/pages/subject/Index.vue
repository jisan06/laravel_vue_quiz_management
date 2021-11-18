<template>
    <div class="container">
        <div class="card card-default">
            <div class="card-header">
                <div class="row">
                    <div class="col-sm-6">
                        Subject list
                    </div>
                    <div class="col-sm-6 text-right">
                        <router-link :to="{ name :'subject_create' }" class="btn btn-primary">Create Subject</router-link>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Class</th>
                        <th scope="col">Name</th>
                    </tr>
                    <tr v-for="subject in subjects" v-bind:key="subject.id" style="margin-bottom: 5px;">
                        <td>{{ subject.id }}</td>
                        <td>{{ subject.quiz_class.name }}</td>
                        <td>{{ subject.name }}</td>
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
                subjects: null
            }
        },
        mounted() {
            this.getSubject()
        },
        methods: {
            getSubject() {
                this.$http({
                    url: `api/subject`,
                    method: 'GET'
                })
                    .then((response) => {
                        this.subjects = response.data
                    }, () => {
                    })
            }
        }
    }
</script>





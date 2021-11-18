<template>
    <div class="container">
        <div class="card card-default">
            <div class="card-header">
                <div class="row">
                    <div class="col-sm-6">
                        All Quiz
                    </div>
                    <div class="col-sm-6 text-right">
                        <router-link :to="{ name :'quiz_create' }" class="btn btn-primary">Create Quiz</router-link>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="mb-4 row">
                    <div class="col-md-3">
                        <select class="form-control" v-model="version_id" @change="filterQuiz">
                            <option value="">Select Version</option>
                            <option :value="version.id" v-for="version in versions"
                                    v-bind:key="version.id">
                                {{version.name}}
                            </option>
                        </select>
                    </div>

                    <div class="col-md-3">
                        <select class="form-control" v-model="quiz_class_id" @change="filterQuiz">
                            <option value="">Select Class</option>
                            <option :value="quiz_class.id" v-for="quiz_class in quiz_classes"
                                    v-bind:key="quiz_class.id">
                                {{quiz_class.name}}
                            </option>
                        </select>
                    </div>

                    <div class="col-md-3">
                        <select class="form-control" v-model="subject_id" @change="filterQuiz">
                            <option value="">Select Subject</option>
                            <option :value="subject.id" v-for="subject in subjects"
                                    v-bind:key="subject.id">
                                {{subject.name}}
                            </option>
                        </select>
                    </div>
                </div>
                <table class="table table-bordered table-striped">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Title</th>
                        <th scope="col">Version</th>
                        <th scope="col">Class</th>
                        <th scope="col">Subject</th>
                        <th scope="col">Start Date</th>
                        <th scope="col">Start Time</th>
                        <th scope="col">End Date</th>
                        <th scope="col">End Time</th>
                        <th scope="col">Pass Percentage</th>
                    </tr>
                    <tr v-for="quiz in quizzes" v-bind:key="quiz.id" style="margin-bottom: 5px;">
                        <td>{{ quiz.id }}</td>
                        <td>{{ quiz.title }}</td>
                        <td>{{ quiz.version.name }}</td>
                        <td>{{ quiz.quiz_class.name }}</td>
                        <td>{{ quiz.subject.name }}</td>
                        <td>{{ quiz.start_date }}</td>
                        <td>{{ quiz.start_time }}</td>
                        <td>{{ quiz.end_date }}</td>
                        <td>{{ quiz.end_time }}</td>
                        <td>{{ quiz.pass_percentage }}</td>
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
                versions: null,
                quiz_classes: null,
                subjects: null,
                version_id: '',
                quiz_class_id: '',
                subject_id: '',
                quizzes: null,

            }
        },
        mounted() {
            this.getVersion()
            this.getClasss()
            this.getSubject()
            this.getQuiz()
        },
        methods: {
            getVersion() {
                this.$http({
                    url: `api/version`,
                    method: 'GET'
                })
                    .then((response) => {
                        this.versions = response.data
                    }, () => {
                    })
            },
            getClasss() {
                this.$http({
                    url: `api/quiz_class`,
                    method: 'GET'
                })
                    .then((response) => {
                        this.quiz_classes = response.data
                    }, () => {
                    })
            },
            getSubject() {
                this.$http({
                    url: `api/subject`,
                    method: 'GET'
                })
                    .then((response) => {
                        this.subjects = response.data
                    }, () => {
                    })
            },
            getQuiz() {
                this.$http({
                    url: `api/quiz`,
                    method: 'GET'
                })
                    .then((response) => {
                        this.quizzes = response.data
                    }, () => {
                    })
            },
            filterQuiz(){
                axios({
                    method: "post",
                    url: `api/quiz/filter`,
                    data: {
                        version_id : this.version_id,
                        quiz_class_id : this.quiz_class_id,
                        subject_id : this.subject_id,
                    },
                    headers: {
                        'Content-type' : 'application/json'
                    },
                })
                .then( response => {
                    this.quizzes = response.data
                })
            }
        }
    }
</script>





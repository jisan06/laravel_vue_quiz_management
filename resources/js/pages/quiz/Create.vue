<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-default">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                New Quiz
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form class="form-horizontal">
                            <div class="form-group row">
                                <label for="inputName" class="col-sm-3 col-form-label">Version</label>
                                <div class="col-sm-10">
                                    <!-- here  is form that come frome data in script-->
                                    <select class="form-control" v-model="form.version_id">
                                        <option value="">Select Version</option>
                                        <option :value="version.id" v-for="version in versions"
                                                v-bind:key="version.id">
                                            {{version.name}}
                                        </option>
                                    </select>
                                    <has-error :form="form" field="name"></has-error>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="inputName" class="col-sm-3 col-form-label">Class</label>
                                <div class="col-sm-10">
                                    <!-- here  is form that come frome data in script-->
                                    <select class="form-control" v-model="form.quiz_class_id">
                                        <option value="">Select Class</option>
                                        <option :value="quiz_class.id" v-for="quiz_class in quiz_classes"
                                                v-bind:key="quiz_class.id">
                                            {{quiz_class.name}}
                                        </option>
                                    </select>
                                    <has-error :form="form" field="name"></has-error>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="inputName" class="col-sm-3 col-form-label">Subject</label>
                                <div class="col-sm-10">
                                    <!-- here  is form that come frome data in script-->
                                    <select class="form-control" v-model="form.subject_id">
                                        <option value="">Select Subject</option>
                                        <option :value="subject.id" v-for="subject in subjects"
                                                v-bind:key="subject.id">
                                            {{subject.name}}
                                        </option>
                                    </select>
                                    <has-error :form="form" field="name"></has-error>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="inputName" class="col-sm-3 col-form-label">Title</label>
                                <div class="col-sm-10">
                                    <!-- here  is form that come frome data in script-->
                                    <input type="text" v-model="form.title" class="form-control"
                                           :class="{ 'is-invalid': form.errors.has('title') }" required>
                                    <has-error :form="form" field="title"></has-error>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="inputName" class="col-sm-3 col-form-label">Start Time</label>
                                <div class="col-sm-10">
                                    <!-- here  is form that come frome data in script-->
                                    <input type="datetime-local" v-model="form.start" class="form-control"
                                           :class="{ 'is-invalid': form.errors.has('start') }" required>
                                    <has-error :form="form" field="start"></has-error>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="inputName" class="col-sm-3 col-form-label">Ending Time</label>
                                <div class="col-sm-10">
                                    <!-- here  is form that come frome data in script-->
                                    <input type="datetime-local" v-model="form.end" class="form-control"
                                           :class="{ 'is-invalid': form.errors.has('end') }" required>
                                    <has-error :form="form" field="end"></has-error>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="inputName" class="col-sm-3 col-form-label">Percentage(%)</label>
                                <div class="col-sm-10">
                                    <!-- here  is form that come frome data in script-->
                                    <input type="number" v-model="form.pass_percentage" class="form-control"
                                           :class="{ 'is-invalid': form.errors.has('pass_percentage') }" required>
                                    <has-error :form="form" field="pass_percentage"></has-error>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="offset-sm-2 col-sm-10">
                                    <button type="submit" @click.prevent="saveQuiz" class="btn btn-danger">Submit
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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
            form: new Form({
                version_id: '',
                quiz_class_id: '',
                subject_id: '',
                title: '',
                start: '',
                end: '',
                pass_percentage: '',
            }),
        }
    },
    mounted() {
        this.getVersion()
        this.getClasss()
        this.getSubject()
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
        saveQuiz() {
            this.form.post('/api/quiz')
                .then(() => {
                    Toast.fire({
                        icon: 'success',
                        title: 'Quiz Created Successfully'
                    })
                    this.$router.push({name: 'home'})
                })
                .catch(() => {
                    console.log("Error.....")
                })

        },
    }
}
</script>





<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card card-default">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                New Subject
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form class="form-horizontal">
                            <div class="form-group row">
                                <label for="inputName" class="col-sm-2 col-form-label">Class</label>
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
                                <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                                <div class="col-sm-10">
                                    <!-- here  is form that come frome data in script-->
                                    <input type="text" v-model="form.name" class="form-control"
                                           :class="{ 'is-invalid': form.errors.has('name') }" required>
                                    <has-error :form="form" field="name"></has-error>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="offset-sm-2 col-sm-10">
                                    <button type="submit" @click.prevent="saveSubject" class="btn btn-danger">Submit
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
            quiz_classes: null,
            form: new Form({
                name: '',
                quiz_class_id: '',
            }),
        }
    },
    mounted() {
        this.getClasss()
    },
    methods: {
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
        saveSubject() {
            this.form.post('/api/subject')
                .then(() => {
                    Toast.fire({
                        icon: 'success',
                        title: 'Subject Created Successfully'
                    })
                    this.$router.push({name: 'subject'})
                })
                .catch(() => {
                    console.log("Error.....")
                })

        },
    }
}
</script>





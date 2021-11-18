<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card card-default">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                New Class
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form class="form-horizontal">
                            <div class="form-group row">
                                <label for="inputName" class="col-sm-2 col-form-label">Version</label>
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
                                    <button type="submit" @click.prevent="saveQuizClass" class="btn btn-danger">Submit
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
            form: new Form({
                name: '',
                version_id: '',
            }),
        }
    },
    mounted() {
        this.getVersions()
    },
    methods: {
        getVersions() {
            this.$http({
                url: `api/version`,
                method: 'GET'
            })
                .then((response) => {
                    this.versions = response.data
                }, () => {
                })
        },
        saveQuizClass() {
            this.form.post('/api/quiz_class')
                .then(() => {
                    Toast.fire({
                        icon: 'success',
                        title: 'Class Created Successfully'
                    })
                    this.$router.push({name: 'quiz_class'})
                })
                .catch(() => {
                    console.log("Error.....")
                })

        },
    }
}
</script>





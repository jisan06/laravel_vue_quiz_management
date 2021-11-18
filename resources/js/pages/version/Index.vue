<template>
    <div class="container">
        <div class="card card-default">
            <div class="card-header">
                <div class="row">
                    <div class="col-sm-6">
                        Version list
                    </div>
                    <div class="col-sm-6 text-right">
                        <router-link :to="{ name :'version_create' }" class="btn btn-primary">Create Version</router-link>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                    </tr>
                    <tr v-for="version in versions" v-bind:key="version.id" style="margin-bottom: 5px;">
                        <td>{{ version.id }}</td>
                        <td>{{ version.name }}</td>
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
                versions: null
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
            }
        }
    }
</script>





<template>
    <section>
        <p>{{getUser(user_id)}}</p>
        <p>{{name}}:</p>
        <p>{{content}}</p>
        <!--<p class="floatRight">{{createdAt}}</p>-->
    </section>

</template>

<script>
import axios from 'axios'
export default{
    props:['content', 'id', 'user_id', 'blog_id', 'createdAt'],
    data(){
        return{
            user: null,
            name: '',
        }
    },
    methods:{
        getUser(id)
        {
            axios.get( `http://localhost:3000/auth/getUser/${id}`).then(
                (response) => {
                    this.name= response.data.user.firstname+' '+response.data.user.lastname;
                });
        }
    }
}
</script>

<style scoped>

section
{
    background-color: none;
    padding-top: 10px;
    padding-bottom: 10px;
    width: 100%;
}
section p{
    display: inline;
    width: 80%;
    margin-left: 10px;
}
.floatRight
{
    font-size: 10px;
    font-weight: 600;
}
</style>

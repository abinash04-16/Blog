<template>
    <div>
        <h2>Other Users</h2>
        <div class='container' v-for="user in usersList" :key="user.user_id">
            <p>{{user.name}}</p>
            <p>{{user.user_mail}}</p>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
export default{
    props:['curre_user'],

    created(){
        axios.get( 'http://localhost:3000/auth/getAll' ).then(
            (response) => {

                const temp = response.data.users;

                temp.forEach(element => {
                    if(element.id !== this.curre_user)
                    {
                        const sample={
                            name: element.firstname+' '+element.lastname,
                            user_id: element.id,
                            user_mail: element.email,
                        };
                        this.usersList.unshift(sample);
                    }
                    
                });

            }
        );
    },


    data(){
        return{
            usersList: [],
        }
    }


}
</script>

<style scoped>
.container{
    padding: 10px;
    border: none;
    box-shadow: 0 4px 4px black;


}
</style>
<template>
    <div>
        <div class="container">
            <h2>My Profile</h2>
            <div class="textbox">
                <input type='text' id='first' placeholder="First Name" v-model.trim="tempFirst"/>
            </div>
            <div class="textbox">
                <input type='text' id='first' placeholder="Last Name" v-model.trim="tempLast"/>
            </div>
            <div class="textbox">
                <input type='text' id='first' placeholder="email" v-model="email" readonly='readonly'/>
            </div>
            <div>
                <button @click="update"  :disabled="first_edited || last_edited ? false : true" >Update</button>
            </div>
        </div>

        <div class='container1'>
            
        </div>
    </div>
</template>

<script>
import axios from 'axios';
//import otherUser from './otherUsers.vue';

    export default{
        components:{
            //otherUser
        },
        created(){
            this.getData();
        },
        data(){
            return{
                firstName: '',
                lastName: '',
                tempFirst: '',
                tempLast: '',
                email: '',
                user: null,

                first_edited: false,
                last_edited: false,
            }
        },
        watch: {
            tempFirst: function(){
                if(this.firstName === this.tempFirst)
                {
                    this.first_edited = false
                }
                else
                {
                    this.first_edited = true;
                }
            },
            tempLast: function(){
                if(this.lastName === this.tempLast)
                {
                    this.last_edited = false
                }
                else
                {
                    this.last_edited = true;
                }
            }
        },
        methods:{
            getData(){
                axios.get('http://localhost:3000/auth/getCurrentUser' ).then(
                (response) => {
                    this.user = response.data.user;
                    this.email = response.data.user.email;
                    this.firstName = response.data.user.firstname;
                    this.lastName = response.data.user.lastname;
                    this.tempFirst = response.data.user.firstname;
                    this.tempLast = response.data.user.lastname;
                });
            },
            update()
            {
                axios.post( 'http://localhost:3000/auth/updateUser', { firstname: this.tempFirst, lastname: this.tempLast }).then(
                    (response) => {
                        console.log(response);
                        this.getData();
                        this.first_edited = false;
                        this.last_edited = false;
                    }
                );
            }
        }
    }
</script>

<style scoped>



button:disabled
{
    border: 1px solid rgb(136, 136, 136);
    color: rgb(136, 136, 136);
}
button{
    width: 50%;
    margin-left: 25%;
    padding-top: 7px;
    padding-bottom: 7px;
    font-size: 18px;
    border: 1px solid rgb(0, 0, 0);
}
.container
{
    margin-left: 40%;
    margin-right: 40%;
    width: 20%;
    margin-top: 17% ;
    color: white;
}

.container h2
{
    color: black;
    font-size: 35px;
}

.textbox
{
    width: 100%;
    padding: 10px;
    overflow: hidden;
    font-size: 18px;
    margin: 25px 0;
    border-bottom: 2px solid rgba(200, 200, 200, 0.746);
}

.textbox input:read-only
{
    color: rgb(77, 77, 77);
}

.textbox input{
    border: none;
    outline: none;
    font-size: 18px;
    background: none;
    color: #000;
}
</style>
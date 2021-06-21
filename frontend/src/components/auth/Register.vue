<template>
    <div class='container'>
        <h2>Register </h2>
        <form @submit.prevent="submit">
            <div class="textbox">
                <input type="text" name="mail" placeHolder="First Name" id='first' v-model.trim='firstName'/>
            </div>
            <div class="textbox">
                <input type="text" name="mail" placeHolder="Last Name" id='last' v-model.trim='lastName'/>
            </div>
            <div class="textbox">
                <input type="text" name="mail" placeHolder="Mail" id='mail' v-model.trim='mail'/>
            </div>
            <p v-if="error" style="color: #000">{{error_msg}}</p>
            <div class="textbox">
                <input type="password" name="Password" placeHolder="Password" id='Password' v-model.trim='password'/>
            </div>
            <p v-if="invalidInput">inputs are InValid</p>
            <div class="btn">
                <button>Submit</button>
            </div>
            <div class='altLink'>
                <p>Already have an Account, <router-link to="login">Login</router-link></p>
            </div>

        </form>
    </div>
</template>

<script>
    //import firebase from 'firebase';
    import axios from 'axios';
    export default{
        data(){
            return{
                firstName: '',
                lastName: '',
                mail: '',
                password: '',
                invalidInput: null,
                error: false,
                error_msg: '',
            };
        },
        methods:{
            submit(){
                if(this.firstName === '' || this.lastName === '' || this.mail === "" || this.password === "" || this.password.length < 6 || !this.mail.includes('@'))
                {
                    this.invalidInput = true;
                }
                else
                {
                    axios.post('http://localhost:3000/register', { firstName: this.firstName, lastName: this.lastName, email: this.mail, password: this.password}).then(
                        (response) => {
                            if(response.data.status === 'success' )
                            {
                                console.log(response);
                                this.$store.commit('setMail_andId', {mail: response.data.mail, id: response.data.id})
                                this.$router.push('login');
                            }
                            else {
                                if(response.data.message === 'email already taken')
                                {
                                    this.error = true;
                                    this.error_msg = 'email already taken'
                                    
                                }
                            }
                }
            );                   
                }
            },
        }
    }

</script>

<style scoped>

.whiteBack
{
    background-color: rgba(red, green, blue, 0.34);
}
.container1
{
    width: 100%;
    height: 100vh;
    position: absolute;
    top:50%;
    left: 50%;
    transform: translate(-50%,-50%);
    background-color: rgba(255, 255, 255, 0.63);
}
.container1 p
{
    font-size: 25px;
    text-align: center;
    padding-top: 50vh;
}
.container
{
    width: 25%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    color: white;
    padding: 70px;
    border-radius: 10px;
}
.container h2
{
    float: left;
    font-size: 37px;
    margin-bottom: 30px 0;
    color: black;
    padding-bottom: 20px;
    border-bottom: 3px solid #a3fa01;
}

.textbox
{
    width: 100%;
    padding: 10px;
    overflow: hidden;
    margin: 25px 0;
    border-bottom: 1px solid #000;
}

.textbox input{
    border: none;
    outline: none;
    font-size: 18px;
    background: none;
    color: black;
}

.btn button
{
    background: none;
    outline: none;
    border: 2px solid #000;
    padding: 10px;
    color: black;
    width: 100%;
    text-transform: uppercase;
    font-size: 20px;
    cursor: pointer;
    margin: 12px;
}
.altLink
{
    margin: 20px 0;
    text-align: center;
    font-size: 18px;
}
.altLink p
{
    color: black;
}

.altLink a
{
    color: red;
    font-weight: 600;
    font-family: Georgia, 'Times New Roman', Times, serif;
    text-decoration: none;
    cursor: pointer;
}
</style>
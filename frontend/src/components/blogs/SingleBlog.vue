<template>    
    <section @click="moveto">
        <div class="card">
            <div class="div1">
                <img :src="'http://localhost:3000'+image" >
            </div>
            <div class="div2">
                <h2>{{title}}</h2>
                <p>{{content}}</p>
                <div>
                    <p>| {{createdAt}}</p>
                    <p>{{name}} |</p>    
                </div>
                
            </div>
        </div>
    </section>
</template>

<script>
import axios from 'axios';
    
    export default{
        mounted(){
            this.get_name(this.from);
        },
        props:[ 'id', 'title', 'content', 'createdAt', 'from', 'image' ],
        data(){
            return{
                name: '',
            }
        },
        methods:
        {
            moveto(){
                const blogId = ''+this.id;
                this.$router.push('/blog/'+blogId);
            },
            get_name(id)
            {
                axios.get( `http://localhost:3000/auth/getUser/${id}`).then(
                    (response) => {
                        this.name = response.data.user.firstname + ' ' + response.data.user.lastname;
                    }
                );
            }
        }
    }
</script>


<style scoped>
/*
section{
    width: 70%;
    margin: 40px 1;
    background-color: #1F2833;
    border-radius: 8px;
    padding: 40px;
    box-shadow: 0 3px 20px rgba(0, 0, 0, 0.26);
}
section img{
    box-shadow: 0 4px 8px black;
    width: 300px;
    height: 280px;
}
.item1
{
    float: left;
    padding-right: 20px;
}
.topContainer
{
    color: #66FCF1;
    font-size: 30px;
    font-weight: 600;
    font-family: 'Courier New', Courier, monospace;
}
.bottomContainer
{
    color: #66FCF1;
    position: absolute;
    bottom: 0px;
    right: 20px;
}
.middleContainer
{
    color: #66FCF1;
    font-size: 20px;
}
.bottomContainer p
{
    color: #66FCF1;
    float: right;
}
*/
</style>
<template>
    <section>
        <div class="myheader" v-if="!$route.meta.hideNav">
            <p>Blogs</p>
            <div>
                <router-link to="/home" :class=" $route.path === '/home' ? 'selected' : null ">Home</router-link>
                <router-link to="/myBlogs" :class=" $route.path === '/myBlogs' ? 'selected' : null ">My Blogs</router-link>
                <router-link to="/addBlog" :class=" $route.path === '/addBlog' ? 'selected' : null ">Add Blog</router-link>
                <router-link to="/about" :class=" $route.path === '/about' ? 'selected' : null ">About</router-link>
                <button @click="logout">Log Out</button>
            </div>
        </div>
    </section>
</template>

<script>
    export default {
        methods:{
            logout()
            {
                this.$store.dispatch('logout');
            }
        },
    }
</script>


<style scoped>
.myheader
{
    overflow: hidden;
    position: fixed;
    z-index: 1;
    background-color: black;
    top: 0;
    left: 0;
    width: 100%;
    padding: 2%;
    
}
.myheader p
{
    float: left;
    font-size: 30px;
    padding: 0px;
    margin-top: 0px;
    margin-bottom: 0px;
    margin-left: 9%;
    color: white;
}
.myheader div{
    float: right;
    margin-right: 13%;

}
a{
    padding: 10px;
    color: rgb(209, 138, 138);
    font-size: 20px;
    text-decoration: none;
}

button{
    margin-left: 10px;
    color: rgb(209, 138, 138);
    font-size: 20px;
    padding: 0px;
    text-decoration: none;
    background: black;
    border: none;
}

button:hover{
    cursor: pointer;
    color: white;
    font-size: 28px;
    transition: .4s;
}

a:hover{
    cursor: pointer;
    color: white;
    font-size: 25px;
    transition: .4s;
}

.selected
{
    color: white;
    font-weight: 600;
    font-size: 28px;
}
</style>

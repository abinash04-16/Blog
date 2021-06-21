<template>
    <router-view></router-view>
    <div v-if="blogs.length === 0" class='nothing'>
        <p> nothing to show, Click add Blog to create your own Blogs</p>
    </div>
    <section v-else >
        <section class="card-wrapper" >
            <single-blog v-for="blog in blogs"
                :key='blog.id'
                :id='blog.id'
                :from='blog.user_id'
                :createdAt="blog.createdAt"
                :title='blog.title'
                :image=blog.image
                :content="blog.maincontent"></single-blog>
            </section>
        </section>
        
</template>


<script>
    import axios from 'axios';
    import SingleBlog from './SingleBlog.vue';

    export default {
        created()
        {
            console.log(this.$store.state.isLoggedIn);
            this.$store.commit('getAllBlogs');

        },
        components:{
            SingleBlog,
        },
        data(){
            return{
                addButton: true,
                blogs: this.$store.state.blogs,
            };
        },
        methods:{
            get_mail(id)
            {
                axios.get( `http://localhost:3000/auth/getUser/${id}`).then(
                    (response) => {
                        console.log(response.data.user.email);
                        return response.data.user.email;
                    }
                );
            }
        }
    }
</script>


<style scoped>


/*button
{
    width: 50%;
    margin-left:25%;
}
*/
/*section {
  box-sizing: border-box;
  font-family: sans-serif;
  margin: 0 auto;
  height: 40vh;
  margin-top: 7%;
  width:90%;
  position: relative;
}
*/
</style>


<template>
    <router-view></router-view>
    <div v-if="blogs.length === 0" class='nothing'>
        <p> nothing to show, Click add Blog to create your own Blogs</p>
    </div>
    <section v-else >
        <section class="card-wrapper">
            <single-blog v-for="blog in blogs"
            :key='blog.id'
            :id='blog.id'
            :from='blog.user_id'
            :createdAt="blog.createdAt"
            :title='blog.title'
            :image='blog.image'
            :content="blog.maincontent"></single-blog>
        </section>
    </section>


</template>


<script>
    import SingleBlog from './SingleBlog.vue';
    import axios from 'axios';
    export default {
        created()
        {
            this.$store.commit( 'setPath', { path: 'my'});
            axios.get(`http://localhost:3000/blog/myBlogs/${this.$store.state.user_id}`).then(
                (response) => {
                    const temp = response.data.blog;
                    temp.forEach(t => {
                        const sample = {
                            id: t.id,
                            title: t.title,
                            maincontent: t.maincontent,
                            content1: t.content1,
                            content2: t.content2,
                            user_id: t.user_id,
                            image: t.image.url,
                            createdAt: t.created_at,
                            updatedAt: t.updated_at,
                        }
                        this.blogs.unshift(sample);                
                    });
                }
            );
            console.log(this.blogs);

        },
        components:{
            SingleBlog,
        },
        data(){
            return{
                addButton: true,
                blogs: [],
            };
        },
    }
</script>


<style scoped>
/*
button
{
    width: 50%;
    margin-left:25%;
}
section {
  box-sizing: border-box;
  font-family: sans-serif;
  margin: 0 auto;
  height: 40vh;
  margin-top: 7%;
  width: 90%;
  position: relative;
}
*/
</style>
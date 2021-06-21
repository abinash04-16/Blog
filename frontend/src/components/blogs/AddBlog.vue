<template>
    <form @submit.prevent="addBlog">
        <h2>ADD BLOG</h2>
        <div class='divItem'>
            <label for="name">Title</label>
            <input type="text" name="title" v-model.trim='title'>
        </div>
        <div class='divItem'>
            <label for="content">Enter your Content in Short</label>
            <input name="content" rows="2" cols="50" v-model.trim='maincontent'>
        </div>
        <div class='divItem'>
            <label for="content1">Paragraph</label>
            <textarea name="content1" rows="4" cols="50" v-model.trim='content1'></textarea>
        </div>
        <div class='divItem'>
            <label for="content2">Paragraph(optional)</label>
            <textarea name="content2" rows="4" cols="50" v-model.trim='content2'></textarea>
        </div>
        <div class='divItem'>
            <label for="image">Select your Blog Image</label>
            <input type="file" name="image" accept="image/*" @change="fileSelected">
        </div>
        <div class='divItem'>
            <button>ADD</button>
        </div>
    </form>
    <div v-if="loading" :class="loading ? 'loading' : null">
                <p>Loading......</p>
            </div>

    
</template>

<script>
    //import firebase from 'firebase';
    import axios from 'axios';
    export default
    {
        created(){
            this.$store.commit( 'set_path', { path: 'add'});
        },
        data(){
            return{
                img: null,
                isValid: null,
                title:'',
                maincontent: '',
                content1: null,
                content2: null,
                temp: new Date().getTime(),
                img_upload: false,
                data_upload: false,
                img_url: null,
                loading:false,
            };
        },
        methods:
        {

            fileSelected(event)
            {
                this.img = event.target.files[0];
                console.log(this.img);
            },
            addBlog()
            {
                
                if( this.title !== '' && this.maincontent !== '' && this.content1 !== '')
                {
                    
                    this.loading = true;

                    var formData = new FormData();
                    formData.append('title', this.title);
                    formData.append('user_id', this.$store.state.user_id);
                    formData.append('user_mail', this.$store.state.user_mail);
                    formData.append('maincontent', this.maincontent);
                    formData.append('content1', this.content1);
                    formData.append('content2', this.content2);
                    formData.append('file', this.img);
                    axios.post( 'http://localhost:3000/blog/add', formData, {
                        headers : { 'Content-Type': 'multipart/form-data' }
                    })
                    .then(
                        (response) => {
                            console.log(response);
                            if(response.data.result === 'success' )
                            {
                                setTimeout( () => { this.$router.push('/home'); },1000);
                            }
                        }
                    );

                    /*
                    firebase.storage().ref(''+this.temp+".jpg").put(this.img).then((snapshot) => {
                        snapshot.ref.getDownloadURL().then(url => { 
                            this.img_url = url;
                        });
                        setTimeout(() => {
                            firebase.database().ref('blogs/'+ this.temp).set({
                                id: this.temp,
                                title:this.title,
                                maincontent:this.maincontent,
                                content1:this.content1,
                                content2: this.content2,
                                createdAt: new Date().toLocaleString(),
                                userId: this.$store.state.userId,
                                imgUrl: this.img_url,
                                userMail: this.$store.state.userMail}).then(() =>
                                { 
                                    console.log("finished");
                                    this.loading = false;
                                    this.$router.push('/home');
                            });
                        }, 2000);
                        
                    });
                    */
                }else{
                    this.isValid= false;
                }
            },
        }
    }
</script>

<style scoped>

.divItem
{
    padding-bottom: 10px;
    width: 94%;
    margin-left: 3%;
}

.divItem input
{
    font-size: 15px;
    padding-top: 10px;
    padding-left: 10px;
    border-radius: 8px;

}
label
{
    display: block;
    margin-bottom: 10px;
    font-size: 19px;
    color: rgb(121, 120, 120);
}

.divItem textarea
{
    font-size: 15px;
    padding-top: 10px;
    padding-left: 10px;
    height: 10vh;
    border-radius: 8px;

}

.divItem button
{
    background: none;
    font-size: 20px;
    border: 1px solid black;
    padding-top: 10px;
    padding-bottom: 10px;
}
button:hover
{
    cursor: pointer;
}
.loading
{
    width: 100%;
    margin: 0 auto;
    position: absolute;
    bottom: 0px;
}
.loading p
{
    text-align: right;
    font-size: 20px;
}
form{
    width: 50%;
    border-radius: 5px;
    height: 70vh;
    margin: 0 auto;
    background-color: none;
    border-color: rgb(162, 89, 231);
    padding: 20px;
    margin-top: 5%;
}
h2
{
    font-size: 37px;
    text-align: left;
    margin-left: 3%;
}
input{
    width: 100%;
    padding: 10px 0;
    border-radius: 4px;
    margin-bottom: 10px;
    border: 1px solid rgb(192, 191, 191);
    color: black;
    
}

textarea{
    width: 100%;
    padding: 10px 0;
    margin-bottom: 10px;
    border-radius: 4px;
    border: none;
    color: black;
    border: 1px solid rgb(192, 191, 191);
    
}
button
{
    width: 50%;
    margin-left:25%;
    padding: 5px;
    font-weight: 600;
    border-radius: 10px;
}
a
{
    float: right;
    text-decoration: none;
    color: black;
    cursor: pointer;
    font-weight: bold;
    padding: 3px;
}

a:hover
{
    border: 1px solid black;
}

.myheader
{
    overflow: hidden;
    position: fixed;
    z-index: 1;
    background-color: black;
    top: 0;
    text-decoration: none;
    left: 0;
    width: 100%;
    padding: 5rem 1;
    padding-bottom: 15px;
    
}
.myheader h2
{
    float: left;
    font-size: 30px;
    color: white;
    text-align: center;
    margin-left: 20%;
}

.myheader div{
    float: right;
    margin-right: 10%;
    margin-top: 2%;

}

</style>

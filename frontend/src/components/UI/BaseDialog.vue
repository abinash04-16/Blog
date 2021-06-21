<template>
    <section>
        <dialog open class='container'>
            <div>
                <slot name='close'></slot>
            </div>
            <div class="title">
                <h2>{{title}}</h2>
            </div>
            <div class="msg">
                <p>{{msg}}</p>
            </div>
            <slot></slot>
        </dialog>
    </section>
</template>

<script>
    export default{
        props:[ 'title', 'msg']
    }
</script>
<style scoped>
dialog {
  position: fixed;
  width: 70%;
  height: 85%;
  top: 8%;
  z-index: 1;
  border-radius: 12px;
  border: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
  padding: 1rem;
  overflow: hidden;
  background-color: #1F2833;
  border: 2px solid #440707;
}

.title
{
    color: #66FCF1;
    text-align: center;
}
.title h2
{
    font-family: 'Courier New', Courier, monospace;
    font-size: 30px;
}

</style>

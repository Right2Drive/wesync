<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style lang="scss">
@import url('https://fonts.googleapis.com/css?family=Bungee');

body {
  margin: 0;
  height: 100vh;
  width: 100vw;
  font-family: Georgia, serif;

  #app {
    height: 100vh;
    width: 100vw;

    .page {
      height: 100vh;
      width: 100vw;
      position: absolute;
    }
  }
}
</style>

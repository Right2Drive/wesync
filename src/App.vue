<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style lang="scss">
@import url('https://fonts.googleapis.com/css?family=Bungee');
@import url('https://fonts.googleapis.com/css?family=Roboto+Slab');

body {
  margin: 0;
  height: 100vh;
  width: 100vw;
  font-family: 'Roboto Slab', serif;

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

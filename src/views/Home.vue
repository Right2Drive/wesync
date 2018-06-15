<template>
  <div class="home">
    <div class="panel left">
      <p>Stream</p>
    </div>
    <div class="panel right">
      <p>Share</p>
    </div>
  </div>
</template>

<script>
</script>

<style lang="scss" scoped>

.home {
  height: 100%;
  display: flex;
  flex-direction: row;

  .panel {
    flex: 1 0 auto;
    width: 0;
    background-color: $lightHome;
    transition: background-color $transitionTime ease;
    display: flex;
    align-items: center;
    justify-content: center;

    &:hover {
      background-color: $darkHome;

      > p {
        color: $white;
      }
    }

    > p {
      color: $black;
      font-size: 50px;
      font-family: 'Bungee', cursive;
      transition: color $transitionTime ease;
    }
  }

}
</style>

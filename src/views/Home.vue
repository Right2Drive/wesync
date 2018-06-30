<template>
  <transition
    name="slide"
  >
    <div class="home-page page">
      <div class="panel left" @click="goToVideoPage">
        <div class="spacer"></div>
        <p class="header">Stream</p>
        <input
          class="uuid-input"
          type="text"
          placeholder="uuid"
        >
      </div>
      <div class="panel right" @click="goToVideoPage">
        <div class="spacer"></div>
        <p class="header">Share</p>
      </div>
    </div>
  </transition>
</template>

<script>
/*
TODO: add a transition that shifts both divs out of the page, split in the middle, with the new page rendered behind it
*/
import Vue from 'vue'

export default Vue.extend({
  methods: {
    goToVideoPage () {
      this.$router.push({
        name: 'video',
      })
    },
  },
})
</script>

<style lang="scss" scoped>

.home-page {
  background-color: $black;
  display: flex;
  flex-direction: row;
  overflow: hidden;

  .panel {
    flex: 1 0 auto;
    width: 0;
    background-color: $lightHome;
    transition: background-color $transitionTime ease;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;

    &:hover {
      background-color: $darkHome;

      .header {
        color: $white;
      }

      .uuid-input {
        opacity: 1;
      }
    }

    .header {
      color: $black;
      font-size: 50px;
      font-family: 'Bungee', cursive;
      transition: color $transitionTime ease;
    }

    .spacer {
      flex: 0 0 40%;
    }

    .uuid-input {
      transition: opacity $transitionTime ease;
      border-radius: 1%;
      height: 25px;
      width: 200px;
      background-color: transparent;
      border: 2px solid $white;
      opacity: 0;
    }
  }

  &.slide-leave-active,
  &.slide-enter-active {
    // Necessary for Vue to pickup the timing
    transition: none $slideOutTime ease-in-out;

    .panel {
      transition: transform $slideOutTime ease-in-out;
    }
  }

  &.slide-leave-to {
    .panel {
      &.left {
        transform: translate3d(-100%, 0, 0);
      }
      &.right {
        transform: translate3d(100%, 0, 0);
      }
    }
  }

  &.slide-enter {
    .panel {
      &.left {
        transform: translate3d(-100%, 0, 0);
      }
      &.right {
        transform: translate3d(100%, 0, 0);
      }
    }
  }
}
</style>

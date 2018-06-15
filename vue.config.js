module.exports = {
  css: {
    loaderOptions: {
      sass: {
        data: `@import "@/scss/_env.scss";
               @import "@/scss/_mixins.scss";
               `,
      },
    },
  },
}

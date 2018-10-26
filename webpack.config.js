module.exports = function () {
  const webpackEnv = process.env.WEBPACK_ENV

  switch (webpackEnv) {
    case 'prod':
    case 'dev':
      return require(`./webpack/${webpackEnv}.config.js`)()

    default:
      throw new Error(`no such build configuration for "${webpackEnv}"`)
  }
}

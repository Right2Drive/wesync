const createConfig = require('./base.config')
const { root } = require('./util')

function devConfig () {
  return createConfig({
    mode: 'development',
    devServer: {
      contentBase: root('dist')
    }
  })
}

module.exports = devConfig

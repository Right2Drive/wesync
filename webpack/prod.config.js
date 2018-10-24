const CleanWebpackPlugin = require('clean-webpack-plugin')
const SriPlugin = require('webpack-subresource-integrity')

const createConfig = require('./base.config')
const { root } = require('./util')

function prodConfig () {
  return createConfig({
    mode: 'production',
    output: {
      crossOriginLoading: 'anonymous',
    },
    plugins: [
      new CleanWebpackPlugin(['dist'], {
        root: root()
      }),
      new SriPlugin({
        hashFuncNames: ['sha256', 'sha384'],
        enabled: process.env.NODE_ENV === 'production',
      }),
    ]
  })
}

module.exports = prodConfig

const HtmlWebpackPlugin = require('html-webpack-plugin')
const merge = require('webpack-merge')

const { root } = require('./util')

const baseConfig = {
  target: 'web',
  entry: {
    main: root('src', 'index.js')
  },
  output: {
    path: root('dist'),
    filename: '[name].[hash].js'
  },
  resolve: {
    extensions: ['.elm', '.js']
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: root('src', 'index.html'),
      inject: 'body'
    })
  ]
}

function createConfig (config) {
  return merge(baseConfig, config)
}

module.exports = createConfig

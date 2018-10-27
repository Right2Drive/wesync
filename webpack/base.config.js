const HtmlPlugin = require('html-webpack-plugin')
const FaviconsPlugin = require('favicons-webpack-plugin')
const merge = require('webpack-merge')

const { root } = require('./util')

const baseConfig = {
  target: 'web',
  entry: {
    main: root('src', 'index.js')
  },
  output: {
    path: root('dist'),
    filename: '[name].[hash].js',
    publicPath: '/'
  },
  resolve: {
    extensions: ['.elm', '.js']
  },
  plugins: [
    new HtmlPlugin({
      template: root('src', 'index.html'),
      inject: 'body'
    }),
    new FaviconsPlugin(root('assets', 'favicon.png'))
  ]
}

function createConfig (config) {
  return merge(baseConfig, config)
}

module.exports = createConfig

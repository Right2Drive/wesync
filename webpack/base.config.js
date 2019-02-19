const CleanWebpackPlugin = require('clean-webpack-plugin')
const CopyPlugin = require('copy-webpack-plugin')
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
    new CleanWebpackPlugin(['dist'], {
      root: root()
    }),
    new CopyPlugin([
      {
        from: root('assets', '_redirects'),
        to: root('dist')
      },
      {
        from: root('assets', 'browserconfig.xml'),
        to: root('dist')
      },
      {
        from: root('assets', 'robots.txt'),
        to: root('dist')
      },
      {
        from: root('assets', '.well-known'),
        to: root('dist', '.well-known')
      },
      {
        from: root('assets', 'icons'),
        to: root('dist', 'icons')
      }
    ]),
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

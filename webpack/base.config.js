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
  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: {
          loader: 'elm-webpack-loader',
          options: {
            cwd: root(),
            optimize: true,
          },
        },
      },
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: root('src', 'index.html'),
      inject: 'body'
    }),
  ],
}

function createConfig (config) {
  return merge(baseConfig, config)
}

module.exports = createConfig

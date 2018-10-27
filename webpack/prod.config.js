const CleanWebpackPlugin = require('clean-webpack-plugin')
const SriPlugin = require('webpack-subresource-integrity')
const CopyPlugin = require('copy-webpack-plugin')

const createConfig = require('./base.config')
const { root } = require('./util')

function prodConfig () {
  return createConfig({
    mode: 'production',
    output: {
      crossOriginLoading: 'anonymous'
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
              optimize: true
            }
          }
        }
      ]
    },
    plugins: [
      new CleanWebpackPlugin(['dist'], {
        root: root()
      }),
      new SriPlugin({
        hashFuncNames: ['sha256', 'sha384'],
        enabled: process.env.NODE_ENV === 'production'
      }),
      new CopyPlugin([
        {
          from: root('public/*'),
          to: root('dist')
        },
        {
          from: root('public', '.well-known'),
          to: root('dist', '.well-known')
        }
      ])
    ]
  })
}

module.exports = prodConfig

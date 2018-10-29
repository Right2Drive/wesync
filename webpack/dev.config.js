const createConfig = require('./base.config')
const { root } = require('./util')

function devConfig () {
  return createConfig({
    mode: 'development',
    devServer: {
      contentBase: root('dist'),
      historyApiFallback: true,
      index: root('dist', 'index.html'),
      overlay: true,
      hot: false
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
              debug: true
            }
          }
        }
      ]
    }
  })
}

module.exports = devConfig

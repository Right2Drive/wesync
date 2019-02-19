const SriPlugin = require('webpack-subresource-integrity')
const ManifestPlugin = require('webpack-pwa-manifest')

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
      new SriPlugin({
        hashFuncNames: ['sha256', 'sha384'],
        enabled: process.env.NODE_ENV === 'production'
      }),
      new ManifestPlugin({
        fingerprints: false,
        name: 'WeSync Video Client',
        short_name: 'WeSync',
        description: 'Video streaming application for local files with synced controls',
        background_color: '#616161',
        theme_color: '#212121',
        display: 'standalone',
        icons: [
          {
            src: root('assets', 'favicon.png'),
            sizes: [96, 128, 192, 256, 384, 512]
          }
        ]
      })
    ]
  })
}

module.exports = prodConfig

const path = require('path')

exports.root = (...filesOrDirs) => path.resolve(__dirname, '..', ...filesOrDirs)

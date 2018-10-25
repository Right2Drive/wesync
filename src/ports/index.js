import * as cache from './cache'

const createListen = app => module => {
  Object.keys(module).forEach((portName) => {
    app[portName].subscribe(module[portName])
  })
}

function interop(app) {
  const listen = createListen(app)
  listen(cache)
}

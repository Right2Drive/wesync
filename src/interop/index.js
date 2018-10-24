import * as storage from './storage'

const createListen = app => module => {
  Object.keys(module).forEach((portName) => {
    app[portName].subscribe(module[portName].bind(undefined, app[portName].sendMessage))
  })
}

function interop(app) {
  const listen = createListen(app)
  listen(storage)
}

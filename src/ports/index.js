import * as cache from './cache'

const createListen = app => module => {
  Object.keys(module).forEach((portName) => {
    console.log(`trying for ${portName}`)
    app.ports[portName].subscribe(module[portName])
  })
}

function listenOnPorts(app) {
  const listen = createListen(app)
  listen(cache)
}

export { listenOnPorts }

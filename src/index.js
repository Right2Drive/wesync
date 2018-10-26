import { Elm } from './Main'
import { getFlags } from './flags'
import { listenOnPorts } from './ports'

const app = Elm.Main.init({
  node: document.getElementsByTagName('body')[0],
  flags: getFlags()
})

listenOnPorts(app)

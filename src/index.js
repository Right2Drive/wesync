import { Elm } from './Main'
import { getFlags } from './flags'

const app = Elm.Main.init({
  node: document.getElementsByTagName('body')[0],
  flags: getFlags()
})

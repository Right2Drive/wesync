import { getCache } from './cache'

function getFlags() {
  return {
    cache: getCache()
  }
}

export { getFlags }

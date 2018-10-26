function setCache (value) {
  window.localStorage.setItem('elmcache', JSON.stringify(value))
}

export {
  setCache
}

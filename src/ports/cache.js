function setCache(value) {
  localStorage.setItem('elmcache', JSON.stringify(value))
}

export {
  setCache
}

function getCache() {
  const value = localStorage.getItem('elmcache')
  return JSON.parse(value)
}

export { getCache }

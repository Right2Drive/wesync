function getCache () {
  const value = window.localStorage.getItem('elmcache')
  return JSON.parse(value)
}

export { getCache }

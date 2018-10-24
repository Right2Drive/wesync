function setLocalStorage({ key, value }) {
  const { key, value } = msg.data
  localStorage.setItem(key, JSON.stringify(value))
}

function getLocalStorage({ key, value }, sendMessage) {
  const { key } = msg.data
  // TODO: Do we need JSON.parse/stringify??
  const value = JSON.parse(localStorage.getItem(key))
  sendMessage({ key, value })
}

export {
  setLocalStorage,
  getLocalStorage
}

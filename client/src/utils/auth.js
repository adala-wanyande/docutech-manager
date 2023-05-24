const storeToken = (token) => {
  localStorage.setItem("token", token);
};
const getToken = () => {
  return localStorage.getItem("token");
};
const isUserLoggedIn = () => {
  return !!getToken();
};
const removeToken = () => {
  localStorage.removeItem("token");
};

export { isUserLoggedIn, storeToken, getToken, removeToken };

import axios from "axios";
// Next we make an 'instance' of it

const baseURL = import.meta.env.VITE_BASE_API_URL;
const instance = axios.create({
  // .. where we make our configurations
  baseURL,
});
// console.log(baseURL);
// Where you would set stuff like your 'Authorization' header, etc ...
instance.defaults.headers.common["Authorization"] =
  localStorage.getItem("token") || "";
instance.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    if (error.response.status == 401) {
      localStorage.removeItem("token");
      window.location.pathname = "/login";
    }
    return Promise.reject(error);
  }
);
export default instance;

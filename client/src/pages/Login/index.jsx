import { useState } from "react";
import { Link } from "react-router-dom";
import network from "../../utils/network";
import { useNavigate } from "react-router-dom";
import { storeToken } from "../../utils/auth";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
function Login({ setUser }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
    const details = {
      email,
      password,
    };
    //TODO:: Handle validation

    setIsLoading(true);

    network
      .login(details)
      .then((response) => {
        storeToken(response.data.data.token);
        navigate("/todos");
        console.log(response.data.data.user);
        setUser(response.data.data.user);
      })
      .catch((error) => {
        toast.error(JSON.stringify(error.response.data.message));
      })
      .finally(() => {
        setIsLoading(false);
      });
  };

  return (
    <form className="form" onSubmit={handleSubmit}>
      <ToastContainer />
      <h4 className="">
        {isLoading ? "Getting  you onboard" : "Login to see your tasks"}
      </h4>
      <label htmlFor="Email">Email:</label>
      <input
        type="text"
        name="email"
        placeholder="eg. janedoe@gmail.com"
        className=""
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        required
      />
      <label htmlFor="password">Password:</label>
      <input
        type="password"
        name="password"
        className=""
        value={password}
        onChange={(e) => setPassword(e.target.value)}
      />

      <button className="btn">login</button>
      <p>
        Don't have an account?{" "}
        <Link to="/signup" className="formLink">
          sign up here
        </Link>
      </p>
    </form>
  );
}

export default Login;

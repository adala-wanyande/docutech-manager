import { useState } from "react";
import { Link } from "react-router-dom";
import network from "../../utils/network";
import { useNavigate } from "react-router-dom";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

function Signup() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [username, setUsername] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
    const details = {
      email,
      password,
      username,
    };

    setIsLoading(true);

    network
      .register(details)
      .then((response) => {
        navigate("/login");
      })
      .catch((error) => {
        toast.error(JSON.stringify(error.response.data));
      })
      .finally(() => {
        setIsLoading(false);
      });
  };

  return (
    <form className="form" onSubmit={handleSubmit}>
      <ToastContainer />
      <h4 className="">
        {isLoading ? "Getting  you onboard" : "Sign up to get sarted "}
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

      <label htmlFor="name">Name:</label>
      <input
        type="text"
        name="name"
        placeholder="eg. Jane Doe"
        className=""
        value={username}
        onChange={(e) => setUsername(e.target.value)}
      />

      <label htmlFor="password">Password:</label>
      <input
        type="password"
        name="password"
        className=""
        value={password}
        onChange={(e) => setPassword(e.target.value)}
      />

      <button type="submit" className="btn">
        sign up
      </button>
      <p>
        Already have an account?{" "}
        <Link to="/login" className="formLink">
          sign in here
        </Link>
      </p>
    </form>
  );
}

export default Signup;

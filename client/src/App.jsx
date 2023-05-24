import { Route, Routes } from "react-router-dom";
import Home from "./pages/Home";
import Navbar from "./components/Navbar";
import Signup from "./pages/Signup";
import Login from "./pages/Login";
import NewTask from "./pages/NewTask";
import Todos from "./pages/Todos";
import { useState, useEffect } from "react";
import { getToken } from "./utils/auth";
import network from "./utils/network";
import { useNavigate } from "react-router-dom";
import UpdateTask from "./pages/UpdateTask";

function App() {
  const [user, setUser] = useState(null);
  const navigate = useNavigate();
  const token = getToken();

  const getUser = async () => {
    if (token) {
      try {
        const response = await network.autoLogin();
        setUser(response.data);
      } catch (err) {
        // toast.error(JSON.stringify(err.response.message));
      }
    }
  };
  useEffect(() => {
    getUser();
  }, []);

  return (
    <div className="main">
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/signup" element={<Signup />} />
        <Route path="/login" element={<Login setUser={setUser} />} />
        <Route path="/newtask" element={<NewTask />} />
        <Route path="/todos" element={<Todos user={user?.username} />} />
        <Route path="/update/:id" element={<UpdateTask />} />
      </Routes>
    </div>
  );
}

export default App;

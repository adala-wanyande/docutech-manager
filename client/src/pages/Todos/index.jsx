import TaskGroup from "../../components/TaskGroup";
import { Link, useNavigate } from "react-router-dom";
import { isUserLoggedIn } from "../../utils/auth";
import { useEffect, useState } from "react";
import network from "../../utils/network";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

function Todos({ user }) {
  const [todos, setTodos] = useState([]);
  const [loading, setLoading] = useState(false);

  const navigate = useNavigate();

  const getTodos = async () => {
    setLoading(true);
    if (isUserLoggedIn()) {
      try {
        const response = await network.getTasks();
        setTodos(response.data.data);
      } catch (err) {
        toast.error(JSON.stringify(err.message));
        console.log(err.message);
      }
      setLoading(false);
    } else {
      navigate("/login");
    }
  };
  useEffect(() => {
    getTodos();
  }, []);
  const createdTodos = todos?.filter((todo) => todo.status === "CREATED");
  const ongoingTodos = todos?.filter((todo) => todo.status === "STARTED");
  const completedTodos = todos?.filter((todo) => todo.status === "COMPLETED");
  return (
    <div className="todos">
      {/* todos nav */}
      <ToastContainer />
      <div className="todosNav">
        <nav className="nav">
          <Link to="/todos" className="nav__link">
            Task List
          </Link>
          <ul className="nav__links">
            <li className="nav__item">
              <Link className="nav__link" to="/newtask">
                + Add new task
              </Link>
            </li>
            <li className="nav__item user">
              <i className="fa-solid fa-user"></i> {user || "Guest"}
            </li>
          </ul>
        </nav>
      </div>
      {/* main sec */}
      <div className="todosCont">
        <TaskGroup
          groupTitle={"Todo"}
          groupDescription={"This item hasn't been started"}
          todos={createdTodos}
        />
        <TaskGroup
          groupTitle={"Ongoing"}
          groupDescription={"This is actively being worked on"}
          todos={ongoingTodos}
        />
        <TaskGroup
          groupTitle={"Completed"}
          groupDescription={"This has been completed"}
          todos={completedTodos}
        />
      </div>
    </div>
  );
}

export default Todos;

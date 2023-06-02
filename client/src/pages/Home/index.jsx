import { Link } from "react-router-dom";

function Home() {
  return (
    <div className="mainTitle">
      <div>
        <h1>
          <span className="highlight">Conquer</span> your day with
          <span className="highlight">DocuTech</span>
        </h1>
        <h4>
          A simple and user-friendly app designed to help you stay on top of
          your tasks and increase your productivity.{" "}
        </h4>
        <Link to="/signup">
          <button className="btnText">Get Started &rarr;</button>
        </Link>
      </div>
      <div>
        <img
          src="https://www.taskopad.com/wp-content/uploads/2021/05/Easier-task-assignment.png"
          className="mainImg"
          alt="home image"
        />
      </div>
    </div>
  );
}

export default Home;

import { useState } from "react";
import network from "../utils/network";
import Modal from "./Modal";
import { Link } from "react-router-dom";

const TaskStatus = ({ currentValue, onChange }) => {
  const statusStyle = () => {
    if (currentValue === "CREATED") {
      return "red";
    } else if (currentValue === "STARTED") {
      return "orange";
    } else if (currentValue === "COMPLETED") {
      return "green";
    }
  };

  return (
    <div className="status-container">
      <div>
        <select
          className={`task-status ${statusStyle()}`}
          defaultValue={currentValue}
          onChange={(e) => {
            onChange(e.target.value);
          }}
        >
          <option value={null}>Status</option>
          <option value="0">To Do</option>
          <option value="1">On Going</option>
          <option value="2">Completed</option>
        </select>
      </div>
    </div>
  );
};

function TaskItem({ task }) {
  const [showDetails, setShowDetail] = useState(false);
  const [showModal, setShowModal] = useState(false);
  // const [confirmDelete, setDelete] = useState(false);
  const handleShowDetails = () => {
    setShowDetail(!showDetails);
  };
  const deleteTask = () => {
    network.deleteTask(task.id);
    setShowModal(false);
    window.location.reload();
  };
  const handleSubmit = (newStatus) => {
    const details = {
      ...task,
      status: +newStatus,
    };
    network
      .updateTask(task.id, details)
      .then((response) => {
        window.location.reload();
        console.log(response.data);
      })
      .catch((error) => {
        toast.error(JSON.stringify(error.response.data.message));
      });
  };

  return (
    <div className="task-item">
      <div className="task-header">
        <h3>{task.title}</h3>
        <i
          className={`fa-solid arrow ${
            showDetails ? "fa-chevron-up" : "fa-chevron-down"
          }`}
          onClick={handleShowDetails}
        ></i>
      </div>
      {showDetails && <p>{task.description}</p>}
      <p>priority: {task.priority}</p>
      {showDetails && (
        <div className="task-header">
          <TaskStatus currentValue={task.status} onChange={handleSubmit} />
          <Link to={`/update/${task.id}`}>
            <i className="fa-sharp fa-solid fa-pen-to-square task-btn"></i>
          </Link>
          <i
            className="fa-solid fa-trash-can task-btn"
            onClick={() => {
              setShowModal(true);
            }}
          ></i>
          {showModal ? (
            <Modal>
              <div className="modal-content">
                <h1>Are you sure you want to delete?</h1>
                <div className="buttons">
                  <button onClick={() => deleteTask()}>Yes</button>
                  <button onClick={() => setShowModal(false)}>No</button>
                </div>
              </div>
            </Modal>
          ) : null}
        </div>
      )}
    </div>
  );
}

export default TaskItem;

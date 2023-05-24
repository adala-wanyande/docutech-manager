import TaskItem from "./TaskItem";

function TaskGroup({ groupTitle, groupDescription, todos }) {
  const titleColor = () => {
    if (groupTitle === "Todo") {
      return "red circle";
    } else if (groupTitle === "Ongoing") {
      return "orange circle";
    } else {
      return "green circle";
    }
  };

  return (
    <div className="taskGroup">
      <div className="taskTitle">
        <div className={titleColor()}></div>
        <h3>{groupTitle}</h3>
      </div>
      <p>{groupDescription}</p>
      <div className="task-items">
        {todos.length === 0 ? (
          <p className="no-tasks task-item">No tasks yet!</p>
        ) : (
          todos?.map((task) => <TaskItem key={task.id} task={task} />)
        )}
      </div>
    </div>
  );
}
export default TaskGroup;

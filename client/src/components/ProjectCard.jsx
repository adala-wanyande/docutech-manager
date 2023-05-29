import React from 'react';

function ProjectCard({ title, tasks }) {
  return (
    <div>
      <h3>{title}</h3>
      <ul>
        {tasks.map((task, index) => (
          <li key={index}>{task}</li>
        ))}
      </ul>
    </div>
  );
}

function App() {
  const projects = [
    {
      title: 'Project 1',
      tasks: ['Task 1', 'Task 2', 'Task 3'],
    },
    {
      title: 'Project 2',
      tasks: ['Task A', 'Task B', 'Task C'],
    },
  ];

  return (
    <div>
      <h1>Welcome to My React Page!</h1>
      {projects.map((project, index) => (
        <ProjectCard key={index} title={project.title} tasks={project.tasks} />
      ))}
    </div>
  );
}

export default ProjectCard;

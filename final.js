let todos = [];
function showPage(pageId) {
  document.getElementById("tablePage").classList.add("hidden");
  document.getElementById("formPage").classList.add("hidden");
  document.getElementById(pageId).classList.remove("hidden");
}
function goToForm() {
  localStorage.removeItem("editId");
  document.getElementById("formTitle").textContent = "Add Todo";
  document.getElementById("name").value = '';
  document.getElementById("area").value = '';
  showPage("formPage");
}
/// load GAPI from websitelink in lms  
async function loadTodos() {
  try {
    const response = await fetch("https://jsonplaceholder.typicode.com/todos?_limit=10");
    const data = await response.json();
    todos = data.map(todo => ({
      id: todo.id,
      name: todo.title,
      area: todo.completed ? "Completed" : "Not Completed"
    }));
    renderTodos();
  } catch (error) {
    console.error("Error loading todos:", error);
  }
}
function renderTodos() {
  const tbody = document.querySelector("#competitionTable tbody");
  tbody.innerHTML = "";
  todos.forEach((todo) => {
    const row = document.createElement("tr");
    row.innerHTML = `
      <td>${todo.name}</td>
      <td>${todo.area}</td>
      <td>
        <button onclick="editTodo(${todo.id})">Update</button>
        <button onclick="deleteTodo(${todo.id})">Delete</button>
      </td>`;
    tbody.appendChild(row);
  });
}
async function deleteTodo(id) {
  try {
    await fetch(`https://jsonplaceholder.typicode.com/todos/${id}`, {
      method: "DELETE"
    });
    todos = todos.filter(t => t.id !== id);
    renderTodos();
  } catch (error) {
    console.error("Error deleting todo:", error);
  }
}
function editTodo(id) {
  const todo = todos.find(t => t.id === id);
  if (todo) {
    document.getElementById("name").value = todo.name;
    document.getElementById("area").value = todo.area;
    localStorage.setItem("editId", id);
    document.getElementById("formTitle").textContent = "Edit Todo";
    showPage("formPage");
  }
}
document.getElementById("competitionForm").addEventListener("submit", async function (e) {
  e.preventDefault();
  const name = document.getElementById("name").value;
  const area = document.getElementById("area").value;
  const editId = localStorage.getItem("editId");
  const body = {
    title: name,
    completed: area.toLowerCase() === "completed",
    userId: 1
  };
  try {
    if (editId) {
      await fetch(`https://jsonplaceholder.typicode.com/todos/${editId}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ...body, id: editId })
      });
      const index = todos.findIndex(t => t.id == editId);
      todos[index] = { id: parseInt(editId), name, area };
      localStorage.removeItem("editId");
    } else {
      const response = await fetch("https://jsonplaceholder.typicode.com/todos", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body)
      });
      const newTodo = await response.json();
      todos.push({ id: newTodo.id, name, area });
    }
    renderTodos();
    showPage("tablePage");
  } catch (error) {
    console.error("Error saving todo:", error);
  }
});
loadTodos();
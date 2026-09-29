let customers = JSON.parse(localStorage.getItem("bankCustomers")) || [
  {token: 1, name: "Arun", account: "ACC1001", service: "Deposit", status: "Waiting"},
  {token: 2, name: "Ravi", account: "ACC1002", service: "Withdrawal", status: "Completed"},
  {token: 3, name: "Kumar", account: "ACC1003", service: "Account Opening", status: "Completed"},
  {token: 4, name: "Suresh", account: "ACC1004", service: "Deposit", status: "Completed"}
];

function save() {
  localStorage.setItem("bankCustomers", JSON.stringify(customers));
}

function render() {
  const queue = document.getElementById("queue");
  queue.innerHTML = "";
  customers.forEach((c, i) => {
    const row = document.createElement("tr");
    row.innerHTML = `
      <td>${c.token}</td>
      <td>${c.name}</td>
      <td>${c.account}</td>
      <td>${c.service}</td>
      <td class="status">${c.status}</td>
      <td>
        <button onclick="nextStatus(${i})">
          ${c.status === "Waiting" ? "Serve" : c.status === "Serving" ? "Complete" : "Done"}
        </button>
      </td>`;
    queue.appendChild(row);
  });
}

function nextStatus(i) {
  if (customers[i].status === "Waiting") customers[i].status = "Serving";
  else if (customers[i].status === "Serving") customers[i].status = "Completed";
  save();
  render();
}

document.getElementById("tokenForm").addEventListener("submit", (e) => {
  e.preventDefault();
  const nextToken = customers.length ? Math.max(...customers.map(c => c.token)) + 1 : 1;
  customers.push({
    token: nextToken,
    name: document.getElementById("name").value,
    account: document.getElementById("account").value,
    service: document.getElementById("service").value,
    status: "Waiting"
  });
  save();
  e.target.reset();
  render();
});

render();

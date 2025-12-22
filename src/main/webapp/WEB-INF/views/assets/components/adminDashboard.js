// check if the search input is focus of not
const input = document.getElementById("admin-dashboard-last-page-registration-upper-search-searcher");
const search = document.getElementById("admin-dashboard-last-page-registration-upper-search");

input.addEventListener("focus", () => {
  search.style.borderColor = "#00C853";   // apply on focus
});

input.addEventListener("blur", () => {
  search.style.borderColor = "";          // reset when focus is lost
});


// second page navigations
const registrationNav = document.getElementById("admin-dashboard-second-page-navigation-nav-registration");
const taskNav = document.getElementById("admin-dashboard-second-page-navigation-nav-tasks");
const manageUserNav = document.getElementById("admin-dashboard-second-page-navigation-nav-manage-user");

//navigation contents
const registerationContent = document.getElementById("admin-dashboard-last-page-registration");
const taskConetent = document.getElementById("admin-dashboard-last-page-tasks");
const manageUserContent = document.getElementById("admin-dashboard-last-page-users");

taskNav.addEventListener('click', () => {
  console.log("task");
  //change the elements
  taskNav.style.color = "#00C853";
  taskNav.style.borderColor = "#00C853";

  //hide the other navitation conetent
  registerationContent.style.display = "none";
  manageUserContent.style.display = "none";

  //show the task content
  taskConetent.style.display = "block";

  //make default to other elements
  registrationNav.style.color = "oklch(0.707 0.022 261.325)";
  registrationNav.style.borderColor = "rgba(255, 0, 0, 0)";

  manageUserNav.style.color = "oklch(0.707 0.022 261.325)";
  manageUserNav.style.borderColor = "rgba(255, 0, 0, 0)";
});

manageUserNav.addEventListener('click', () => {
  console.log("manage user");
  //change the elements
  manageUserNav.style.color = "#00C853";
  manageUserNav.style.borderColor = "#00C853";

  // hide the other content
  taskConetent.style.display = "none";
  registerationContent.style.display = "none";

  //show the own content
  manageUserContent.style.display = "block";

  //make default to other elements
  registrationNav.style.color = "oklch(0.707 0.022 261.325)";
  registrationNav.style.borderColor = "rgba(255, 0, 0, 0)";

  taskNav.style.color = "oklch(0.707 0.022 261.325)";
  taskNav.style.borderColor = "rgba(255, 0, 0, 0)";
});

registrationNav.addEventListener('click', () => {
  console.log("registeration");
  //change the elements
  registrationNav.style.color = "#00C853";
  registrationNav.style.borderColor = "#00C853";

  //hide other contents
  taskConetent.style.display = "none";
  manageUserContent.style.display = "none";

  //show your contents
  registerationContent.style.display = "block";

  //make default to other elements
  taskNav.style.color = "oklch(0.707 0.022 261.325)";
  taskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  manageUserNav.style.color = "oklch(0.707 0.022 261.325)";
  manageUserNav.borderColor = "rgba(255, 0, 0, 0)";
});


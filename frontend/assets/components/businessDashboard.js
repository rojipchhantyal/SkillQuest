// second page navigations
const allTaskNav = document.getElementById("business-dashboard-second-page-navigation-nav-all-task");
const pendingTaskNav = document.getElementById("business-dashboard-second-page-navigation-nav-pending-task");
const activeTaskNav = document.getElementById("business-dashboard-second-page-navigation-nav-active-task");
const completedTaskNav = document.getElementById("business-dashboard-second-page-navigation-nav-completed-task");
const profileNav = document.getElementById("business-dashboard-second-page-navigation-nav-profile");


//navigation contents
const allTaskContent = document.getElementById("business-dashboard-last-page-all-task");
const pendingTaskContent = document.getElementById("business-dashboard-last-page-pending-tasks");
const activeTaskContent = document.getElementById("business-dashboard-last-page-active-tasks");
const completedTaskContent = document.getElementById("business-dashboard-last-page-completed-tasks");
const profileContent = document.getElementById("business-dashboard-last-page-profile");

pendingTaskNav.addEventListener('click', () => {
  console.log("pending clicked");
  //change the elements
  pendingTaskNav.style.color = "#00C853";
  pendingTaskNav.style.borderColor = "#00C853";

  //hide the other navitation conetent
  allTaskContent.style.display = "none";
  activeTaskContent.style.display = "none";
  profileContent.style.display = "none";
  completedTaskContent.style.display = "none";

  //show the task content
  pendingTaskContent.style.display = "flex";

  //make default to other elements
  allTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  allTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  completedTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  completedTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  profileNav.style.color = "oklch(0.707 0.022 261.325)";
  profileNav.style.borderColor = "rgba(255, 0, 0, 0)";

  activeTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  activeTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";
});

activeTaskNav.addEventListener('click', () => {
  console.log("active clicked");
  //change the elements
  activeTaskNav.style.color = "#00C853";
  activeTaskNav.style.borderColor = "#00C853";

  //hide the other navitation conetent
  allTaskContent.style.display = "none";
  pendingTaskContent.style.display = "none";
  profileContent.style.display = "none";
  completedTaskContent.style.display = "none";

  //show the task content
  activeTaskContent.style.display = "flex";

  //make default to other elements
  allTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  allTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  completedTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  completedTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  profileNav.style.color = "oklch(0.707 0.022 261.325)";
  profileNav.style.borderColor = "rgba(255, 0, 0, 0)";

  pendingTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  pendingTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";
});

completedTaskNav.addEventListener('click', () => {
  console.log("completed clicked");
  //change the elements
  completedTaskNav.style.color = "#00C853";
  completedTaskNav.style.borderColor = "#00C853";

  //hide the other navitation conetent
  allTaskContent.style.display = "none";
  activeTaskContent.style.display = "none";
  profileContent.style.display = "none";
  pendingTaskContent.style.display = "none";

  //show the task content
  completedTaskContent.style.display = "flex";

  //make default to other elements
  allTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  allTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  pendingTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  pendingTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  profileNav.style.color = "oklch(0.707 0.022 261.325)";
  profileNav.style.borderColor = "rgba(255, 0, 0, 0)";

  activeTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  activeTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";
});

profileNav.addEventListener('click', () => {
  console.log("profile clicked");
  //change the elements
  profileNav.style.color = "#00C853";
  profileNav.style.borderColor = "#00C853";

  //hide the other navitation conetent
  allTaskContent.style.display = "none";
  activeTaskContent.style.display = "none";
  pendingTaskContent.style.display = "none";
  completedTaskContent.style.display = "none";

  //show the task content
  profileContent.style.display = "flex";

  //make default to other elements
  allTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  allTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  completedTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  completedTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  activeTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  activeTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  pendingTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  pendingTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";
});

allTaskNav.addEventListener('click', () => {
  console.log("all clicked");
  //change the elements
  allTaskNav.style.color = "#00C853";
  allTaskNav.style.borderColor = "#00C853";

  //hide the other navitation conetent
  profileContent.style.display = "none";
  activeTaskContent.style.display = "none";
  pendingTaskContent.style.display = "none";
  completedTaskContent.style.display = "none";

  //show the task content
  allTaskContent.style.display = "flex";

  //make default to other elements
  activeTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  activeTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  completedTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  completedTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  profileNav.style.color = "oklch(0.707 0.022 261.325)";
  profileNav.style.borderColor = "rgba(255, 0, 0, 0)";

  pendingTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  pendingTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";
});
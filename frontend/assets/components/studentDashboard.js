// second page navigations
const browseTaskNav = document.getElementById("student-dashboard-second-page-navigation-nav-browse-task");
const myTasknav = document.getElementById("student-dashboard-second-page-navigation-nav-my-tasks");
const completedTasknav = document.getElementById("student-dashboard-second-page-navigation-nav-completed-task");
const profileNave = document.getElementById("student-dashboard-second-page-navigation-nav-profile");


//navigation contents
const browseTaskContent = document.getElementById("student-dashboard-last-page-browse-task");
const taskConetent = document.getElementById("admin-dashboard-last-page-tasks");
const manageUserContent = document.getElementById("admin-dashboard-last-page-users");

myTasknav.addEventListener('click', () => {
  console.log("my task");
  //change the elements
  myTasknav.style.color = "#00C853";
  myTasknav.style.borderColor = "#00C853";

//   //hide the other navitation conetent
//   browseTaskNav.style.display = "none";
//   browseTaskNav.style.display = "none";

  //show the task content
  browseTaskContent.style.display = "block";

  //make default to other elements
  browseTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  browseTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  completedTasknav.style.color = "oklch(0.707 0.022 261.325)";
  completedTasknav.style.borderColor = "rgba(255, 0, 0, 0)";

  profileNave.style.color = "oklch(0.707 0.022 261.325)";
  profileNave.style.borderColor = "rgba(255, 0, 0, 0)";
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
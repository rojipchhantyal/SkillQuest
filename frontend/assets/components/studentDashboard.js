// second page navigations
const browseTaskNav = document.getElementById("student-dashboard-second-page-navigation-nav-browse-task");
const myTaskNav = document.getElementById("student-dashboard-second-page-navigation-nav-my-tasks");
const completedTaskNav = document.getElementById("student-dashboard-second-page-navigation-nav-completed-task");
const profileNav = document.getElementById("student-dashboard-second-page-navigation-nav-profile");


//navigation contents
const browseTaskConetent = document.getElementById("student-dashboard-last-page-browse-task");
const myTaskConetent= document.getElementById("student-dashboard-last-page-my-tasks");
const completedTaskConetent = document.getElementById("student-dashboard-last-page-completed-tasks");
const profileConetent= document.getElementById("student-dashboard-last-page-profile");

myTaskNav.addEventListener('click', () => {
  console.log("my task");
  //change the elements
  myTaskNav.style.color = "#00C853";
  myTaskNav.style.borderColor = "#00C853";

  //hide the other navitation conetent
  browseTaskConetent.style.display = "none";
  completedTaskConetent.style.display = "none";
  profileConetent.style.display = "none";

  //show the task content
  myTaskConetent.style.display = "flex";

  //make default to other elements
  browseTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  browseTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  completedTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  completedTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  profileNav.style.color = "oklch(0.707 0.022 261.325)";
  profileNav.style.borderColor = "rgba(255, 0, 0, 0)";
});

completedTaskNav.addEventListener('click', () => {
  console.log("complete task");
  //change the elements
  completedTaskNav.style.color = "#00C853";
  completedTaskNav.style.borderColor = "#00C853";

  //hide the other navitation conetent
  browseTaskConetent.style.display = "none";
  myTaskConetent.style.display = "none";
  profileConetent.style.display = "none";

  //show the task content
  completedTaskConetent.style.display = "flex";

  //make default to other elements
  browseTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  browseTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  myTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  myTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  profileNav.style.color = "oklch(0.707 0.022 261.325)";
  profileNav.style.borderColor = "rgba(255, 0, 0, 0)";
});

profileNav.addEventListener('click', () => {
  console.log("profile");
  //change the elements
  profileNav.style.color = "#00C853";
  profileNav.style.borderColor = "#00C853";

  //hide the other navitation conetent
  browseTaskConetent.style.display = "none";
  completedTaskConetent.style.display = "none";
  browseTaskConetent.style.display = "none";

  //show the task content
  profileConetent.style.display = "flex";

  //make default to other elements
  browseTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  browseTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  completedTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  completedTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  browseTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  browseTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";
});

browseTaskNav.addEventListener('click', () => {
  console.log("browse task");
  //change the elements
  browseTaskNav.style.color = "#00C853";
  browseTaskNav.style.borderColor = "#00C853";

  //hide the other navitation conetent
  myTaskConetent.style.display = "none";
  completedTaskConetent.style.display = "none";
  profileConetent.style.display = "none";

  //show the task content
  browseTaskConetent.style.display = "block";

  //make default to other elements
  myTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  myTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  completedTaskNav.style.color = "oklch(0.707 0.022 261.325)";
  completedTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

  profileNav.style.color = "oklch(0.707 0.022 261.325)";
  profileNav.style.borderColor = "rgba(255, 0, 0, 0)";
});
<%@ page import="com.skillquest.DTOs.TasksDTOs" %>
<%@ page import="java.util.List" %>
<%@ page import="com.skillquest.DTOs.UserInfoDTOs" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillQuest</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/studentDashboard.css">
    <link
        href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css"
        rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans+Code:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
</head>
</head>
<body>
    <main>
    <%
    UserInfoDTOs userInfo = (UserInfoDTOs) request.getAttribute("userInfo");
    %>
        <nav>
            <div class="nav-logo">
                <span class="logo-circle">SQ</span>
                <span class="logo">SkillQuest</span>
            </div>
            <ul class="nav-navigation">
                <li>
                    <a href="">
                        <span>Browse Tasks</span>
                    </a>
                </li>
                <li>
                    <a href="./assets/components/login.html">
                        <span>Home</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- for dashboard left navigation -->
        <div class="student-dashboard-left-nav">
            <div class="student-dashboard-tittle">
                <div class="student-dashboard-tittle-heading">
                    <h1>Student Dashboard</h1>
                </div>
                <span>Welcome back, <%= userInfo.getName() %>!</span>
            </div>

            <div class="student-dashboard-first-page">
                <div class="student-dashboard-first-page-inners" id="pending-user">
                    <div class="student-dashboard-first-page-inners-left">
                        <span class="student-dashboard-first-page-inners-info">Tasks Completed</span>
                        <span class="student-dashboard-first-page-inners-count">2</span>
                    </div>
                    <i class="ri-gift-2-line"></i>
                </div>

            <div class="student-dashboard-first-page-inners" id="pending-user">
                    <div class="student-dashboard-first-page-inners-left">
                        <span class="student-dashboard-first-page-inners-info">Total Earnings</span>
                        <span class="student-dashboard-first-page-inners-count">$ 3000</span>
                    </div>
                    <i class="ri-money-dollar-circle-line"></i>
                </div>

                <div class="student-dashboard-first-page-inners" id="pending-user">
                    <div class="student-dashboard-first-page-inners-left">
                        <span class="student-dashboard-first-page-inners-info">Active Tasks</span>
                        <span class="student-dashboard-first-page-inners-count">3</span>
                    </div>
                    <i class="ri-history-line"></i>
                </div>
            </div>
            
            <!-- for navigation bars -->
            <div class="student-dashboard-second-page-navigation">
                <div class="student-dashboard-second-page-navigation-nav">
                    <div class="student-dashboard-second-page-navigation-nav-inners" id="student-dashboard-second-page-navigation-nav-browse-task">
                        <i class="ri-search-line"></i>
                        <span>Browse Tasks</span>
                    </div>
                    <div class="student-dashboard-second-page-navigation-nav-inners" id="student-dashboard-second-page-navigation-nav-my-tasks">
                        <i class="ri-history-line"></i>
                        <span>My Tasks</span>
                    </div>
                    <div class="student-dashboard-second-page-navigation-nav-inners" id="student-dashboard-second-page-navigation-nav-completed-task">
                        <i class="ri-award-line"></i>
                        <span>Completed</span>
                    </div>
                    <div class="student-dashboard-second-page-navigation-nav-inners" id="student-dashboard-second-page-navigation-nav-profile">
                        <i class="ri-user-line"></i>
                        <span>Profile</span>
                    </div>
                </div>
            </div>
        </div>
        

        <!-- left nav cover -->
        <div class="student-dashboard-left-nav-cover"></div>

        <!-- last page main container -->
        <div class="student-dashboard-last-page-main">
            <!-- for browseing tasks -->
            <div class="student-dashboard-last-page-browse-task" id="student-dashboard-last-page-browse-task">
                <div class="student-dashboard-last-page-browse-task-upper">
                    <div class="student-dashboard-last-page-browse-task-upper-search" id="student-dashboard-last-page-browse-task-upper-search">
                        <i class="ri-search-line"></i>
                        <input type="search" name="admin-dashboard-last-page-registration-upper-search-searcher" id="admin-dashboard-last-page-registration-upper-search-searcher" placeholder="Search Tasks..">
                    </div>
                </div>
                <div class="student-dashboard-last-page-browse-task-lower" id="student-dashboard-last-page-browse-task-lower">
                <!-- all avialable tasks -->

                    <%
                    List<TasksDTOs> allTasks = (List<TasksDTOs>) request.getAttribute("allAvailableTasks");
                       if(allTasks != null){
                           for(TasksDTOs tasks : allTasks){
                                %>
                                <div class="student-dashboard-last-page-browse-task-lower-inners">
                                    <h3><%= tasks.getTitle() %> .</h3>
                                    <p><%= tasks.getDescription() %> .</p>
                                    <ul>
                                        <li>
                                            <i class="ri-file-list-line"></i>
                                            <span><%= tasks.getBusinessName() %>.</span>
                                        </li>
                                        <li>
                                            <i class="ri-map-pin-line"></i>
                                            <span><%= tasks.getLocation() %></span>
                                        </li>
                                        <li>
                                            <i class="ri-money-dollar-circle-line"></i>
                                            <span><%= tasks.getBudget() %></span>
                                        </li>
                                        <li>
                                            <i class="ri-calendar-event-line"></i>
                                            <span>Deadline: <%= tasks.getDeadline() %></span>
                                        </li>
                                    </ul>
                                    <div class="student-dashboard-last-page-browse-task-lower-inners-button">
                                        <span><%= tasks.getTask_type() %></span>
                                        <form action="<%= application.getContextPath() %>/claimTasks/<%= tasks.getId() %>" method="post">
                                            <input style="display: none;" type="text" name="studentId" value="<%= userInfo.getId() %>">
                                            <button>Claim Task</button>
                                        </form>
                                    </div>
                                </div>
                           <%
                           }
                       }
                    %>
            </div>
        </div>

        <!-- for my Tasks -->
        <div style="display: none;" class="student-dashboard-last-page-my-tasks" id="student-dashboard-last-page-my-tasks">
            <!-- my task lists -->
            <%

            List<TasksDTOs> allStudentClaimTasks = (List<TasksDTOs>) request.getAttribute("allStudentClaimTasks");

            if(allStudentClaimTasks != null){

                for(TasksDTOs claimTasks : allStudentClaimTasks){
                %>
                    <div class="student-dashboard-last-page-my-tasks-inners">
                        <div class="student-dashboard-last-page-my-tasks-inners-tittle">
                            <h3><%= claimTasks.getTitle() %> .</h3>
                            <span>in_progres</span>
                        </div>

                        <p><%= claimTasks.getDescription() %> .</p>
                        <ul>
                            <li>
                                <i class="ri-file-list-line"></i>
                                <span><%= claimTasks.getBusinessName() %></span>
                            </li>
                            <li>
                                <i class="ri-map-pin-line"></i>
                                <span><%= claimTasks.getLocation() %></span>
                            </li>
                            <li>
                                <i class="ri-money-dollar-circle-line"></i>
                                <span><%= claimTasks.getBudget() %></span>
                            </li>
                            <li>
                                <i class="ri-calendar-event-line"></i>
                                <span>Deadline: <%= claimTasks.getDeadline() %></span>
                            </li>
                        </ul>
                        <div class="student-dashboard-last-page-my-tasks-inners-button">
                            <span><%= claimTasks.getTask_type() %></span>
                            <button id="pending-task-submit"
                                data-task-id="1"
                            >
                            Submit Task</button>
                        </div>
                    </div>
                <%
                }
            }
            %>
        </div>

        <!-- for completed tasks -->
        <div style="display: none;" class="student-dashboard-last-page-completed-tasks" id="student-dashboard-last-page-completed-tasks">
            <!-- my completed task lists -->
            <div class="student-dashboard-last-page-completed-tasks-inners">
                <div class="student-dashboard-last-page-completed-tasks-inners-tittle">
                    <h3>Web Development-Ecomerce-Site</h3>
                    <span>completed</span>
                </div>
                
                <p>Need a talented designer to create modern UI/UX for our fitness mobile app.</p>
                <ul>
                    <li>
                        <i class="ri-file-list-line"></i>
                        <span>NewCo Inc.</span>
                    </li>
                    <li>
                        <i class="ri-map-pin-line"></i>
                        <span>Remote</span>
                    </li>
                    <li>
                        <i class="ri-money-dollar-circle-line"></i>
                        <span>1000</span>
                    </li>
                    <li>
                        <i class="ri-calendar-event-line"></i>
                        <span>Deadline: Jan 10, 2026</span>
                    </li>
                </ul>
                <div class="student-dashboard-last-page-completed-tasks-inners-button">
                    <span>Design</span>
                </div>
            </div>

            <div class="student-dashboard-last-page-completed-tasks-inners">
                <div class="student-dashboard-last-page-completed-tasks-inners-tittle">
                    <h3>Web Development-Ecomerce-Site</h3>
                    <span>completed</span>
                </div>
                
                <p>Need a talented designer to create modern UI/UX for our fitness mobile app.</p>
                <ul>
                    <li>
                        <i class="ri-file-list-line"></i>
                        <span>NewCo Inc.</span>
                    </li>
                    <li>
                        <i class="ri-map-pin-line"></i>
                        <span>Remote</span>
                    </li>
                    <li>
                        <i class="ri-money-dollar-circle-line"></i>
                        <span>1000</span>
                    </li>
                    <li>
                        <i class="ri-calendar-event-line"></i>
                        <span>Deadline: Jan 10, 2026</span>
                    </li>
                </ul>
                <div class="student-dashboard-last-page-completed-tasks-inners-button">
                    <span>Design</span>
                </div>
            </div>
            <div class="student-dashboard-last-page-completed-tasks-inners">
                <div class="student-dashboard-last-page-completed-tasks-inners-tittle">
                    <h3>Web Development-Ecomerce-Site</h3>
                    <span>completed</span>
                </div>
                
                <p>Need a talented designer to create modern UI/UX for our fitness mobile app.</p>
                <ul>
                    <li>
                        <i class="ri-file-list-line"></i>
                        <span>NewCo Inc.</span>
                    </li>
                    <li>
                        <i class="ri-map-pin-line"></i>
                        <span>Remote</span>
                    </li>
                    <li>
                        <i class="ri-money-dollar-circle-line"></i>
                        <span>1000</span>
                    </li>
                    <li>
                        <i class="ri-calendar-event-line"></i>
                        <span>Deadline: Jan 10, 2026</span>
                    </li>
                </ul>
                <div class="student-dashboard-last-page-completed-tasks-inners-button">
                    <span>Design</span>
                </div>
            </div>
            <div class="student-dashboard-last-page-completed-tasks-inners">
                <div class="student-dashboard-last-page-completed-tasks-inners-tittle">
                    <h3>Web Development-Ecomerce-Site</h3>
                    <span>completed</span>
                </div>
                
                <p>Need a talented designer to create modern UI/UX for our fitness mobile app.</p>
                <ul>
                    <li>
                        <i class="ri-file-list-line"></i>
                        <span>NewCo Inc.</span>
                    </li>
                    <li>
                        <i class="ri-map-pin-line"></i>
                        <span>Remote</span>
                    </li>
                    <li>
                        <i class="ri-money-dollar-circle-line"></i>
                        <span>1000</span>
                    </li>
                    <li>
                        <i class="ri-calendar-event-line"></i>
                        <span>Deadline: Jan 10, 2026</span>
                    </li>
                </ul>
                <div class="student-dashboard-last-page-completed-tasks-inners-button">
                    <span>Design</span>
                </div>
            </div>
        </div>
        
        <!-- for profile -->
        <div style="display: none;" class="student-dashboard-last-page-profile" id="student-dashboard-last-page-profile">
            <div class="student-dashboard-last-page-profile-inner">
                <div class="student-dashboard-last-page-profile-inner-top">
                    <div class="student-dashboard-last-page-profile-inner-top-tittle">
                        <div class="student-dashboard-last-page-profile-inner-top-tittle-avatar">
                            A
                        </div>
                        <div class="student-dashboard-last-page-profile-inner-top-tittle-content">
                            <h2>Alex Johnson</h2>
                            <p>New York University</p>
                            <p id="student-dashboard-last-page-profile-inner-top-tittle-content-last">Computer Science • Junior</p>
                        </div>
                    </div>
                    <div class="student-dashboard-last-page-profile-inner-top-button">
                        <button>Edit Profile</button>
                    </div>
                </div>
                <div class="student-dashboard-last-page-profile-inner-bio">
                    <span>Bio</span>
                    <p>Passionate about web development and UI/UX design. Looking to gain real-world experience while earning.</p>
                </div>
                <div class="student-dashboard-last-page-profile-inner-detials">
                    <li>
                        <span><i class="ri-mail-line"></i>
                            Email
                        </span>
                        <p>alex.johnson@university.edu</p>
                    </li>

                    <li>
                        <span><i class="ri-phone-line"></i>
                            Phone
                        </span>
                        <p>+1 234 567 8900</p>
                    </li>

                    <li>
                        <span><i class="ri-map-pin-line"></i>
                            Location
                        </span>
                        <p>Kathmandu, Nepal</p>
                    </li>
                    <li>
                        <span><i class="ri-graduation-cap-line"></i>
                            University
                        </span>
                        <p>Tribhuvan University</p>
                    </li>
                </div>
                <div class="student-dashboard-last-page-profile-inner-skills">
                    <p>Skills</p>
                    <ul>
                        <span>C-programming</span>
                        <span>Java</span>
                        <span>HTML</span>
                        <span>CSS</span>
                        <span>DSA</span>
                    </ul>
                </div>
            </div>
        </div>
        </div>
        <!-- form to submit the done task -->
        <div style="display: none;" class="student-dashboard-last-page-my-task-inners-form-outer" id="student-dashboard-last-page-my-task-inners-form-outer">
            <div class="student-dashboard-last-page-my-task-inners-form">
                <div class="student-dashboard-last-page-my-task-inners-form-tittle">
                    <h2>Submit Your Task</h2>
                    <!-- form hider button -->
                    <div  class="student-dashboard-last-page-my-task-inners-form-hider" onclick="closeSubmitTask()">
                        <i class="ri-close-line"></i>
                    </div>
                </div>
                <form class="main-form">
                    <div class="form-task-info">
                        <h2>Web Development-Ecomerce-Site</h2>
                        <p>Need a talented designer to create modern UI/UX for our fitness mobile app.</p>
                    </div>

                    <div class="form-fields">
                        <!-- for file to upload -->
                        <label for="task-file">Upload File</label>
                        <input type="file" name="task-file" id="task-file">
                    </div>
                    
                    <div class="form-fields">
                        <!-- to add the discription -->
                        <label for="message-business">Message To Business</label>
                        <textarea name="message-business" id="message-business" placeholder="Describle your completed task, any chalanges faced, or aditional note.."></textarea>
                    </div>
                        
                    <div class="form-fields">
                        <!-- for projects links -->
                        <label for="github-link">Send Github Project Link</label>
                        <input type="text" name="github-link" id="github-link" placeholder="https://github.com/rojipchhantyal/SkillQuest">
                    </div>

                    <!-- buttons to send and  cancle the task -->
                    <div" class="form-buttons">
                        <button onclick="closeSubmitTask()" id="form-buttons-cancle" type="button">Cancle Task</button>
                        <button id="form-buttons-submit">Submit Task</button>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <script>
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
          myTaskConetent.style.display = "none";

          //show the task content
          profileConetent.style.display = "flex";

          //make default to other elements
          browseTaskNav.style.color = "oklch(0.707 0.022 261.325)";
          browseTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

          completedTaskNav.style.color = "oklch(0.707 0.022 261.325)";
          completedTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";

          myTaskNav.style.color = "oklch(0.707 0.022 261.325)";
          myTaskNav.style.borderColor = "rgba(255, 0, 0, 0)";
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

        // for submit task forms
        const form = document.getElementById("student-dashboard-last-page-my-task-inners-form-outer");
        const submitBtn = document.getElementById("pending-task-submit");

        // function for opening the form
        submitBtn.addEventListener('click', () => {
          console.log("open the form to submit the task");
          console.log(form);

          //collect the data send form btn dataset
          const taskId = submitBtn.dataset.taskId;
          console.log(taskId);

          //button will send the id and title disc of the task got form db and send here from here we will show the form with this data
          form.style.display = "flex";


        });
        // function for close the add task form
        function closeSubmitTask(){
          console.log("closing the form to submit the task");
          form.style.display = "none";
        }

    </script>
</body>
</html>
<style>
    *{
        padding: 0;
        margin: 0;
        font-family: ui-sans-serif, system-ui, sans-serif;
    }
    :root{
        --white: #FFF;
        --background: oklch(0.145 0 0);
        --lightter-background: #181818;
        --dark-gray: oklch(0.446 0.03 256.802);
        --green-bgc: #00C853;
        --dark-green: #009624;
        --light-green: oklch(0.726563 -0.177442 0.109428/0.1);
        --gray: oklch(0.707 0.022 261.325);
        --red: red;
    }
    nav{
        height: 11vh;
        width: 100%;
        background-color: var(--background);
        display: flex;
        align-items: center;
        justify-content: center;
        position: fixed;
        top: 0;
        z-index: 999;
        border-bottom: 0.1px solid var(--green-bgc);
    }
    .nav-logo{
        height: 100%;
        width: 28%;
        display: flex;
        align-items: center;
        gap: 6px;
        font-size: 20px;
    }
    .logo-circle{
        font-size: 16px;
        background-color: var(--green-bgc);
        padding: 6px 6px;
        border-radius: 12px;
    }
    .logo{
        color: var(--white);
    }
    .nav-navigation{
        height: 100%;
        width: 68%;
        display: flex;
        align-items: center;
        justify-content: end;
        gap: 22px;
    }
    .nav-navigation li a{
        text-decoration: none;
        color: var(--white);
        transition: all ease-in-out 0.3s;
    }
    .nav-navigation li{
        list-style: none;
    }
    .nav-navigation li a:hover{
        color: var(--green-bgc);
    }
    main{
        background-color: var(--background);
        display: flex;
        justify-content: center;
        padding-top: 11vh;
    }
    /* title page */
    .student-dashboard-tittle{
        display: flex;
        flex-direction: column;
        align-items: start;
        justify-content: start;
        width: 100%;
        padding-left: 24px;
    }
    .student-dashboard-tittle-heading{
        display: flex;
        align-items: center;
        color: var(--green-bgc);
        font-size: 14px;
        font-weight: 300;
        gap: 8px;
        line-height: 1.1;
    }
    .student-dashboard-tittle span{
        color: var(--gray);
        font-size: 16px;
    }
    /* dashboard left nav */
    .student-dashboard-left-nav{
        height: 100vh;
        position: fixed;
        width: 26%;
        left: 0;
        padding: 24px 0 24px 0;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        background-color: var(--background);
    }

    .student-dashboard-left-nav-cover{
        height: 10vh;
        width: 26%;
    }
    .student-dashboard-last-page-main{
        min-height: 10vh;
        width: 76%;
        box-sizing: border-box;
        padding-top: 24px;
        background-color: var(--lightter-background);
    }

    /* first page */
    .student-dashboard-first-page{
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-top: 20px;
        padding: 0 24px;
    }
    .student-dashboard-first-page-inners{
        width: 100%;
        height: 52px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-sizing: border-box;
        line-height: 1.5;
    }
    .student-dashboard-first-page-inners-left{
        display: flex;
        flex-direction: column;
    }
    .student-dashboard-first-page-inners i{
        font-size: 22px;
        color: var(--green-bgc);
    }
    .student-dashboard-first-page-inners-count{
        font-size: 18px;
        color: var(--green-bgc);
        margin-left: 8px;
    }
    .student-dashboard-first-page-inners-info{
        font-size: 16px;
        color: var(--white);
        font-weight: 500;
        font-weight: inherit;
    }
    /* for second page */
    .student-dashboard-second-page-navigation{
        margin-top: 20px;
    }
    .student-dashboard-second-page-navigation-nav{
        width: 100%;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        gap: 8px;
        padding-left: 24px;
    }
    .student-dashboard-second-page-navigation-nav-inners{
        height: 42px;
        width: 100%;
        display: flex;
        align-items: center;
        font-size: 16px;
        gap: 8px;
        font-weight: 400;
        border-bottom: 2.5px solid rgba(255, 0, 0, 0);
        color: var(--gray);
        cursor: pointer;
        box-sizing: border-box;
    }
    #student-dashboard-second-page-navigation-nav-browse-task{
        color: var(--green-bgc);
        border-color:  var(--green-bgc);
    }
    .student-dashboard-second-page-navigation-nav-inners i{
        font-weight: 500;
    }
    .student-dashboard-second-page-navigation-nav-inners:hover{
        color: var(--white);
    }

    /* last page */
    .student-dashboard-last-page-browse-task{
        min-height: 16vh;
    }
    .student-dashboard-last-page-browse-task-upper{
        box-sizing: border-box;
        padding: 0 24px;
        display: flex;
        align-items: start;
        justify-content: space-between;
    }
    .student-dashboard-last-page-browse-task-upper-search{
        height: 8vh;
        width: 100%;
        background-color: var(--background);
        border-radius: 12px;
        display: flex;
        align-items: center;
        padding: 0 12px;
        box-sizing: border-box;
        gap: 4px;
    }
    .student-dashboard-last-page-browse-task-upper-search i{
        height: 84%;
        width: 10%;
        font-size: 22px;
        font-weight: 500;
        color: var(--gray);
        height: fit-content;
        width: fit-content;
    }
    .student-dashboard-last-page-browse-task input{
        outline: none;
        height: 99%;
        width: 86%;
        font-size: 14px;
        background-color: var(--background);
        border: none;
        color: var(--white);
    }

    .student-dashboard-last-page-browse-task-lower,
    .student-dashboard-last-page-my-tasks,
    .student-dashboard-last-page-completed-tasks,
    .student-dashboard-last-page-profile{
        min-height: 90vh;
        width: 100%;
        display: flex;

        flex-wrap: wrap;
        gap: 24px;
        padding: 24px 24px;
        box-sizing: border-box;
    }
    .student-dashboard-last-page-browse-task-lower-inners,
    .student-dashboard-last-page-my-tasks-inners,
    .student-dashboard-last-page-completed-tasks-inners{
        height: 354px;
        width: 430.7px;
        background-color: var(--background);
        border-radius: 12px;
        box-sizing: border-box;
        padding: 24px;
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    .student-dashboard-last-page-browse-task-lower-inners h3,
    .student-dashboard-last-page-my-tasks-inners h3,
    .student-dashboard-last-page-completed-tasks-inners h3{
        font-size: 24px;
        font-weight: 600;
        color: var(--dark-green);
        line-height: 1.5;
        margin-bottom: 6px;
    }
    .student-dashboard-last-page-browse-task-lower-inners p,
    .student-dashboard-last-page-my-tasks-inners p,
    .student-dashboard-last-page-completed-tasks-inners p{
        line-height: 1.6;
        font-size: 16px;
        font-weight: 450;
        color: var(--gray);
        margin-bottom: 8px;
    }
    .student-dashboard-last-page-browse-task-lower-inners ul,
    .student-dashboard-last-page-my-tasks-inners ul,
    .student-dashboard-last-page-completed-tasks-inners ul{
        line-height: 1.6;
    }
    .student-dashboard-last-page-browse-task-lower-inners ul li,
    .student-dashboard-last-page-my-tasks-inners ul li,
    .student-dashboard-last-page-completed-tasks-inners ul li{
        list-style: none;
        font-size: 14px;
        color: var(--gray);
        line-height: 1.6;
        font-weight: 400;
        display: flex;
        gap: 6px;
    }
    .student-dashboard-last-page-browse-task-lower-inners ul li i,
    .student-dashboard-last-page-my-tasks-inners ul li i,
    .student-dashboard-last-page-completed-tasks-inners ul li i{
        font-size: 16px;
    }
    .student-dashboard-last-page-browse-task-lower-inners-button,
    .student-dashboard-last-page-my-tasks-inners-button,
    .student-dashboard-last-page-completed-tasks-inners-button{
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-top: 16px;
    }
    .student-dashboard-last-page-browse-task-lower-inners-button span,
    .student-dashboard-last-page-my-tasks-inners-button span,
    .student-dashboard-last-page-completed-tasks-inners-button span{
        background-color: rgba(0, 128, 0, 0.393);
        font-size: 12px;
        color: var(--green-bgc);
        padding: 2px 12px;
        border-radius: 12px;
    }
    .student-dashboard-last-page-browse-task-lower-inners-button button,
    .student-dashboard-last-page-my-tasks-inners-button button{
        font-size: 16px;
        font-weight: 600;
        padding: 6px 16px;
        background-color: var(--green-bgc);
        color: var(--background);
        border-radius: 12px;
        border: none;
        transition: all ease-in-out 0.3s;
    }
    .student-dashboard-last-page-browse-task-lower-inners-button button:hover,
    .student-dashboard-last-page-my-tasks-inners-button button:hover{
        background-color: var(--dark-green);
    }
    /* for my task page */
    .student-dashboard-last-page-my-tasks{
        padding-top: 0;
    }
    .student-dashboard-last-page-my-tasks-inners-tittle,
    .student-dashboard-last-page-completed-tasks-inners-tittle{
        display: flex;
    }
    .student-dashboard-last-page-my-tasks-inners-tittle span,
    .student-dashboard-last-page-completed-tasks-inners-tittle span{
        padding: 2px 8px 4px 8px;
        height: fit-content;
        background-color: rgba(96, 20, 20, 0.389);
        color: var(--red);
        font-size: 12px;
        border-radius: 8px;
    }
    .student-dashboard-last-page-completed-tasks-inners-tittle span{
        background-color: rgba(41, 108, 41, 0.681);
        color: var(--white);
    }
    .student-dashboard-last-page-completed-tasks{
        padding-top: 0;
    }
    /* for submit the done task*/
    .student-dashboard-last-page-my-task-inners-form-outer{
        position: fixed;
        background-color: rgba(0, 0, 0, 0.744);
        z-index: 999999;
        height: 100vh;
        width: 100%;
        top: 0;
        left: 0;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .student-dashboard-last-page-my-task-inners-form{
        height: 86vh;
        width: 54%;
        background-color: var(--lightter-background);
        border-radius: 12px;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-sizing: border-box;
        border-radius: 12px;
        overflow: hidden;
    }
    .student-dashboard-last-page-my-task-inners-form-tittle{
        padding: 24px;
        border-bottom: 1px solid var(--green-bgc);
        width: 100%;
        box-sizing: border-box;
        position: relative;
    }
    .student-dashboard-last-page-my-task-inners-form-tittle h2{
        font-size: 28px;
        font-weight: 500;
        color: var(--white);
    }
    .main-form{
        width: 100%;
        padding:  18px 24px 28px 24px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        overflow-y: scroll;
        gap: 18px;
        overflow-x: hidden;
    }
    .form-task-info h2{
        font-size: 26px;
        font-weight: 500;
        color: var(--green-bgc);
    }
    .form-task-info p{
        font-size: 16px;
        font-weight: 400;
        color: var(--gray);
        margin-top: 4px;
    }
    .form-fields{
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    .main-form label{
        font-size: 14px;
        color: var(--white);
        font-weight: 500;
    }
    .main-form textarea{
        height: 24vh;
        width: 100%;
        border: none;
        outline: none;
        background-color: var(--background);
        color: var(--gray);
        border-radius: 12px;
        resize: none;
        padding: 12px;
        box-sizing: border-box;
        font-size: 14px;
    }
    .main-form input{
        height: 36px;
        border: none;
        outline: none;
        color: var(--gray);
        background-color: var(--background);
        border-radius: 12px;
        padding: 12px;
        font-size: 14px;
    }
    .form-buttons{
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 24px;
        margin-top: 12px;
    }
    .form-buttons button{
        height: 48px;
        width: 50%;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        box-sizing: border-box;
        transition: all ease-in-out 0.3s;
    }
    #form-buttons-cancle{
        border: 1px solid rgba(6, 81, 6, 0.505);
        color: var(--gray);
        background-color: var(--lightter-background);
    }
    #form-buttons-submit{
        background-color: var(--green-bgc);
        color: var(--lightter-background);
    }
    #form-buttons-cancle:hover{
        border: 1px solid var(--green-bgc);
        color: var(--white);
    }
    #form-buttons-submit:hover{
        background-color: var(--dark-green);
    }
    .student-dashboard-last-page-my-task-inners-form-hider{
        position: absolute;
        top: 24px;
        right: 24px;
    }
    .student-dashboard-last-page-my-task-inners-form-hider i{
        color: gray;
        font-size: 30px;
        font-weight: 500;
    }
    .student-dashboard-last-page-my-task-inners-form-hider:hover i{
        color: var(--white);
    }
    /* for profile */
    .student-dashboard-last-page-profile{
        height: 92vh;
        width: 100%;
        padding-top: 0;
        justify-content: start;
    }
    .student-dashboard-last-page-profile-inner{
        height: 80vh;
        width: 82%;
        border-radius: 12px;
        padding: 24px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        background-color: var(--background);
    }
    .student-dashboard-last-page-profile-inner-top{
        height: 96px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        margin-bottom: 30px;
    }
    .student-dashboard-last-page-profile-inner-top-tittle{
        height: 100%;
        width: 60%;
        display: flex;
        gap: 12px;
    }
    .student-dashboard-last-page-profile-inner-top-tittle-avatar{
        background-color: var(--green-bgc);
        height: 96px;
        width: 96px;
        color: var(--background);
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 49%;
        font-size: 36px;
        font-weight: 400;
    }
    .student-dashboard-last-page-profile-inner-top-tittle-content{
        display: flex;
        flex-direction: column;
        justify-content: center;

    }
    .student-dashboard-last-page-profile-inner-top-tittle-content h2{
        font-size: 32px;
        color:  var(--white);
        font-weight: 500;
    }
    .student-dashboard-last-page-profile-inner-top-tittle-content p{
        font-size: 16px;
        font-weight: 400;
        line-height: 1.3;
        color: var(--gray);
    }
    #student-dashboard-last-page-profile-inner-top-tittle-content-last{
        color: var(--green-bgc);
    }
    /* .student-dashboard-last-page-profile-inner-top-button{

    } */
    .student-dashboard-last-page-profile-inner-top-button button{
        color: var(--green-bgc);
        font-size: 16px;
        font-weight: 500;
        padding: 8px 16px;
        border: 1px solid var(--green-bgc);
        background-color: var(--lightter-background);
        border-radius: 8px;
        margin-top: 12px;
        transition: all ease-in-out 0.3s;
    }
    .student-dashboard-last-page-profile-inner-top-button button:hover{
        background-color: var(--green-bgc);
        color: var(--lightter-background);
    }
    .student-dashboard-last-page-profile-inner-bio{
        line-height: 1.6;
        margin-bottom: 24px;
    }
    .student-dashboard-last-page-profile-inner-bio span{
        color: var(--white);
        font-size: 14px;
        font-weight: 400;
    }
    .student-dashboard-last-page-profile-inner-bio p{
        color: var(--gray);
        font-size: 16px;
        font-weight: 400;
    }
    .student-dashboard-last-page-profile-inner-detials{
        display: grid;
        grid-template-columns: 346px 346px;
        gap: 20px;
        margin-bottom: 24px;
    }
    .student-dashboard-last-page-profile-inner-detials li{
        list-style: none;
        display: flex;
        flex-direction: column;
        gap: 6px;
    }
    .student-dashboard-last-page-profile-inner-detials li span{
        color: var(--white);
        font-size: 14px;
        font-weight: 400;
    }
    .student-dashboard-last-page-profile-inner-detials li span i{
        margin-right: 4px;
    }
    .student-dashboard-last-page-profile-inner-detials li p{
        color: var(--gray);
        font-size: 16px;
        font-weight: 400;
    }
    /* .student-dashboard-last-page-profile-inner-skills{

    } */
    .student-dashboard-last-page-profile-inner-skills p{
        font-size: 14px;
        color: var(--white);
        font-weight: 400;
        margin-bottom: 8px;
    }
    .student-dashboard-last-page-profile-inner-skills ul{
        display: flex;
        align-items: center;
        gap:16px;
    }
    .student-dashboard-last-page-profile-inner-skills ul span{
        font-size: 14px;
        font-weight: 400;
        padding: 4px 16px;
        border-radius: 12px;
        background-color: rgba(15, 96, 15, 0.525);
        color: var(--green-bgc);
        border: 0.2px solid var(--green-bgc);
    }
</style>
<%@ page import="java.util.List" %>
<%@ page import="com.skillquest.Entity.Student" %>
<%@ page import="com.skillquest.Entity.Business" %>
<%@ page import="com.skillquest.DTOs.TasksDTOs" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillQuest</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/adminDashboard.css">
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
                String success = (String) request.getAttribute("success");
                String failed = (String) request.getAttribute("failed");

                if (success != null && !success.isEmpty()) {
                %>
                    <p style="position: fixed; top: 12px; left: 50%; transform: translateX(-50%); translate z-index: 9999999999; color:green">
                        <%= success %>
                    </p>
                <%
                    } else if (failed != null && !failed.isEmpty()) {
                %>
                    <p style="position: fixed; top: 12px; left: 50%; transform: translateX(-50%); z-index: 9999999999; color:red">
                        <%= failed %>
                    </p>
                <%
                }
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

        <!-- for adimin left side nav -->
        <div class="admin-dashboard-left-nav">
            <div class="admin-dashboard-tittle">
                <div class="admin-dashboard-tittle-heading">
                    <h1>Admin Dashboard</h1>
                </div>
                <span>Manage users, approvals, and monitor platform activity</span>
            </div>
            <div class="admin-dashboard-first-page">
                <!-- <div class="admin-dashboard-first-page-compartments"> -->
                    <div class="admin-dashboard-first-page-inners" id="pending-user">
                        <div class="admin-dashboard-first-page-inners-left">
                            <span class="admin-dashboard-first-page-inners-info">Pending Registrations</span>
                            <span class="admin-dashboard-first-page-inners-count">3</span>
                        </div>
                        <i class="ri-user-line"></i>
                    </div>

                    <div class="admin-dashboard-first-page-inners" id="pending-user">
                        <div class="admin-dashboard-first-page-inners-left">
                            <span class="admin-dashboard-first-page-inners-info">Pending Tasks</span>
                            <span class="admin-dashboard-first-page-inners-count">3</span>
                        </div>
                        <i class="ri-file-list-line"></i>
                    </div>
                <!-- </div> -->
                
                <div class="admin-dashboard-first-page-compartments">
                    <div class="admin-dashboard-first-page-inners" id="pending-user">
                        <div class="admin-dashboard-first-page-inners-left">
                            <span class="admin-dashboard-first-page-inners-info">Total Users</span>
                            <span class="admin-dashboard-first-page-inners-count">3</span>
                        </div>
                        <i class="ri-user-line"></i>
                    </div>

                    <div class="admin-dashboard-first-page-inners" id="pending-user">
                        <div class="admin-dashboard-first-page-inners-left">
                            <span class="admin-dashboard-first-page-inners-info">Total Tasks</span>
                            <span class="admin-dashboard-first-page-inners-count">3</span>
                        </div>
                        <i class="ri-file-copy-2-fill"></i>
                    </div>
                </div>
            </div>

            <div class="admin-dashboard-second-page-navigation">
                <div class="admin-dashboard-second-page-navigation-nav">
                    <div class="admin-dashboard-second-page-navigation-nav-inners" id="admin-dashboard-second-page-navigation-nav-registration">
                        <i class="ri-group-line"></i>
                        <span>Registrations</span>
                    </div>
                    <div class="admin-dashboard-second-page-navigation-nav-inners" id="admin-dashboard-second-page-navigation-nav-tasks">
                        <i class="ri-group-line"></i>
                        <span>Tasks</span>
                    </div>
                    <div class="admin-dashboard-second-page-navigation-nav-inners" id="admin-dashboard-second-page-navigation-nav-manage-user">
                        <i class="ri-group-line"></i>
                        <span>Manages Users</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- left nav cover -->
        <div class="admin-dashboard-left-nav-cover"></div>

        <!-- to comtain the main content -->
        <div class="admin-dashboard-last-page-main">
            <!-- for registration -->
            <div class="admin-dashboard-last-page-registration" id="admin-dashboard-last-page-registration">
                <div class="admin-dashboard-last-page-registration-upper">
                    <h2>Pending Registrations</h2>
                    <div class="admin-dashboard-last-page-registration-upper-search" id="admin-dashboard-last-page-registration-upper-search">
                        <i class="ri-search-line"></i>
                        <input type="search" name="admin-dashboard-last-page-registration-upper-search-searcher" id="admin-dashboard-last-page-registration-upper-search-searcher" placeholder="Search registrations..">
                    </div>
                </div>
                <div class="admin-dashboard-last-page-registration-lower" id="admin-dashboard-last-page-registration-lower">

                    <%
                    List<Object> allPandingUsers = (List<Object>) request.getAttribute("allpendingUsers");

                    if(allPandingUsers != null){

                        for(Object user : allPandingUsers){
                            if(user instanceof Student){

                                Student student = (Student)user;

                                %>
                                    <div class="admin-dashboard-last-page-registration-lower-inners">
                                        <div class="admin-dashboard-last-page-registration-lower-inners-icon">
                                            <i class="ri-user-line"></i>
                                        </div>
                                        <div class="admin-dashboard-last-page-registration-lower-inners-info">
                                            <div class="admin-dashboard-last-page-registration-lower-inners-info-name-role">
                                                <h3>
                                                    <%= student.getFullName() %>
                                                </h3>
                                                <span>studnet</span>
                                            </div>
                                            <div class="admin-dashboard-last-page-registration-lower-inners-info-email">
                                                <span>
                                                    <%= student.getEmail() %>
                                                </span>
                                            </div>
                                            <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info">
                                                <span>
                                                    <%= student.getUniversityName() %>
                                                </span>
                                                <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots"></div>
                                                <span>
                                                    <%= student.getMajor() %>
                                                </span>
                                                <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots"></div>
                                                <span>
                                                    <%= student.getLocation() %>
                                                </span>
                                                <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots"></div>
                                                <span>Registered: <%= student.getRegistredDate() %>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="admin-dashboard-last-page-registration-lower-inners-options">
                                            <form action="<%= application.getContextPath() %>/approveRegistration/<%= ((Student)user).getStudentId() %>" method="post">
                                                <button id="admin-dashboard-last-page-registration-lower-inners-options-accept">
                                                    <i class="ri-check-line"></i>
                                                    Approve
                                                </button>S
                                            </form>
                                            <form action="<%= application.getContextPath() %>/rejectRegistration/<%= ((Student)user).getStudentId() %>" method="post">
                                                <button id="admin-dashboard-last-page-registration-lower-inners-options-reject">
                                                    <i class="ri-close-line"></i>
                                                    Reject
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                <%
                            }
                            else if(user instanceof Business){

                                Business business = (Business)user;

                            %>
                                <div class="admin-dashboard-last-page-registration-lower-inners">
                                    <div class="admin-dashboard-last-page-registration-lower-inners-icon">
                                        <i class="ri-building-4-line"></i>
                                    </div>
                                    <div class="admin-dashboard-last-page-registration-lower-inners-info">
                                        <div class="admin-dashboard-last-page-registration-lower-inners-info-name-role">
                                            <h3>
                                                <%= business.getBusinessName() %>
                                            </h3>
                                            <span>business</span>
                                        </div>
                                        <div class="admin-dashboard-last-page-registration-lower-inners-info-email">
                                            <span>
                                                <%= business.getEmail() %>
                                            </span>
                                        </div>
                                        <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info">
                                            <span>
                                                <%= business.getBusinesstype() %>
                                            </span>
                                            <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots"></div>
                                            <span>
                                                <%= business.getLocation() %>
                                            </span>
                                            <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots"></div>
                                            <span>Registered: <%= business.getRegistredDate() %>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="admin-dashboard-last-page-registration-lower-inners-options">
                                        <form action="<%= application.getContextPath() %>/approveRegistration/<%= ((Business)user).getBusinessId() %>" method="post">
                                            <button id="admin-dashboard-last-page-registration-lower-inners-options-accept">
                                                <i class="ri-check-line"></i>
                                                Approve
                                            </button>S
                                        </form>
                                        <form action="<%= application.getContextPath() %>/rejectRegistration/<%= ((Business)user).getBusinessId() %>" method="post">
                                            <button id="admin-dashboard-last-page-registration-lower-inners-options-reject">
                                                <i class="ri-close-line"></i>
                                                Reject
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            <%
                            }
                        }
                    }
                    %>
                </div>
            </div>

            <!-- for Tasks -->
            <div class="admin-dashboard-last-page-tasks" id="admin-dashboard-last-page-tasks" style="display: none;">
                <div class="admin-dashboard-last-page-tasks-upper">
                    <h2>Pending Task Approvals</h2>
                </div>
                <div class="admin-dashboard-last-page-tasks-lower" id="admin-dashboard-last-page-tasks-lower">

                    <%
                        List<TasksDTOs> allTasks = (List<TasksDTOs>) request.getAttribute("allpendingTasks");

                        if(allTasks != null){

                            for(TasksDTOs tasks : allTasks){
                                %>

                                <!-- ever users info -->
                                <div class="admin-dashboard-last-page-tasks-lower-inners">
                                    <div class="admin-dashboard-last-page-tasks-lower-inners-infos">
                                        <div class="admin-dashboard-last-page-tasks-lower-inners-infos-title">
                                            <h3><%= tasks.getTitle() %> .</h3>
                                            <span>panding</span>
                                        </div>
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
                                        <span class="admin-dashboard-last-page-tasks-lower-inners-infos-task-type"><%= tasks.getTask_type() %></span>
                                    </div>
                                    <div class="admin-dashboard-last-page-tasks-lower-inners-options">
                                        <form action="<%= application.getContextPath() %>/adminResponseToTasks/<%= tasks.getId() %>" method="post">
                                            <input style="display: none;" type="text" value="Approved" name="isApproved">
                                            <button id="admin-dashboard-last-page-tasks-lower-inners-options-accept">
                                                <i class="ri-check-line"></i>
                                                Approve
                                            </button>
                                        </form>
                                        <form action="<%= application.getContextPath() %>/adminResponseToTasks/<%= tasks.getId() %>" method="post">
                                            <input style="display: none;" type="text" value="Rejected" name="isApproved">
                                            <button id="admin-dashboard-last-page-tasks-lower-inners-options-reject">
                                                <i class="ri-close-line"></i>
                                                Reject
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            <%
                            }
                        }
                    %>

                </div> 
            </div>

            <!-- for user mantenance -->
            <div  style="display: none;" class="admin-dashboard-last-page-users" id="admin-dashboard-last-page-users">
                <div class="admin-dashboard-last-page-users-upper">
                    <h2>Manage Users</h2>
                    <div class="admin-dashboard-last-page-users-upper-search" id="admin-dashboard-last-page-users-upper-search">
                        <i class="ri-search-line"></i>
                        <input type="search" name="admin-dashboard-last-page-users-upper-search-searcher" id="admin-dashboard-last-page-users-upper-search-searcher" placeholder="Search Users..">
                    </div>
                </div>

                <div class="admin-dashboard-last-page-users-lower" id="admin-dashboard-last-page-users-lower">
                    <%
                    List<Object> allUsers = (List<Object>) request.getAttribute("allUsers");

                    if(allUsers != null){

                        for(Object user : allUsers){
                            if(user instanceof Student){
                                Student student = (Student)user;
                            %>

                                <div class="admin-dashboard-last-page-users-lower-inners">
                                    <div class="admin-dashboard-last-page-users-lower-inners-icon">
                                        <i class="ri-user-line"></i>
                                    </div>
                                    <div class="admin-dashboard-last-page-users-lower-inners-info">
                                        <div class="admin-dashboard-last-page-users-lower-inners-info-name-role">
                                            <h3>
                                                <%= student.getFullName() %>
                                            </h3>
                                            <span>studnet</span>
                                        </div>
                                        <div class="admin-dashboard-last-page-users-lower-inners-info-email">
                                            <span>
                                                <%= student.getEmail() %>
                                            </span>
                                        </div>
                                        <div class="admin-dashboard-last-page-users-lower-inners-info-extra-info">
                                            <span>Tasks Completed: 5</span>
                                        </div>
                                    </div>
                                    <div class="admin-dashboard-last-page-users-lower-inners-options">
                                        <button id="admin-dashboard-last-page-users-lower-inners-options-accept">View Details</button>
                                        <button id="admin-dashboard-last-page-users-lower-inners-options-reject">Ban User</button>
                                    </div>
                                </div>
                                <%
                            }
                            else if(user instanceof Business){
                                Business business = (Business)user;
                            %>
                                <div class="admin-dashboard-last-page-users-lower-inners">
                                    <div class="admin-dashboard-last-page-users-lower-inners-icon">
                                        <i class="ri-building-4-line"></i>
                                    </div>
                                    <div class="admin-dashboard-last-page-users-lower-inners-info">
                                        <div class="admin-dashboard-last-page-users-lower-inners-info-name-role">
                                            <h3>
                                                <%= business.getBusinessName() %>
                                            </h3>
                                            <span>business</span>
                                        </div>
                                        <div class="admin-dashboard-last-page-users-lower-inners-info-email">
                                            <span>
                                                <%= business.getEmail() %>
                                            </span>
                                        </div>
                                        <div class="admin-dashboard-last-page-users-lower-inners-info-extra-info">
                                            <span>Tasks Posted: 8</span>
                                        </div>
                                    </div>
                                    <div class="admin-dashboard-last-page-users-lower-inners-options">
                                        <button id="admin-dashboard-last-page-users-lower-inners-options-accept">View Details</button>
                                        <button id="admin-dashboard-last-page-users-lower-inners-options-reject">Ban User</button>
                                    </div>
                                </div>
                                <%
                            }
                        }
                    }
                    %>
                </div>
            </div>
        </div>
        
    </main>
    <script>
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
        z-index: 999;
        top: 0;
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
    .admin-dashboard-tittle{
        display: flex;
        flex-direction: column;
        align-items: start;
        justify-content: start;
        width: 100%;
        padding: 0 24px;
        gap: 4px;
        box-sizing: border-box;
    }
    .admin-dashboard-tittle-heading{
        display: flex;
        align-items: center;
        color: var(--green-bgc);
        font-size: 14px;
        font-weight: 300;
        gap: 8px;
        line-height: 1.1;
    }
    .admin-dashboard-tittle span{
        color: var(--gray);
        font-size: 16px;
    }

    /* for dashboar left nav */
    .admin-dashboard-left-nav{
        height: 100vh;
        position: fixed;
        width: 26%;
        left: 0;
        padding: 16px 0 24px 0;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        background-color: var(--background);
        overflow-x: scroll;
    }
    .admin-dashboard-left-nav-cover{
        height: 10vh;
        width: 26%;
    }
    .admin-dashboard-last-page-main{
        min-height: 10vh;
        width: 76%;
        box-sizing: border-box;
        background-color: var(--lightter-background);
    }

    /* first page */
    .admin-dashboard-first-page{
        display: flex;
        flex-direction: column;
        gap: 18px;
        margin-top: 20px;
        padding: 0 24px;
        /* background-color: gray; */
    }
    .admin-dashboard-first-page-compartments{
        display: flex;
        gap: 18px;
    }
    .admin-dashboard-first-page-inners{
        width: 100%;
        height: 52px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-sizing: border-box;
        line-height: 1.5;
        padding: 6px;
        background-color: var(--lightter-background);
        border-radius: 8px;
    }
    .admin-dashboard-first-page-inners-left{
        display: flex;
        flex-direction: column;
    }
    .admin-dashboard-first-page-inners i{
        font-size: 22px;
        color: var(--green-bgc);
    }
    .admin-dashboard-first-page-inners-count{
        font-size: 18px;
        color: var(--green-bgc);
        margin-left: 8px;
    }
    .admin-dashboard-first-page-inners-info{
        font-size: 16px;
        color: var(--white);
        font-weight: 500;
    }
    /* for second page */
    .admin-dashboard-second-page-navigation{
        margin-top: 20px;
    }
    .admin-dashboard-second-page-navigation-nav{
        width: 100%;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        gap: 8px;
        padding: 0 24px;
    }
    .admin-dashboard-second-page-navigation-nav-inners{
        height: 38px;
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
    #admin-dashboard-second-page-navigation-nav-registration{
        color: var(--green-bgc);
        border-color:  var(--green-bgc);
    }
    .admin-dashboard-second-page-navigation-nav-inners i{
        font-weight: 500;
    }
    .admin-dashboard-second-page-navigation-nav-inners:hover{
        color: var(--white);
    }

    /* for last page */
    .admin-dashboard-last-page-registration,
    .admin-dashboard-last-page-tasks,
    .admin-dashboard-last-page-registration{
        min-height: 90vh;
        width: 100%;
        padding: 24px;
        box-sizing: border-box;
    }
    .admin-dashboard-last-page-registration-upper,
    .admin-dashboard-last-page-tasks-upper,
    .admin-dashboard-last-page-users-upper{
        box-sizing: border-box;
        display: flex;
        align-items: start;
        justify-content: space-between;
    }
    .admin-dashboard-last-page-registration-upper h2,
    .admin-dashboard-last-page-tasks-upper h2,
    .admin-dashboard-last-page-users-upper h2{
        font-size: 30px;
        font-weight: 600;
        color: var(--white);
    }
    .admin-dashboard-last-page-registration-upper-search,
    .admin-dashboard-last-page-users-upper-search{
        height: 6vh;
        width: 36%;
        background-color: var(--lightter-background);
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 6px 4px 6px 4px;
        box-sizing: border-box;
        gap: 4px;
        border: 0.1px solid var(--dark-gray);
    }
    .admin-dashboard-last-page-registration-upper-search i,
    .admin-dashboard-last-page-users-upper-search i{
        height: 84%;
        width: 10%;
        font-size: 20px;
        font-weight: 500;
        color: var(--gray);
    }
    .admin-dashboard-last-page-registration-upper-search input,
    .admin-dashboard-last-page-users-upper-search input{
        outline: none;
        height: 84%;
        width: 86%;
        font-size: 14px;
        background-color: var(--lightter-background);
        border: none;
        color: var(--white);
    }
    .admin-dashboard-last-page-registration-lower,
    .admin-dashboard-last-page-users-lower{
        padding: 18px 0 24px 0;
        display: flex;
        flex-direction: column;
        gap: 24px;
        min-height: 70vh;
    }
    .admin-dashboard-last-page-registration-lower-inners,
    .admin-dashboard-last-page-users-lower-inners{
        height: 128px;
        width: 100%;
        background-color: var(--background);
        padding: 24px;
        box-sizing: border-box;
        border-radius: 12px;
        display: flex;
        position: relative;
    }
    .admin-dashboard-last-page-registration-lower-inners:hover,
    .admin-dashboard-last-page-users-lower-inners:hover{
        border: 1px solid var(--dark-green);
    }
    .admin-dashboard-last-page-registration-lower-inners-icon,
    .admin-dashboard-last-page-users-lower-inners-icon{
        height: 90%;
        width: 5.7%;
        display: flex;
        align-items: start;
    }
    .admin-dashboard-last-page-registration-lower-inners-icon i,
    .admin-dashboard-last-page-users-lower-inners-icon i{
        padding: 11.5px 12px;
        border-radius: 48%;
        background-color: var(--green-bgc);
        color: var(--white);
        font-size: 22px;
    }
    .admin-dashboard-last-page-registration-lower-inners-info,
    .admin-dashboard-last-page-users-lower-inners-info{
        display: flex;
        flex-direction: column;
        gap: 2px;
        padding-left: 10px;
    }
    .admin-dashboard-last-page-registration-lower-inners-info-name-role,
    .admin-dashboard-last-page-users-lower-inners-info-name-role{
        display: flex;
        gap: 4px;
    }
    .admin-dashboard-last-page-registration-lower-inners-info-name-role h3,
    .admin-dashboard-last-page-users-lower-inners-info-name-role h3{
        font-size: 22px;
        font-weight: 600;
        color: var(--white);
    }
    .admin-dashboard-last-page-registration-lower-inners-info-name-role span,
    .admin-dashboard-last-page-users-lower-inners-info-name-role span{
        font-size: 12px;
        font-weight: 400;
        background-color: var(--green-bgc);
        height: fit-content;
        padding: 2px 6px 4px 4px;
        border-radius: 8px;
    }
    .admin-dashboard-last-page-registration-lower-inners-info-email,
    .admin-dashboard-last-page-users-lower-inners-info-email{
        margin-bottom: 4px;
    }
    .admin-dashboard-last-page-registration-lower-inners-info-email span,
    .admin-dashboard-last-page-users-lower-inners-info-email span{
        color: var(--gray);
        font-size: 16px;
        font-weight: 500;
    }
    .admin-dashboard-last-page-registration-lower-inners-info-extra-info,
    .admin-dashboard-last-page-users-lower-inners-info-extra-info{
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .admin-dashboard-last-page-registration-lower-inners-info-extra-info span,
    .admin-dashboard-last-page-users-lower-inners-info-extra-info span{
        font-size: 14px;
        color: var(--gray);
        font-weight: 500;
    }
    .admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots{
        height: 4px;
        width: 4px;
        background-color: var(--dark-gray);
        border-radius: 50%;
    }
    .admin-dashboard-last-page-registration-lower-inners-options,
    .admin-dashboard-last-page-users-lower-inners-options{
        position: absolute;
        right: 24px;
        height: 60%;
        display: flex;
        align-items: center;
        gap: 12px;
    }
    .admin-dashboard-last-page-registration-lower-inners-options button,
    .admin-dashboard-last-page-users-lower-inners-options button{
        height: 42px;
        font-size: 16px;
        font-weight: 500;
        padding: 0 16px;
        border: 1.5px solid;
        border-radius: 12px;
        transition: all ease-in 0.3s;
    }
    .admin-dashboard-last-page-registration-lower-inners-options i,
    .admin-dashboard-last-page-users-lower-inners-options i{
        font-size: 20px;
        font-weight: 600;
    }
    #admin-dashboard-last-page-registration-lower-inners-options-accept{
        background-color: var(--green-bgc);
        color: var(--background);
        border-color: var(--green-bgc);
    }
    #admin-dashboard-last-page-registration-lower-inners-options-accept:hover{
        background-color: var(--dark-green);
    }
    #admin-dashboard-last-page-registration-lower-inners-options-reject,
    #admin-dashboard-last-page-users-lower-inners-options-reject{
        color: var(--red);
        background-color: var(--lightter-background);
    }
    #admin-dashboard-last-page-registration-lower-inners-options-reject:hover,
    #admin-dashboard-last-page-users-lower-inners-options-reject:hover{
        background-color: var(--red);
        color: var(--white);
        border-color: var(--red);
    }
    /* for task approval */
    .admin-dashboard-last-page-tasks-lower{
        padding: 18px 0;
        display: flex;
        flex-wrap: wrap;
        gap: 24px;
    }
    .admin-dashboard-last-page-tasks-lower-inners{
        height: 394px;
        width: 432px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    .admin-dashboard-last-page-tasks-lower-inners-infos{
        height: 85.5%;
        width: 100%;
        background-color: var(--background);
        padding: 24px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        align-items: start;
        justify-content: center;
        gap: 8px;
        border-radius: 12px;
    }
    .admin-dashboard-last-page-tasks-lower-inners-options{
        height: 14.5%;
        width: 100%;
        display: flex;
        align-items: end;
        justify-content: space-between;
    }
    .admin-dashboard-last-page-tasks-lower-inners-options button{
        height: 42px;
        font-size: 16px;
        font-weight: 500;
        padding: 0 54px;
        border: 1.5px solid;
        border-radius: 12px;
        transition: all ease-in 0.3s;
    }
    .admin-dashboard-last-page-tasks-lower-inners-options i{
        font-size: 20px;
        font-weight: 600;
    }
    #admin-dashboard-last-page-tasks-lower-inners-options-accept{
        background-color: var(--green-bgc);
        color: var(--background);
        border-color: var(--green-bgc);
    }
    #admin-dashboard-last-page-tasks-lower-inners-options-accept:hover{
        background-color: var(--dark-green);
    }
    #admin-dashboard-last-page-tasks-lower-inners-options-reject{
        color: var(--red);
        background-color: var(--lightter-background);
    }
    #admin-dashboard-last-page-tasks-lower-inners-options-reject:hover{
        background-color: var(--red);
        color: var(--white);
        border-color: var(--red);
    }
    .admin-dashboard-last-page-tasks-lower-inners-infos-title{
        display: flex;
        width: 100%;
    }
    .admin-dashboard-last-page-tasks-lower-inners-infos-title h3{
        font-size: 24px;
        color: var(--green-bgc);
        font-weight: 540;
    }
    .admin-dashboard-last-page-tasks-lower-inners-infos-title span{
        background-color: var(--green-bgc);
        height: fit-content;
        text-align: center;
        width: 68px;
        padding: 0 4px 4px 4px;
        border-radius: 8px;
        font-size: 12px;
        font-weight: 400;
        margin-left: 18px;
    }
    .admin-dashboard-last-page-tasks-lower-inners-infos p{
        font-size: 16px;
        font-weight: 400;
        line-height: 1.6;
        color: var(--gray);
    }
    .admin-dashboard-last-page-tasks-lower-inners-infos ul{
        line-height: 1.6;
    }
    .admin-dashboard-last-page-tasks-lower-inners-infos ul li{
        list-style: none;
        font-size: 14px;
        color: var(--gray);
        line-height: 1.6;
        font-weight: 400;
        display: flex;
        gap: 6px;
    }
    .admin-dashboard-last-page-tasks-lower-inners-infos ul li i{
        font-size: 16px;
    }
    .admin-dashboard-last-page-tasks-lower-inners-infos-task-type{
        background-color: var(--dark-green);
        color: var(--white);
        padding: 4px 10px 4px 10px;
        border-radius: 8px;
        font-size: 12px;
        font-weight: 400;
    }

    /* for user management */
    .admin-dashboard-last-page-users{
        padding: 24px;
    }
    #admin-dashboard-last-page-users-lower-inners-options-accept{
        background-color: var(--lightter-background);
        border: 2px solid var(--green-bgc);
        color: var(--green-bgc);
    }
    #admin-dashboard-last-page-users-lower-inners-options-accept:hover{
        background-color: var(--green-bgc);
        color: var(--background);
    }
</style>
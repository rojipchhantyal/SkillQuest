<%@ page import="com.skillquest.DTOs.TasksDTOs" %>
<%@ page import="java.util.List" %>
<%@ page import="com.skillquest.DTOs.UserInfoDTOs" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillQuest</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/businessDashboard.css">
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
                    <a href="">
                        <span>Home</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="nav-cover"></div>

        <!-- for dashboard left navigation -->
        <div class="business-dashboard-left-nav">
            <div class="business-dashboard-tittle">
                <div class="business-dashboard-tittle-compartment">
                    <div class="business-dashboard-tittle-heading">
                        <h1>Business Dashboard</h1>
                    </div>
                    <span>Welcome back, <%=userInfo.getBusinessName()%>.!</span>
                </div>

                <div class="business-dashboard-tittle-compartment" id="business-dashboard-tittle-compartment-btn">
                    <button onclick="openAddTask()">
                        <i class="ri-add-line"></i>
                        Post New Task
                    </button>
                </div>  
            </div>

            <!-- business dashboard first page -->
            <div class="business-dashboard-first-page">
                <div class="business-dashboard-first-page-compartments">
                    <div class="business-dashboard-first-page-inners" id="pending-user">
                        <div class="business-dashboard-first-page-inners-left">
                            <span class="business-dashboard-first-page-inners-info">Total Tasks</span>
                            <span class="business-dashboard-first-page-inners-count">2</span>
                        </div>
                        <i class="ri-handbag-line"></i>
                    </div>

                    <div class="business-dashboard-first-page-inners" id="pending-user">
                        <div class="business-dashboard-first-page-inners-left">
                            <span class="business-dashboard-first-page-inners-info">Approved</span>
                            <span class="business-dashboard-first-page-inners-count">3</span>
                        </div>
                        <i class="ri-check-line"></i>
                    </div>
                </div>
                
                <div class="business-dashboard-first-page-compartments">
                    <div class="business-dashboard-first-page-inners" id="pending-user">
                        <div class="business-dashboard-first-page-inners-left">
                            <span class="business-dashboard-first-page-inners-info">Pending</span>
                            <span class="business-dashboard-first-page-inners-count">1</span>
                        </div>
                        <i class="ri-timer-2-line"></i>
                    </div>

                    <div class="business-dashboard-first-page-inners" id="pending-user">
                        <div class="business-dashboard-first-page-inners-left">
                            <span class="business-dashboard-first-page-inners-info">Completed</span>
                            <span class="business-dashboard-first-page-inners-count">5</span>
                        </div>
                        <i class="ri-check-double-line"></i>
                    </div>
                </div>
            </div>

            <!-- for navigation bars -->
            <div class="business-dashboard-second-page-navigation">
                <div class="business-dashboard-second-page-navigation-nav">
                    <div class="business-dashboard-second-page-navigation-nav-inners" id="business-dashboard-second-page-navigation-nav-all-task">
                        <i class="ri-handbag-line"></i>
                        <span>All Tasks</span>
                    </div>
                    <div class="business-dashboard-second-page-navigation-nav-inners" id="business-dashboard-second-page-navigation-nav-pending-task">
                        <i class="ri-history-line"></i>
                        <span>Pending Tasks</span>
                    </div>
                    <div class="business-dashboard-second-page-navigation-nav-inners" id="business-dashboard-second-page-navigation-nav-active-task">
                        <i class="ri-check-line"></i>
                        <span>Active Tasks</span>
                    </div>
                    <div class="business-dashboard-second-page-navigation-nav-inners" id="business-dashboard-second-page-navigation-nav-completed-task">
                        <i class="ri-check-double-line"></i>
                        <span>Completed Tasks</span>
                    </div>
                    <div class="business-dashboard-second-page-navigation-nav-inners" id="business-dashboard-second-page-navigation-nav-profile">
                        <i class="ri-user-line"></i>
                        <span>Profile</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- form for posting the tasks -->
        <div style="display: none;" class="business-dashboard-post-task-wrapper" id="business-dashboard-post-task-wrapper">
            <div class="business-dashboard-post-task">
                <div class="business-dashboard-post-task-tittle">
                    <h2>Post New Task</h2>
                </div>
                <div class="business-dashboard-post-task-tittle-cover">a</div>
                <form action = "<%= application.getContextPath() %>/postTask" method="post">

                    <input style="display: none" type="text" name="id" value = "<%= userInfo.getId()%>">
                    <div class="form-fields">
                        <label for="taskTittle">Task Title</label>
                        <input type="text" name="taskTittle" id="taskTittle" placeholder="e.g., Mobile app UI/UX Design">
                    </div>

                    <div class="form-fields">
                        <label for="taskDescription">Description</label>
                        <textarea name="taskDescription" id="taskDescription" placeholder="Describe the task in details.."></textarea>
                    </div>

                    <ul>
                        <li>
                            <label for="taskType">Task Type</label>
                            <select name="taskType" id="taskType">
                                <option value="Design">Design</option>
                                <option value="Development">Development</option>
                                <option value="Writing">Writing</option>
                                <option value="Video Editing">Video Editing</option>
                            </select>
                        </li>
                        <li>
                            <label for="location">Location</label>
                            <div class="inputs">
                                <i class="ri-map-pin-line"></i>
                                <input type="text" name="location" id="location" placeholder="e.g., Remote, Kathmandu Nepal">
                            </div>
                        </li>
                        <li>
                            <label for="budget">Budget</label>
                            <div class="inputs">
                                <i class="ri-money-dollar-circle-line"></i>
                                <input type="number" name="budget" id="budget" placeholder="100">
                            </div>
                        </li>
                        <li>
                            <label for="deadline">DeadLine</label>
                            <div class="inputs">
                                <i class="ri-calendar-2-line"></i>
                                <input type="date" name="deadline" id="deadline">
                            </div>
                        </li>
                    </ul>

                    <div class="form-fields" id="form-fields-note">
                    <p>
                        <strong>Note:</strong>
                        Your task will be submitted for admin approval before it becomes visible to students.
                    </p>
                    </div>

                    <div class="form-button-field">
                        <button onclick="closeAddTask()" id="form-button-field-cancle" type="button">Cancle</button>
                        <button id="form-button-field-submit">Subimt for Approval</button>
                    </div>
                </form>

                <!-- form hider button -->
                <div class="business-dashboard-post-task-hider" onclick="closeAddTask()">
                    <i class="ri-close-line"></i>
                </div>
            </div>
        </div>
        
        <!-- left nav cover -->
        <div class="business-dashboard-left-nav-cover"></div>


        <!-- last page main container -->
        <div class="business-dashboard-last-page-main">
            <!-- for all tasks -->
            <div class="business-dashboard-last-page-all-task" id="business-dashboard-last-page-all-task">
                <!-- all tasks lists-->

                <%

                List<TasksDTOs> allTasks = (List<TasksDTOs>) request.getAttribute("allPostedTasks");
                if(allTasks != null){
                   for(TasksDTOs tasks : allTasks){
                        %>
                        <div class="business-dashboard-last-page-all-task-lower-inners">
                            <div class="business-dashboard-last-page-all-task-lower-inners-tittle">
                                <h3><%= tasks.getTitle() %> .</h3>
                                <%
                                if(tasks.getStatus().equals("Claimed")){
                                %>
                                    <span>active</span>
                                <%
                                }
                                else if(tasks.getStatus().equals("Pending")){
                                %>
                                    <span id="panding">pending</span>
                                <%
                                }
                                else if(tasks.getStatus().equals("Approved")){
                                %>
                                    <span>approved</span>
                                <%
                                }
                                else if(tasks.getStatus().equals("Rejected")){
                                %>
                                    <span style="color: red; background-color: rgba(114, 4, 4, 0.429)">rejected</span>
                                <%
                                }
                                %>
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
                            <div class="student-dashboard-last-page-browse-task-lower-inners-button">
                                <span><%= tasks.getTask_type() %></span>
                            </div>
                        </div>
                        <%
                   }
                }
                %>

            </div>


            <!-- pending tasks-->
            <div style="display: none;" class="business-dashboard-last-page-pending-tasks" id="business-dashboard-last-page-pending-tasks">
                <!--all pending taskslists -->
                <div class="business-dashboard-last-page-pending-tasks-inners">
                    <div class="business-dashboard-last-page-pending-tasks-inner-tittle">
                        <h3>Web Development-Ecomerce-Site</h3>
                        <span id="panding">pending</span>
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
                    <div class="business-dashboard-last-page-pending-tasks-inners-button">
                        <span>Design</span>
                        <div class="business-dashboard-last-page-pending-tasks-inners-button-right">
                            <button id="edit-pending-task">Edit</button>
                            <button id="delete-pending-task">Delete</button>
                        </div>
                    </div>
                </div>

                <div class="business-dashboard-last-page-pending-tasks-inners">
                    <div class="business-dashboard-last-page-pending-tasks-inner-tittle">
                        <h3>Web Development-Ecomerce-Site</h3>
                        <span id="panding">pending</span>
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
                    <div class="business-dashboard-last-page-pending-tasks-inners-button">
                        <span>Design</span>
                        <div class="business-dashboard-last-page-pending-tasks-inners-button-right">
                            <button id="edit-pending-task">Edit</button>
                            <button id="delete-pending-task">Delete</button>
                        </div>
                    </div>
                </div>

                <div class="business-dashboard-last-page-pending-tasks-inners">
                    <div class="business-dashboard-last-page-pending-tasks-inner-tittle">
                        <h3>Web Development-Ecomerce-Site</h3>
                        <span id="panding">pending</span>
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
                    <div class="business-dashboard-last-page-pending-tasks-inners-button">
                        <span>Design</span>
                        <div class="business-dashboard-last-page-pending-tasks-inners-button-right">
                            <button id="edit-pending-task">Edit</button>
                            <button id="delete-pending-task">Delete</button>
                        </div>
                    </div>
                </div>

                <div class="business-dashboard-last-page-pending-tasks-inners">
                    <div class="business-dashboard-last-page-pending-tasks-inner-tittle">
                        <h3>Web Development-Ecomerce-Site</h3>
                        <span id="panding">pending</span>
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
                    <div class="business-dashboard-last-page-pending-tasks-inners-button">
                        <span>Design</span>
                        <div class="business-dashboard-last-page-pending-tasks-inners-button-right">
                            <button id="edit-pending-task">Edit</button>
                            <button id="delete-pending-task">Delete</button>
                        </div>
                    </div>
                </div>

                <div class="business-dashboard-last-page-pending-tasks-inners">
                    <div class="business-dashboard-last-page-pending-tasks-inner-tittle">
                        <h3>Web Development-Ecomerce-Site</h3>
                        <span id="panding">pending</span>
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
                    <div class="business-dashboard-last-page-pending-tasks-inners-button">
                        <span>Design</span>
                        <div class="business-dashboard-last-page-pending-tasks-inners-button-right">
                            <button id="edit-pending-task">Edit</button>
                            <button id="delete-pending-task">Delete</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- for active tasks -->
            <div style="display: none;" class="business-dashboard-last-page-active-tasks" id="business-dashboard-last-page-active-tasks">
                <!-- my active task lists -->
                <div class="business-dashboard-last-page-active-tasks-inners">
                    <div class="business-dashboard-last-page-active-tasks-inners-tittle">
                        <h3>Web Development-Ecomerce-Site</h3>
                        <span>active</span>
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
                    <div class="business-dashboard-last-page-active-tasks-inners-button">
                        <span>Design</span>
                    </div>
                </div>

                <div class="business-dashboard-last-page-active-tasks-inners">
                    <div class="business-dashboard-last-page-active-tasks-inners-tittle">
                        <h3>Web Development-Ecomerce-Site</h3>
                        <span>active</span>
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
                    <div class="business-dashboard-last-page-active-tasks-inners-button">
                        <span>Design</span>
                    </div>
                </div>

                <div class="business-dashboard-last-page-active-tasks-inners">
                    <div class="business-dashboard-last-page-active-tasks-inners-tittle">
                        <h3>Web Development-Ecomerce-Site</h3>
                        <span>active</span>
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
                    <div class="business-dashboard-last-page-active-tasks-inners-button">
                        <span>Design</span>
                    </div>
                </div>
            </div>
            
            <!-- for completed tasks-->
            <div style="display: none;" class="business-dashboard-last-page-completed-tasks" id="business-dashboard-last-page-completed-tasks">
                
                <!-- completed tasks lists -->
                <div class="business-dashboard-last-page-completed-tasks-inners">
                    <div class="business-dashboard-last-page-completed-tasks-inners-tittle">
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
                    <div class="business-dashboard-last-page-completed-tasks-inners-button">
                        <span>Design</span>
                        <button onclick="openViewDetailTask(1)">View In Details</button>
                    </div>
                </div>

                <div class="business-dashboard-last-page-completed-tasks-inners">
                    <div class="business-dashboard-last-page-completed-tasks-inners-tittle">
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
                    <div class="business-dashboard-last-page-completed-tasks-inners-button">
                        <span>Design</span>
                        <button id="view-completed-task-details">View In Details</button>
                    </div>
                </div>
            </div>

            <!-- business profile -->
            <div style="display: none;" class="business-dashboard-last-page-profile" id="business-dashboard-last-page-profile">
                <div class="business-dashboard-last-page-profile-inner">
                    <div class="business-dashboard-last-page-profile-inner-top">
                        <div class="business-dashboard-last-page-profile-inner-top-tittle">
                            <div class="business-dashboard-last-page-profile-inner-top-tittle-avatar">
                                T
                            </div>
                            <div class="business-dashboard-last-page-profile-inner-top-tittle-content">
                                <h2>TechStartup Inc.!</h2>
                                <p id="business-dashboard-last-page-profile-inner-top-tittle-content-last">Startup</p>
                            </div>
                        </div>
                        <div class="business-dashboard-last-page-profile-inner-top-button">
                            <button>Edit Profile</button>
                        </div>
                    </div>
                    <div class="business-dashboard-last-page-profile-inner-bio">
                        <span>Bio</span>
                        <p>We are a growing software development company focused on building modern web and mobile applications. We collaborate with students and fresh developers by providing real-world tasks and project-based opportunities to help them gain practical experience while earning.</p>
                    </div>
                    <div class="business-dashboard-last-page-profile-inner-detials">
                        <li>
                            <span><i class="ri-mail-line"></i>
                                Email
                            </span>
                            <p>contact@technovasolutions.com</p>
                        </li>

                        <li>
                            <span><i class="ri-phone-line"></i>
                                Phone
                            </span>
                            <p>+1 234 567 8901</p>
                        </li>

                        <li>
                            <span><i class="ri-map-pin-line"></i>
                                Location
                            </span>
                            <p>Kathmandu, Nepal</p>
                        </li>
                    </div>
                    <div class="business-dashboard-last-page-profile-inner-skills">
                        <p>Skills Required</p>
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
        <!-- completed task view in details -->
        <div style="display: none;" class="business-dashboard-last-page-completed-tasks-outer" id="business-dashboard-last-page-completed-tasks-outer">
            <div class="business-dashboard-last-page-completed-tasks-outer-inners">
                <div class="business-dashboard-last-page-completed-tasks-outer-inners-title">
                    <h2>Completed Task In Detail</h2>
                    <!-- form hider button -->
                    <div  class="business-dashboard-last-page-completed-tasks-outer-inners-hider" onclick="closevewDetailTask()">
                        <i class="ri-close-line"></i>
                    </div>
                </div>
                <div class="business-dashboard-last-page-completed-tasks-outer-inners-info">
                    <div class="completed-task-view-details-fields">
                        <h2>Web Development-Ecomerce-Site</h2>
                        <p>Need a talented designer to create modern UI/UX for our fitness mobile app.</p>
                    </div>

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

                    <div class="completed-task-view-details-fields" id="completed-task-view-details-fields-type-of-task">
                        <span>Design</span>
                    </div>

                    <div class="completed-task-view-details-fields">
                        <label>Your Task File</label>
                        <p>file Name</p>
                        <button>Download Here</button>
                    </div>
                    
                    <div class="completed-task-view-details-fields">
                        <label>Message From Student</label>
                        <textarea readonly name="message-business" id="message-business">Student message will shown here.</textarea>
                    </div>
                        
                    <div class="completed-task-view-details-fields">
                        <label>Get Project By Github</label>
                        <a href="https://github.com/rojipchhantyal/SkillQuest">click me</a>
                    </div>

                    <div" class="completed-task-view-details-fields" id="completed-task-view-details-fields-last">
                        <button onclick="closevewDetailTask()" id="close-completed-view-detail" type="button">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <script>
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

        // for form to open when which in the add post and close when click in the close button
        // form content
        const form = document.getElementById("business-dashboard-post-task-wrapper");

        // function for opening the form
        function openAddTask(){
          console.log("opeing the add task form");
          form.style.display = "flex";
        }
        // function for close the add task form
        function closeAddTask(){
          console.log("closing the add task form");
          form.style.display = "none";
        }

        // for view details
        const inDetailsTask = document.getElementById("business-dashboard-last-page-completed-tasks-outer");

        function openViewDetailTask(id){
          console.log(id+"\nOpen view details");

          inDetailsTask.style.display = "flex";
        }
        function closevewDetailTask(){
          console.log("closing the view details");

          inDetailsTask.style.display = "none";
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
        --orange: #f0b100;
    }
    nav{
        height: 11vh;
        width: 100%;
        background-color: var(--background);
        display: flex;
        align-items: center;
        justify-content: center;
        top: 0;
        position: fixed;
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
        position: relative;
    }

    /* title page */
    .business-dashboard-tittle{
        display: flex;
        flex-direction: column;
        align-items: start;
        justify-content: start;
        padding: 0 24px;
        gap: 14px;
    }
    .business-dashboard-tittle-compartment{
        width: 100%;
        display: flex;
        flex-direction: column;
    }
    /* #business-dashboard-tittle-compartment-btn{
        align-items: end;
    } */
    .business-dashboard-tittle-heading{
        display: flex;
        align-items: center;
        color: var(--green-bgc);
        font-size: 14px;
        font-weight: 300;
        gap: 8px;
        line-height: 1.1;
    }
    .business-dashboard-tittle span{
        color: var(--gray);
        font-size: 16px;
    }
    .business-dashboard-tittle button{
        width: 100%;
        color: var(--background);
        background-color: var(--green-bgc);
        border: none;
        padding: 6px 0 8px 0;
        font-size: 14px;
        font-weight: 600;
        border-radius: 8px;
        transition: all ease-in-out 0.3s;
    }
    .business-dashboard-tittle button i{
        font-size: 16px;
        font-weight: 600;
    }
    .business-dashboard-tittle button:hover{
        background-color: var(--dark-green);
    }

    /* dashboard left nav */
    .business-dashboard-left-nav{
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
    .business-dashboard-left-nav-cover{
        height: 10vh;
        width: 26%;
    }
    .business-dashboard-last-page-main{
        min-height: 10vh;
        width: 76%;
        box-sizing: border-box;
        background-color: var(--lightter-background);
    }

    /* task posting form */
    .business-dashboard-post-task-wrapper{
        height: 100vh;
        width: 100%;
        background-color: rgba(0, 0, 0, 0.744);
        position: fixed;
        z-index: 9999999999;
        top: 0;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .business-dashboard-post-task{
        position: relative;
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
    .business-dashboard-post-task-tittle{
        position: absolute;
        padding: 24px;
        border-bottom: 1px solid var(--green-bgc);
        width: 100%;
        box-sizing: border-box;
        background-color: var(--lightter-background);
    }
    .business-dashboard-post-task-tittle h2{
        font-size: 32px;
        font-weight: 500;
        color: var(--white);
    }
    .business-dashboard-post-task-tittle-cover{
        height: 16vh;
        width: 100%;
        display: flex;
        flex-direction: column;
        padding: 15px 0;
    }
    form{
        width: 100%;
        padding: 24px 24px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        gap: 24px;
        overflow-y: scroll;
    }
    .form-fields{
        display: flex;
        flex-direction: column;
    }
    .form-fields label,
    form ul li label{
        font-size: 14px;
        color: var(--white);
        font-weight: 500;
        margin-bottom: 8px;
    }
    .form-fields input,
    .form-fields textarea,
    .inputs,
    form ul li select{
        padding: 8px 16px;
        font-size: 14px;
        color: var(--white);
        background-color: var(--background);
        border: none;
        border-radius: 8px;
        outline: none;
    }
    .form-fields textarea{
        height: 102px;
        resize: none;
    }
    form ul{
        display: grid;
        grid-template-columns: 49% 49%;
        gap: 12px;
    }
    form ul li{
        list-style: none;

        display: flex;
        flex-direction: column;
    }
    .inputs{
      display: flex;
      gap: 4px;
      align-items: center;
      background-color: var(--background);
    }
    .inputs input{
        outline: none;
        border: none;
        background-color: var(--background);
        color: var(--white);
        font-size: 14px;
        width: 96%;
    }
    .inputs i{
        font-size: 16px;
    }
    #form-fields-note{
        background-color: rgba(4, 55, 4, 0.403);
        padding: 16px;
        border-radius: 12px;
        font-size: 16px;
        color: var(--green-bgc);
        line-height: 1.6;
    }
    .form-button-field{
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 24px;
    }
    .form-button-field button{
        height: 48px;
        width: 50%;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        box-sizing: border-box;
        transition: all ease-in-out 0.3s;
    }
    #form-button-field-cancle{
        border: 1px solid rgba(6, 81, 6, 0.505);
        color: var(--gray);
        background-color: var(--lightter-background);
    }
    #form-button-field-submit{
        background-color: var(--green-bgc);
        color: var(--lightter-background);
    }
    #form-button-field-cancle:hover{
        border: 1px solid var(--green-bgc);
        color: var(--white);
    }
    #form-button-field-submit:hover{
        background-color: var(--dark-green);
    }
    .business-dashboard-post-task-hider{
        position: absolute;
        right: 36px;
        top: 32px;
    }
    .business-dashboard-post-task-hider i{
        color: gray;
        font-size: 30px;
        font-weight: 500;
    }
    .business-dashboard-post-task-hider:hover i{
        color: var(--white);
    }

    /* first page */
    .business-dashboard-first-page{
        display: flex;
        flex-direction: column;
        gap: 18px;
        margin-top: 20px;
        padding: 0 24px;
    }
    .business-dashboard-first-page-compartments{
        display: flex;
        gap: 18px;
    }
    .business-dashboard-first-page-inners{
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
    .business-dashboard-first-page-inners-left{
        display: flex;
        flex-direction: column;
    }
    .business-dashboard-first-page-inners i{
        font-size: 22px;
        color: var(--green-bgc);
    }
    .business-dashboard-first-page-inners-count{
        font-size: 18px;
        color: var(--green-bgc);
        margin-left: 8px;
    }
    .business-dashboard-first-page-inners-info{
        font-size: 16px;
        color: var(--white);
        font-weight: 500;
    }

    /* for second page */
    .business-dashboard-second-page-navigation{
        margin-top: 20px;
    }
    .business-dashboard-second-page-navigation-nav{
        width: 100%;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        gap: 8px;
        padding: 0 24px;
    }
    .business-dashboard-second-page-navigation-nav-inners{
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
    #business-dashboard-second-page-navigation-nav-all-task{
        color: var(--green-bgc);
        border-color:  var(--green-bgc);
    }
    .business-dashboard-second-page-navigation-nav-inners i{
        font-weight: 500;
    }
    .business-dashboard-second-page-navigation-nav-inners:hover{
        color: var(--white);
    }

    /* last page */
    .business-dashboard-last-page-all-task,
    .business-dashboard-last-page-pending-tasks,
    .business-dashboard-last-page-active-tasks,
    .business-dashboard-last-page-completed-tasks{
        min-height: 90vh;
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        gap: 24px;
        padding: 24px;
        box-sizing: border-box;
    }
    .business-dashboard-last-page-all-task-lower-inners,
    .business-dashboard-last-page-pending-tasks-inners,
    .business-dashboard-last-page-active-tasks-inners,
    .business-dashboard-last-page-completed-tasks-inners{
        height: 354px;
        width: 432px;
        background-color: var(--background);
        border-radius: 12px;
        box-sizing: border-box;
        padding: 24px;
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    .business-dashboard-last-page-all-task-lower-inners-tittle,
    .business-dashboard-last-page-pending-tasks-inner-tittle,
    .business-dashboard-last-page-active-tasks-inners-tittle,
    .business-dashboard-last-page-completed-tasks-inners-tittle{
        display: flex;
    }
    .business-dashboard-last-page-all-task-lower-inners-tittle h3,
    .business-dashboard-last-page-pending-tasks-inner-tittle h3,
    .business-dashboard-last-page-active-tasks-inners-tittle h3,
    .business-dashboard-last-page-completed-tasks-inners-tittle h3{
        font-size: 24px;
        font-weight: 600;
        color: var(--dark-green);
        line-height: 1.5;
        margin-bottom: 6px;
    }
    .business-dashboard-last-page-all-task-lower-inners-tittle span,
    .business-dashboard-last-page-pending-tasks-inner-tittle span,
    .business-dashboard-last-page-active-tasks-inners-tittle span,
    .business-dashboard-last-page-completed-tasks-inners-tittle span{
        padding: 2px 8px 4px 8px;
        height: fit-content;
        background-color: rgba(0, 128, 0, 0.393);
        color: var(--green-bgc);
        font-size: 12px;
        border-radius: 8px;
    }
    #panding{
        color: var(--orange);
        background-color: rgba(90, 60, 5, 0.599);
    }
    .business-dashboard-last-page-all-task-lower-inners p,
    .business-dashboard-last-page-pending-tasks-inners p,
    .business-dashboard-last-page-active-tasks-inners p,
    .business-dashboard-last-page-completed-tasks-inners p{
        line-height: 1.6;
        font-size: 16px;
        font-weight: 450;
        color: var(--gray);
        margin-bottom: 8px;
    }
    .business-dashboard-last-page-all-task-lower-inners ul,
    .business-dashboard-last-page-pending-tasks-inners ul,
    .business-dashboard-last-page-active-tasks-inners ul,
    .business-dashboard-last-page-completed-tasks-inners ul{
        line-height: 1.6;
    }
    .business-dashboard-last-page-all-task-lower-inners ul li,
    .business-dashboard-last-page-pending-tasks-inners ul li,
    .business-dashboard-last-page-active-tasks-inners ul li,
    .business-dashboard-last-page-completed-tasks-inners ul li{
        list-style: none;
        font-size: 14px;
        color: var(--gray);
        line-height: 1.6;
        font-weight: 400;
        display: flex;
        gap: 6px;
    }
    .business-dashboard-last-page-all-task-lower-inners ul li i,
    .business-dashboard-last-page-pending-tasks-inners ul li i,
    .business-dashboard-last-page-active-tasks-inners ul li i,
    .business-dashboard-last-page-completed-tasks-inners ul li i{
        font-size: 16px;
    }
    .student-dashboard-last-page-browse-task-lower-inners-button,
    .business-dashboard-last-page-pending-tasks-inners-button,
    .business-dashboard-last-page-active-tasks-inners-button,
    .business-dashboard-last-page-completed-tasks-inners-button{
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-top: 16px;
    }
    .student-dashboard-last-page-browse-task-lower-inners-button span,
    .business-dashboard-last-page-pending-tasks-inners-button span,
    .business-dashboard-last-page-active-tasks-inners-button span,
    .business-dashboard-last-page-completed-tasks-inners-button span{
        background-color: rgba(0, 128, 0, 0.393);
        font-size: 12px;
        color: var(--green-bgc);
        padding: 2px 12px;
        border-radius: 12px;
    }
    .business-dashboard-last-page-pending-tasks-inners-button-right{
        display: flex;
        gap: 8px;
    }
    .business-dashboard-last-page-pending-tasks-inners-button-right button,
    .business-dashboard-last-page-completed-tasks-inners-button button{
        font-size: 16px;
        font-weight: 600;
        padding: 4px 16px;
        background-color: var(--green-bgc);
        color: var(--background);
        border-radius: 12px;
        border: none;
        transition: all ease-in-out 0.3s;
        box-sizing: border-box;
    }
    .business-dashboard-last-page-completed-tasks-inners-button button{
        padding: 6px 16px;
    }
    .business-dashboard-last-page-completed-tasks-inners-button button:hover{
        background-color: var(--dark-green);
    }
    #edit-pending-task{
        border: 1px solid var(--orange);
        color: var(--orange);
        background-color: var(--lightter-background);
    }
    #delete-pending-task{
        border: 1px solid var(--red);
        color: var(--red);
        background-color: var(--lightter-background);
    }
    #edit-pending-task:hover{
        background-color: rgba(90, 60, 5, 0.599);
    }
    #delete-pending-task:hover{
        background-color: rgba(114, 4, 4, 0.429);
    }

    /* for profile */
    .business-dashboard-last-page-profile{
        padding: 24px;
        padding-top: 0;
        padding-top: 24px;
    }
    .business-dashboard-last-page-profile-inner{
        min-height: 80vh;
        width: 82%;
        border-radius: 12px;
        padding: 24px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        background-color: var(--background);
    }
    .business-dashboard-last-page-profile-inner-top{
        height: 96px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        margin-bottom: 30px;
    }
    .business-dashboard-last-page-profile-inner-top-tittle{
        height: 100%;
        width: 60%;
        display: flex;
        gap: 12px;
    }
    .business-dashboard-last-page-profile-inner-top-tittle-avatar{
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
    .business-dashboard-last-page-profile-inner-top-tittle-content{
        display: flex;
        flex-direction: column;
        justify-content: center;

    }
    .business-dashboard-last-page-profile-inner-top-tittle-content h2{
        font-size: 32px;
        color:  var(--white);
        font-weight: 500;
    }
    .business-dashboard-last-page-profile-inner-top-tittle-content p{
        font-size: 16px;
        font-weight: 400;
        line-height: 1.3;
        color: var(--gray);
    }
    #business-dashboard-last-page-profile-inner-top-tittle-content-last{
        color: var(--green-bgc);
    }
    /* .business-dashboard-last-page-profile-inner-top-button{

    } */
    .business-dashboard-last-page-profile-inner-top-button button{
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
    .business-dashboard-last-page-profile-inner-top-button button:hover{
        background-color: var(--green-bgc);
        color: var(--lightter-background);
    }
    .business-dashboard-last-page-profile-inner-bio{
        line-height: 1.6;
        margin-bottom: 24px;
    }
    .business-dashboard-last-page-profile-inner-bio span{
        color: var(--white);
        font-size: 14px;
        font-weight: 400;
    }
    .business-dashboard-last-page-profile-inner-bio p{
        color: var(--gray);
        font-size: 16px;
        font-weight: 400;
    }
    .business-dashboard-last-page-profile-inner-detials{
        display: grid;
        grid-template-columns: 346px 346px;
        gap: 20px;
        margin-bottom: 24px;
    }
    .business-dashboard-last-page-profile-inner-detials li{
        list-style: none;
        display: flex;
        flex-direction: column;
        gap: 6px;
    }
    .business-dashboard-last-page-profile-inner-detials li span{
        color: var(--white);
        font-size: 14px;
        font-weight: 400;
    }
    .business-dashboard-last-page-profile-inner-detials li span i{
        margin-right: 4px;
    }
    .business-dashboard-last-page-profile-inner-detials li p{
        color: var(--gray);
        font-size: 16px;
        font-weight: 400;
    }
    /* .business-dashboard-last-page-profile-inner-skills{

    } */
    .business-dashboard-last-page-profile-inner-skills p{
        font-size: 14px;
        color: var(--white);
        font-weight: 400;
        margin-bottom: 8px;
    }
    .business-dashboard-last-page-profile-inner-skills ul{
        display: flex;
        align-items: center;
        gap:16px;
    }
    .business-dashboard-last-page-profile-inner-skills ul span{
        font-size: 14px;
        font-weight: 400;
        padding: 4px 16px;
        border-radius: 12px;
        background-color: rgba(15, 96, 15, 0.525);
        color: var(--green-bgc);
        border: 0.2px solid var(--green-bgc);
    }
    /* view in details adn download task panel  */
    .business-dashboard-last-page-completed-tasks-outer{
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
    .business-dashboard-last-page-completed-tasks-outer-inners{
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
    .business-dashboard-last-page-completed-tasks-outer-inners-title{
        padding: 24px;
        border-bottom: 1px solid var(--green-bgc);
        width: 100%;
        box-sizing: border-box;
        position: relative;
    }
    .business-dashboard-last-page-completed-tasks-outer-inners-title h2{
        font-size: 28px;
        font-weight: 500;
        color: var(--white);
    }
    .business-dashboard-last-page-completed-tasks-outer-inners-info{
        width: 100%;
        padding:  18px 24px 28px 24px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        overflow-y: scroll;
        gap: 18px;
        overflow-x: hidden;
    }
    .completed-task-view-details-fields h2{
        font-size: 26px;
        font-weight: 500;
        color: var(--green-bgc);
    }
    .completed-task-view-details-fields p{
        font-size: 16px;
        font-weight: 400;
        color: var(--gray);
        margin-top: 4px;
    }
    .completed-task-view-details-fields{
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    .business-dashboard-last-page-completed-tasks-outer-inners-info label{
        font-size: 14px;
        color: var(--white);
        font-weight: 500;
    }
    .business-dashboard-last-page-completed-tasks-outer-inners-info ul{
        display: flex;
        flex-direction: column;
    }
    .business-dashboard-last-page-completed-tasks-outer-inners-info ul li{
        list-style: none;
        font-size: 16px;
        font-weight: inherit;
        color: var(--gray);
        line-height: 1.6;
    }
    #completed-task-view-details-fields-type-of-task{
        align-items: end;
    }
    .completed-task-view-details-fields span{
        width: fit-content;
        background-color: rgba(0, 128, 0, 0.393);
        font-size: 12px;
        color: var(--green-bgc);
        padding: 2px 12px;
        border-radius: 12px;
    }
    .completed-task-view-details-fields button{
        height: 38px;
        width: 100%;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        box-sizing: border-box;
        transition: all ease-in-out 0.3s;
        background-color: var(--green-bgc);
        color: var(--lightter-background);
        margin-top: 2px;
    }
    .completed-task-view-details-fields button:hover{
        background-color: var(--dark-green);
    }
    .business-dashboard-last-page-completed-tasks-outer-inners-info textarea{
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
    .completed-task-view-details-fields a{
        height: 38px;
        padding: 2px 0;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: var(--background);
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        text-decoration: none;
        color: var(--green-bgc);
        transition: all ease-in-out 0.3s;
    }
    .completed-task-view-details-fields a:hover{
        background-color: var(--dark-green);
        color: var(--background);
    }
    #completed-task-view-details-fields-last{
        display: flex;
        align-items: end;
    }
    #close-completed-view-detail{
        width: 100%;
    }
    .business-dashboard-last-page-completed-tasks-outer-inners-hider{
        position: absolute;
        top: 24px;
        right: 24px;
    }
    .business-dashboard-last-page-completed-tasks-outer-inners-hider i{
        color: gray;
        font-size: 30px;
        font-weight: 500;
    }
    .business-dashboard-last-page-completed-tasks-outer-inners-hider:hover i{
        color: var(--white);
    }
</style>
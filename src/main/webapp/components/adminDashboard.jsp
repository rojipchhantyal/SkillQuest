<%@ page import="java.util.List" %>
<%@ page import="com.skillquest.Entity.Student" %>
<%@ page import="com.skillquest.Entity.Business" %>
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
                                %>
                                    <div class="admin-dashboard-last-page-registration-lower-inners">
                                        <div class="admin-dashboard-last-page-registration-lower-inners-icon">
                                            <i class="ri-user-line"></i>
                                        </div>
                                        <div class="admin-dashboard-last-page-registration-lower-inners-info">
                                            <div class="admin-dashboard-last-page-registration-lower-inners-info-name-role">
                                                <h3>Rojip Chhantyal</h3>
                                                <span>studnet</span>
                                            </div>
                                            <div class="admin-dashboard-last-page-registration-lower-inners-info-email">
                                                <span>rejanchhantyal@gmail.com</span>
                                            </div>
                                            <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info">
                                                <span>MIT</span>
                                                <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots"></div>
                                                <span>Computer Science</span>
                                                <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots"></div>
                                                <span>Kathmandu, Nepal</span>
                                                <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots"></div>
                                                <span>Registered: 9 dec 2025</span>
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
                            %>
                                <div class="admin-dashboard-last-page-registration-lower-inners">
                                    <div class="admin-dashboard-last-page-registration-lower-inners-icon">
                                        <i class="ri-building-4-line"></i>
                                    </div>
                                    <div class="admin-dashboard-last-page-registration-lower-inners-info">
                                        <div class="admin-dashboard-last-page-registration-lower-inners-info-name-role">
                                            <h3>TechVenture Ltd</h3>
                                            <span>business</span>
                                        </div>
                                        <div class="admin-dashboard-last-page-registration-lower-inners-info-email">
                                            <span>ontact@techventure.com</span>
                                        </div>
                                        <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info">
                                            <span>Startup</span>
                                            <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots"></div>
                                            <span>Kathmandu, Nepal</span>
                                            <div class="admin-dashboard-last-page-registration-lower-inners-info-extra-info-dots"></div>
                                            <span>Registered: 9 dec 2025</span>
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
                    
                    <!-- ever users info -->
                    <div class="admin-dashboard-last-page-tasks-lower-inners">
                        <div class="admin-dashboard-last-page-tasks-lower-inners-infos">
                            <div class="admin-dashboard-last-page-tasks-lower-inners-infos-title">
                                <h3>Logo Design for New Startup</h3>
                                <span>panding</span>
                            </div>
                            <p>Need a creative logo designer to create a modern brand identity.</p>
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
                            <span class="admin-dashboard-last-page-tasks-lower-inners-infos-task-type">Design</span>
                        </div>
                        <div class="admin-dashboard-last-page-tasks-lower-inners-options">
                            <button id="admin-dashboard-last-page-tasks-lower-inners-options-accept">
                                <i class="ri-check-line"></i>
                                Approve
                            </button>
                            <button id="admin-dashboard-last-page-tasks-lower-inners-options-reject">
                                <i class="ri-close-line"></i>
                                Reject
                            </button>
                        </div>
                    </div>

                    <div class="admin-dashboard-last-page-tasks-lower-inners">
                        <div class="admin-dashboard-last-page-tasks-lower-inners-infos">
                            <div class="admin-dashboard-last-page-tasks-lower-inners-infos-title">
                                <h3>Python Automation Script</h3>
                                <span>panding</span>
                            </div>
                            <p>Create automation scripts for data processing tasks.</p>
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
                                    <span>1500</span>
                                </li>
                                <li>
                                    <i class="ri-calendar-event-line"></i>
                                    <span>Deadline: Jan 10, 2026</span>
                                </li>
                            </ul>
                            <span class="admin-dashboard-last-page-tasks-lower-inners-infos-task-type">Development</span>
                        </div>
                        <div class="admin-dashboard-last-page-tasks-lower-inners-options">
                            <button id="admin-dashboard-last-page-tasks-lower-inners-options-accept">
                                <i class="ri-check-line"></i>
                                Approve
                            </button>
                            <button id="admin-dashboard-last-page-tasks-lower-inners-options-reject">
                                <i class="ri-close-line"></i>
                                Reject
                            </button>
                        </div>
                    </div>
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
                    <!-- ever users info -->
                    <div class="admin-dashboard-last-page-users-lower-inners">
                        <div class="admin-dashboard-last-page-users-lower-inners-icon">
                            <i class="ri-user-line"></i>
                        </div>
                        <div class="admin-dashboard-last-page-users-lower-inners-info">
                            <div class="admin-dashboard-last-page-users-lower-inners-info-name-role">
                                <h3>Rojip Chhantyal</h3>
                                <span>studnet</span>
                            </div>
                            <div class="admin-dashboard-last-page-users-lower-inners-info-email">
                                <span>rejanchhantyal@gmail.com</span>
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

                    <div class="admin-dashboard-last-page-users-lower-inners">
                        <div class="admin-dashboard-last-page-users-lower-inners-icon">
                            <i class="ri-building-4-line"></i>
                        </div>
                        <div class="admin-dashboard-last-page-users-lower-inners-info">
                            <div class="admin-dashboard-last-page-users-lower-inners-info-name-role">
                                <h3>TechVenture Ltd</h3>
                                <span>business</span>
                            </div>
                            <div class="admin-dashboard-last-page-users-lower-inners-info-email">
                                <span>ontact@techventure.com</span>
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
                </div>
            </div>
        </div>
        
    </main>
    <script src="<%= application.getContextPath() %>/js//adminDashboard.js"></script>
</body>
</html>
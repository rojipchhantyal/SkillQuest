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
                    <span>Welcome back, TechStartup Inc.!</span>
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
                <form>
                    <div class="form-fields">
                        <label for="">Task Title</label>
                        <input type="text" name="" id="" placeholder="e.g., Mobile app UI/UX Design">
                    </div>

                    <div class="form-fields">
                        <label for="">Description</label>
                        <textarea name="" id="" placeholder="Describe the task in details.."></textarea>
                    </div>

                    <ul>
                        <li>
                            <label for="">Task Type</label>
                            <select name="" id="">
                                <option value="">Design</option>
                                <option value="">Design</option>
                                <option value="">Design</option>
                                <option value="">Design</option>
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
                                <input type="number" name="location" id="location" placeholder="100">
                            </div>
                        </li>
                        <li>
                            <label for="deadline">DeadLine</label>
                            <div class="inputs">
                                <i class="ri-calendar-2-line"></i>
                                <input type="date" name="location" id="location">
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
                <div class="business-dashboard-last-page-all-task-lower-inners">
                    <div class="business-dashboard-last-page-all-task-lower-inners-tittle">
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
                    <div class="student-dashboard-last-page-browse-task-lower-inners-button">
                        <span>Design</span>
                    </div>
                </div>

                <div class="business-dashboard-last-page-all-task-lower-inners">
                    <div class="business-dashboard-last-page-all-task-lower-inners-tittle">
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
                    <div class="student-dashboard-last-page-browse-task-lower-inners-button">
                        <span>Design</span>
                    </div>
                </div>

                <div class="business-dashboard-last-page-all-task-lower-inners">
                    <div class="business-dashboard-last-page-all-task-lower-inners-tittle">
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
                    <div class="student-dashboard-last-page-browse-task-lower-inners-button">
                        <span>Design</span>
                    </div>
                </div>
                <div class="business-dashboard-last-page-all-task-lower-inners">
                    <div class="business-dashboard-last-page-all-task-lower-inners-tittle">
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
                    <div class="student-dashboard-last-page-browse-task-lower-inners-button">
                        <span>Design</span>
                    </div>
                    </div>
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
    <script src="<%= application.getContextPath() %>/js/businessDashboard.js"></script>
</body>
</html>
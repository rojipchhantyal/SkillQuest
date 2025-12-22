<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillQuest</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="<c:url value='/assets/homePage.css' />">
    <link
        href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css"
        rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans+Code:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
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
                        <span>Post Tasks</span>
                    </a>
                </li>
                <li>
                    <a href="./assets/components/login.html">
                        <span>Login</span>
                    </a>
                </li>
                <li>
                    <a href="./assets/components/getStarted.html">
                        <span>Get Started</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="home-first-page">
            <h1>Find Your Next Quest</h1>
            <p>Discover opportunities, showcase your skills, and earn while you learn. Join thousands of <br>students and businesses.</p>
            <div class="home-first-page-last">
                <a href="">Get Started</a>
                <a href="">Login</a>
            </div>
        </div>
        <div class="home-available-task-page">
            <div class="home-available-task-page-search">
                <div class="home-available-task-page-search-inners">
                    <i class="ri-search-line"></i>
                    <input type="text" name="" id="" placeholder="Search tasks..">
                </div>
                <div class="home-available-task-page-search-inners">
                    <i class="ri-map-pin-line"></i>
                    <input type="text" name="" id="" placeholder="Location..">
                </div>
                <div class="home-available-task-page-search-inners">
                    <i class="ri-recycle-line"></i>
                    <select name="" id="">
                        <option value="all type" selected>All Types</option>
                        <option value="">Design</option>
                        <option value="">Writing</option>
                        <option value="">Video Editing</option>
                        <option value="">Deveopment</option>
                    </select>
                </div>
            </div>
            <div class="home-available-task-page-tasks">
                <div class="home-available-task-page-tasks-tittle">
                    <h2>Available Tasks</h2>
                    <span>6 tasks found</span>
                </div>
                <div class="home-available-task-page-tasks-list">
                    <!-- lists of the tasks -->
                    <div class="home-available-task-page-tasks-list-inners">
                        <h3>Web Development-Ecomerce-Site</h3>
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
                        <div class="home-available-task-page-tasks-list-inners-button">
                            <span>Design</span>
                            <button>Claim Task</button>
                        </div>
                    </div>

                    <div class="home-available-task-page-tasks-list-inners">
                        <h3>Mobile App UI/UX Design</h3>
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
                        <div class="home-available-task-page-tasks-list-inners-button">
                            <span>Design</span>
                            <button>Claim Task</button>
                        </div>
                    </div>

                    <div class="home-available-task-page-tasks-list-inners">
                        <h3>Mobile App UI/UX Design</h3>
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
                        <div class="home-available-task-page-tasks-list-inners-button">
                            <span>Design</span>
                            <button>Claim Task</button>
                        </div>
                    </div>

                    <div class="home-available-task-page-tasks-list-inners">
                        <h3>Mobile App UI/UX Design</h3>
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
                        <div class="home-available-task-page-tasks-list-inners-button">
                            <span>Design</span>
                            <button>Claim Task</button>
                        </div>
                    </div>

                    <div class="home-available-task-page-tasks-list-inners">
                        <h3>Mobile App UI/UX Design</h3>
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
                        <div class="home-available-task-page-tasks-list-inners-button">
                            <span>Design</span>
                            <button>Claim Task</button>
                        </div>
                    </div>

                    <div class="home-available-task-page-tasks-list-inners">
                        <h3>Mobile App UI/UX Design</h3>
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
                        <div class="home-available-task-page-tasks-list-inners-button">
                            <span>Design</span>
                            <button>Claim Task</button>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <div class="home-register-page">
            <div class="home-register-page-inner">
                <h2>Ready to Start Your Quest?</h2>
                <p>Join SkillQuest today and connect with opportunities that match your skills. Students earn, <br>businesses grow.</p>
                <button>Register Now</button>
            </div>
        </div>
    </main>
    <footer>
        <p>© 2024 SkillQuest. All rights reserved.</p>
    </footer>
</body>
</html>
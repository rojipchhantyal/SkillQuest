<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillQuest</title>
    <link
        href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css"
        rel="stylesheet"
    />
    <link rel="stylesheet" href="../css/getStarted.css">
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
        <div class="skillquest-logo">
            <span class="logo-circlee">SQ</span>
            <h2>Join SkillQuest</h2>
            <p>Create your account and start your journey</p>
        </div>
        
        <!-- form to register -->
        <div class="form-outer-main">
            <div class="form-outer-selector-main">
                <label>Register as</label>
                <div class="form-outer-selector">
                    <div class="form-outer-selector-student" id="form-outer-selector-student">
                        <i class="ri-user-line"></i>
                        <span class="form-outer-selector-type-span">Studnet</span>
                        <p class="form-outer-selector-type-p">Find and complete tasks.</p>
                    </div>
                    <div class="form-outer-selector-business" id="form-outer-selector-business">
                        <i class="ri-building-4-line"></i>
                        <span id="form-outer-selector-type-span">Business</span>
                        <p class="form-outer-selector-type-p">Post task and hire.</p>
                    </div>
                </div>
            </div>


            <!-- for student registration -->
            <form class="form-for-student" action="" id="form-for-student">
                <ul class="form-for-student-field-outer">
                    <li>
                        <label for="fullName">Full Name</label>
                        <div class="student-input-wrapper">
                            <i class="ri-user-line"></i>
                            <input type="text" name="fullName" id="fullName" placeholder="Rojip Chhantyal">
                        </div>
                    </li>
                    <li>
                        <label for="emailStuent">Email</label>
                        <div class="student-input-wrapper">
                            <i class="ri-mail-line"></i>
                            <input type="email" name="emailStuent" placeholder="your@email.com">
                        </div>
                    </li>
                    <li>
                        <label for="university">University</label>
                        <div class="student-input-wrapper">
                            <input style="padding-left: 8px;" type="text" name="university" id="university" placeholder="Your University">
                        </div>
                    </li>
                    <li>
                        <label for="major">Major</label>
                        <div class="student-input-wrapper">
                            <input style="padding-left: 8px;" type="text" name="major" id="major" placeholder="BCA">
                        </div>
                    </li>
                    <li>
                        <label for="phoneStudent">Phone</label>
                        <div class="student-input-wrapper">
                            <i class="ri-phone-line"></i>
                            <input type="tel" name="phone" id="phoneStudent" placeholder="9700000000">
                        </div>
                    </li>
                    <li>
                        <label for="locationStudent">Location</label>
                        <div class="student-input-wrapper">
                            <i class="ri-map-pin-line"></i>
                            <input type="text" name="location" id="locationStudent" placeholder="Kathmandu, Nepal">
                        </div>
                    </li>
                    <!-- for passwords -->
                    <li>
                        <label for="firstPasswordStudent">Password</label>
                        <div class="student-input-wrapper">
                            <i class="ri-lock-line"></i>
                            <input type="password" name="firstPassword" id="firstPasswordStudent" placeholder="🔑🔑🔑">
                        </div>
                    </li>
                    <li>
                        <label for="confirmPasswordStudent">Password</label>
                        <div class="student-input-wrapper">
                            <i class="ri-lock-line"></i>
                            <input type="password" name="confirmPassword" id="confirmPasswordStudent" placeholder="🔑🔑🔑">
                        </div>
                    </li>
                </ul>
                <button>Register</button>
            </form>

            <!-- registration form for business-->
            <form style="display: none;" class="form-for-business" action="" id="form-for-business">
                <ul class="form-for-business-field-outer">
                    <li>
                        <label for="contactName">Contact Name</label>
                        <div class="business-input-wrapper">
                            <i class="ri-user-line"></i>
                            <input type="text" name="contactName" id="contactName" placeholder="Rejan Chhantyal">
                        </div>
                    </li>
                    <li>
                        <label for="emailBusiness">Email</label>
                        <div class="student-input-wrapper">
                            <i class="ri-mail-line"></i>
                            <input type="email" name="email" id="emailBusiness" placeholder="your@email.com">
                        </div>
                    </li>
                    <li>
                        <label for="businessName">Business Name</label>
                        <div class="student-input-wrapper">
                            <input style="padding-left: 8px;" type="text" name="businessName" id="businessName" placeholder="SkillQuest">
                        </div>
                    </li>
                    <li>
                        <label for="businessType">Business Type</label>
                        <div class="student-input-wrapper">
                            <select style="padding-left: 8px;" name="businessType" id="businessType">
                                <option value="" selected disabled>--Select Type--</option>
                                <option value="startUp">Startup</option>
                                <option value="smallBusiness">Small Business</option>
                                <option value="enterPrise">Enterprise</option>
                                <option value="nonProfit">Non-Profit</option>
                            </select>
                        </div>
                    </li>
                    <li>
                        <label for="phoneBusiness">Phone</label>
                        <div class="student-input-wrapper">
                            <i class="ri-phone-line"></i>
                            <input type="tel" name="phone" id="phoneBusiness" placeholder="9700000000">
                        </div>
                    </li>
                    <li>
                        <label for="locationBusiness">Location</label>
                        <div class="student-input-wrapper">
                            <i class="ri-map-pin-line"></i>
                            <input type="text" name="location" id="locationBusiness" placeholder="Kathmandu, Nepal">
                        </div>
                    </li>
                    <!-- for passwords -->
                    <li>
                        <label for="firstPasswordBusiness">Password</label>
                        <div class="student-input-wrapper">
                            <i class="ri-lock-line"></i>
                            <input type="password" name="firstPassword" id="firstPasswordBusiness" placeholder=".........">
                        </div>
                    </li>
                    <li>
                        <label for="confirmPasswordBusiness">Password</label>
                        <div class="student-input-wrapper">
                            <i class="ri-lock-line"></i>
                            <input type="password" name="confirmPassword" id="confirmPasswordBusiness" placeholder=".........">
                        </div>
                    </li>
                </ul>
                <button>Register</button>
            </form>

            <div class="form-outer-main-or-line">
                <span>or</span>
            </div>
            <p class="form-outer-main-p">
                Already have an account?
                <a href="login.jsp">Login here</a>
            </p>
        </div>

        <div class="note-for-user">
            <p>
                <strong>Note: </strong>
                Your registration will be reviewed by our admin team. You can able to login once your account is approved.
            </p>
        </div>
    </main>
</body>
<script src="../js/getStarted.js"></script>
</html>
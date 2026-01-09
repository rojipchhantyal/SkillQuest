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
            <%
            String validMessage = (String) request.getAttribute("validMessage");
            if(validMessage != null && !validMessage.isEmpty()){
                %>
                <p style="position: absolute; z-index: 9999; color: rgba(255, 0, 0, 0.386); max-width: 66%;"><%= validMessage %></p>
                <%
            }
            %>

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
            <form class="form-for-student" action="${pageContext.request.contextPath}/registerStudents" method="post" id="form-for-student">
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
                            <input type="email" name="email" placeholder="your@email.com">
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
                            <input type="password" name="firstPassword" id="firstPasswordStudent" placeholder="🔒🔒🔒">
                        </div>
                    </li>
                    <li>
                        <label for="confirmPasswordStudent">Confirm Password</label>
                        <div class="student-input-wrapper">
                            <i class="ri-lock-line"></i>
                            <input type="password" name="confirmPassword" id="confirmPasswordStudent" placeholder="🔒🔒🔒">
                        </div>
                    </li>
                </ul>
                <button>Register</button>
            </form>

            <!-- registration form for business-->
            <form style="display: none;" class="form-for-business" action="${pageContext.request.contextPath}/registerBusiness"  method="post" id="form-for-business">
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
                        <label for="confirmPasswordBusiness">Confirm Password</label>
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
<script>
    // first collect the chenging html element to js object

    // for button
    const studentFormSelectorBtn = document.getElementById("form-outer-selector-student");
    const businessFormSelectorBtn = document.getElementById("form-outer-selector-business");

    // for form
    const studentFormContent = document.getElementById("form-for-student");
    const businessFormContent = document.getElementById("form-for-business");

    //checking if the Btn is clicked or not
    businessFormSelectorBtn.addEventListener('click', () => {
        console.log("business btn");

        //first remove the effect on the studnet btn
        studentFormSelectorBtn.style.backgroundColor = "oklch(0.145 0 0)";
        studentFormSelectorBtn.style.color = "#FFF";

        //giving the effect to the own btn
        businessFormSelectorBtn.style.backgroundColor = "#00C853";
        businessFormSelectorBtn.style.color = "oklch(0.145 0 0)";

        //hiding the student content
        studentFormContent.style.display = "none";

        //showing own content
        businessFormContent.style.display = "flex";
    });

    //checking if the studnet button click or not
    studentFormSelectorBtn.addEventListener('click', () => {
        console.log("student btn");

        //first remove the effect on the studnet btn
        businessFormSelectorBtn.style.backgroundColor = "oklch(0.145 0 0)";
        businessFormSelectorBtn.style.color = "#FFF";

        //giving the effect to the own btn
        studentFormSelectorBtn.style.backgroundColor = "#00C853";
        studentFormSelectorBtn.style.color = "oklch(0.145 0 0)";

        //hiding the student content
        businessFormContent.style.display = "none";

        //showing own content
        studentFormContent.style.display = "flex";
    });
</script>
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
        --black: #0A0A0A;
        --gray-bgc: oklch(0.928 0.006 264.531);
    }
    main{
        height: auto;
        background-color: var(--background);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 24px;
        padding: 32px;
    }
    nav{
        top: 0;
        height: 11vh;
        width: 100%;
        background-color: var(--background);
        display: flex;
        align-items: center;
        justify-content: center;
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
    /* cover nav */
    .nav-cover{
        height: 11vh;
    }
    .skillquest-logo{
        height: 9%;
        width: 28%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        font-size: 20px;
    }
    .logo-circlee{
        font-size: 20px;
        background-color: var(--green-bgc);
        padding: 7px 8px;
        border-radius: 12px;
        margin-bottom: 12px;
    }
    .skillquest-logo h2{
        font-size: 32px;
        color: var(--green-bgc);
        font-weight: 500;
        margin-bottom: 4px;
    }
    .skillquest-logo p{
        font-size: 16px;
        color: var(--gray);
    }

    .form-outer-main{
        height: 742px;
        width: 672px;
        background-color: var(--lightter-background);
        border-radius: 12px;
        padding: 32px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 20px;
    }
    .form-outer-selector-main{
        height: fit-content;
        display: flex;
        flex-direction: column;
        gap: 6px;
        width: 100%;
    }
    .form-outer-selector{
        height: 112px;
        width: 100%;
        display: flex;
        justify-content: space-between;
    }
    .form-outer-selector-main label{
        font-size: 14px;
        font-weight: 600;
        color: var(--white);
    }
    .form-outer-selector-student,
    .form-outer-selector-business{
        height: 100%;
        width: 48.6%;
        background-color: var(--background);
        border-radius: 8px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        cursor: default;
        color: var(--white);
        box-sizing: border-box;
        transition: all ease-in-out 0.3s;
        line-height: 1.6;
    }
    #form-outer-selector-student{
        background-color: var(--green-bgc);
        color: var(--background);
    }
    .form-outer-selector-student i,
    .form-outer-selector-business i{
        font-size: 22px;
        font-weight: 600;
        margin-bottom: 4px;
    }
    .form-outer-selector-type-span,
    .form-outer-selector-type-span{
        font-size: 16px;
        font-weight: 500;
    }
    .form-outer-selector-type-p,
    .form-outer-selector-type-p{
        font-size: 12px;
        font-weight: 400;
    }
    .form-outer-selector-student:hover,
    .form-outer-selector-business:hover{
        border: 1px solid var(--green-bgc);
    }
    /* for forms */
    .form-for-student,
    .form-for-business{
        width: 100%;
        min-height: 10vh;
        display: flex;
        flex-direction: column;
        gap: 32px;
        margin-top: 12px;
    }
    .form-for-student-field-outer,
    .form-for-business-field-outer{
        width: 100%;
        display: grid;
        grid-template-columns: 49% 49%;
        gap: 14px;
    }
    .form-for-student-field-outer li,
    .form-for-business-field-outer li{
        height: 70px;
        list-style: none;
        display: flex;
        flex-direction: column;
    }
    .form-for-student-field-outer label,
    .form-for-business-field-outer label{
        font-size: 14px;
        font-weight: 400;
        color: var(--white);
        margin-bottom: 8px;
    }
    .student-input-wrapper,
    .business-input-wrapper{
        background-color: var(--background);
        border-radius: 8px;
        overflow: hidden;
    }
    .student-input-wrapper i,
    .business-input-wrapper i{
        font-size: 18px;
        font-weight: 500;
        color: var(--gray);
        padding-left: 8px;
    }
    .student-input-wrapper input,
    .business-input-wrapper input,
    select{
        width: 70%;
        padding: 0 12px 4px 0;
        font-size: 14px;
        height: 40px;
        outline: none;
        border: none;
        background-color: var(--background);
        color: var(--white);
        box-sizing: border-box;
    }
    select{
        width: 96%;
    }
    .form-for-student button,
    .form-for-business button{
        font-size: 16px;
        font-weight: 600;
        width: 100%;
        background-color: var(--green-bgc);
        transition: all ease-in-out 0.3s;
        border: none;
        border-radius: 12px;
        padding: 12px 0;
    }
    .form-for-student button:hover,
    .form-for-business button:hover{
        background-color: var(--dark-green);
    }
    .form-outer-main-or-line{
        height: 20px;
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        margin-top: 12px;
    }
    .form-outer-main-or-line span{
        font-size: 14px;
        color: var(--gray);
        position: relative;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .form-outer-main-or-line span::after{
        content: "";
        height: 1px;
        width: 293px;
        background-color: var(--green-bgc);
        position: absolute;
        border-radius: 24px;
        right: -297px;
        top: 10px;
    }
    .form-outer-main-or-line span::before{
        content: "";
        height: 1px;
        width: 293px;
        background-color: var(--green-bgc);
        position: absolute;
        border-radius: 24px;
        left: -297px;
        top: 10px;
    }
    .form-outer-main-p{
        font-size: 16px;
        font-weight: 400;
        color: var(--gray);
        margin-top: 12px;
    }
    .form-outer-main-p a{
        font-size: 18px;
        text-decoration: none;
        color: var(--green-bgc);
        font-weight: 600;
    }
    .form-outer-main-p a:hover{
        text-decoration: underline;
    }
    .note-for-user{
        width: 672px;
        background-color: rgba(4, 55, 4, 0.403);
        border-radius: 12px;
        padding: 16px;
        box-sizing: border-box;
        font-size: 16px;
        font-weight: 400;
        line-height: 1.6;
        color: var(--green-bgc);
    }
</style>
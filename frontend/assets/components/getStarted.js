//collecting the elements as object

//for loading numbers
const firstNum = document.getElementById("join-us-loding-steps-first-num");
const secondNum = document.getElementById("join-us-loding-steps-second-num");
const secondTittle = document.getElementById("join-us-loding-steps-second-num-details");

//for  loding steps
const firstStep = document.getElementById("join-us-loding-steps-bar-first");

//for loading bar
const loadingBar = document.getElementById("loding-bar-progress");

//for main details main div
const mainDetails = document.getElementById("form-for-choose-details");

//for roles
const roleTittle = document.getElementById("form-for-choose-role-tittle");
const roleSelect = document.getElementById("form-for-choose-role-selector");
const roleContnueBtn = document.getElementById("done-continue");

//details title
const detailsTittle = document.getElementById("form-for-details-tittle");
//for strudent details
const studentFirstRow = document.getElementById("form-for-choose-details-first-row");
const studentFirstLeftRow = document.getElementById("form-for-choose-details-first-row-left");
const studentFirstRightRow = document.getElementById("form-for-choose-details-first-row-right");
const studentSecondRow = document.getElementById("form-for-choose-details-second-row");
const studentThirdRow = document.getElementById("form-for-choose-details-third-row");
const studentFourthRow = document.getElementById("form-for-choose-details-fourth-row");
const studentFourthLeftRow = document.getElementById("form-for-choose-details-fourth-row-left");
const studentFourthRightRow = document.getElementById("form-for-choose-details-fourth-row-right");

//for business details
const businessFirstRow = document.getElementById("form-for-choose-details-business-first-row");
const businessFirstLeftRow = document.getElementById("form-for-choose-details-business-first-row-left");
const businessFirstRightRow = document.getElementById("form-for-choose-details-business-first-row-right");
const businessSecondRow = document.getElementById("form-for-choose-details-business-second-row");
const businessThirdRow = document.getElementById("form-for-choose-details-business-third-row");
const businessFourthRow = document.getElementById("form-for-choose-details-business-fourth-row");
const businessFourthLeftRow = document.getElementById("form-for-choose-details-business-fourth-row-left");
const businessFourthRightRow = document.getElementById("form-for-choose-details-business-fourth-row-right");

//details buttons
const detailsBtn = document.getElementById("details-duttons");
const detailsBack = document.getElementById("details-back");

//declearing the function to show components
// function show
roleContnueBtn.addEventListener('click', () => {
    console.log("continue btn");
    //collect the role
    const role = document.getElementById("role-sel").value;

    console.log(role);
    //first change in the steps
    firstNum.innerHTML = "<i class='ri-check-line'></i>";
    firstStep.style.backgroundColor = "#00C853";
    secondNum.style.backgroundColor = "#00C853";
    secondNum.style.color = "black";
    secondTittle.style.display = "block";
    secondTittle.style.color = "black";

    //for loading bar changes 33%
    loadingBar.style.width = "68%";

    //first hide the done domponents
    roleTittle.style.display = "none";
    roleSelect.style.display = "none";
    roleContnueBtn.style.display = "none";

    mainDetails.style.display = "flex";
        
    detailsBtn.style.display = "flex";
    
    detailsTittle.style.display = "block";
    //check wgich form to show
    if(role.includes("student")){
        console.log("true");

        // Show student details
        studentFirstRow.style.display = "flex";
        studentFirstLeftRow.style.display = "flex";
        studentFirstRightRow.style.flexDirection = "column";
        studentFirstRightRow.style.gap = "6px";
        studentFirstRightRow.style.display = "flex";
        studentSecondRow.style.display = "flex";
        studentThirdRow.style.display = "flex";
        studentFourthRow.style.display = "flex";
        studentFourthLeftRow.style.display = "flex";
        studentFourthRightRow.style.display = "flex";

        // Hide business details
        businessFirstRow.style.display = "none";
        businessFirstLeftRow.style.display = "none";
        businessFirstRightRow.style.display = "none";
        businessSecondRow.style.display = "none";
        businessThirdRow.style.display = "none";
        businessFourthRow.style.display = "none";
        businessFourthLeftRow.style.display = "none";
        businessFourthRightRow.style.display = "none";
        
        //desable the business forms
        document.getElementById("busPerson").disabled = true;
        document.getElementById("busEmail").disabled = true;
        document.getElementById("busName").disabled = true;
        document.getElementById("busLocation").disabled = true;
        document.getElementById("bussPassword").disabled = true;
        document.getElementById("busConfirmPass").disabled = true;

        //enable the students form
        document.getElementById("fullName").disabled = false;
        document.getElementById("userEmail").disabled = false;
        document.getElementById("userSkills").disabled = false;
        document.getElementById("userLocation").disabled = false;
        document.getElementById("userPassword").disabled = false;
        document.getElementById("userConfirmPass").disabled = false;

    }else{
        console.log("false");
        // Show business details
        businessFirstRow.style.display = "flex";
        businessFirstLeftRow.style.display = "flex";
        businessFirstRightRow.style.display = "flex";
        businessSecondRow.style.display = "flex";
        businessThirdRow.style.display = "flex";
        businessFourthRow.style.display = "flex";
        businessFourthLeftRow.style.display = "flex";
        businessFourthRightRow.style.display = "flex";

        // Hide student details
        studentFirstRow.style.display = "none";
        studentFirstLeftRow.style.display = "none";
        studentFirstRightRow.style.display = "none";
        studentSecondRow.style.display = "none";
        studentThirdRow.style.display = "none";
        studentFourthRow.style.display = "none";
        studentFourthLeftRow.style.display = "none";
        studentFourthRightRow.style.display = "none";

        //disable the students form
        document.getElementById("fullName").disabled = true;
        document.getElementById("userEmail").disabled = true;
        document.getElementById("userSkills").disabled = true;
        document.getElementById("userLocation").disabled = true;
        document.getElementById("userPassword").disabled = true;
        document.getElementById("userConfirmPass").disabled = true;

        //enable the business forms
        document.getElementById("busPerson").disabled = false;
        document.getElementById("busEmail").disabled = false;
        document.getElementById("busName").disabled = false;
        document.getElementById("busLocation").disabled = false;
        document.getElementById("bussPassword").disabled = false;
        document.getElementById("busConfirmPass").disabled = false;
    }   
});

// //for back button
detailsBack.addEventListener("click", () => {
    console.log("back btn");
    //for the steps
    firstNum.textContent = "1";
    firstStep.style.backgroundColor = "oklch(0.928 0.006 264.531)";
    secondNum.style.backgroundColor = "oklch(0.928 0.006 264.531)";
    secondNum.style.color = "oklch(0.707 0.022 261.325)";
    secondTittle.style.color = "oklch(0.707 0.022 261.325)";

    //backing the loading bar
    loadingBar.style.width = "33%";

    //hide the button of the details
    detailsBtn.style.display = "none";
    detailsTittle.style.display = "none";

    // Hide student details
    studentFirstRow.style.display = "none";
    studentFirstLeftRow.style.display = "none";
    studentFirstRightRow.style.display = "none";
    studentSecondRow.style.display = "none";
    studentThirdRow.style.display = "none";
    studentFourthRow.style.display = "none";
    studentFourthLeftRow.style.display = "none";
    studentFourthRightRow.style.display = "none";

    // Hide business details
    businessFirstRow.style.display = "none";
    businessFirstLeftRow.style.display = "none";
    businessFirstRightRow.style.display = "none";
    businessSecondRow.style.display = "none";
    businessThirdRow.style.display = "none";
    businessFourthRow.style.display = "none";
    businessFourthLeftRow.style.display = "none";
    businessFourthRightRow.style.display = "none";

    //show the roles info
    roleTittle.style.display = "block";
    roleSelect.style.display = "flex";
    roleContnueBtn.style.display = "flex";
    roleContnueBtn.style.marginTop = "-24px";
});
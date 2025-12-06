//collecting the elements as object

//for loading numbers
const firstNum = document.getElementById("join-us-loding-steps-first-num");
const secondNum = document.getElementById("join-us-loding-steps-second-num");
const secondTittle = document.getElementById("join-us-loding-steps-second-num-details");

//for  loding steps
const firstStep = document.getElementById("join-us-loding-steps-bar-first");

//for loading bar
const loadingBar = document.getElementById("loding-bar-progress");

//for forms
//for roles
const roleTittle = document.getElementById("form-for-choose-role-tittle");
const roleSelect = document.getElementById("form-for-choose-role-selector");
const roleContnueBtn = document.getElementById("done-continue");

//for details
const detailsTittle = document.getElementById("form-for-details-tittle");
const detailsInput = document.getElementById("form-for-choose-details");
const detailsBtn = document.getElementById("details-duttons");
const detailsBack = document.getElementById("details-back");

//declearing the function to show components
// function show
roleContnueBtn.addEventListener('click', () => {
    console.log("continue btn");
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

    //showing the details components
    detailsTittle.style.display = "block";
    detailsInput.style.display = "flex";
    detailsBtn.style.display = "flex";
});

//for back button
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

    //hidding the details components
    detailsTittle.style.display = "none";
    detailsInput.style.display = "none";
    detailsBtn.style.display = "none";

    //first hide the done domponents
    roleTittle.style.display = "block";
    roleSelect.style.display = "flex";
    roleContnueBtn.style.display = "flex";
});
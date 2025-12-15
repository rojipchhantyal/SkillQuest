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
//for nav drop down functions
let explore_dropdown_btn = document.getElementById("explore_dropdown_btn");

let explore_dropdown_content = document.getElementById("explore_dropdown_content");

explore_dropdown_btn.addEventListener("click", () => {

    let upDown = document.getElementById("explore_dropdown_btn_span");
    if (explore_dropdown_content.style.display == "flex") {
        explore_dropdown_content.style.display = "none";
        upDown.innerHTML = "<i class='ri-arrow-down-wide-line'></i>";
    } else {
        explore_dropdown_content.style.display = "flex";
        upDown.innerHTML = "<i class='ri-arrow-up-wide-line'></i>";
    }
});
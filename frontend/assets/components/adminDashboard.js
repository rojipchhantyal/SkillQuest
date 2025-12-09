// check if the search input is focus of not
const input = document.getElementById("admin-dashboard-last-page-registration-upper-search-searcher");
const search = document.getElementById("admin-dashboard-last-page-registration-upper-search");

input.addEventListener("focus", () => {
  search.style.borderColor = "#00C853";   // apply on focus
});

input.addEventListener("blur", () => {
  search.style.borderColor = "";          // reset when focus is lost
});

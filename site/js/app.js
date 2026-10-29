document.addEventListener("DOMContentLoaded", function () {
  // Highlight the current page in the navigation
  var current = window.location.pathname.split("/").pop() || "index.html";
  var links = document.querySelectorAll(".site-nav a");
  links.forEach(function (link) {
    var href = link.getAttribute("href");
    if (href === current) {
      link.classList.add("active");
    } else {
      link.classList.remove("active");
    }
  });
});
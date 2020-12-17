let hamButton = document.querySelector(".hamburger")
let contentMobileShow = document.querySelector(".content-mobile");

hamButton.addEventListener("click", () => {
  if (contentMobileShow.style.display === "none" || contentMobileShow.style.display === "") {
    contentMobileShow.style.display = "block";
  } else {
    contentMobileShow.style.display = "none";
  }
});
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// document.addEventListener("DOMContentLoaded", function () {
//   // Your code goes here

//   const element = document.getElementById("task_button");
//   element.addEventListener("click", toggleClick);

//   function toggleClick() {
//     // get the category
//     var myTask = document.getElementById("task");

//     // get the current value of the category's display property
//     var displaySetting = myTask.style.display;

//     // also get the category button, so we can change what it says
//     var taskButton = document.getElementById("task_button");

//     // now toggle the category and the button text, depending on current state
//     if (displaySetting == "block") {
//       // category is visible. hide it
//       myTask.style.display = "none";
//       // change button text
//       taskButton.innerHTML = "Add task";
//     } else {
//       // category is hidden. show it
//       myTask.style.display = "block";
//       // change button text
//       taskButton.innerHTML = "Cancel";
//     }
//   }
// });

document.addEventListener('DOMContentLoaded', () => {
let filterInput = document.querySelector("#filterInput");
filterInput.addEventListener('keyup', filterNames);

function filterNames(){
  let filterValue = document.querySelector("#filterInput").value.toUpperCase();
  let li = document.querySelectorAll("li.patient");

  for(let i = 0; i < li.length; i++){
    let a = li[i].querySelectorAll('a')[0];
    if(a.innerHTML.toUpperCase().indexOf(filterValue) > -1){
      li[i].style.display = '';
    } else {
      li[i].style.display = 'none';
    }
  }
} 
});

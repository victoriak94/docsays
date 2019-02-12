document.addEventListener('DOMContentLoaded', () => {
//  axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

// const myForm = document.querySelector('.patient-search');

// myForm.addEventListener('submit', function(e){
//     e.preventDefault();
//     console.log("I m in the event submit");
//     const formData = new FormData(myForm);
//     axios({
//         method: myForm.getAttribute('method'),
//         url: myForm.getAttribute('action'),
//         data: formData,
//         headers:{
//             'Content-Type': 'application/html',
//             'Accept': 'text/html'
//         }
//        // responseType: 'JSON'
//     }).then(function(response){

//         console.log("Success"+response.data);
//         document.querySelector('#patient_name').value = '';
//        const myDiv = document.querySelector('#searchResult');
//        //
//        //  // const newItem = document.createElement('li');
//        //  // newItem.innerText = response.data.content;
//        myDiv.innerHTML = '';
//        myDiv.insertAdjacentHTML('afterbegin',response.data);
//       //myDiv.appendChild(response.data);


//     });

// })

let filterInput = document.querySelector("#filterInput");
filterInput.addEventListener("keyup", filterNames);

function filterNames(){
  let filterValue = document.querySelector("#filterInput").value.toUpperCase();
  let li = document.querySelectorAll("li.patient");

  for(let i = 0; i < li.length; i++){
    let a = li[i].getElementsByTagName('a')[0];
    if(a.innerHTML.toUpperCase().indexOf(filterValue) > -1){
      li[i].style.display = '';
    } else {
      li[i].style.display = 'none';
    }
  }

});

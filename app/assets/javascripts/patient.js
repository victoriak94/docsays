document.addEventListener('DOMContentLoaded',function(){
 axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

const myForm = document.querySelector('.patient-search');

myForm.addEventListener('submit', function(e){
    e.preventDefault();
    console.log("I m in the event submit");
    const formData = new FormData(myForm);
    axios({
        method: myForm.getAttribute('method'),
        url: myForm.getAttribute('action'),
        data: formData,
        headers:{
            'Content-Type': 'application/html',
            'Accept': 'text/html'
        }
       // responseType: 'JSON'
    }).then(function(response){

        console.log("Success"+response.data);
        document.querySelector('#patient_name').value = '';
       const myDiv = document.querySelector('#searchResult');
       //
       //  // const newItem = document.createElement('li');
       //  // newItem.innerText = response.data.content;
       myDiv.innerHTML = '';
       myDiv.insertAdjacentHTML('afterbegin',response.data);
      //myDiv.appendChild(response.data);
    });

})
});

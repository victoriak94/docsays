document.addEventListener("DOMContentLoaded", function() {

  console.log("in here")

    const getRecipesForm = document.querySelector("#new_patient")
    const recipeDivs = document.querySelectorAll(".recipe-box")
    const recipeBook = document.querySelector("#recipeBook")

    getRecipesForm.addEventListener('submit',

    function test(e) {
      e.preventDefault()
        const request = axios({
            url: '/search',
            method: 'POST',
            responseType: 'JSON',
            mode: 'no-cors',
            headers: {
	             'Access-Control-Allow-Origin'  : '*',
               'Content-Type': 'application/json',
    'credentials':true
	},
            console.log(myForm.elements[3]);
       myForm.elements[3].disabled = false;
        }).then(function(response) {
              console.log(response.data)
            recipeDivs.forEach(function(box, index) {
                box.innerHTML = '';
                const recipeImg = document.createElement("IMG");
                recipeImg.src = response.data.recipes[index]['photo'];
                recipeImg.alt = `photo of ${response.data.recipes[index]['name']}`;
                box.appendChild(recipeImg);
                let recipeEntry = document.createElement("LI");
                recipeEntry.innerHTML = (`${response.data.recipes[index]['name']}`)
                recipeBook.appendChild(recipeEntry);
                console.log(box)
            })
            console.log(response.recipes)
            console.log(response)
            console.log(recipeDivs)
        })
    });
});

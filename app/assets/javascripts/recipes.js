document.addEventListener("DOMContentLoaded", function() {

  console.log("in here")

    const getRecipesForm = document.querySelector("#new_patient")
    const recipeDivs = document.querySelectorAll(".recipe-box")
    const recipeBook = document.querySelector("#recipeBook")

    getRecipesForm.addEventListener('submit',
    // const myInput = document.querySelector("input clas/id")


    function test(e) {
      e.preventDefault()
        const request = axios({
            url: 'https://api.edamam.com/api/nutrition-data?app_id=1a5ac459&app_key=263e9d8bf34384b63230ee6f193da30b&ingr=1%20large%20apple',

            method: 'GET',
            responseType: 'JSON',
            mode: 'no-cors',
            headers: {
	             'Access-Control-Allow-Origin'  : '*',
               'Content-Type': 'application/json',
    'credentials':true
	},
            // params: {number: myInput.value}

            // this is pretty much bullshit at this point - we need to figure out the
            // API and then render it accordingly
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
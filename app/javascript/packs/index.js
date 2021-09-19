document.addEventListener('DOMContentLoaded',(e)=>{
    let but1=document.getElementById("but1");
    let but2=document.getElementById("but2");
    let but3=document.getElementById("but3");
    let but4=document.getElementById("but4");
    let div=document.querySelector(".listingbox")
    let az=true
    
    but2.addEventListener('click',()=>{
        if(az===true){
            az=false
            let count=document.querySelectorAll(".listing").length;
            let listings=document.querySelectorAll(".listing");
            let newlistings=Array.from(listings).reverse()
            for (let index = 0; index < count; index++) {
                div.removeChild(listings[index]);
            };
            newlistings.forEach((e)=>{
                div.appendChild(e);
            });
        }
    });
    
    but1.addEventListener('click',()=>{
        if(az===false){
            az=true
            let count=document.querySelectorAll(".listing").length;
            let listings=document.querySelectorAll(".listing");
            let newlistings=Array.from(listings).reverse()
            for (let index = 0; index < count; index++) {
                div.removeChild(listings[index]);
            };
            newlistings.forEach((e)=>{
                div.appendChild(e);
            });
        }
    });

});

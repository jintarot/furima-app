function detail(){
  console.log("load")
   const category = document.getElementsByClassName("category-list");
    category.addEventListener("mouseover",()=>{
    console.log("click");
    const data = document.getElementsByClassName("clist");
    data.style.display = ""

  })
}
window.addEventListener("load",detail);
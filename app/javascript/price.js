function count(){
const ItemPrice = document.getElementById("item-price")
ItemPrice.addEventListener("input",()=>{
const sum = document.getElementById("add-tax-price")
console.log("hello")
sum.innerHTML = `${ItemPrice.value *0.1}`
const profit = document.getElementById("profit")
profit.innerHTML =`${ItemPrice.value - sum.innerHTML}`
})
}
window.addEventListener("load",count);
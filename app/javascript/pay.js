function pay(){
  console.log("hello")
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form1");
form.addEventListener("submit",(e)=>{
  console.log("submit")
  
  const formResult = document.getElementById("charge-form1");
  const formData = new FormData(formResult);
  
  const card = {
    number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("month"),
      exp_year: `20${formData.get("year")}`,
  }

  Payjp.createToken(card, (status, response) => {
    if (status == 200) {
      const token = response.id;
      const renderDom = document.getElementById("charge-form1");
      const tokenObj = `<input value=${token} name='token' type="hidden"> `;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
    }
    document.getElementById("card-number").removeAttribute("name");
    document.getElementById("card-cvc").removeAttribute("name");
    document.getElementById("card-exp-month").removeAttribute("name");
    document.getElementById("card-exp-year").removeAttribute("name");

    document.getElementById("charge-form1").submit();
  })
})
};
window.addEventListener("load",pay)
function comment(){
const comment = document.getElementById("comment-submit")
const form = document.getElementById("comment-form")
comment.addEventListener("click",()=>{
  console.log("test");
  const formData = new FormData(form);
  const XHR = new XMLHttpRequest();
  XHR.open("POST","/comments",true);
  XHR.responseType = "json";
  XHR.send(formData);
  XHR.onload = ()=>{
    if(XHR.statue != 200){
      alert(`${XHR.status},${XHR.statusText}`)
      return null;
    };
    e.preventDefault();
    const comment = XHR.response.comment;
    const place = document.getElementById("comments");
    const fontData = document.getElementById("text-field");
    const HTML = `<div class="comment-content">${comment.content}</div>`;
    place.insertAdjacentHTML("afterbegin",HTML);
    fontData.value = ""
  }
})

}
window.addEventListener("load",comment)
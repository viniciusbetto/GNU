
var handleAcentos  = (event, caixa) =>{
  let texto = event.target
  texto.value = texto.value.normalize('NFD').replace(/[\u0300-\u036f]/g, "")
  if (caixa == 1){
    texto.value = texto.value.toLowerCase()
  }else{
    if (caixa == 2){
      texto.value = texto.value.toUpperCase()
    }
  }
}

var handlePhone = (event) => {
    let input = event.target
    input.value = phoneMask(input.value)
}
  
var phoneMask = (texto) => {
    if (!texto) return ""
    texto = texto.replace(/\D/g,'')
    texto = texto.replace(/(\d{2})(\d)/,"($1) $2")
    texto = texto.replace(/(\d)(\d{4})$/,"$1-$2")
    texto = decodeURI(texto)
    return texto
}

//MUDAMOS O ACTION DO FORM E SUBMETMOS
function changeAction(texto){
  document.forms[0].action=texto;
  document.forms[0].submit();
}
    
function openModal(){
  const fade = document.querySelector("#fade");
  const modal = document.querySelector("#modal");
  fade.classList.toggle("hide");
  modal.classList.toggle("hide");
}

function closeModal(){
  const fade = document.querySelector("#fade");
  const modal = document.querySelector("#modal");
  fade.classList.toggle("hide");
  modal.classList.toggle("hide");
}

 
// function mudaTexto(texto, idhtml){
  //----------------------------------------------------
  // NÃO DEDOCIFICA OS CARACTERES ; / ? : @ & = + $ , #
  //----------------------------------------------------
//   let decode = document.getElementById(idhtml)
//   texto = texto.trim()
//   let mudado = decodeURI(texto)
//   mudado = mudado.trim()
//   decode.innerHTML = mudado
//   console.log(mudado)
// }



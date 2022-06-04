function commission (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const a = inputValue/10;
    const b = inputValue-a;


    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = Math.floor(a)

    const profitDom = document.getElementById('profit');
    profitDom.innerHTML = Math.floor(b)

  }) };
 
 window.addEventListener('load', commission);




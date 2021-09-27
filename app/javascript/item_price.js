window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    inputValue;
    
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    addTaxDom;

    const profitNumber = document.getElementById("profit")
    const value_result = inputValue * 0.1
    value_result
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
      profitNumber;
  })
});
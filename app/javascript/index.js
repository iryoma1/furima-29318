function check() {
  let add_tax_price  =  document.getElementById("add-tax-price")
  let item_price = document.getElementById("item-price")
  let profit = document.getElementById("profit")
  item_price.addEventListener('input', function(){
    var input = document.getElementById("item-price").value;
    add_tax = input * 0.1
    profit_price = input * 0.9
    add_tax_price.innerHTML = add_tax
    console.log(add_tax_price.innerHTML)
    profit.innerHTML = profit_price
    console.log(profit.innerHTML)
  })
}
window.addEventListener("load", check);

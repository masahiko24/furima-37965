// const pay = () => {
//   Payjp.setPublicKey(
//   "pk_test_968ae258a720fca198e796e7")
//   const submit = document.getElementById("button");
//   submit.addEventListener("click", (e) => {
//     e.preventDefault();
//     const formResult = document.getElementById("charge-form");
//     const formData = new FormData(formResult);

//     const card = {
//       number: formData.get("order[number]"),
//       cvc: formData.get("order[cvc]"),
//       exp_month: formData.get("order[exp_month]"),
//       exp_year: `20${formData.get("order[exp_year]")}`,
//     };
//     Payjp.createToken(card, (status, response) => {
//       if (status == 200) {
//         const token = response.id;
//         const renderDom = document.getElementById("charge-form");
//         const tokenObj = `<input value=${token} name='token'>`;
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);
//         debugger;
//         console.log(token)
//       }
//     });
//   });
// };

// window.addEventListener("load", pay);
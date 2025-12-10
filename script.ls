/* Telegram WebApp SDK bilan ishlash */
window.addEventListener("DOMContentLoaded", () => {
  const tg = window.Telegram.WebApp;
  tg.expand(); // ekranni to‘liq ochish

  const form = document.getElementById("orderForm");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const payload = {
      name:    document.getElementById("name").value.trim(),
      phone:   document.getElementById("phone").value.trim(),
      comment: document.getElementById("comment").value.trim()
    };

    // ma’lumotni botga yuboramiz
    tg.sendData(JSON.stringify(payload));

    // foydalanuvchiga «yuborildi» efekti
    form.reset();
    tg.showPopup({
      title: "✅ Qabul qilindi",
      message: "Ma’lumotingiz adminga yetkazildi, tez orada aloqaga chiqamiz.",
      buttons: [{type: "close"}]
    });
  });
});

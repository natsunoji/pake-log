import "@hotwired/turbo-rails"
import "controllers"

const showLoader = (text) => {
  const overlay = document.getElementById("loading-overlay");
  if (overlay) {
    const textElement = overlay.querySelector("p");
    if (textElement) {
      // 🌟 アイコンなし、文字のみをシンプルに表示
      textElement.innerHTML = `<span class="text-sm font-bold tracking-widest animate-pulse">${text}</span>`;
    }
    overlay.style.setProperty('display', 'flex', 'important');
    overlay.classList.remove("hidden");
  }
};

const hideLoader = () => {
  const overlay = document.getElementById("loading-overlay");
  if (overlay) {
    overlay.style.setProperty('display', 'none', 'important');
    overlay.classList.add("hidden");
  }
};

// 🌟 保存時
document.addEventListener("turbo:submit-start", () => {
  showLoader("LOADING...");
});

// 🌟 終了時
document.addEventListener("turbo:submit-end", hideLoader);
document.addEventListener("turbo:load", hideLoader);
document.addEventListener("turbo:render", hideLoader);

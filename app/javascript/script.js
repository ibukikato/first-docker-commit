// script.js
const slidesContainer = document.querySelector('.slides');
const slides = document.querySelectorAll('.slide');
const prevButton = document.querySelector('.prev-button');
const nextButton = document.querySelector('.next-button');

let currentIndex = 0;
let autoSlideTimer;

function goToSlide(index) {
  currentIndex = index;
  slidesContainer.style.transform = `translateX(-${currentIndex * 100}%)`;
}

function showNextSlide() {
  currentIndex = (currentIndex + 1) % slides.length;
  goToSlide(currentIndex);
}

function showPreviousSlide() {
  currentIndex = (currentIndex - 1 + slides.length) % slides.length;
  goToSlide(currentIndex);
}

nextButton.addEventListener('click', showNextSlide);
prevButton.addEventListener('click', showPreviousSlide);

function startAutoSlide() {
  autoSlideTimer = setInterval(showNextSlide, 5000); // 5秒ごとに次のスライドを表示
}

function stopAutoSlide() {
  clearInterval(autoSlideTimer);
}

slidesContainer.addEventListener('mouseover', stopAutoSlide);
slidesContainer.addEventListener('mouseout', startAutoSlide);

startAutoSlide();

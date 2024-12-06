let slideIndex = 0;
let slides = document.getElementsByClassName("mySlides");
let totalSlides = slides.length;

function showSlides() {
    slideIndex++;
    if (slideIndex >= totalSlides) {
        slideIndex = 0;
    }
    updateSlides();
}

function plusSlides(n) {
    slideIndex += n;
    if (slideIndex < 0) {
        slideIndex = totalSlides - 1;
    } else if (slideIndex >= totalSlides) {
        slideIndex = 0;
    }
    updateSlides();
}

function updateSlides() {
    let offset = -slideIndex * 100; // Tính toán vị trí
    document.querySelector(".slideshow-wrapper").style.transform = `translateX(${offset}%)`;
}

// Tự động chuyển ảnh
setInterval(showSlides, 4000); // Thay đổi ảnh sau 4 giây

window.onscroll = function () {
    let header = document.querySelector('.main-header');
    if (window.scrollY > 50) {
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
};
document.querySelector("#logoutPopup a").addEventListener("click", function (event) {
    event.preventDefault(); // Ngăn chặn hành động mặc định
    window.location.href = "trangchu.aspx"; // Điều hướng về trang chủ sau khi đăng xuất
});
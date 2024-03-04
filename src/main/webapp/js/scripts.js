const listImage = document.querySelector('.list-images');
const imgs = document.getElementsByTagName('img');
const btnleft = document.querySelector('.btns-left');
const btnright = document.querySelector('.btns-right');
const length = imgs.length;
let curent = 0;

const handleChangeSlide = () => {
    if (curent === length - 1) {
        curent = 0;
        let width = imgs[0].offsetWidth;
        listImage.style.transform = `translateX(0px)`;
        document.querySelector('.active').classList.remove('active');
        document.querySelector('.index-item-'+ curent).classList.add('active');
    } else {
        curent++;
        let width = imgs[0].offsetWidth;
        listImage.style.transform = `translateX(${width * -1 * curent }px)`;
        document.querySelector('.active').classList.remove('active');
        document.querySelector('.index-item-'+ curent).classList.add('active');
    }
};
let handleEnventChangeSlide = setInterval(handleChangeSlide, 4000);

btnright.addEventListener('click', () => {
    clearInterval(handleEnventChangeSlide);
    handleChangeSlide();
    handleEnventChangeSlide = setInterval(handleChangeSlide, 4000);
});

btnleft.addEventListener('click', () => {
    clearInterval(handleEnventChangeSlide);
    if (curent === 0) {
        curent = length - 1;
        let width = imgs[0].offsetWidth;
        listImage.style.transform = `translateX(${width * -1 * curent}px)`;
        document.querySelector('.active').classList.remove('active');
        document.querySelector('.index-item-'+ curent).classList.add('active');
    } else {
        curent--;
        let width = imgs[0].offsetWidth;
        listImage.style.transform = `translateX(${width * -1 * curent }px)`;
        document.querySelector('.active').classList.remove('active');
        document.querySelector('.index-item-'+ curent).classList.add('active');
    }
    handleEnventChangeSlide = setInterval(handleChangeSlide, 4000);
});

// hiện ra màng hình
function showNowShowing() {
    // Ẩn phần "Sắp chiếu" và hiển thị phần "Đang chiếu"
    document.querySelectorAll(".upcoming").forEach(function(el) {
        el.style.display = "none";
    });
    document.querySelectorAll(".now-showing").forEach(function(el) {
        el.style.display = "flex";
    });

    // Đánh dấu nút "Đang chiếu" là đã được chọn và thêm lớp "selected-button"
    document.getElementById("nowShowingButton").classList.add('selected-button');
    document.getElementById("upcomingButton").classList.remove('selected-button');
}

function showUpcoming() {
    // Ẩn phần "Đang chiếu" và hiển thị phần "Sắp chiếu"
    document.querySelectorAll(".now-showing").forEach(function(el) {
        el.style.display = "none";
    });
    document.querySelectorAll(".upcoming").forEach(function(el) {
        el.style.display = "flex";
    });

    // Đánh dấu nút "Sắp chiếu" là đã được chọn và nút "Đang chiếu" là không được chọn
    document.getElementById("upcomingButton").classList.add('selected-button');
    document.getElementById("nowShowingButton").classList.remove('selected-button');
}


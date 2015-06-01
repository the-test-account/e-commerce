$('.center').slick({
    centerMode: true,
    centerPadding: '60px',
   
    slidesToShow: 1,
    autoplay: true,
    responsive: [
      {
          breakpoint: 768,
          settings: {
              arrows: true,
              centerMode: true,
              centerPadding: '40px',
              slidesToShow: 1
          }
      },
      {
          breakpoint: 480,
          settings: {
              arrows: true,
              centerMode: true,
              centerPadding: '40px',
              slidesToShow: 1
          }
      }
    ]
});
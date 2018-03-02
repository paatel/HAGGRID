document.addEventListener('DOMContentLoaded', function(){
  $('#rating').raty({
    path: '/assets/ratings',
    scoreName: 'review[rating]'
  });
});

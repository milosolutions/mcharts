
  // HTMLElement.prototype.wrap = function(wrapper){
    
  //   this.parentNode.insertBefore(wrapper, this);
  //   wrapper.appendChild(this);
  // }


  // document.getElementsByClassName("current")[0].appendChild(
  //   document.getElementsByClassName("tablist")[1]
  //   );

  // document.getElementsByClassName('tablist')[1].classList.add('custom-submenu');

  // document.getElementsByClassName('tablist')[1].classList.remove('tablist');




  // var x = document.getElementsByClassName("contents");

  // if(x[0].children[0].className != 'toc') { 
  //   x[0].classList.add('custom-contents');
  // }

  // if(x[0].children[1].nodeName == 'UL') {
  //   x[0].classList.remove('custom-contents');

  //   var ul = x[0].children[1];

  //   var dv = document.createElement('div');
  //   dv.classList.add('toc');

  //   ul.wrap(dv);
  // }








$( document ).ready(function() {

  HTMLElement.prototype.wrap = function(wrapper) {
    this.parentNode.insertBefore(wrapper, this);
    wrapper.appendChild(this);
  }



  $('.current')[0].appendChild($('.tablist')[1]);

  $('.tablist')[1].classList.add('.custom-submenu');

  $('.tablist')[1].classList.remove('.tablist');
  


  var x = $('.contents');

  if(x[0].children[0].className != 'toc') { 
    x[0].classList.add('custom-contents');
  }

  if(x[0].children[1].nodeName == 'UL') {
    x[0].classList.remove('custom-contents');

    var ul = x[0].children[1];

    var dv = document.createElement('div');
    dv.classList.add('toc');

    ul.wrap(dv);
  }



  if(!$('.toc').length){
      $('.textblock').css('width', '100%');
      $('.directory').css('width', '100%');
  }
  
  $('.tablist li').css({width: "auto", display: "inline-block", clear: "none"});
  $('.tablist').css({backgroundColor: "#444", width: "100%"});
  $('.directory').css('margin', '0');
        
});
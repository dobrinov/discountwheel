// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require raphael-min
//= require_tree .

$(document).ready(function(){
  var wheel = new Wheel();

  $('image').on('click', function(){
    wheel.spin();
  });
});

function Wheel() {
  this.speed = 0;
  this.angle = 0;
  this.loops = 0;
  this.power = 0;

  this.paper = Raphael(0, 0, 500, 500);
  this.image = this.paper.image("assets/wheel.png", 0, 0, 500, 500);
}

Wheel.prototype.spin = function(){
  var self = this;

  var last_loop_when_speed_decreased = 0;
  self.power = Math.floor((Math.random()*360)+1);;
  self.speed = 10;

  var t = setInterval(function(){

    self.rotate(self.speed);

    if(last_loop_when_speed_decreased != self.loops && self.loops % 1 == 0 && self.speed > 1){
      last_loop_when_speed_decreased = self.loops;
      self.speed--;
    }

    if(self.speed == 1){
      if(self.power > 0){
        self.power = self.power - self.speed;
      } else {
        clearInterval(t);
      }
    }

  }, 30);
}

Wheel.prototype.rotate = function(degree){
  var newDegree = this.angle + degree;

  console.log(this.angle + ' - ' + this.loops + ' - ' + this.speed);

  this.angle = newDegree % 360;
  this.loops += Math.floor(newDegree / 360);

  this.image.rotate(degree);
}
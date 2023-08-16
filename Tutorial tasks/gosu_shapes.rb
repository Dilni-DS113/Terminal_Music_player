require 'rubygems'
require 'gosu'
require './libs/circle'

# The screen has layers: Background, middle, top
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

class DemoWindow < Gosu::Window
  def initialize
    super(640, 400, false)
  end

  def draw
    # see www.rubydoc.info/github/gosu/gosu/Gosu/Color for colours
    draw_quad(0, 0, 0xff_ffffff, 640, 0, 0xff_ffffff, 0, 400, 0xff_ffffff, 640, 400, 0xff_ffffff, ZOrder::BACKGROUND)
    
    
    # draw_rect works a bit differently:
    Gosu.draw_rect(300, 200, 110, 150, 0xff_663300, ZOrder::TOP, mode=:default)
    # Circle parameter - Radius
    img2 = Gosu::Image.new(Circle.new(75))
    # Image draw parameters - x, y, z, horizontal scale (use for ovals), vertical scale (use for ovals), colour
    # Colour - use Gosu::Image::{Colour name} or .rgb({red},{green},{blue}) or .rgba({alpha}{red},{green},{blue},)
    # Note - alpha is used for transparency.
    # drawn as an elipse (0.5 width:)
    img2.draw(260, 140, ZOrder::TOP, 0.5, 1.0,0xff_6FFF00 )
    # drawn as a red circle:
    img2.draw(286, 60, ZOrder::TOP, 1.0, 1.0, 0xff_6FFF00)
  
   

  end
end

DemoWindow.new.show

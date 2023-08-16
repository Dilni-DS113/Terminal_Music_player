require 'rubygems'
require 'gosu'

# Instructions:  This code also needs to be fixed and finished!
# The button should be highlighted when the mouse moves over it
# (i.e it should have a black border around the outside)
# finally, a user has noticed that in this version also sometimes the
# button action occurs when you click outside the button area and vice-versa.


# FOR THE CREDIT VERSION:
# display a colored border that 'highlights' the button when the mouse moves over it

# determines whether a graphical widget is placed over others or not
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

# Global constants
WIN_WIDTH = 640
WIN_HEIGHT = 400

class DemoWindow < Gosu::Window

  # set up variables and attributes
  def initialize
    super(WIN_WIDTH, WIN_HEIGHT, false)
    @background = Gosu::Color::WHITE
    @button_font = Gosu::Font.new(20)
    @info_font = Gosu::Font.new(10)
    @hover = Gosu::Color::BLACK
    @locs = [60,60]
  end


  # Draw the background, the button with 'click me' text and text
  # showing the mouse coordinates
  def draw
    # Draw background color
    Gosu.draw_rect(0, 0, WIN_WIDTH, WIN_HEIGHT, @background, ZOrder::BACKGROUND, mode=:default)
    # Draw the rectangle that provides the background.
  Gosu.draw_rect(50,50,100,50,Gosu::Color::GREEN,ZOrder::TOP,mode=:default)
    # Draw the button
    Gosu.draw_rect(49, 49, 102, 53, @hover, ZOrder::MIDDLE, mode=:default)
    # Draw the button text 
    Gosu.draw_rect(50,50, 100, 50, Gosu::Color::BLACK, ZOrder::MIDDLE,mode=:default)
   Gosu.draw_rect(50,50, 100, 50, Gosu::Color.argb(0x00_000000), ZOrder::TOP,mode=:default)

    @button_font.draw("Click me", 65, 65, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
    # Draw the mouse_x position
    @info_font.draw("mouse_x: #{mouse_x}", 6, 350, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
    # Draw the mouse_y position
    @info_font.draw("mouse_y: #{mouse_y}", 80, 350, ZOrder::TOP, 1.0,1.0, Gosu::Color::BLACK)
  end

  # this is called by Gosu to see if it should show the cursor (or mouse)
  def needs_cursor?; true;
 end



  def mouse_over_button(mouse_x, mouse_y)
    if ((mouse_x > 50 and mouse_x < 150) and (mouse_y > 50 and mouse_x < 100))
      true
    else
      false
    end
    if ((mouse_y > 50 and mouse_y < 150) and (mouse_x > 50 and mouse_y < 100))
      true 
    else 
      false
    end 
  end


  def update 
     if mouse_over_button(mouse_x, mouse_y)
      @hover = Gosu::Color::BLACK
      else
        @hover = Gosu::Color.argb(0x00_000000)
     end
  end 
  # If the button area (rectangle) has been clicked on change the background color
  # also store the mouse_x and mouse_y attributes that we 'inherit' from Gosu
  # you will learn about inheritance in the OOP unit - for now just accept that
  # these are available and filled with the latest x and y locations of the mouse click.
  def button_down(id)
    case id
    when Gosu::MsLeft
      @locs 
      if mouse_over_button(mouse_x, mouse_y)
        @background = Gosu::Color::YELLOW
      else
        @background = Gosu::Color::WHITE
      end
    end
  end
end

# Lets get started!
DemoWindow.new.show

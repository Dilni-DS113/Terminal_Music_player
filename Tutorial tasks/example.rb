require 'rubygems'
require 'gosu'




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
    @locs = [60,60]
  end

  # Draw the background, the button with 'click me' text and text
  # showing the mouse coordinates
  def draw
    # Draw background color
    Gosu.draw_rect(0, 0, WIN_WIDTH, WIN_HEIGHT, @background, ZOrder::BACKGROUND, mode=:default)
    # Draw the button
    Gosu.draw_rect(50, 50, 100, 50, Gosu::Color::GREEN, ZOrder::TOP, mode=:default)
    # Draw the button text
    @button_font.draw("Click me", 93, 73, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
    # Draw the mouse position information
    @info_font.draw_markup("mouse_x: #{@locs[0]}", 0, 350, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
    @info_font.draw_markup("mouse_y: #{@locs[1]}", 0, 370, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
  end



  # this is called by Gosu to see if should show the cursor (or mouse)
  def needs_cursor?
    true
  end

  # If the button area (rectangle) has been clicked on change the background color
  # also store the mouse_x and mouse_y attributes that we 'inherit' from Gosu
  # you will learn about inheritance in the OOP unit - for now just accept that
  # these are available and filled with the latest x and y locations of the mouse click.

  def mouse_over_button(mouse_x, mouse_y)
    mouse_x.between?(50, 150) && mouse_y.between?(50, 100)
  end


 # <----------- ADD THIS METHOD ----------->
    def update
      if mouse_over_button(mouse_x, mouse_y)
        @background = Gosu::Color::YELLOW
      else
        @background = Gosu::Color::WHITE
     end
    end


  # Where is mouse_x and mouse_y defined

  def button_down(id)
    case id
    when Gosu::MsLeft
      @locs = [mouse_x, mouse_y]
    end
  end
end

# Lets get started!
DemoWindow.new.show
# Reaction game by Kimono Studio
# Developed by Kevin Narain
require 'ruby2d'

# Set green background color
set background: 'fuchsia'
set title: "Reaction Game by Kimono Studio"

# Global variables
message = Text.new("Click to begin", x: 20, y: 20) # Show text
game_started = false # Game not started
square = nil
start_time = nil
duration = nil # Is used with #{}
tiger_eyes = Music.new('tigereyes.mp3')

# When mouse button is down then
on :mouse_down do |event|
  # Check if game has started then stop the game on a click
  if game_started
    if square.contains?(event.x, event.y)
      duration = ((Time.now - start_time) * 1000).round
      message = Text.new("Well done! You took: #{duration} milliseconds. Click to begin", x: 20, y: 20)
      square.remove # Hides square
      tiger_eyes.fadeout(2000) # Stop song: RYU SU JEONG (Lovelyz) - Tiger Eyes (Instrumental)
      game_started = false # Resets the game
    end
  else # if game hasn't started then start the game on a click
    message.remove # Remove text

    # Start song: RYU SU JEONG (Lovelyz) - Tiger Eyes (Instrumental)
    tiger_eyes.play
    tiger_eyes.volume = 50

    # Create a square
    square = Square.new(
        x: rand(get(:width) - 25), y: rand(get(:height) - 25), # Auto screen-resolution
        size: 25,
        color: 'green'
      )
    start_time = Time.now # The current time
    game_started = true
  end
end

# Execute program
show
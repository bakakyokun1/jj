#!/bin/sh

# Define the duration each color is shown
DURATION=1

# Define the paths to the RGB LED controls
LED_RED="/sys/devices/platform/pwm-leds/leds/d200:red:status/brightness"
LED_GREEN="/sys/devices/platform/pwm-leds/leds/d200:green:status/brightness"
LED_BLUE="/sys/devices/platform/pwm-leds/leds/d200:blue:status/brightness"

# Function to set color
set_color() {
    echo $1 > $LED_RED
    echo $2 > $LED_GREEN
    echo $3 > $LED_BLUE
}

# Check for a stop file to allow external stop command
STOP_FILE="/tmp/stop_led_cycle"

# Remove stop file if exists
rm -f $STOP_FILE

# Main loop to cycle colors
while [ ! -f $STOP_FILE ]; do
    # Set to pink (R: 255, G: 105, B: 180)
    set_color 255 105 180
    sleep $DURATION

    # Set to purple (R: 128, G: 0, B: 128)
    set_color 128 0 128
    sleep $DURATION

    # Set to blue (R: 0, G: 0, B: 255)
    set_color 0 0 255
    sleep $DURATION
done

# Clean up after stop
rm -f $STOP_FILE
echo "LED cycling stopped."

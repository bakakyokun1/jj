#!/bin/sh

# Function to play a note with beep
play_note() {
    beep -f $1 -l $2
}

# Function to add a short pause
pause() {
    sleep 0.1
}

# Playing "Jingle Bells" melody
play_note 659 300; pause  # E
play_note 659 300; pause  # E
play_note 659 600; pause  # E
play_note 659 300; pause  # E
play_note 659 300; pause  # E
play_note 659 600; pause  # E
play_note 659 300; pause  # E
play_note 523 300; pause  # C
play_note 587 300; pause  # D
play_note 523 600; pause  # C
play_note 784 300; pause  # G
play_note 659 300; pause  # E
play_note 784 300; pause  # G
play_note 880 600; pause  # A
play_note 659 300; pause  # E
play_note 587 300; pause  # D
play_note 523 300; pause  # C
play_note 587 300; pause  # D
play_note 523 900; pause  # C
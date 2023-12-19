#!/bin/bash

# Function to play a note with beep
play_note() {
    beep -f $1 -l $2
}

# Function to add a short pause
pause() {
    sleep 0.1
}

# Jingle Bells melody
# Verse 1
play_note 659 300; pause  # E
play_note 659 300; pause  # E
play_note 659 600; pause  # E
play_note 659 300; pause  # E
play_note 659 300; pause  # E
play_note 659 600; pause  # E
play_note 659 300; pause  # E
play_note 523 300; pause  # C
play_note 587 300; pause  # D
play_note 523 900; pause  # C
# Little pause before next part
sleep 0.3
# Verse 2
play_note 784 300; pause  # G
play_note 784 300; pause  # G
play_note 784 600; pause  # G
play_note 784 300; pause  # G
play_note 659 300; pause  # E
play_note 659 300; pause  # E
play_note 659 300; pause  # E
# Little pause
sleep 0.1
play_note 523 300; pause  # C
play_note 523 300; pause  # C
play_note 523 300; pause  # C
play_note 523 300; pause  # C
play_note 587 300; pause  # D
play_note 523 900; pause  # C
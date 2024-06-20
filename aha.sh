#!/bin/ash

initialize_game() {
    clear
    tput civis
    stty -echo
    width=20
    height=10
    snake_x=(10)
    snake_y=(5)
    direction="RIGHT"
    score=0
    place_food
}

draw_board() {
    clear
    for y in $(seq 0 $height); do
        for x in $(seq 0 $width); do
            if [ "$x" -eq 0 ] || [ "$x" -eq "$width" ] || [ "$y" -eq 0 ] || [ "$y" -eq "$height" ]; then
                echo -n "#"
            elif [ "$x" -eq "$food_x" ] && [ "$y" -eq "$food_y" ]; then
                echo -n "F"
            else
                draw_snake "$x" "$y"
            fi
        done
        echo
    done
    echo "Score: $score"
}

draw_snake() {
    x=$1
    y=$2
    for i in $(seq 0 $((${#snake_x[@]} - 1))); do
        if [ "${snake_x[$i]}" -eq "$x" ] && [ "${snake_y[$i]}" -eq "$y" ]; then
            echo -n "O"
            return
        fi
    done
    echo -n " "
}

place_food() {
    food_x=$((RANDOM % (width - 2) + 1))
    food_y=$((RANDOM % (height - 2) + 1))
}

update_snake() {
    new_x=${snake_x[0]}
    new_y=${snake_y[0]}
    case $direction in
        "UP") new_y=$((new_y - 1)) ;;
        "DOWN") new_y=$((new_y + 1)) ;;
        "LEFT") new_x=$((new_x - 1)) ;;
        "RIGHT") new_x=$((new_x + 1)) ;;
    esac

    if [ "$new_x" -eq 0 ] || [ "$new_x" -eq "$width" ] || [ "$new_y" -eq 0 ] || [ "$new_y" -eq "$height" ]; then
        game_over
    fi

    for i in $(seq 0 $((${#snake_x[@]} - 1))); do
        if [ "$new_x" -eq "${snake_x[$i]}" ] && [ "$new_y" -eq "${snake_y[$i]}" ]; then
            game_over
        fi
    done

    snake_x=("$new_x" "${snake_x[@]}")
    snake_y=("$new_y" "${snake_y[@]}")

    if [ "$new_x" -eq "$food_x" ] && [ "$new_y" -eq "$food_y" ]; then
        score=$((score + 1))
        place_food
    else
        snake_x=("${snake_x[@]:0:${#snake_x[@]}-1}")
        snake_y=("${snake_y[@]:0:${#snake_y[@]}-1}")
    fi
}

game_over() {
    stty echo
    tput cnorm
    echo "Game Over! Final Score: $score"
    exit
}

read_input() {
    while true; do
        read -n1 -s key
        case $key in
            w) direction="UP" ;;
            s) direction="DOWN" ;;
            a) direction="LEFT" ;;
            d) direction="RIGHT" ;;
        esac
    done
}

main() {
    initialize_game
    (read_input) &
    while true; do
        draw_board
        update_snake
        sleep 0.2
    done
}

main

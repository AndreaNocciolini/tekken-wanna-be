sleep 0.5
echo ". . ."
sleep 0.5

echo "Welcome, tarnished. You seem to have the potential to face the challenges that will arise before you, but it seems that you haven't chosen your path yet. Choose your class, and get ready to start you're journey:"
sleep 2

echo "
0 - Wretch
1 - Warrior
2 - Prophet
3 - Hero
4 - Vagabond
5 - Prisoner
6 - Bandit
7 - Astrologer
8 - Confessor
9 - Samurai
"

read class

case $class in
    0)
        type="Wretch"
        hp=10
        attack=10
        magic=10
        ;;
    1)
        type="Warrior"
        hp=15
        attack=15
        magic=0
        ;;
    2)
        type="Prophet"
        hp=8
        attack=11
        magic=11
        ;;
    3)
        type="Hero"
        hp=12
        attack=10
        magic=8
        ;;
    4)
        type="Vagabond"
        hp=14
        attack=11
        magic=5
        ;;
    5)
        type="Prisoner"
        hp=14
        attack=14
        magic=2
        ;;
    6)
        type="Bandit"
        hp=10
        attack=15
        magic=5
        ;;
    7)
        type="Astrologer"
        hp=12
        attack=7
        magic=11
        ;;
    8)
        type="Confessor"
        hp=16
        attack=8
        magic=6
        ;;
    9)
        type="Samurai"
        hp=13
        attack=17
        magic=0
        ;;
esac

sleep 1

echo "You have chosen the path of the $type.
Your health points are $hp.
Your attack power is $attack.
Your magic power is $magic.
"

sleep 0.5
echo ". . ."
sleep 0.5

echo "You are now ready to travel along the Lands Between. Farwell, and good luck, tarnished..."

sleep 0.5
echo ". . ."
sleep 0.5

echo "You wake up from a deep sleep. It seems like centuries since you last opened your eyes."
sleep 1.2

echo "You gather your strength for a few minutes before setting off on your journey."
sleep 1.2

#First Beast Battle How I would like to do but frickin' bash doesn't enter in the until :(

echo "Your first enemy approaches. It's a feral beast. Prepare to battle."

beast=45


until [[ $beast -le 1 && $hp -gt 1 || $beast -gt 1 && $hp -le 1 ]]
do
echo "Pick a number between 0 and 1 to attack. (0/1)"

    swing=$(( $RANDOM % 2 ))

        
    read tarnished

    if [[ $swing == $tarnished ]]; then
        echo "You tear the flesh of the beast with a slash! Blood begins to gush from the wound!"
        beast=$(( beast -= $attack ))
        echo "$beast"
    else
        echo "You try to dodge, but the beast manages to hit you! You feel the blow and back away, ready to attack again!"
        hp=$((hp -= 3 ))
        echo "$hp"
    fi
done

if [[ $beast -le 0 ]]; then
    echo "Beast VANQUISHED! Congrats, fellow tarnished!"
    sleep 0.8
    echo "You have $hp left."
elif [[ $hp -le 0 ]]; then
    echo "You Died"
    exit 2
fi

sleep 1.2

echo "You see a castle in the distance. Your heart tightens for a moment. But you know your journey have to take you there."
sleep 1

echo "You approach the castle. A Boss appear as soon you step into the area. It's Margit, the fell omen. Pick a number between 0 and 9 to defeat him!(0/1/.../9)"

#Margit Battle
read tarnished

margit=$(( $RANDOM % 10 ))

if [[ $margit == $tarnished ]]; then
    echo "After a grueling battle, Margit falls to the ground defeated, sinking into a pool soaked in his own blood. Congrats, fellow tarnished!"
else
    echo "You Died"
    exit 2
fi

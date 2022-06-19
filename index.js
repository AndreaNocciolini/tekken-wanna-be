const canvas = document.querySelector('canvas');
const c = canvas.getContext('2d');

canvas.width = 1024;
canvas.height = 576;

c.fillRect(0, 0, canvas.width, canvas.height)

//GRAVITY
const gravity = 0.2
//GRAVITY

class Sprite {
    constructor({ position, velocity }) {
        this.position = position
        this.velocity = velocity
        this.height = 150
    };

    draw() {
        c.fillStyle = 'green'
        c.fillRect(this.position.x, this.position.y, 50, this.height)
    };

    update() {
        this.draw()

        this.position.x += this.velocity.x
        this.position.y += this.velocity.y

        if (this.position.y + this.height + this.velocity.y >= canvas.height) {
            this.velocity.y = 0
        } else {
            this.velocity.y += gravity
        }
    }
};


//PLAYER
const player = new Sprite({
    position: {
        x: 0,
        y: 0
    },
    velocity: {
        x: 0,
        y: 10
    }
});

console.log(player)
//PLAYER

//ENEMY
const enemy = new Sprite({
    position: {
        x: 400,
        y: 0
    },
    velocity: {
        x: 0,
        y: 10
    }
});

console.log(enemy)
//ENEMY

// ANIMATION
const keys = {
    a: {
        pressed: false
    },
    d: {
        pressed: false
    },
}

let lastKey

function animate() {
    window.requestAnimationFrame(animate) //this make an animation loop
    c.fillStyle = 'black'
    c.fillRect(0, 0, canvas.width, canvas.height)
    player.update()
    enemy.update()
    player.velocity.x = 0

    if (keys.d.pressed && lastKey === 'd') {
        player.velocity.x = 1
    } else if (keys.a.pressed && lastKey === 'a') {
        player.velocity.x = -1
    }
}

animate()
// ANIMATION

//MOVEMENTS
window.addEventListener('keydown', (event) => {
    switch(event.key) {
        case 'd':
            keys.d.pressed = true
            lastKey = 'd'
            break
        case 'a':
            keys.a.pressed = true
            lastKey = 'a'
            break
    }
    console.log(event.key)
})

window.addEventListener('keyup', (event) => {
    switch(event.key) {
        case 'd':
            keys.d.pressed = false
            break
        case 'a':
            keys.a.pressed = false    
            break
    }
    console.log(event.key)
})
//MOVEMENTS
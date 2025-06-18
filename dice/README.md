# Dicee - A Simple Dice Rolling App

This is a basic Flutter app that simulates rolling two dice. When you tap on either dice image, both dice faces change randomly.

## Features

- Two dice displayed side-by-side
- Tap on any dice to roll both dice
- Random dice faces between 1 and 6
- Simple, clean red-themed UI

## How It Works

- The app uses a `StatefulWidget` to maintain the state of the dice numbers.
- Pressing either dice triggers the `changeDiceFace` function.
- `changeDiceFace` updates both dice numbers to random values between 1 and 6.
- Dice images update accordingly using the `Image.asset` widget.

## Getting Started

1. Make sure you have Flutter installed and set up.
2. Add dice images named `dice1.png` to `dice6.png` in an `images` folder inside your project.
3. Run the app on your emulator or physical device.
4. Tap the dice to roll!

## Screenshots

![Dicee App Screenshot](dice/images/Screenshot.png)

---

Created as part of my Flutter learning journey.

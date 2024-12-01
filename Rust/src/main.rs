use rand::Rng;
use std::io::{self, Write};

fn main() {
    let mut rng = rand::thread_rng();

    let n = rng.gen_range(1..=100);
    let mut step = 1;

    let stdin = io::stdin();
    let mut stdout = io::stdout();

    println!("You should guess a number in range 1 .. 100");

    loop {
        let mut guess_string = String::new();

        print!("Enter your guess: ");
        stdout.flush().unwrap();

        stdin
            .read_line(&mut guess_string)
            .expect("Failed to read line");

        let guess: i32 = guess_string.trim().parse().expect("Not a valid number");

        if guess < n {
            println!("Your guess is too low :(");
        } else if guess > n {
            println!("Your guess is too high :(");
        } else {
            break;
        }

        step += 1;
    }

    println!("You won on step {}!", step);
}

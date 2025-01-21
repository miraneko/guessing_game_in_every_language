let () =
  Random.self_init ();
  let n = Random.int 100 + 1 in
  print_endline "You should guess the number in range 1 .. 100";
  let rec game_loop step =
    print_string "Enter your guess: ";
    let input = read_line () in
    match int_of_string_opt input with
    | None ->
        print_endline "You entered bullshit";
        game_loop step
    | Some guess ->
        if guess < n then begin
            print_endline "Your guess is too low";
            game_loop (step + 1)
        end else if guess > n then begin
            print_endline "Your guess is too high";
            game_loop (step + 1)
        end else Printf.printf "You won in %d steps!\n" step
  in game_loop 1;;

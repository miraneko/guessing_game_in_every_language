let () =
  Random.self_init ();
  let n = Random.int 100 + 1 in
  print_endline "You should guess the number in range 1 .. 100";
  let rec game_loop step =
    print_string "Enter your guess: ";
    let input = 
      try read_line () |> String.trim with
      | End_of_file ->
        print_endline "\nGame cancelled";
        exit 0
    in
    match int_of_string input with
    | exception Failure _ ->
      print_endline "You entered bullshit";
      game_loop step
    | guess when guess < 1 || guess > 100 ->
      print_endline "Your guess is out of 1 .. 100 range";
      game_loop step
    | guess when guess < n ->
      print_endline "Your guess is too low";
      game_loop (step + 1)
    | guess when guess > n ->
      print_endline "Your guess is too high";
      game_loop (step + 1)
    | _ -> Printf.printf "You won in %d steps!\n" step
  in game_loop 1

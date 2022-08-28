(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

(*____________________________________________________*)
fun is_older(date1: (int * int * int), date2: (int * int * int)) =
    if #1 date1 < #1 date2
    then true
    else if (#1 date1 = #1 date2) andalso  (#2 date1 < #2 date2)
    then true
    else if (#2 date1 = #2 date2) andalso  (#3 date1 < #3 date2)
    then true
    else false;

(*____________________________________________________*)
fun number_in_month(dates: (int * int * int) list, month: int ) =
    if null dates
    then 0
    else if #2 (hd dates) = month
    then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month);


(*____________________________________________________*)
fun number_in_months (dates: (int * int * int) list, months: int list) =
    if null months then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)


(*____________________________________________________*)
fun dates_in_month (dates: (int * int * int) list, month: int) =
    if null dates then []
    else if (#2 (hd dates)) = month then hd dates :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)


(*____________________________________________________*)
fun dates_in_months (dates: (int * int * int) list, months: int list) =
    if null months then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);


(*____________________________________________________*)
fun get_nth(strings: string list, n: int) = 
    if (n = 1)
    then hd strings
    else get_nth(tl strings, n - 1)

(*____________________________________________________*)
fun date_to_string(date: (int * int * int)) =
    let
        val eng_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
        get_nth(eng_months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date) 
    end

(*____________________________________________________*)
fun number_before_reaching_sum (sum : int, nums : int list) =
    if hd nums >= sum then 0
    else 1 + number_before_reaching_sum(sum - hd nums, tl nums)


(*____________________________________________________*)
fun what_month (day : int) =
    let val month_sums = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in number_before_reaching_sum(day, month_sums) + 1
    end

(*____________________________________________________*)
fun month_range (day1 : int, day2 : int) =
    if day1 > day2 then []
    else what_month(day1) :: month_range(day1 + 1, day2);


fun oldest (dates : (int * int * int) list) =
    if null dates then NONE
    else
        let fun oldest_helper (dates: (int * int * int) list) =
            if null (tl dates) then hd dates
            else
               let val tail_oldest = oldest_helper(tl dates)
               in
                   if is_older(hd dates, tail_oldest) then hd dates
                   else tail_oldest
               end
        in
            SOME (oldest_helper(dates))
        end

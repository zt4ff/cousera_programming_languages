(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

(*________________HELPER FUNCTIONS____________________*)

fun is_part_of_list(ls: int list, l: int) =
    if null ls
    then false
    else if (hd ls) = l
    then true
    else is_part_of_list(tl ls, l)
(*____________________________________________________*)
    

(*____________________________________________________*)
fun is_older(date1: (int * int * int), date2: (int * int * int)) =
    if #1 date1 < #1 date2
    then true
    else if (#1 date1 = #1 date2) andalso  (#2 date1 < #2 date2)
    then true
    else if (#2 date1 = #2 date2) andalso  (#3 date1 < #3 date2)
    then true
    else false;

val test1 = is_older ((1,2,3),(2,3,4)) = true

(*____________________________________________________*)
fun number_in_month(dates: (int * int * int) list, month: int ) =
    if null dates
    then 0
    else if #2 (hd dates) = month
    then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month);


val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1;


(*____________________________________________________*)
fun number_in_months (dates: (int * int * int) list, months: int list) =
    if null months then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3


(*____________________________________________________*)
fun dates_in_month (dates: (int * int * int) list, month: int) =
    if null dates then []
    else if (#2 (hd dates)) = month then hd dates :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

(*____________________________________________________*)
fun dates_in_months (dates: (int * int * int) list, months: int list) =
    if null months then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)
val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
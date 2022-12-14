(* A useful function to print to the terminal while adding a newline to the back of the string to be printed *)
fun p (s: string) =
    print(s ^ "\n")

(* RECORDS *)
(* Records are a way of storying data that are accessible via a name binding *)
val myRecord = {name="segun", age=33};
(* p(#name myRecord) *)

(* NOTE: turples in sml are special records where the property names are numeric numbers that are in a consecutive order of +1 *)
val turple1 = ("Segun", "Kayode");
val turple2 = {1="Segun", 2="Kayode"};
(* if #1 turple1 = #1 turple2 then p("they are equal") else p("not equal") *)

(* So we can say turple is a kind of syntatic sugar, snythetic sugar are constructs in a programming language 
that make and already existing contruct easy or more plesant that the existing construct  *)

(* ------------------------------------------------------------------------------------------------------------------------------------- *)

(* DATATYPE BINDING *)
(* This is a contruct that allows you to make to define custom types *)
datatype MyType = int | string;
(* above I created a custom type that can either be an int or a string*)
(* for example *)
datatype mytype = TwoInts of int * int | Str of string | Pizza;
fun f (x: mytype) =
    case x of
        Pizza => 3
        | Str s => 8
        | TwoInts(i1, i2) => i1 + i2
(* example of using datatype in a card playing game *)
datatype suit = Club | Diamond | Heart| Spade;
datatype rank = Jack | Queen | King | Ace | Num of int;

(* ------------------------------------------------------------------------------------------------------------------------------------- *)

(* TYPE SYNONYM *)
(* is a new constructor that creates another name for a particular type *)
(* for instacnce, below we are define a turple type where the first element is the suit type and the other is thr rank tyoe *)
type card = suit * rank;
fun is_Queen_of_Spade(c: card) =
    #1 c = Spade andalso #2 c = Queen;

(* it can also be used to define the types of a record *)
type student_record = {
    student_num: int option,
    first: string,
    middle: string option,
    last: string
};


(* MORE ABOUT PATTERN MATCHING *)
(* pattern matching also works for records and turples *)
(* the pattern (x1, x2) matches the turple value (v1, v2) *)
(* the pattern {f1=x1, f2=x3} matches the record value {fi=v1, f2=v2} *)

(* some examples - though it's a poor style *)
fun sum_of_three(tripple) =
    case tripple of
        (x, y, z) => x + y + z;

fun print_full_name(person) =
    case person of
        {firstname=x, lastname=y} => x ^ ", " ^ y;

print_full_name({firstname="Segun", lastname="Kayode"});

(* in the two functions above, the pattern matching is a bad style for a pattern that should have only a single branch *)
(* so val a kinda like a pattern matching contruct *)
val tripple = (1, 2, 3);
val (x, y, z) = tripple;
(* the above code would match the turple into the variables x, y, z *)
(* knowing this would work, we can rewrite the function above *)
fun sum_of_three1 tripple =
    let 
        val (x, y, z) = tripple
    in
      x + y + z
    end;

sum_of_three1((1, 2, 1));

fun print_full_name1 person =
    let val {firstname=x, lastname=y} = person
    in
      x ^ ", " ^ y
    end;

print_full_name1({firstname="Adelade", lastname="Ipaye"});


(* now function argument also have pattern matching, so we cna simplify this process *)
fun sum_of_three2 (x, y, z) =
    x + y + z;

sum_of_three2((1, 4, 1))


(* creating an append function *)
fun append(xs, ys) =
    case xs of
        [] => ys
        x::xs' => x :: apend(xs', ys)

(* EXCEPTION *)
exception MyError of int * int
(* you can pass date to whosoever is handlign your exception using this construct *)
raise MyError(2, 3)

(* how to handle exception *)
expression1 handle excepname => expression2
(* means if expression1 reaise an exception the handle keyworkd checks if the exception  *)
(* matches the excepname given then runs the expression2 *)

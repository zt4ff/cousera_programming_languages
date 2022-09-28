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


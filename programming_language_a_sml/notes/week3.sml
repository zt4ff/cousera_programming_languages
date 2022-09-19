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
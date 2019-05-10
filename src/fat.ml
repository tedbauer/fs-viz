open Base

type block_store = int Array.t

(* [fs_read bs i] is data [d] that's contained in block [i]. *)
let fs_read _ _ _ = failwith "NYI"

(* [fs_write bs i d] is block store [bs'] with data [d] written at block [i]. *)
let fs_write _ _ _ = failwith "NYI"

(* [fs_free_file bs i] is block store [bs'] with the file at block [i] freed. *)
let fs_free_file _ _ _ = failwith "NYI"

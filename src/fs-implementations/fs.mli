type block_store

(* [fs_read bs i] is data [d] that's contained in block [i]. *)
val fs_read: block_store -> int -> int

(* [fs_write bs i d] is block store [bs'] with data [d] written at block [i]. *)
val fs_write: block_store -> int -> int -> int

(* [fs_free_file bs i] is block store [bs'] with the file at block [i] freed. *)
val fs_free_file: block_store -> int -> block_store

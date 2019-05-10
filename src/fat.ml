open Base

type block_store_t = int Array.t

let write_block (bs_store: block_store_t) (i: int) (block: int Array.t) =
  for entry = 0 to Array.length bs_store do
    bs_store.(entry) <- block.(entry)
  done

(** [fs_create blocks n_inodes inodes_per_block] is a new block store
  * initialized with a FAT filesystem *)
let fs_create blocks (blk_size: int) (n_in: int) (in_per_blk: int) (fat_per_blk: int) =
  let bs_size = blocks * blk_size in
  let bs_store = Array.create ~len: bs_size 0 in

  let n_iblocks = n_in / in_per_blk in

  (* blocks = 1 + n_iblocks + n_fatblocks + n_fatblocks * fat_per_block
   * implies this: *)
  let n_fblocks = (blocks - 1 - n_iblocks) / (1 + fat_per_blk) in

  let super_block = Array.create ~len: blk_size 0 in
  super_block.(0) <- n_iblocks;
  super_block.(1) <- n_fblocks;
  super_block.(2) <- 0; (* Head of free list is 0th data block *)

  write_block bs_store 0 super_block;

  let inode_table = Array.create ~len: (blk_size * n_iblocks) 0 in
  ignore inode_table;
  failwith "NYI"

(* [fs_read bs i] is data [d] that's contained in block [i]. *)
let fs_read _ _ _ = failwith "NYI"

(* [fs_write bs i d] is block store [bs'] with data [d] written at block [i]. *)
let fs_write _ _ _ = failwith "NYI"

(* [fs_free_file bs i] is block store [bs'] with the file at block [i] freed. *)
let fs_free_file _ _ _ = failwith "NYI"

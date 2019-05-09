# Filesystem Visualizer

Filesystem Visualizer (name pending) visualizes filesystems in your web browser. 
This is very WIP, and this readme will change often -- the project is in its infancy.

The plan is to include implementations of these filesystems:
- [File Allocation Table](wiki-fat)
- [Log-structured file system](wiki-lfs)

[fat]: https://en.wikipedia.org/wiki/File_Allocation_Table
[lfs]: https://en.wikipedia.org/wiki/Log-structured_file_system

## Building
fs-viz requires:
- OCaml
- Jane Street's Core library
- Js_of_ocaml

## Adding Your Own Filesystem Implementation
You will be able to add your own filesystem implementations, written in
[OCaml](ocaml-site). You'll need to match a signature that will tentatively
look something like this:

```ocaml
type block_store

(* [fs_read bs i] is data [d] that's contained in block [i]. *)
val fs_read: block_store -> int -> int

(* [fs_write bs i d] is block store [bs'] with data [d] written at block [i]. *)
val fs_write: block_store -> int -> int -> int

(* [fs_free_file bs i] is block store [bs'] with the file at block [i] freed. *)
val fs_free_file: block_store -> int -> block_store
```

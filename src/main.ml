module IntToBool = Set.Make (
  struct
    type t = int
    let compare = Pervasives.compare
  end
)
type block_store = IntToBool.t

let num_blocks = 256

let bsd_width = 600.
let bsd_height = 100.

let document = Dom_html.window##.document
let get_element_by_id id = document##getElementById (Js.string id)

let main = Js.Opt.get (get_element_by_id "main") (fun () -> assert false)

let canvas = Dom_html.createCanvas document
let ctx = canvas##getContext Dom_html._2d_

let create_canvas () =
  canvas##.width := int_of_float bsd_width;
  canvas##.height := int_of_float bsd_height;
  ctx##rect 0. 0. bsd_width bsd_height;
  ctx##stroke;
  Dom.appendChild main canvas

let draw_blocks bs =
  let block_width = bsd_width /. (float_of_int num_blocks) in
  for b = 0 to num_blocks do
    let x1 = float_of_int b *. block_width in
        (if IntToBool.mem b bs then
          (ctx##beginPath;
          ctx##rect (x1 +. block_width) 0. block_width bsd_height;
          ctx##fill)
        else
          ctx##beginPath;
          ctx##rect (x1 +. block_width) 0. bsd_width bsd_height;
          ctx##stroke)
  done

let create_title () =
  let h2 = Dom_html.createH2 document in
  Dom.appendChild h2 (document##createTextNode (Js.string "Filesystem Visualizer"));
  Dom.appendChild main h2

let _ =
  create_title ();
  create_canvas ();
  draw_blocks (let open IntToBool in (add 5 empty));

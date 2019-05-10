let _ =
  let document = Dom_html.window##.document in
  let main = Js.Opt.get (document##getElementById (Js.string "main")) (fun () -> assert false) in
  let h2 = Dom_html.createH2 document in
  Dom.appendChild h2 (document##createTextNode (Js.string "Filesystem Visualizer"));
  Dom.appendChild main h2;
  let canvas = Dom_html.createCanvas document in
  canvas##.width := 400;
  canvas##.height := 200;
  let ctx = canvas##getContext Dom_html._2d_ in
  ctx##rect 0. 0. 350. 150.;
  ctx##fill;
  Dom.appendChild main canvas

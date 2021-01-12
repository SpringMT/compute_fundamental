let twice f =
  let g x = f (f x) in g

let twice2 x = (twice twice) x

export def expand [title: string spec] {
  let data = $in
  let spec = $spec | insert data { values: $data } | to json

  $"
<!doctype html>
<html>

<head>
  <title>($title)</title>
  <meta charset='utf-8' />

  <script src='https://cdn.jsdelivr.net/npm/vega@5.27.0'></script>
  <script src='https://cdn.jsdelivr.net/npm/vega-lite@5.17.0'></script>
  <script src='https://cdn.jsdelivr.net/npm/vega-embed@6.24.0'></script>

</head>

<body>
  <h1>($title)</h1>
  <div id='vis'></div>
  <script>
  vegaEmbed\(
    '#vis', 
    ($spec), 
    { actions: false }
  );
  </script>
</body>

</html>
"
}

export def view [title: string spec] {
    expand $title $spec | ~/Desktop/VegaView.app/Contents/MacOS/VegaView
}

export def bars [x: string y: string] {
    {
      '$schema': 'https://vega.github.io/schema/vega-lite/v5.json',
      mark: 'bar',
      encoding: {
        y: { field: $x, type: 'nominal' },
        x: {
          aggregate: 'average',
          field: $y,
          type: 'quantitative',
          axis: {
            title: ('Average of ' ++ $y)
          }
        }
      }
    }
}
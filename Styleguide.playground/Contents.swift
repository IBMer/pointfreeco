import Prelude
import Styleguide
import HTML
import CSS
import WebKit
import PlaygroundSupport

func row(_ widths: [Int]) -> Node {
  return div(
    [ HTML.class("row") ],
    widths.map { column($0, [p([text("\($0)")])]) }
  )
}

func row(_ nodes: [Node]) -> Node {
  return div(
    [ HTML.class("row") ],
    nodes
  )
}

func column(_ n: Int, _ nodes: [Node]) -> Node {
  return div(
    [ HTML.class("column column-\(n)") ],
    nodes
  )
}

let gridStylesCss: Stylesheet =
  body % padding(all: "20px")
    <> ".column" % (
      background(white(0.9, 1))
        <> borderWidth(all: pt(1))
        <> borderStyle(all: solid)
        <> borderColor(all: white(0.75, 1))
        <> borderRadius(all: px(6))
        <> color(white(0.5, 1))
        <> padding(all: px(5))
        <> minHeight("30px")
        <> textAlign(.center)
    )
    <> ".row" % (
      fontSize("10px")
        <> margin(bottom: "10px")
        <> .pseudo(.lastChild) & margin(bottom: "0")
    )
    <> (".column" ** ".column") % (
      color(white(0.9, 1))
        <> background(white(0.25, 1))
        <> borderColor(all: white(0, 1))
)

let extraResets = html % (
  fontFamily(["Open Sans", "Helvetica Neue", "Arial", "Helvetica", "Verdana", "sans-serif"])
)

let styleguideHtml = html(
  [],
  [
    head(
      [
        style(
          reset
            <> styleguide
            <> gridSystem
            <> gridStylesCss
            <> extraResets
        )
      ]
    ),

    div(
      [
        button(
          [ HTML.class("btn") ],
          [ "I’m a button!" ]
        ),
        h1([ "Heading Level 1" ]),
        h2([ "Heading Level 2" ]),
        h3([ "Heading Level 3" ]),
        h4([ "Heading Level 4" ]),
        h5([ "Heading Level 5" ]),
        h6([ "Heading Level 6" ]),
        ]
    ),

    div(
      [ ],
      [
        row([
          div(
            [ HTML.class("offset-8 column column-4") ],
            [ "4" ]
          )
          ]),

        row([12]),
        row([6, 6]),
        row([4, 4, 4]),
        row([3, 3, 3, 3]),
        row([1, 2, 2, 2, 2, 2, 1]),
        row([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]),

        row(
          [
            column(6, [
              row([3, 3, 3, 3]),
              row([6, 6]),
              row([12])
              ]),
            column(6, [
              row([1, 2, 3, 4, 2]),
              row([1, 2, 2, 2, 2, 2, 1]),
              row([1, 2, 3, 3, 2, 1]),
              ]),
            ]
        ),

        row([2, 1, 3, 4, 2]),
        row([12]),
      ]
    )
  ]
)

let htmlString = render(styleguideHtml, config: pretty)

let webView = WKWebView(frame: .init(x: 0, y: 0, width: 600, height: 700))
webView.loadHTMLString(htmlString, baseURL: nil)
PlaygroundPage.current.liveView = webView

1

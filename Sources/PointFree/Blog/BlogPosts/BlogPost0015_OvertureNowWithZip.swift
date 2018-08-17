import Foundation

let post0015_openSourcingValidated = BlogPost(
  author: .stephen,
  blurb: """
Today we are releasing Overture 0.3.0 with a bunch of useful zip functions.
""",
  contentBlocks: [

    .init(
      content: "",
      timestamp: nil,
      type: .image(src: "https://d1iqsrac68iyd8.cloudfront.net/posts/0015-overture-now-with-zip/poster.png")
    ),

        .init(
      content: """
---

> Today we are releasing [Overture](\(gitHubUrl(to: .repo(.overture)))) 0.3.0 with a bunch of useful `zip` functions.

---
""",
      timestamp: nil,
      type: .paragraph
    ),

    .init(
      content: "N-ary zip for Sequences",
      timestamp: nil,
      type: .title
    ),

    .init(
      content: """
The Swift standard library defines [`zip`](https://developer.apple.com/documentation/swift/1541125-zip) to take a pair of sequences. While the Swift "Generics Manifesto" [shows an example](https://github.com/apple/swift/blob/478d846e3699a48bca8867d82086ecaaec9c80e3/docs/GenericsManifesto.md#variadic-generics) of how Swift may support a `zip` of any number of sequences, why wait?

Overture 0.3.0 defines `zip` to zip up to ten sequences at once! This means supporting the ability to easily combine related sequences that may have come from different sources.
""",
      timestamp: nil,
      type: .paragraph
    ),

    .init(
      content: """
let ids = [1, 2, 3]
let emails = ["blob@pointfree.co", "blob.jr@pointfree.co", "blob.sr@pointfree.co"]
let names = ["Blob", "Blob Junior", "Blob Senior"]

struct User {
  let id: Int
  let email: String
  let name: String
}

zip(ids, emails, names)
// [
//   (1, "blob@pointfree.co", "Blob"),
//   (2, "blob.jr@pointfree.co", "Blob Junior"),
//   (3, "blob.sr@pointfree.co", "Blob Senior")
// ]
""",
      timestamp: nil,
      type: .code(lang: .swift)
    ),

    .init(
      content: """
When combined with `map`, we have a succinct way of transforming tuples into other values!
""",
      timestamp: nil,
      type: .paragraph
    ),

    .init(
      content: """
zip(ids, emails, names).map(User.init)
// [
//   User(id: 1, email: "blob@pointfree.co", name: "Blob"),
//   User(id: 2, email: "blob.jr@pointfree.co", name: "Blob Junior"),
//   User(id: 3, email: "blob.sr@pointfree.co", name: "Blob Senior")
// ]
""",
      timestamp: nil,
      type: .code(lang: .swift)
    ),

    .init(
      content: """
Overture also provides a `zip(with:)` function, for ergonomics and composition.
""",
      timestamp: nil,
      type: .paragraph
    ),

    .init(
      content: """
zip(with: User.init)(ids, emails, names)
// [
//   User(id: 1, email: "blob@pointfree.co", name: "Blob"),
//   User(id: 2, email: "blob.jr@pointfree.co", name: "Blob Junior"),
//   User(id: 3, email: "blob.sr@pointfree.co", name: "Blob Senior")
// ]
""",
      timestamp: nil,
      type: .code(lang: .swift)
    ),

    .init(
      content: "Zip for Optionals",
      timestamp: nil,
      type: .title
    ),

    .init(
      content: """
Overture also defines `zip` for optional values. This is an expressive way of unwrapping a bunch of values at once, much like multiple `if`/`guard`–`let` binding.
""",
      timestamp: nil,
      type: .paragraph
    ),

    .init(
      content: """
let id: Int? = 1
let email: String? = "blob@pointfree.co"
let name: String? = "Blob"

zip(id, email, name)
// Optional<(Int, String, String)>.some((1, "blob@pointfree.co", "Blob"))
""",
      timestamp: nil,
      type: .code(lang: .swift)
    ),

    .init(
      content: """
As we saw with `Sequence`, `zip` pairs well with `map`, and we already have `map` on `Optional`!
""",
      timestamp: nil,
      type: .paragraph
    ),

    .init(
      content: """
let id: Int? = 1
let email: String? = "blob@pointfree.co"
let name: String? = "Blob"

zip(id, email, name).map(User.init)
// Optional<User>.some(User(id: 1, email: "blob@pointfree.co", name: "Blob"))
""",
      timestamp: nil,
      type: .code(lang: .swift)
    ),

    .init(
      content: """
We once again have `zip(with:)` at our disposal, for ergonomics and composition.
""",
      timestamp: nil,
      type: .paragraph
    ),

    .init(
      content: """
zip(with: User.init)(id, email, name)
// Optional<User>.some(User(id: 1, email: "blob@pointfree.co", name: "Blob"))
""",
      timestamp: nil,
      type: .code(lang: .swift)
    ),

    .init(
      content: """
Using `zip` can be an expressive alternative to `let`-unwrapping!
""",
      timestamp: nil,
      type: .paragraph
    ),

    .init(
      content: """
let optionalUser = zip(with: User.init)(id, email, name)

// vs.

let optionalUser: User?
if let id = id, let email = email, let name = name {
  optionalUser = User(id: id, email: email, name: name)
} else {
  optionalUser = nil
}
""",
      timestamp: nil,
      type: .code(lang: .swift)
    ),

    .init(
      content: "Conclusion",
      timestamp: nil,
      type: .title
    ),

    .init(
      content: """
That's it for this release! Ready to add more `zip` to your code bases? Upgrade to [Overture 0.3.0](https://github.com/pointfreeco/swift-overture/releases/tag/0.3.0) today!
""",
      timestamp: nil,
      type: .paragraph
    ),

  ],
  coverImage: "https://d1iqsrac68iyd8.cloudfront.net/posts/0015-overture-now-with-zip/poster.png",
  id: 15,
  publishedAt: .init(timeIntervalSince1970: 1534485424),
  title: "Overture 0.3.0: Now with Zip"
)

type layout =
| Landscape
| Portrait;

type mediaQueryList = {
	matches: bool,
	media: string
}

// https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver/MutationObserver
type observerOptions = {
  childList: bool, /* changes in the direct children of node */
  attributes: bool, /* attributes of node */
  subtree: bool /* in all descendants of node */
}

type window = {
	onresize: (int, unit) => unit
}
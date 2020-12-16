Conference.seed(
  {
    id: 1,
    name: "Test Event Autumn 2020",
    abbr: "tea2020",
    status: 2, # closed
  },
  {
    id: 2,
    name: "Test Event Winter 2020",
    abbr: "tew2020",
    status: 1, # opened
  },
  {
    id: 3,
    name: "Test Event Summer 2021",
    abbr: "tes2021",
    status: 0, # registered
  },
)

Speaker.seed(
  {
    id: 1,
    name: "クラウド 太郎",
    email: "cloud_taro@example.com"
  },
  {
    id: 2,
    name: "ネイティブ 二郎",
    email: "native_jiro@example.com"
  }
)
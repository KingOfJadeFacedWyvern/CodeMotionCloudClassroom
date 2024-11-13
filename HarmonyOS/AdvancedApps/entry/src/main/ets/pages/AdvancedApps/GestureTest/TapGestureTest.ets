
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct TapGestureTest {
  build () {
    Column () {
      Text ('双击触发事件')
        .fontSize (35)
        .gesture (
          TapGesture ({ count: 2 })
            .onAction (() => {
              promptAction.showToast ({ message: '检测到了双击屏幕' })
            })
        )

    }
    .width (300)
    .height (300)
    .padding (20)
    .borderWidth (3)
    .margin (30)
  }
}
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct PanGestureTest {
  @State
  offsetX: number = 0
  offsetY: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions( { direction: PanDirection.Left | PanDirection.Right })

  build () {
    Column () {
      Column () {
        Text (`位置:X:${this.offsetX},Y:${this.offsetY}`)
          .fontSize (30)
      }
      .width (300)
      .height (300)
      .padding (20)
      .borderWidth (3)
      .margin (30)
      .gesture (
        PanGesture (this.panOption)
          .onActionStart (() => {
            promptAction.showToast ({ message: '检测到手动事件' })
          })
          .onActionUpdate ((event: GestureEvent) => {
            this.offsetX = event.offsetX
            this.offsetY = event.offsetY
            promptAction.showToast ({ message: '拖动手势' })

          })
          .onActionEnd (() => {
            promptAction.showToast ({ message: '结束' })

          })

      )
    }
    // .width (300)
    // .height (300)
    // .padding (20)
    // .borderWidth (3)
    // .margin (30)
  }
}

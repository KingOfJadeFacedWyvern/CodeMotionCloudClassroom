import promptAction from '@ohos.promptAction'

@Entry
@Component
struct LongPressGestureTest {
  @State cnt: number = 0

  build () {
    Column () {
      Text ('长按计数；' + this.cnt)
        .fontSize (35)
        .gesture (
          LongPressGesture ({ repeat: true })
            .onAction ((event: GestureEvent) => {
              if (event.repeat) {
                this.cnt++
              }
            })
            .onActionEnd (() => {
              this.cnt = 0
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
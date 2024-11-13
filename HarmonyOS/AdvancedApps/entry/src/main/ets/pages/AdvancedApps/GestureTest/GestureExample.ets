// 创建文件GestureExample.ets 这个案例中主要绍介页面刷新功能实现
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct GestureExample {
  @State
  OffsetY: number = 0
  text: string = '立即刷新'

  build () {
    Stack () {
      Row () {
        LoadingProgress ()
          .width (35)
          .aspectRatio (1)
        Text (this.text)
          .fontColor ('#878787')
          .margin ({ top: 7 })
      }
      .width ('100%')
      .height ('100%')
      .alignItems (VerticalAlign.Top)
      .justifyContent (FlexAlign.Center)
      .margin ({ top: 15 })

      Row () {
        Text (this.OffsetY.toString ())
          .margin ({ top: 5 })
      }
      .width ('100%')
      .height ('100%')
      .alignItems (VerticalAlign.Top)
      .justifyContent (FlexAlign.Center)

      .backgroundColor (Color.White)
      .translate ({ y: this.OffsetY })
      .gesture (
        PanGesture ()

          .onActionUpdate ((event: GestureEvent) => {
            if (event.offsetY > 0) {
              this.OffsetY = event.offsetY

            }
          })
            // 枪手刷新
          .onActionEnd (() => {
            // 判断 OffsetY是否超过100
            if (this.OffsetY > 100) {
              // 先动画回到100位置
              animateTo ({ duration: 500 } , () => {
                this.OffsetY = 100
                this.text = '正在刷新中。。。'
              })

              //   等待1秒。自动回弹，完成刷新
              setTimeout (() => {
                animateTo ({ duration: 500 } , () => {
                  this.OffsetY = 0
                  this.text = ''
                })
              } , 1000)
            } else {
              // 动画回弹
              animateTo ({ duration: 500 } , () => {
                this.OffsetY = 0
              })

            }
            setTimeout (() => {
              promptAction.showToast ({ message: '刷新成功' })

            } , 1000)
          })
      )

    }
    .width ('100%')
    .height ('100%')
    .backgroundColor ('#AAA')

  }
}
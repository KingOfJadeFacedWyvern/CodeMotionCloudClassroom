// 这个文件主要介绍画布如何创建画布

@Entry
@Component
struct CanvasTest {
  // 抗锯齿设置
  private settings: RenderingContextSettings = new RenderingContextSettings( true)
  // 第一步:创建画布实例Context
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D( this.settings)
  // 绘制图创，图片ImageBitmap对象
  private myimg = new ImageBitmap( 'images/message.svg')

  build () {
    Row () {
      Column () {

        // 第二步:创建画布
        Canvas (this.context)
          .width ('100%')
          .height ('100%')
          .backgroundColor ('#FFFB58')
          .onReady (() => {
            // this.context.fillRect (10 , 30 , 100 , 100)
            this.context.fillRect (100 , 100 , 100 , 100)

            // 设置旋转中心
            this.context.translate (100 , 100)
            // 画布图像旋转
            this.context.rotate (180 * Math.PI / 180)
            // 设置旋转中心
            this.context.translate (-50 , -50)
            // 绘制图像
            this.context.drawImage (this.myimg , 0 , 0 , 50 , 50)
          })
      }
      .width ('100%')
    }
    .height ('100%')
  }
}
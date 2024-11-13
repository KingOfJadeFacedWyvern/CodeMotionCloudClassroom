@Entry
@Component
struct TextClockPage {
  //抗锯齿设置
  private settings: RenderingContextSettings = new RenderingContextSettings( true)
  // 创建画布实例
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D( this.settings)
  // 绘制图片。创建ImageBitmap对象。时钟、分钟、秒钟
  private pneImage = new ImageBitmap( '/images/ic_clock_pan.png')
  private honrImage = new ImageBitmap( '/images/ic_hour_pointer.png')
  private minuteImage = new ImageBitmap( '/images/ic_minute_pointer.png')
  private secondImage = new ImageBitmap( '/images/ic_second_pointer.png')

  // 画面参数
  canvasSize = 252
  //时钟、分钟、秒钟对应的宽度
  pointerWidth = 8

  build () {
    Row () {
      Column () {
        Canvas (this.context)
          .width (this.canvasSize)
          .height (this.canvasSize)
          .backgroundColor ('#CCC')
          .onReady (() => {
            // 绘制表盘
            this.context.drawImage (this.pneImage , 0 , 0,this.canvasSize,this.canvasSize)
            // 绘制时针　↓
            //设置旋转顶点
            this.context.translate (this.canvasSize/2+this.pointerWidth/2,this.canvasSize/2)
            //画面.画面旋转
            this.context.rotate (180 * Math.PI / 180)
            //设置旋转中心
            this.context.translate (0 , -this.canvasSize/2)

            // 绘制时针
            this.context.drawImage (this.honrImage, 0 , 0,this.pointerWidth,this.canvasSize)
            //设置旋转中心
            this.context.translate (this.canvasSize/2,this.canvasSize/2)
            // //绘制图片
            // this.context.drawImage (this.pneImage , 0 , 0)
          //   绘制时针　↑

          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
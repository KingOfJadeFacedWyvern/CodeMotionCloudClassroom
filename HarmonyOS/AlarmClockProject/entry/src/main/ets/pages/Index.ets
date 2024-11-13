import { CanvasComp } from '../components/CanvasComp'
import { ClockItemComp } from '../components/ClockItemComp'
@Entry
@Component
struct Index {
  build () {
    Stack ({ alignContent: Alignment.Bottom }) {
      Column ({space: 15}) {
        //闹钟
        Text('Alarm CLock')
          .fontSize(24)
          .width ('100%')

        //表盘
        CanvasComp()

        //闹钟管理
        ForEach([1,2,3],()=>{
          ClockItemComp()
        })
      }
      .width('100%')
      .height('100%')
      .padding(15)
      .backgroundColor ('#F5F5F5')
      //加号
      Text('+')
        .width(50)
        .aspectRatio(1)
        .backgroundColor ('#05F')
        .fontSize(40)
        .fontWeight(200)
        .fontColor('#FFF')
        .textAlign(TextAlign.Center)
        .borderRadius(50)
        .margin ({ bottom: 50})


    }
  }
}
// 这个文件主要介绍手机和平板下拉系统消息通知，按下按钮Add Notification并且进入后台，手机和平板通知区域能进入这个程序
import notificationManager from '@ohos.notificationManager'
import WantAgent from '@ohos.app.ability.wantAgent'

@Entry
@Component
struct NotificationPage {
  notifiyId = 100

  build () {
    Row () {
      Column () {
        Button ('Add Notification')
          .margin ({ bottom: 5 })
          .onClick (async () => {
            // 定义wantAgent对象
            const want = await WantAgent.getWantAgent ({
              // 跳转信息
              wants: [
                {
                  bundleName: 'com.example.codemotioncloudclassroom' , //跳转应用
                  abilityName: 'EntryAbility' //Ability名称
                }
              ] ,
              //   打开一个有页面的Ability
              operationType: WantAgent.OperationType.START_ABILITY ,
              requestCode: 0 //请求
            })
            //   创建通知请求对象
            const myrequest: notificationManager.NotificationRequest = {
              //   通知ID
              id: this.notifiyId ,
              //   通知内容
              content: {
                //   通知类型
                contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT ,

                // 通知内容
                normal: {
                  title: '温馨提醒' ,
                  text: '已发货'
                }

              } ,
              //   跳转应用 wantAgent对象
              wantAgent: want


            }

            //   发送通知
            notificationManager.publish (myrequest)
          })
        Button ('Cancel Notification')
          .onClick (() => {
            notificationManager.cancel (this.notifiyId)
          })
      }
      .width ('100%')
    }
    .height ('100%')
  }
}
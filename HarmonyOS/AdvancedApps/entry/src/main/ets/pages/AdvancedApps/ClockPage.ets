import reminderAgentManager from '@ohos.reminderAgentManager'
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct ClockPage {
  reminderId = null //定义闹钟ID
  build () {
    Row () {
      Column ({ space: 11 }) {
        Button ('App Clock')
          .onClick (async () => {
            //   定义一个提醒对象ReminderAgentManager
            const MyReminderAgent: reminderAgentManager.ReminderRequestAlarm = {
              //   设置闹钟提醒
              reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM ,
              //   闹钟提醒小时
              hour: 1 ,
              //   闹钟提醒的分钟
              minute: 10 ,

              //   设置提醒的操作按钮
              actionButton: [
                {
                  title: 'Stop Alarm Clock' ,
                  type: reminderAgentManager.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE
                },
                {
                  title: 'Delay Reminder' ,
                  type: reminderAgentManager.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE
                }
              ] ,
              //   延迟提醒设置
              snoozeTimes: 2 , //延迟提醒2次
              timeInterval: 10 * 60 , //延迟提醒间隔时间，单位秒
              //   闹钟长时，单位秒
              ringDuration: 60 ,
              // 点击提醒跳转的目标应用
              wantAgent: {
                pkgName: 'com.example.codemotioncloudclassroom' ,
                abilityName: 'EntryAbility'
              }


            }
            //   发布提醒
            this.reminderId = await reminderAgentManager.publishReminder (MyReminderAgent)
            promptAction.showToast ({ message: 'App AlarmClock Success' })

          })
        Button ('Cancel Clock')
          .onClick (async () => {
            //     取消指定ID的闹钟
            await reminderAgentManager.cancelReminder (this.reminderId)
            // 显示提示信息
            promptAction.showToast ({ message: 'Cancel AlarmClock Success' })

          })
      }
      .width ('100%')
    }
    .height ('100%')
  }
}
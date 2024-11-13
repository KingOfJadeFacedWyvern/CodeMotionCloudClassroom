import { Student , StudentStore } from './Entity'

@Entry
@Component
struct PreferencePage {
  studentStore: StudentStore
  @State
  message: string = '学生的信息'
  student: Student = {}

  build () {
    Row () {
      Column ({ space: 15 }) {
        Text (this.message)
        Button ('获取数据')
          .onClick (() => {
            this.studentStore = new StudentStore()
            this.studentStore.getStudent ().then ((student) => {
              // this.student = student
            })
          })
        Button ('修改数据')
          .onClick (() => {

          })
        Button ('删除数据')
          .onClick (() => {

          })

      }
      .width ('100%')
    }
    .height ('100%')
  }
}
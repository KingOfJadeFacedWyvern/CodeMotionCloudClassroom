/*
 * Preference 持久化实例
 */
import preferences from '@ohos.data.preferences'

export class Student {
  id?: number
  name?: string
  age?: number
}

export class StudentStore {
  Key = 'studentInfo'
  //   从首选项中获取存储数据信息
  getPreferences () {
    return preferences.getPreferences (getContext (this) , 'studentStoreFile')
  }
  //   修改信息
  async SetStudent (student: Student) {
    //   异步获取Preferences存储信息
    const persistStudentData = await this.getPreferences ()
    //   存储值
    persistStudentData.put (this.Key , JSON.stringify (student))
    //   持久化刷新
    persistStudentData.flush ()
  }
  //   获取信息
  async getStudent () {
    //   异步获取Preferences存储信息
    const persistStudentData = await this.getPreferences ()
    // 获取Key对应的值
    const studentstr = await persistStudentData.get (this.Key , '{}')

    //   str转换成对象并返回
    const studentObj = JSON.parse (studentstr as string) as String
    return studentObj
  }
  //   删除信息.
  async delStudent () {
    //   异步获取Preferences存储信息
    const persistStudentData = await this.getPreferences ()
    //   异步删除
    await persistStudentData.delete (this.Key)

    //   持久化
    persistStudentData.flush ()
  }
}

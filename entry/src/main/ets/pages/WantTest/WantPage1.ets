import { common, Want } from '@kit.AbilityKit';
import Logger from '../../common/utils/Logger';

@Entry
@Component
struct WantPage1 {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Button("夸应用切换")
        .onClick(()=>{

          let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

          let want: Want ={
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.example.wanttest2',
            abilityName: 'EntryAbility',
            moduleName: 'entry', // moduleName非必选
          }
          context.startAbility(want).then(()=>{
            Logger.debug("启动了新的")
          }).catch(()=>{
            Logger.debug("启动了出错了")
          })
        })

      Button("应用内部启动")
        .onClick(() => {
          let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

          let want: Want ={
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.example.myapplication1',
            abilityName: 'TestAbility',
            moduleName: 'entry', // moduleName非必选
          }
          context.startAbility(want).then(()=>{
            Logger.debug("启动了组建内的")
          }).catch(()=>{
            Logger.debug("启动了出错了")
          })
      })
    }
    .height('100%')
    .width('100%')
  }
}
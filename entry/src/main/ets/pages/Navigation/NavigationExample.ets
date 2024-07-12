/*
* Copyright (C) 2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import {  DialogUtil ,TipsUtil,ToastUtil} from '@yunkss/eftool'
import Logger from "../../common/utils/Logger"




@Entry
@Component
@Preview
struct NavigationExample {
  pageInfos: NavPathStack = new NavPathStack();
  @State showTips: boolean = false;

  build() {

    Navigation(this.pageInfos) {
      TipsUtil({
        options: {
          show: this.showTips,
          content: '请仔细阅读请仔细阅读请仔细阅读请仔细阅读请仔细阅读请仔细阅读请仔细阅读请仔细阅读请仔细阅读xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
          clickCallBack: (index, isChecked) => {
            ToastUtil.showToast(index === 0 ? '点击了第一个按钮' + isChecked : '点击了第二个按钮' + isChecked);
            this.showTips = false;
          }
        }
      });
      Column({ space: 12 }) {
        Text("首页")
          .fontSize("15")
          .width("100%")
          .height('20vp')
          .fontColor(Color.Black)
        Button("芜湖芜湖")
          .onClick(()=>{
            this.showTips=!this.showTips;
            DialogUtil.showDialog({
              msg:"芜湖",
              okCallBack: ()=>{
                Logger.debug("确定")
              },
              okText: '揍你',
              cancelText: '去吧',
              cancelCallBack: ()=>{
                Logger.debug("取消","取消")
              }
            })


          })
          .width("100%")
          .height('20vp')

        Button('第一个页面', { stateEffect: true, type: ButtonType.Capsule })
          .width("100%")
          .height('20vp')
          .onClick(() => {
            //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
            this.pageInfos.pushPathByName('pageOne', null);
          })
        Button('第二个页面', { stateEffect: true, type: ButtonType.Capsule })
          .width("100%")
          .height('20vp')
          .onClick(() => {
            //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
            this.pageInfos.pushPathByName('pageTwo', null);
          })

      }
      .width($r('app.string.navDestination_width'))
      .height($r('app.string.navDestination_height'))
      .justifyContent(FlexAlign.End)
      .padding({
        bottom: $r('app.string.column_padding'),
        left: $r('app.string.column_padding'),
        right: $r('app.string.column_padding')
      })
    }
    .title($r('app.string.entry_index_title'))
  }
}
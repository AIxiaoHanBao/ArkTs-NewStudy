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

  import Logger from '../../common/utils/Logger';

  @Builder
  export function PageTwoBuilder(name: string, param: Object) {
    PageTwo()
  }

  const COLUMN_SPACE: number = 12;

  @Component
  export struct PageTwo {
    pageInfos: NavPathStack = new NavPathStack();

    build() {
      NavDestination() {

        Column({ space: 10 }) {
          Text("第2个页面")
            .fontSize("15")
            .width("100%")
            .height('20vp')
            .fontColor(Color.Black)

          Button("返回首页", { stateEffect: true, type: ButtonType.Capsule })
            .width("100%")
            .height('20vp')
            .onClick(() => {
              this.pageInfos.clear(); //Clear all pages in the stack
            })
          Button("第一个页面", { stateEffect: true, type: ButtonType.Capsule })
            .width("100%")
            .height('20vp')
            .onClick(() => {
              //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
              this.pageInfos.pushPathByName('pageOne', null);
            })

          Button("第二个页面", { stateEffect: true, type: ButtonType.Capsule })
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
      .title('entry-pageTwo')
      .onReady((context: NavDestinationContext) => {
        this.pageInfos = context.pathStack
        Logger.info('current page config info is ' + JSON.stringify(context.getConfigInRouteMap()));
      })
    }
  }
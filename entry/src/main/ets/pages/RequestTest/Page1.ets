import Logger from '../../common/utils/Logger';
import { http } from '@kit.NetworkKit';

@Entry
@Component
struct Page1 {
  @State message: string = 'Hello World';

  build() {
   Column(){
     Text("测试")

     Button("发送请求").onClick(()=>{
       Logger.debug("Hello World","wuhu")




     })
   }
    .height('100%')
    .width('100%')
  }
}
import { AbilityConstant, AbilityStage, Want } from '@kit.AbilityKit';
import Logger from '../common/utils/Logger';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    // 应用的HAP在首次加载的时，为该Module初始化操作
    Logger.debug("系统日志","测试AbilityStage")

  }

  onAcceptWant(want: Want): string {
    // 仅specified模式下触发
    Logger.debug("系统日志","切换了UIAbility")

    return 'MyAbilityStage';
  }






  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    // 根据系统可用内存的变化情况，释放不必要的内存
  }


}
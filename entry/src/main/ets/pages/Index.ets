@Entry
@Component
@Preview
struct Index {
  @State message: string = 'Hello World123';
  //创建页面栈
  pageStack: NavPathStack = new NavPathStack()

  build() {
    Column(){
      Navigation(this.pageStack){
        Column(){
         Button("123").onClick(()=>{
           this.pageStack.pushPathByName('pageOne', null); })
          Button("456").onClick(()=>{
            this.pageStack.pushPathByName('pageOne', null);
          })
        }
      }
    }

    }

}
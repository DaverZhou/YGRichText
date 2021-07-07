# YGRichText
链式设置富文本！
可以自由组合成对应的富文本效果，省去多个方法的定义。

[Swift 版本](https://github.com/DaverZhou/YGRichText_Swift/tree/master)

### 导入
支持pod 导入
```
pod 'YGRichText'
```
或者手动导入`YGRichText`文件夹内的类即可。

### 使用
导入头文件
```
#import "YGRichText.h"
```
代码中调用:
```
    textView.attributedText = [@"hello world, this is rich text test~" yg_makeAttributed:^(YGAttributedMaker *make) {
        make.font([UIFont systemFontOfSize:17]).allRange();
        make.foregroundColor(UIColor.redColor).allRange();
        make.strikethroughStyle(4).allRange();
        make.underlineStyle(4).underlineColor(UIColor.blueColor).allRange();
        make.strokeWidth(4).strokeColor(UIColor.blackColor).allRange();
        make.textAlignment(NSTextAlignmentCenter).kern(10).lineSpacing(10).lineBreakMode(NSLineBreakByCharWrapping).allRange();
        make.appendString(self.string);
    }];
```
**注意**：每一个属性设置结束后请以`allRange()`或者`inRange()`结束，方可生效！！！

插入图片
```
    label.attributedText = [@" 会员" yg_makeAttributed:^(YGAttributedMaker *make) {
        make.insertImage([UIImage imageNamed:@"image_name"], CGRectMake(0, -1, 12, 10), 0);
    }];
```
因为图文的富文本，是直接调用`insertAttributedString:atIndex:`的形式，可归纳为富文本拼接，无需调用`allRange()`或者`inRange()`即可生效。


### 说明
可能存在的问题，同个range分开设置`lineSpacing、textAlignment、lineBreakMode`，如下：
```
   make.textAlignment(NSTextAlignmentCenter).allRange();
   make.lineSpacing(10).allRange();
```
最后将只有写在最后的代码生效，例如上面的只有`lineSpacing`生效，覆盖了上方`textAlignment`的效果，如果需要同时设置`lineSpacing、textAlignment、lineBreakMode`,需要在同一个range中调用：
```
 make.textAlignment(NSTextAlignmentCenter).lineSpacing(10).lineBreakMode(NSLineBreakByCharWrapping).allRange();
```

### 联系
使用过程中如有问题欢迎留下你的issue。
[作者简书](https://www.jianshu.com/u/0a00afec8c29)



## Theme

![Foil.png](https://raw.githubusercontent.com/chenmingjia/Theme/master/Foil.png)

### 用法



### 示例
全局类注册(不推荐使用系统类)
```
Theme.register(UITabBar.self)
Theme.register(UINavigationBar.self)
```

实例注册
```
Theme.register(self.tableView, propertyName: "backgroundColor", level: ColorLevel.light)
Theme.register(button.titleLabel!, propertyName: "font", level: FontLevel.primary)
```

自定义样式主题
```

class CustomStyle: ThemeDesign {

    override init() {
        super.init()
        name = "magic"
        primaryColor = .yellow
        baseColor = .yellow
        baseTextColor = .yellow
        successColor = .yellow
        warningColor = .yellow
        lightColor = .yellow
        primaryFont = UIFont(name: "Arial", size: 50)!
    }
}

```

切换主题
```
Theme.switchStyle(.soft)

```

## Support
还有其他问题？





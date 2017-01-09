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

```

## Support
还有其他问题？





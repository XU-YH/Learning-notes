# vue项目nginx配置子目录访问

## 前言

现在有一个项目名为dccmp的vue前端项目，由 `localhost:80` 根目录的形式访问项目改为 `localhost:80/dccmp` 子目录访问

## vue配置

**vue.config.js**

```js
module.exports = {
  // 部署在子目录上这里的publicPath应为/子目录名称/
  publicPath: process.env.NODE_ENV === "production" ? "/dccmp/" : "/",
  outputDir: 'dist',
  assetsDir: 'static',
  ...
}
```

**router -> index.js**

```js
export default new Router({
   // 去掉url中的#
  mode: 'history',
  base: '/dccmp/',
  ...
})
```

## nginx配置

**nginx.conf**

```xml
server {
    listen       80;
    server_name  localhost;

    location /dccmp {
		# 若为root，则访问的是html/dccmp文件夹,这里会将子目录名（dccmp）加在root（html）的后面
        root   html;
		# 若为alias，则访问的是html/aaa文件夹。此方式可用于子目录名和项目存放文件夹名不同时使用，如aaa
		# alias  html/aaa;
		# 如果 URL 匹配不到任何静态资源，则应该返回同一个 index.html
        try_files $uri $uri/ /dccmp/index.html;
        index  index.html index.htm;
    }
}
```

[history模式](https://router.vuejs.org/zh/guide/essentials/history-mode.html)


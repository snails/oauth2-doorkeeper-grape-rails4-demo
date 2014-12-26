#Readme

#Versions

* Ruby 2.1.5
* Rails 4.1.8
* Grape 0.10.0
* Grape-entity 0.4.4
* rack-oauth2 1.0.9
* doorkeeper 2.0.1

截止2013年12月26日最新版

#Tutorial

1. <http://blog.yorkxin.org/posts/2013/10/10/oauth2-tutorial-grape-api-doorkeeper>
2. Grape Github主页说明文档
3. doorkeeper Github主页说明文档
4. rack-oauth2主页

#遇到的坑

1. Tutorial 1中doorkeeper是0.7.4版本的，现在已经跨越式发展到了2.0.1，改动比较大。原来的`Doorkeeper::AccessToken.authenticate`已经不可用，纠结半天，最后又翻越代码，搞定之。还有api_guard中的`find_token_string`方法已经失效，照例改之。
2. scope validate service中的validate方法有问题，因为配置文件中是`hash`构成的Array，而DB中查找出来的是String构成的Array，有坑。Ruby版本问题。
3. Install PostMan. thanks to GFW.

#Howto
1. run `bundle install`
2. run `db:migrate`
3. run `rails s`
4. You can see all the avariable api through the browser in `/api` path.

#Copyright &copy; DavidWei CC
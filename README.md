
1、构建dockerile镜像

docker build -t pbootcms:0.1 .

2、通过docker测试运行

docker run --name pboocms -d -p 80:80 pbootcms:0.1

3、推送镜像到镜像仓库

docker tag pbootcms:0.1 10.1.2.10:5000/pbootcms:0.1

docker push 10.1.2.10:5000/pbootcms:0.1

4、编写yml文件

5、编排服务运行在k8环境上面

kubectl apply pboot-cms-demo.yml

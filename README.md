# BUAAPhyhelper

一个北航实验报告小工具，全是垃圾代码，没什么好看的。

（如果你也写了脚本 欢迎fork和pr~）

## 近期更新

- 1021_1完成基本功能

## TODO

- 为1021_1添加不确定度计算。
- 重构1021_1。
- 重构1051_1部分，考虑自动舍入。
- **打印和计算分离**
- 模块化，重复代码写个库。

## FAQ

Q：为什么保留位数和书本不同？

A：我大部分数据都多打印了一些位数，请自行按照“四舍六入五取偶”来得到数据（因为我懒）。

Q：如果我用你的脚本报告扣分了怎么办？

A：本人对脚本产生的任何后果概不负责。

## 1051

### 1.自组电位差计（必做）

按照书本P165输入所有数据后就可以按照书本顺序计算出所有值。

### 测试

`python3 main.py < Test.txt`

和课本上的数据对照即可。

### 2.箱式电位差计测电池电动势

我没做XD。 

### 3.箱式电位差计测固定电阻

电路图略。

### 测试

`python3 main.py < Test.txt`

（其实没有正确答案

### 4.箱式电位差计测电表内阻

跟第二个一模一样的，不额外写了。

## 1021

垃圾仪器，要气死我了.jpg

### 1.测量冰的熔解热

#### 环境要求

**Octave**（别问我为什么）

如果一定要Matlab，请考虑用适当的积分函数替换cal_area.m中的quadv函数。

### 实验数据输入

如果要输入你的数据，应该保证以下四个文件和main.m同一目录。

#### const文件

- 环境温度对应的阻值R0（单位千欧）。
- 冰的温度T1，一般为-21℃。
- 水的质量m（单位克）。
- 杯子质量m1（单位克）。
- 搅拌棒质量m2（单位克）。
- 冰的质量M（单位克）。

最终输入应该为一个6x1的矩阵。

#### down、melt、up文件

分别对应降温、溶解、升温曲线的数据，要求两列，第一列为时间t，第二列为对应的阻值（单位千欧），说白了就是实验原始数据。

### 可控变量

目前只有两个可控变量

- precision 对应面积相等要求的精度
- step 对应搜索面积相等点时候的区间长度

推荐 precision ≈ 10*step。

### 最终输出

最终会输出对应的修正图像，L和K以及T2'和T3'。

![](http://a2.qpic.cn/psb?/V10hb9Qz3wPcMq/i2MSZX7D*cdJ2idIgAeub7yEZ0ePx0KLRlp0VFhvgBM!/b/dPkAAAAAAAAA&ek=1&kp=1&pt=0&bo=iASAAogEgAIDACU!&vuin=771644612&tm=1507989600&sce=60-1-1&rf=viewer_311)

### 注意

- 由于采用折线拟合，实际上计算会有很大的误差。
- K采用解微分方程后线性回归求得，可能跟以往处理不同。
- **代码非常非常垃圾**。

## 2.测量热功当量

还没写完。
# BrainFuckVirtualMachine

## 介绍

    ++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.

Brain fuck 的一个解释器/编译器 

这是一个图灵机, 执行BF的代码.

程序和数据虽然可以通过两个通道输入, 但是实际上最后都汇合到了一个通道(纸带上)

输出也是从纸带上输出的

理论上可以改变程序, 使得该虚拟机一直运行, 在运行完毕转为程序输入模式, 程序输入完毕后

输入结束符虚拟机转为工作态.

更多 brain fuck 的介绍[点击这里](https://baike.baidu.com/item/Brainfuck/1152785)

BF是图灵完备的计算机, 下一步升级目标:

1. 实现BF的自举
2. 在该虚拟机内实现c语言编译器与解释器

我已经实现了BF的内存调试功能, 具体方法看一下代码就知道了.

后面的图展示了调试时的内存(纸带)与堆栈空间的样子.

---------------

## 使用说明

该项目包含多个版本, 包括运行于WindowsNT的解释器以及编译器, MCU版本等(或许有). 请参考各自文件夹内的自述文档.

BF-GDB调试效果:

![BF-GDB调试效果](./pic/1.png)


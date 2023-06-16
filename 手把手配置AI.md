# 前提准备

安装 python  请至 [Python官网](https://www.python.org/downloads/release/python-3106/)下载的64位安装文件。`3.10.6``Python 3.10.6`,安装前务必勾选，将Python加到环境变量。 再按。`Add Python 3.10 to PATH``Install Now`



![image-20230616141410920](images\image-20230616141410920.png)

安装 git  [Git for Windows](https://gitforwindows.org/) 下载安装文件，一直下一步即可。

下载 安装显卡驱动程序 

Nvidia显示卡建议用 [Geforce Experience](https://www.nvidia.com/zh-tw/geforce/geforce-experience/)安装最新驱动，会顺便安装CUDA。 或者你想 [手动下载CUDA](https://developer.nvidia.com/cuda-downloads)也行。

AMD显示卡请用 [驱动程序自动检测工具](https://www.amd.com/zh-hant/support/kb/faq/gpu-131)安装显卡驱动。

Intel Arc显卡请安装 [WHQL](https://www.intel.com.tw/content/www/tw/zh/download/726609/intel-arc-iris-xe-graphics-whql-windows.html)驱动。





## 检查

输入以下指令，检查目前Python版本，输出应为3.10.6

```bash
python --version
```

Nvidia显示卡用户输入以下指令，确认CUDA是否有正确安装，输出应含有`nvcc: NVIDIA (R) Cuda compiler driver`

```bash
nvcc --version
```

Nvidia显卡用户输入以下指令，复制Stable Diffusion WebUI的储存库。 复制完成后保持终端机开着。

```bash
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

AMD显卡用户请用这个DirectML的分支：

```bash
git clone https://github.com/lshqqytiger/stable-diffusion-webui-directml.git
```

Intel Arc显卡用户请用这个DirectML的分支：

```bash
git clone https://github.com/Aloereed/stable-diffusion-webui-arc-directml.git
```

复制完成储存库后，桌面会多出文件夹。 如果你有下载模型，将刚刚下载的存档点模型放到文件夹。 这个文件夹可放入多个存档点模型文件。`stable-diffusion-webui``models\Stable-diffusion`

![image-20230616142112631](images\image-20230616142112631.png)

#  设定启动命令行参数
参考网站： [🖥️ 安装至Windows | Stable Diffusion WebUI使用手册（正体中文）|Ivon的部落格 (ivonblog.com)](https://ivonblog.com/posts/stable-diffusion-webui-manuals/installation/windows-installation/#4-設定啟動命令列引數)



# 前提准备



安装 python  请至 [Python官网](https://www.python.org/downloads/release/python-3106/)下载的64位安装文件。`3.10.6``Python 3.10.6`,安装前务必勾选，将Python加到环境变量。 再按。`Add Python 3.10 to PATH``Install Now`

![image-20230616141410920](images\image-20230616141410920.png)
=======



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
=======
## 设定启动命令行参数

如下图所示，对文件夹里面的按右键，以记事本打开（看不到.bat请点击文件管理视图 → 显示/隐藏 → 显示扩展名）`stable-diffusion-webui``webui-user.bat`

![img](images\windows-installation-6.webp)

接着您想要编辑这一行启动参数。`set COMMANDLINE_ARGS=`

若显卡VRAM在8GB以上，将替换成引数。`set COMMANDLINE_ARGS=``set COMMANDLINE_ARGS=--enable-insecure-extension-access`

显示卡VRAM小于等于4GB，将替换成引数。 加上的用意是为了限制VRAM占用。`set COMMANDLINE_ARGS=``set COMMANDLINE_ARGS=--medvram --opt-split-attention --enable-insecure-extension-access``--medvram`

电脑RAM（不是VRAM）小于等于8GB的话改替换为参数。 注意使用引数会让高阶显卡算图变很慢。`set COMMANDLINE_ARGS=--lowvram --opt-split-attention --enable-insecure-extension-access``--lowvram`

（下面的不加也可以）

加上可进一步减少VRAM占用，只支持Nvidia显卡。 加入减少使用VAE算出黑图的机率。`--xformers``--no-half-vae`

加上引数再开放防火墙7860串埠，即可用区域网络其他电脑的浏览器访问WebUI。`--listen`

加上引数则会产生一组Gradio网址，让你可以从外部网络或手机使用WebUI。 网址72小时后过期。`--share`

其余可用引数请见 [命令列引数](https://ivonblog.com/posts/stable-diffusion-webui-manuals/installation/command-line-arguments-and-settings/)

```
set COMMANDLINE_ARGS=--enable-insecure-extension-access  --xformers --no-half-vae
```

## 遇到问题

启动后：

![image-20230616204459524](images\image-20230616204459524.png)

github上issue  https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/9150

我是参考的这个

> > 同样的问题，这个有效果，但是有没有其他方法可以启动代理？我试着添加`set COMMANDLINE ARGS=--share`到webui-user.bat文件，但是没有用
>
> 我遇到了同样的问题。如果你不想关闭代理，你可以在命令参数中添加 --no-gradio-queue 作为[#9132 (comment)](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/9132#issuecomment-1488638956)中提到的解决方法，它对我有用。

我这边遇到同样的问题，加上上面描述的指令后，正常了



# 启动Stable Diffusion WebUI 

初次启动会下载好几GB的资料，请保持网路顺畅，不要开VPN。如果您所在的地方有网路审查干扰Github连线，请想办法找代理绕过。

回到终端机，输入以下指令启动SD WebUI：

```
cd stable-diffusion-webui
./webui-user.bat
```



初次启动会下载依赖套件，大概要等个30分钟安装。如果在此步骤遇到错误，请先看 [常见问题](https://ivonblog.com/posts/stable-diffusion-webui-manuals/installation/errors/)。

![image-20230616200727257](images\image-20230616200727257.png)

启动完成后会显示一组网址。执行程式时请勿关闭终端机。

![image-20230616200753872](images\image-20230616200753872.png)

用浏览器开启：`http://127.0.0.1:7860`就可进入图形界面了。执行程式时请勿关闭终端机，执行时若出错终端机也会输出讯息。



要关闭SD WebUI，在终端机按Ctrl+C终止，再关闭视窗。日后要启动SD WebUI，只要对资料夹里面的`webui-user.bat`按二下即可(不需要用系统管理员执行)。





# 模型下載網站

目前找Stable Diffusion与其衍生模型的网站主要就二个。

第一个是 [HuggingFace](https://huggingface.co/models?other=stable-diffusion)，中文俗称抱脸笑，可以说是人工智能界的Github。 Stable Diffusion背后用到的很多AI工具，如Transformer、Tokenizers、Datasets都他们开发的，网站上也有丰富的教学文档。

另一个是 [Civitai](https://civitai.com/)，专门用来分享Stable Diffusion相关的资源，特色是模型都有示范缩图，用户也可以分享彼此使用的提示词，以及分享作品。



# 文生图



# 补充功能

## 汉化

- 正体中文扩充功能来源： [benlisquare/stable-diffusion-webui-localization-zh_TW](https://github.com/benlisquare/stable-diffusion-webui-localization-zh_TW)
- 简体中文扩充功能来源： [dtlnor/stable-diffusion-webui-localization-zh_CN](https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN)

Stable Diffusion WebUI可以透过扩充功能将界面变成中文。如果您想协助翻译，请点选以上的Github储存库连结，帮帮他们。

- 进入Extensions页面，取消勾选`localization`，再点选`Load from:`，找到`zh_TW Localization`或`zh_CN Localization`，点选Install。

之后重启WebUI，界面就会变成中文了。

由于SD WebUI的扩充功能发展太快，翻译可能跟不上，建议另外安装双语对照 [sd-webui-bilingual-localization](https://github.com/journey-ad/sd-webui-bilingual-localization)，同时显示中文和英文的文字，这样看教学时就不会找无按钮了。

双语扩充功能安装方法：在Extensions页面按`Install from URL`，填入`https://github.com/journey-ad/sd-webui-bilingual-localization`，再按`Install`。

![img](images\localizations-1.webp)



- 到Settings页面，找到左边的Localization，点选`zh-tw`或`zh-cn`，再点选`Apply Settings`。 之后重启WebUI，界面就会变成中文了。

![img](images\localizations-2.webp)

- 由于SD WebUI的扩充功能发展太快，翻译可能跟不上，建议另外安装双语对照 [sd-webui-bilingual-localization](https://github.com/journey-ad/sd-webui-bilingual-localization)，同时显示中文和英文的文字，这样看教学时就不会找无按钮了。双语扩充功能安装方法：在Extensions页面按`Install from URL`，填入`https://github.com/journey-ad/sd-webui-bilingual-localization`，再按`Install`。
- 在启用双语扩充功能前，要到Settings → User interface → Localization设为None再重启WebUI才会生效。

![img](images\localizations-3.webp)



## 安装扩充功能

注意：安装扩充功能可能会导致Stable Diffusion WebUI无法启动，或是启动变慢。

如果遇到bug，您应当优先到扩充功能开发者的储存库回报，而非直接到AUTOMATIC1111的储存库询问。

- 用图形界面安装 

   您必须在 [命令列引数](https://ivonblog.com/posts/stable-diffusion-webui-manuals/installation/command-line-arguments-and-settings/)加入`--enable-insecure-extension-access`才能从图形界面装扩充功能。

​    最简单的方法就是点选Extensions → Available的`Load from:`，就会列出可下载安装的扩充功能，点选安装。

![img](images\how-to-install-extensions-1.webp)

  有些比较新的扩充功能则是要您复制Github储存库网址，并点选选Extensions → `Install from URL`，贴上网址再按Install，它会自动完成git clone的操作。

  在安装扩充功能后，都要点选Installed → Apply and restart WebU，重新载入网页界面。有些则是得关掉终端机，重新启动WebUI。

  如果未来要更新扩充功能，点选Installed → Check for updates，等待下载完成，然后重启WebUI。您可以在这个界面按取消打勾来停用特定的扩充功能。

- 用指令安装

Stable Diffusion WebUI的扩充功能目录一律放在`extensions`资料夹。

1. 用指令安装扩充功能前先关闭主程式。

2. 接着在`stable-diffusion-webui/extensions`资料夹开启终端机，执行`git clone`指令，安装扩充功能。例如要安装正体中文翻译的话就是把该储存库复制下来：

   ```bash
   git clone https://github.com/benlisquare/stable-diffusion-webui-localization-zh_TW.git
   ```

    

3. 重新启动SD WebUI，即会看到新安装的扩充功能。

​          未来要一次更新全部扩充功能的话，在`stable-diffusion-webui/extensions`资料夹开启终端机，执行以下指令：

```bash
# Linux
ls | xargs -I{} git -C {} pull

# Windows
Get-ChildItem | ForEach-Object { git -C $_.FullName pull }
```

- 如何移除扩充功能 

1. 关闭Stable Diffusion WebUI的终端机。
2. 到`stable-diffusion-webui`下的`extension`资料夹，将要移除的扩充功能资料夹删除。
3. 如果要完全移除扩充功能，将`stable-diffusion-webui`下的`venv`资料夹也删除，迫使主程式下次启动重新安装pip依赖套件。

## ControlNet 按照骨架画图

- 扩充功能来源： [Mikubill/sd-webui-controlnet](https://github.com/Mikubill/sd-webui-controlnet)
- ControlNet的储存库： [lllyasviel/ControlNet](https://github.com/lllyasviel/ControlNet)

目前版本：ControlNet v1.1

ControlNet是通过加入额外条件来控制扩散模型的神经网路结构，它可以让AI参考给定图片的动作/线条/景深，更精准的生成图片。

跟内建的「图生图」技术比起来，ControlNet的效果更好，能让AI以指定动作生图；再搭配3D建模作为辅助，能缓解单纯用文生图手脚、脸部表情画不好的问题。

ControlNet的用法还有：上传人体骨架线条，ControlNet就能按骨架的动作生成完稿的人物图片。或是上传素色的3D建模，让ControlNet彩现成为室内布置家具。

Lvmin Zhang是ControlNet原始程式的开发者，Mikubill则是开发扩充功能，让我们可以在Stable Diffusion WebUI用ControlNet生图。

### 安装ControlNet与下载模型 [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#1-安裝controlnet與下載模型)

1. 切换至Extensions页面，点选`Install From URL`，URL输入`https://github.com/Mikubill/sd-webui-controlnet.git`，按下Install，接着从终端机按CTRL＋C，关闭Stable Diffusion WebUI。
2. 到 [lllyasviel/ControlNet v1.1](https://huggingface.co/lllyasviel/ControlNet-v1-1/tree/main)下载以`.pth`结尾的模型档，全部档案加起来约18GB。`.yaml`档不需要下载。目前v1.1是测试版，之后会合并回 [主储存库](https://huggingface.co/lllyasviel/ControlNet)。

   ![img](images\controlnet-1.webp)

3. 将这些模型档放到`stable-diffusion-webui/extensions/sd-webui-controlnet/models`资料
4. 重新启动Stable Diffusion WebUI。

### 各个模型的用途 

 ControlNet现有以下模型，您可以按照需求只下载需要的模型。

-  Anime Lineart 

侦测线条，生成的图片亦会保留原始的线条，适合处理动漫图像

- Canny 

侦测图片边缘，比较模糊，不如Scribbles完整。

-    Depth

侦测输入图片的深度图(depth map)。

- Illumination

侦测输入图片的光源与照明效果。

- Inpaint 

功能类似「内补绘制」，使用50%随机遮罩＋50%随机光流遮罩训练而成。

- Instruct Pix2Pix 

模型档名为`ip2p`，类似「图生图」，但是使用训练50%的指示(instruction)提示词和50%的叙述(description)提示词训练而成。因为是ControlNet，使用此模型时不需要调整CFG Scale。

根据原作者的说法，此模型在下「使其成为X」的提示词所生成的图，效果比「使Y成为X」要好。

> Also, it seems that instructions like “make it into X” works better than “make Y into X”.

- Lineart

侦测线条，适合处理线稿，生成的图片亦会保留原始的线条。

- M-LSD 

侦测输入图片的直线。

- Normalbae

- Openpose 

使用OpenPose技术侦测输入图片人物的动作，不一定会保留线条。

- Scribbles 

侦测线条，侦测到的线条品质介于Soft Edge和Lineart之间。

- Segmentation 

模型档名为`seg`，将侦测的图片物件切成一个一个色块处理，例如房子一个色块，后面的天空一个色块。

- Shuffle 

把输入图片的概念转移到生成的图片。

- Soft Edge 

侦测图片边缘，效果较为柔和，像用炭笔涂过。

- Tile

输入图片，选取一个区域，使其变清晰的模型。

### 参数解说

在安装之后，WebUI的界面会多出"ControlNet"的按钮。

![img](images\controlnet-2.webp)

点开会看到以下选项：

#### Single Image [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#single-image)

上传单张图片。

#### Batch [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#batch)

处理多张图片。Input Directory填写的是待处理的图片所在路径。

#### Open New Canvas [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#open-new-canvas)

清除图片，开一张新画布。

#### 使用电脑镜头 [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#使用電腦鏡頭)

在Open New Canvas的选项下面有四个按钮。

![img](images\controlnet-3.webp)

由左到右：新增画布；使用电脑镜头拍照上传；未知；还原上次算图设定。

#### Enable [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#enable)

在生图时启用ControlNet，必选。

#### Low VRAM [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#low-vram)

生图使用ControlNet会吃更多VRAM，此选项可降低VRAM使用量。

#### Pixel Perfect [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#pixel-perfect)

由ControlNet自动决定Preprocessor解析度。

#### Allow Preview [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#allow-preview)

允许预览生图结果，会显示该模型侦测的线条或骨架。

#### Preprocessor 预处理器 [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#preprocessor-預處理器)

通常Preprocessor和Model二者要一致。

Preprocessor是先将上传的图片处理过一轮，例如`Scribbles`会将彩色图片转成线稿。若图片的线条是白底黑线，且不是用WebUI画布所绘制，则Preprocessor必须选取"Invert"。

如果你的图片不需要处理，Preprocessor可留空。

#### Run Preprocessor (爆炸图示) [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#run-preprocessor-爆炸圖示)

执行预处理器，预先处理图片。

#### Model 模型 [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#model-模型)

设定生图的时候使用哪个ControlNet模型。

#### Control Weight [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#control-weight)

ControlNet在生图时的权重。

#### Starting Control Step [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#starting-control-step)

要让ControlNet开始参与生图的步数。

#### Ending Control Step [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#ending-control-step)

让ControlNet结束参与生图的步数。

#### Preprocessor Resolution [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#preprocessor-resolution)

预处理器的解析度。

如果不知道要设多少，请勾选"Pixel Perfect"让ControlNet自动为您决定。

#### Control Mode (Guess Mode) [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#control-mode-guess-mode)

控制生图时，要AI平衡二者(Balanced)，或是偏重你的提示词(My prompt is more important)，还是偏重ControlNet (ControlNet is more important)。

#### [Loopback] Automatically send generated images to this ControlNet unit [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#loopback-automatically-send-generated-images-to-this-controlnet-unit)

自动将生成的图片传回此ControlNet运算单元(unit)。

是的，如果您的电脑VRAM够大，您可以在Settings → ControlNet启用多个ControlNet运算单元。

#### Multi ControlNet [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#multi-controlnet)

一个ControlNet效果不够，您有没有想过启用第二、第三个ControlNet！？

预设安装后只会使用一个ControlNet，但是叠加多个有助于生成更好的图片。比方说同时使用Open Pose和Depth生成人体，并防止手画歪。

要启用Multi ControlNet，请进入Settings → ControlNet，拖动拉杆，设定要启用的ControlNet数量。

![img](images\controlnet-4.webp)

### 实际操作 [#](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/controlnet/#4-實際操作)

此处以改绘一个人物姿势为例子。

1. 在安装之后，WebUI的界面会多出"ControlNet"的按钮。

![img](images\controlnet-5.webp)

1. 进入文生图的页面填入提示词，接着点开下面ControlNet的界面，勾选`Enabled`启用ControlNet，上传图片。勾选LowVRAM可降低VRAM占用。

![img](images\controlnet-6.webp)

1. 接着选取要使用的Preprocessor和Model，二者要一致。

Preprocessor是先将上传的图片处理过一轮，例如`Scribbles`会将彩色图片转成线稿。如果你的图片不需要处理，则Preprocessor可留空。

![img](images\controlnet-7.webp)

1. 以Scribbles为例，选取后点选右上角Generate即会生成出结果，并附上侦测到的线条。如下图所示，右边贞德的姿势确实跟左边的02十分类似。

![img](images\controlnet-8.webp)

##  提示词自动补齐

- 扩充功能来源： [DominikDoom/a1111-sd-webui-tagcomplete](https://github.com/DominikDoom/a1111-sd-webui-tagcomplete)

输入提示词的时候提示相关Danbooru上的标签，画动漫图的时候很有用，还可以安装中文标签翻译

![img](images\a1111-sd-webui-tagcomplete-1.webp)

进入Extensions页面，点选`Install from URL`，输入网址`https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git`，按`Install`，之后重启WebUI。

如何安装标签中文翻译：到 [byzod/a1111-sd-webui-tagcomplete-CN](https://github.com/byzod/a1111-sd-webui-tagcomplete-CN)储存库，点选绿色的Code → Download ZIP，解压缩，得到tags资料夹，下面有`Tags-zh-full-pack.csv`和`config.json`这二个档案。将这二个档案移动到`stable-diffusion-webui/extensions/a1111-sd-webui-tagcomplete/tags`资料夹。



## 图片库浏览器 Image Browser

- 扩充功能来源： [yfszzx/stable-diffusion-webui-images-browser](https://github.com/yfszzx/stable-diffusion-webui-images-browser)

安装后即可方便浏览生图的结果，并查看使用过的提示词历史纪录。

安装方法：进入Extensions页面，点选Install from URL，输入`https://github.com/yfszzx/stable-diffusion-webui-images-browser.git`后按Install，重启WebUI。WebUI页面即会多出"Images Browser"的页面。

点进去，按一下First Page即会显示最近生图的结果。

![img](images\stable-diffusion-webui-images-browser-1.webp)
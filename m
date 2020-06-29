Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DDF20DBB4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 22:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgF2UIo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 16:08:44 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16980 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388510AbgF2UIY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jun 2020 16:08:24 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef9fecb0001>; Mon, 29 Jun 2020 07:46:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 29 Jun 2020 07:48:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 29 Jun 2020 07:48:13 -0700
Received: from [10.2.167.193] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 14:48:12 +0000
Subject: Re: [RFC PATCH v2 08/18] media: tegra-video: Enable TPG based on
 kernel config
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <robh+dt@kernel.org>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-9-git-send-email-skomatineni@nvidia.com>
 <f0f362e2-3748-5efe-b4a2-4ad344ae6a1e@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <91c70ed2-2a86-e99f-8dcb-73501a25b3d8@nvidia.com>
Date:   Mon, 29 Jun 2020 07:48:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f0f362e2-3748-5efe-b4a2-4ad344ae6a1e@xs4all.nl>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593441995; bh=mRHvcQYMUVmA9zSshngrK+5IlhrjxWXFrVsZZvga3QQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=WDO97jzJDKDQPttTd6AfzMo5VeIPv3djcwqFiAR1sFdr4QgvbndC8++vvqxNVLGo1
         OsKjCUnizT/a5uY4sBKu0uX5gyHXSPvDq6k1hp+Zv6PjSq8KpYHw5e78DSBVJpjpI0
         odO5XM/1WLMOHMvFQvGcGhzJwtZ1qTTFVUd1AggCKxVT1fPAw4AEcoC2K33DiGg1sh
         hV2TqaBgtksici/VBLyAgYNAcBUn01wsYIMyn+V1Bc/WtSfaeMIOBRRue8GRTQQi25
         jp4UM4ugJJGzgct7/3CFaSCfeZyMFcsOP1San1gWDtg9wdMoEETK2wEwcgVJ/Pyx4s
         3k2lLOuVLggAQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/29/20 2:28 AM, Hans Verkuil wrote:
> On 17/06/2020 03:41, Sowjanya Komatineni wrote:
>> Tegra internal TPG mode is only for Tegra vi and csi testing
>> without a real sensor and driver should default support real
>> sensor.
>>
>> So, This patch adds CONFIG_VIDEO_TEGRA_TPG and enables Tegra
>> internal TPG mode only when this config is selected.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/staging/media/tegra-video/Kconfig    |  6 +++++
>>   drivers/staging/media/tegra-video/csi.c      | 38 +++++++++++++++++++++++-----
>>   drivers/staging/media/tegra-video/tegra210.c |  6 +++++
>>   drivers/staging/media/tegra-video/vi.c       | 13 +++++++---
>>   drivers/staging/media/tegra-video/video.c    | 23 +++++++++--------
>>   5 files changed, 65 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
>> index f6c61ec..566da62 100644
>> --- a/drivers/staging/media/tegra-video/Kconfig
>> +++ b/drivers/staging/media/tegra-video/Kconfig
>> @@ -10,3 +10,9 @@ config VIDEO_TEGRA
>>   
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called tegra-video.
>> +
>> +config VIDEO_TEGRA_TPG
>> +	bool "NVIDIA Tegra VI driver TPG mode"
>> +	depends on VIDEO_TEGRA
>> +	help
>> +	  Say yes here to enable Tegra internal TPG mode
> This is not clear: if this is enabled, will the driver use TPG for
> ALL CSI ports? Or just for those that are not connected to anything?
> (i.e. the unused ports).
>
> I always assumed that the latter was intended, but it kind of looks from
> the code that this switches to TPG completely.
>
> It would also be nice if you can still use the TPG even for connected
> CSI ports by just setting the TEST_PATTERN control. I believe that's also what
> happens in the driver that is in the L4T tree.
>
> In any case, it is definitely not clear from this config description what
> it does.
>
> Regards,
>
> 	Hans

Same v4l2 test pattern control is used by sensor subdevices as well and 
we can't differentiate between Tegra Vs Sensor test patterns.

Current patches are based on our prior discussions where Tegra internal 
TPG is enabled for all channels/ports only when TPG Kconfig is set 
otherwise it will be for sensor capture based on the device graph.

To be clear, will update Kconfig description specifying all channels 
will be in TPG mode only when TPG Kconfig is set otherwise media links 
are purely based on the device graph from DT.

Thanks

Sowjanya

>
>> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
>> index 40ea195..fb667df 100644
>> --- a/drivers/staging/media/tegra-video/csi.c
>> +++ b/drivers/staging/media/tegra-video/csi.c
>> @@ -62,6 +62,9 @@ static int csi_enum_bus_code(struct v4l2_subdev *subdev,
>>   			     struct v4l2_subdev_pad_config *cfg,
>>   			     struct v4l2_subdev_mbus_code_enum *code)
>>   {
>> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>> +		return -ENOIOCTLCMD;
>> +
>>   	if (code->index >= ARRAY_SIZE(tegra_csi_tpg_fmts))
>>   		return -EINVAL;
>>   
>> @@ -76,6 +79,9 @@ static int csi_get_format(struct v4l2_subdev *subdev,
>>   {
>>   	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>>   
>> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>> +		return -ENOIOCTLCMD;
>> +
>>   	fmt->format = csi_chan->format;
>>   
>>   	return 0;
>> @@ -121,6 +127,9 @@ static int csi_enum_framesizes(struct v4l2_subdev *subdev,
>>   {
>>   	unsigned int i;
>>   
>> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>> +		return -ENOIOCTLCMD;
>> +
>>   	if (fse->index >= ARRAY_SIZE(tegra_csi_tpg_sizes))
>>   		return -EINVAL;
>>   
>> @@ -148,6 +157,9 @@ static int csi_enum_frameintervals(struct v4l2_subdev *subdev,
>>   	const struct tpg_framerate *frmrate = csi->soc->tpg_frmrate_table;
>>   	int index;
>>   
>> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>> +		return -ENOIOCTLCMD;
>> +
>>   	/* one framerate per format and resolution */
>>   	if (fie->index > 0)
>>   		return -EINVAL;
>> @@ -172,6 +184,9 @@ static int csi_set_format(struct v4l2_subdev *subdev,
>>   	const struct v4l2_frmsize_discrete *sizes;
>>   	unsigned int i;
>>   
>> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>> +		return -ENOIOCTLCMD;
>> +
>>   	sizes = v4l2_find_nearest_size(tegra_csi_tpg_sizes,
>>   				       ARRAY_SIZE(tegra_csi_tpg_sizes),
>>   				       width, height,
>> @@ -208,6 +223,9 @@ static int tegra_csi_g_frame_interval(struct v4l2_subdev *subdev,
>>   {
>>   	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>>   
>> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>> +		return -ENOIOCTLCMD;
>> +
>>   	vfi->interval.numerator = 1;
>>   	vfi->interval.denominator = csi_chan->framerate;
>>   
>> @@ -311,8 +329,12 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
>>   	subdev = &chan->subdev;
>>   	v4l2_subdev_init(subdev, &tegra_csi_ops);
>>   	subdev->dev = csi->dev;
>> -	snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s-%d", "tpg",
>> -		 chan->csi_port_num);
>> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>> +		snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s-%d", "tpg",
>> +			 chan->csi_port_num);
>> +	else
>> +		snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s",
>> +			 kbasename(chan->of_node->full_name));
>>   
>>   	v4l2_set_subdevdata(subdev, chan);
>>   	subdev->fwnode = of_fwnode_handle(chan->of_node);
>> @@ -405,11 +427,13 @@ static int tegra_csi_init(struct host1x_client *client)
>>   
>>   	INIT_LIST_HEAD(&csi->csi_chans);
>>   
>> -	ret = tegra_csi_tpg_channels_alloc(csi);
>> -	if (ret < 0) {
>> -		dev_err(csi->dev,
>> -			"failed to allocate tpg channels: %d\n", ret);
>> -		goto cleanup;
>> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
>> +		ret = tegra_csi_tpg_channels_alloc(csi);
>> +		if (ret < 0) {
>> +			dev_err(csi->dev,
>> +				"failed to allocate tpg channels: %d\n", ret);
>> +			goto cleanup;
>> +		}
>>   	}
>>   
>>   	ret = tegra_csi_channels_init(csi);
>> diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
>> index 3baa4e3..3492a8a 100644
>> --- a/drivers/staging/media/tegra-video/tegra210.c
>> +++ b/drivers/staging/media/tegra-video/tegra210.c
>> @@ -631,7 +631,11 @@ const struct tegra_vi_soc tegra210_vi_soc = {
>>   	.ops = &tegra210_vi_ops,
>>   	.hw_revision = 3,
>>   	.vi_max_channels = 6,
>> +#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
>>   	.vi_max_clk_hz = 499200000,
>> +#else
>> +	.vi_max_clk_hz = 998400000,
>> +#endif
>>   };
>>   
>>   /* Tegra210 CSI PHY registers accessors */
>> @@ -957,7 +961,9 @@ static const char * const tegra210_csi_cil_clks[] = {
>>   	"cilab",
>>   	"cilcd",
>>   	"cile",
>> +#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
>>   	"csi_tpg",
>> +#endif
>>   };
>>   
>>   /* Tegra210 CSI operations */
>> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
>> index d621ebc..0197f4e 100644
>> --- a/drivers/staging/media/tegra-video/vi.c
>> +++ b/drivers/staging/media/tegra-video/vi.c
>> @@ -565,6 +565,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
>>   {
>>   	int ret;
>>   
>> +#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
>>   	/* add test pattern control handler to v4l2 device */
>>   	v4l2_ctrl_new_std_menu_items(&chan->ctrl_handler, &vi_ctrl_ops,
>>   				     V4L2_CID_TEST_PATTERN,
>> @@ -576,6 +577,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
>>   		v4l2_ctrl_handler_free(&chan->ctrl_handler);
>>   		return chan->ctrl_handler.error;
>>   	}
>> +#endif
>>   
>>   	/* setup the controls */
>>   	ret = v4l2_ctrl_handler_setup(&chan->ctrl_handler);
>> @@ -918,10 +920,13 @@ static int tegra_vi_init(struct host1x_client *client)
>>   
>>   	INIT_LIST_HEAD(&vi->vi_chans);
>>   
>> -	ret = tegra_vi_tpg_channels_alloc(vi);
>> -	if (ret < 0) {
>> -		dev_err(vi->dev, "failed to allocate tpg channels: %d\n", ret);
>> -		goto free_chans;
>> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
>> +		ret = tegra_vi_tpg_channels_alloc(vi);
>> +		if (ret < 0) {
>> +			dev_err(vi->dev,
>> +				"failed to allocate tpg channels: %d\n", ret);
>> +			goto free_chans;
>> +		}
>>   	}
>>   
>>   	ret = tegra_vi_channels_init(vi);
>> diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
>> index 30816aa..e50bd70 100644
>> --- a/drivers/staging/media/tegra-video/video.c
>> +++ b/drivers/staging/media/tegra-video/video.c
>> @@ -60,15 +60,17 @@ static int host1x_video_probe(struct host1x_device *dev)
>>   	if (ret < 0)
>>   		goto unregister_v4l2;
>>   
>> -	/*
>> -	 * Both vi and csi channels are available now.
>> -	 * Register v4l2 nodes and create media links for TPG.
>> -	 */
>> -	ret = tegra_v4l2_nodes_setup_tpg(vid);
>> -	if (ret < 0) {
>> -		dev_err(&dev->dev,
>> -			"failed to setup tpg graph: %d\n", ret);
>> -		goto device_exit;
>> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
>> +		/*
>> +		 * Both vi and csi channels are available now.
>> +		 * Register v4l2 nodes and create media links for TPG.
>> +		 */
>> +		ret = tegra_v4l2_nodes_setup_tpg(vid);
>> +		if (ret < 0) {
>> +			dev_err(&dev->dev,
>> +				"failed to setup tpg graph: %d\n", ret);
>> +			goto device_exit;
>> +		}
>>   	}
>>   
>>   	return 0;
>> @@ -91,7 +93,8 @@ static int host1x_video_remove(struct host1x_device *dev)
>>   {
>>   	struct tegra_video_device *vid = dev_get_drvdata(&dev->dev);
>>   
>> -	tegra_v4l2_nodes_cleanup_tpg(vid);
>> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>> +		tegra_v4l2_nodes_cleanup_tpg(vid);
>>   
>>   	host1x_device_exit(dev);
>>   
>>

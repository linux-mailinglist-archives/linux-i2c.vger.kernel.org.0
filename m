Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1995F20E787
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 00:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404720AbgF2V5k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 17:57:40 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:60333 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404715AbgF2V5j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jun 2020 17:57:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pq5yjZgkq0MRapq61jPyw7; Mon, 29 Jun 2020 11:29:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593422943; bh=HG6aXa0G2/oL2YwtHy3gZbLqxOSMpxFnwk+kd5Lht7E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LQslp9z5ToBLh8Xspe/VcMIlqNlvL0wDyuxqQrSy0sYxcx4SjMBARBzmPp2b/mXJO
         ahIRiJPczRzP6fDFBsCp4e1kszT1DitQNxDRSIRM7k11f0+NeHiSxqNg+Xb6IJj0rK
         6MtdmbxuPuA6uuVUK01JgmQ5EDrhFL1EyR4sFmthYrUkwtHzyXV0+gn9cRsihwWgYh
         nf3L0SwaXNWEGW/tZfhzM3yWnzbmCSCphRCsrsl5JlnE7DnXmTHJiewRYmYqbZRwvc
         luDADAG7vIqS7Lr559JOv8zfpeabluaStg6OIa/mGdRplnqMjxyyZ5N72Ka0sCg+vo
         iwRHoO5pnEQrw==
Subject: Re: [RFC PATCH v2 08/18] media: tegra-video: Enable TPG based on
 kernel config
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc:     digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-9-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f0f362e2-3748-5efe-b4a2-4ad344ae6a1e@xs4all.nl>
Date:   Mon, 29 Jun 2020 11:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592358094-23459-9-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKkXLlR5hpfZJdFnd49TANoPwmUQ+5Xlsf+/kOTXOATIDj7u/gR8iNOwyKfLYxvURugNirOKE6DEVtqs48XFDgFdx6qriUZ2xKX4qkBqbKgvZoMmpijX
 Xkzn3p0ixS/u7QOhz00Ms1O2drJ01MohpuFxwQBNRAohGKycIaWaChyy7vjvU7FHZIzh7UicRMOg/0tGkm5HaIdVSXDZmJQoxOz4liitbhzMjFM2zbUnyPIJ
 jcBRc6WaNqsbkSxHffaRLMpGG0eN3Bw8YNjj9lmEFnJLqFY9gGr1UHtAB9osHeC7oMm5gkPs7eqokAavAQI9T6+uIhQPRgaT9kLZnTzIWq/hdFeAK9infQeo
 YUncUHqsLkOGfVh8BnvHjHbHS/YSHlU4KbYhxyralzi8UmqqaIF4mPgUS9PMbgLWVQYELJQVI3vFDQRBe+n8yN824Qq9Ech6RUXCyasPC0ae1tGIJANaWBbX
 s+StPVVHPks4BRihMV01KZklVJucFrwX33jKLcQB5SQP3pzLZV8DpEd9q2EjRqff7otc0I7InXyINCUlRBUIEtwirGk5kEFNx7Njngvjh/22TnVc1w92WZca
 j5h5fyts+ItWYkLyXbRzUcFj2jjTlAERAM5wGO5ECSBjrKUR5xcdENX93Dk6s5oKcft4C630sz+LqsBfLo41nbsE
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/06/2020 03:41, Sowjanya Komatineni wrote:
> Tegra internal TPG mode is only for Tegra vi and csi testing
> without a real sensor and driver should default support real
> sensor.
> 
> So, This patch adds CONFIG_VIDEO_TEGRA_TPG and enables Tegra
> internal TPG mode only when this config is selected.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/tegra-video/Kconfig    |  6 +++++
>  drivers/staging/media/tegra-video/csi.c      | 38 +++++++++++++++++++++++-----
>  drivers/staging/media/tegra-video/tegra210.c |  6 +++++
>  drivers/staging/media/tegra-video/vi.c       | 13 +++++++---
>  drivers/staging/media/tegra-video/video.c    | 23 +++++++++--------
>  5 files changed, 65 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
> index f6c61ec..566da62 100644
> --- a/drivers/staging/media/tegra-video/Kconfig
> +++ b/drivers/staging/media/tegra-video/Kconfig
> @@ -10,3 +10,9 @@ config VIDEO_TEGRA
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called tegra-video.
> +
> +config VIDEO_TEGRA_TPG
> +	bool "NVIDIA Tegra VI driver TPG mode"
> +	depends on VIDEO_TEGRA
> +	help
> +	  Say yes here to enable Tegra internal TPG mode

This is not clear: if this is enabled, will the driver use TPG for
ALL CSI ports? Or just for those that are not connected to anything?
(i.e. the unused ports).

I always assumed that the latter was intended, but it kind of looks from
the code that this switches to TPG completely.

It would also be nice if you can still use the TPG even for connected
CSI ports by just setting the TEST_PATTERN control. I believe that's also what
happens in the driver that is in the L4T tree.

In any case, it is definitely not clear from this config description what
it does.

Regards,

	Hans

> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
> index 40ea195..fb667df 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -62,6 +62,9 @@ static int csi_enum_bus_code(struct v4l2_subdev *subdev,
>  			     struct v4l2_subdev_pad_config *cfg,
>  			     struct v4l2_subdev_mbus_code_enum *code)
>  {
> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> +		return -ENOIOCTLCMD;
> +
>  	if (code->index >= ARRAY_SIZE(tegra_csi_tpg_fmts))
>  		return -EINVAL;
>  
> @@ -76,6 +79,9 @@ static int csi_get_format(struct v4l2_subdev *subdev,
>  {
>  	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>  
> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> +		return -ENOIOCTLCMD;
> +
>  	fmt->format = csi_chan->format;
>  
>  	return 0;
> @@ -121,6 +127,9 @@ static int csi_enum_framesizes(struct v4l2_subdev *subdev,
>  {
>  	unsigned int i;
>  
> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> +		return -ENOIOCTLCMD;
> +
>  	if (fse->index >= ARRAY_SIZE(tegra_csi_tpg_sizes))
>  		return -EINVAL;
>  
> @@ -148,6 +157,9 @@ static int csi_enum_frameintervals(struct v4l2_subdev *subdev,
>  	const struct tpg_framerate *frmrate = csi->soc->tpg_frmrate_table;
>  	int index;
>  
> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> +		return -ENOIOCTLCMD;
> +
>  	/* one framerate per format and resolution */
>  	if (fie->index > 0)
>  		return -EINVAL;
> @@ -172,6 +184,9 @@ static int csi_set_format(struct v4l2_subdev *subdev,
>  	const struct v4l2_frmsize_discrete *sizes;
>  	unsigned int i;
>  
> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> +		return -ENOIOCTLCMD;
> +
>  	sizes = v4l2_find_nearest_size(tegra_csi_tpg_sizes,
>  				       ARRAY_SIZE(tegra_csi_tpg_sizes),
>  				       width, height,
> @@ -208,6 +223,9 @@ static int tegra_csi_g_frame_interval(struct v4l2_subdev *subdev,
>  {
>  	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>  
> +	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> +		return -ENOIOCTLCMD;
> +
>  	vfi->interval.numerator = 1;
>  	vfi->interval.denominator = csi_chan->framerate;
>  
> @@ -311,8 +329,12 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
>  	subdev = &chan->subdev;
>  	v4l2_subdev_init(subdev, &tegra_csi_ops);
>  	subdev->dev = csi->dev;
> -	snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s-%d", "tpg",
> -		 chan->csi_port_num);
> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> +		snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s-%d", "tpg",
> +			 chan->csi_port_num);
> +	else
> +		snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s",
> +			 kbasename(chan->of_node->full_name));
>  
>  	v4l2_set_subdevdata(subdev, chan);
>  	subdev->fwnode = of_fwnode_handle(chan->of_node);
> @@ -405,11 +427,13 @@ static int tegra_csi_init(struct host1x_client *client)
>  
>  	INIT_LIST_HEAD(&csi->csi_chans);
>  
> -	ret = tegra_csi_tpg_channels_alloc(csi);
> -	if (ret < 0) {
> -		dev_err(csi->dev,
> -			"failed to allocate tpg channels: %d\n", ret);
> -		goto cleanup;
> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
> +		ret = tegra_csi_tpg_channels_alloc(csi);
> +		if (ret < 0) {
> +			dev_err(csi->dev,
> +				"failed to allocate tpg channels: %d\n", ret);
> +			goto cleanup;
> +		}
>  	}
>  
>  	ret = tegra_csi_channels_init(csi);
> diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
> index 3baa4e3..3492a8a 100644
> --- a/drivers/staging/media/tegra-video/tegra210.c
> +++ b/drivers/staging/media/tegra-video/tegra210.c
> @@ -631,7 +631,11 @@ const struct tegra_vi_soc tegra210_vi_soc = {
>  	.ops = &tegra210_vi_ops,
>  	.hw_revision = 3,
>  	.vi_max_channels = 6,
> +#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
>  	.vi_max_clk_hz = 499200000,
> +#else
> +	.vi_max_clk_hz = 998400000,
> +#endif
>  };
>  
>  /* Tegra210 CSI PHY registers accessors */
> @@ -957,7 +961,9 @@ static const char * const tegra210_csi_cil_clks[] = {
>  	"cilab",
>  	"cilcd",
>  	"cile",
> +#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
>  	"csi_tpg",
> +#endif
>  };
>  
>  /* Tegra210 CSI operations */
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index d621ebc..0197f4e 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -565,6 +565,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
>  {
>  	int ret;
>  
> +#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
>  	/* add test pattern control handler to v4l2 device */
>  	v4l2_ctrl_new_std_menu_items(&chan->ctrl_handler, &vi_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,
> @@ -576,6 +577,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
>  		v4l2_ctrl_handler_free(&chan->ctrl_handler);
>  		return chan->ctrl_handler.error;
>  	}
> +#endif
>  
>  	/* setup the controls */
>  	ret = v4l2_ctrl_handler_setup(&chan->ctrl_handler);
> @@ -918,10 +920,13 @@ static int tegra_vi_init(struct host1x_client *client)
>  
>  	INIT_LIST_HEAD(&vi->vi_chans);
>  
> -	ret = tegra_vi_tpg_channels_alloc(vi);
> -	if (ret < 0) {
> -		dev_err(vi->dev, "failed to allocate tpg channels: %d\n", ret);
> -		goto free_chans;
> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
> +		ret = tegra_vi_tpg_channels_alloc(vi);
> +		if (ret < 0) {
> +			dev_err(vi->dev,
> +				"failed to allocate tpg channels: %d\n", ret);
> +			goto free_chans;
> +		}
>  	}
>  
>  	ret = tegra_vi_channels_init(vi);
> diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
> index 30816aa..e50bd70 100644
> --- a/drivers/staging/media/tegra-video/video.c
> +++ b/drivers/staging/media/tegra-video/video.c
> @@ -60,15 +60,17 @@ static int host1x_video_probe(struct host1x_device *dev)
>  	if (ret < 0)
>  		goto unregister_v4l2;
>  
> -	/*
> -	 * Both vi and csi channels are available now.
> -	 * Register v4l2 nodes and create media links for TPG.
> -	 */
> -	ret = tegra_v4l2_nodes_setup_tpg(vid);
> -	if (ret < 0) {
> -		dev_err(&dev->dev,
> -			"failed to setup tpg graph: %d\n", ret);
> -		goto device_exit;
> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
> +		/*
> +		 * Both vi and csi channels are available now.
> +		 * Register v4l2 nodes and create media links for TPG.
> +		 */
> +		ret = tegra_v4l2_nodes_setup_tpg(vid);
> +		if (ret < 0) {
> +			dev_err(&dev->dev,
> +				"failed to setup tpg graph: %d\n", ret);
> +			goto device_exit;
> +		}
>  	}
>  
>  	return 0;
> @@ -91,7 +93,8 @@ static int host1x_video_remove(struct host1x_device *dev)
>  {
>  	struct tegra_video_device *vid = dev_get_drvdata(&dev->dev);
>  
> -	tegra_v4l2_nodes_cleanup_tpg(vid);
> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> +		tegra_v4l2_nodes_cleanup_tpg(vid);
>  
>  	host1x_device_exit(dev);
>  
> 


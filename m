Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D5C212556
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 15:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgGBNyx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 09:54:53 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33129 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729210AbgGBNyw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jul 2020 09:54:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qzfpjmz6o40yDqzfsjenTt; Thu, 02 Jul 2020 15:54:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593698089; bh=JXy9S9EFKh754KQxF9C4q8ICFD46pAeOzhR4AkdLf7o=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nwUoKSLUlNVqWjIvTY2WwOsi8/95XfDmCp7uCu1YsNQMvIXunqZwtbyr+4ODyUO6r
         gOxxgw3rLP5VnAOSNRdhdChlaRPq2uW+oFAvLiIavPbOL152SS2breZtyagqSULQV+
         ttO1Kclc7ivJYILY/XVmRpjeUHE2XRjGCcHBdWzdUortP0lf80JB47u93GRNbraIst
         b/9yOeoSBZyKheS/vfXT8GYLcUuKEpxYop+3sTAm/5fZPdTdQfAh8h00oSmVSUBnrT
         svGZc9Y76lh3qkXy8Tm8B6ogA2Dw8bzTP4dExaZZ9i+mMs25IejAHUjNAb+0JnqjDo
         3TYw8eP9n3YKw==
Subject: Re: [RFC PATCH v2 12/18] media: tegra-video: Add support for
 selection ioctl ops
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc:     digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-13-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <efc84cff-76d5-78a2-e84e-0342459d3756@xs4all.nl>
Date:   Thu, 2 Jul 2020 15:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592358094-23459-13-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPaR373dt6+A25Gd0pjQvnETJQ+BwEOViqqw20Lb16D1ffk7XoBWsLKAD6EthvNL8cp3aRBpVMzPdniOULqs5GG9Utp0ca5K3eTlcZhD3ezgt1LWVy3b
 Hg2X1pD2FROPXPI+0/GvEqillcMQkOv6bMT0TAHpODXYFHOoGmmxJUj/cTnnS8h3zdsuJOhSyzjd6UvAvhhvnuh83FE9WWV/eYRdVBgdsPUYDwJDgQ3+ejMG
 FVWzfSxsvbExj9Ojjb+eY3Qzt+R3qYLndSH9/Smo9wyU7KqAGCbitrjD4a9TuwTh1XKmQg0Ja+kfAoHFW4H8sLfJaJRfIDjIgAghOTt6UOoGDmCHWsrLeW5V
 UFc2u1BOZDn20rNipxT8Z2etP5Oh209YZx0gTH/2KPT8x6UAFQaGVB/FFJVHP/vfA9d/OHSYzJE0bPq0s0iP64cDrCzFus0UMlvubj2fnou3VCKZtOgtYBSO
 Clsz2Bu+GfmfV0VBVkF2+1QcI1UAjzHMfkU8OUl3gPzdmt7iPqKNH9LOVSz43nOBFxDnXvLAMXEni6CxeAqg0y7I7to22Pp7J/H821lnKNE29YsmDKaZpfTP
 rALXObO6fGopNeAhQvDHYnHXM9Wx3OTCVN4W4hsHT5AHhTLiGlSvQx0yYhcTStD6FiQ2PFp97JfVEh6D1m3lDAiZ
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/06/2020 03:41, Sowjanya Komatineni wrote:
> This patch adds selection v4l2 ioctl operations to allow configuring
> a selection rectangle in the sensor through the Tegra video device
> node.
> 
> Some sensor drivers supporting crop uses try_crop rectangle from
> v4l2_subdev_pad_config during try format for computing binning.
> 
> So with selection ops support, this patch also updates try format
> to use try crop rectangle either from subdev frame size enumeration
> or from subdev crop boundary.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 106 +++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 506c263..f9eb96b 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -427,6 +427,13 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>  	struct v4l2_subdev *subdev;
>  	struct v4l2_subdev_format fmt;
>  	struct v4l2_subdev_pad_config *pad_cfg;
> +	struct v4l2_subdev_frame_size_enum fse = {
> +		.which = V4L2_SUBDEV_FORMAT_TRY,
> +	};
> +	struct v4l2_subdev_selection sdsel = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.target = V4L2_SEL_TGT_CROP_BOUNDS,
> +	};
>  	int ret;
>  
>  	subdev = tegra_channel_get_remote_subdev(chan, true);
> @@ -449,6 +456,24 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>  	fmt.which = V4L2_SUBDEV_FORMAT_TRY;
>  	fmt.pad = 0;
>  	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
> +
> +	/*
> +	 * Attempt to obtain the format size from subdev.
> +	 * If not available, try to get crop boundary from subdev.
> +	 */
> +	fse.code = fmtinfo->code;
> +	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, pad_cfg, &fse);
> +	if (ret) {
> +		ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
> +		if (ret)
> +			return -EINVAL;
> +		pad_cfg->try_crop.width = sdsel.r.width;
> +		pad_cfg->try_crop.height = sdsel.r.height;
> +	} else {
> +		pad_cfg->try_crop.width = fse.max_width;
> +		pad_cfg->try_crop.height = fse.max_height;
> +	}
> +
>  	ret = v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
>  	if (ret < 0)
>  		return ret;
> @@ -540,6 +565,85 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
>  	return 0;
>  }
>  
> +static int tegra_channel_g_selection(struct file *file, void *priv,
> +				     struct v4l2_selection *sel)
> +{
> +	struct tegra_vi_channel *chan = video_drvdata(file);
> +	struct v4l2_subdev *subdev;
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	struct v4l2_subdev_selection sdsel = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.target = sel->target,
> +	};
> +	int ret;
> +
> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> +		return -ENOTTY;
> +
> +	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +	/*
> +	 * Try the get selection operation and fallback to get format if not
> +	 * implemented.
> +	 */
> +	subdev = tegra_channel_get_remote_subdev(chan, true);
> +	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
> +	if (!ret)
> +		sel->r = sdsel.r;
> +	if (ret != -ENOIOCTLCMD)
> +		return ret;
> +
> +	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
> +	if (ret < 0)
> +		return ret;
> +
> +	sel->r.left = 0;
> +	sel->r.top = 0;
> +	sel->r.width = fmt.format.width;
> +	sel->r.height = fmt.format.height;
> +
> +	return 0;
> +}
> +
> +static int tegra_channel_s_selection(struct file *file, void *fh,
> +				     struct v4l2_selection *sel)
> +{
> +	struct tegra_vi_channel *chan = video_drvdata(file);
> +	struct v4l2_subdev *subdev;
> +	int ret;
> +	struct v4l2_subdev_selection sdsel = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.target = sel->target,
> +		.flags = sel->flags,
> +		.r = sel->r,
> +	};
> +

This function doesn't check if the subdev actually supports set_selection.
The imx219 is one such driver: it supports get_selection, but not set_selection.

So this code should add these lines to fix the v4l2-compliance fail:

       subdev = tegra_channel_get_remote_subdev(chan, true);

       if (!v4l2_subdev_has_op(subdev, pad, set_selection))
               return -ENOTTY;


> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> +		return -ENOTTY;
> +
> +	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	if (vb2_is_busy(&chan->queue))
> +		return -EBUSY;
> +
> +	subdev = tegra_channel_get_remote_subdev(chan, true);

And this line can be dropped.

Regards,

	Hans

> +	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, &sdsel);
> +	if (!ret) {
> +		sel->r = sdsel.r;
> +		/*
> +		 * Subdev active format resolution may have changed during
> +		 * set selection operation. So, update channel format to
> +		 * the sub-device active format.
> +		 */
> +		return tegra_channel_set_subdev_active_fmt(chan);
> +	}
> +
> +	return ret;
> +}
> +
>  static int tegra_channel_enum_input(struct file *file, void *fh,
>  				    struct v4l2_input *inp)
>  {
> @@ -597,6 +701,8 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
>  	.vidioc_streamoff		= vb2_ioctl_streamoff,
>  	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
>  	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +	.vidioc_g_selection		= tegra_channel_g_selection,
> +	.vidioc_s_selection		= tegra_channel_s_selection,
>  };
>  
>  /*
> 


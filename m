Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B4B212EAD
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 23:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgGBVTR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 17:19:17 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19124 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgGBVTR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jul 2020 17:19:17 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efe4f480000>; Thu, 02 Jul 2020 14:19:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 02 Jul 2020 14:19:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 02 Jul 2020 14:19:17 -0700
Received: from [10.2.167.4] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 21:19:16 +0000
Subject: Re: [RFC PATCH v2 12/18] media: tegra-video: Add support for
 selection ioctl ops
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <robh+dt@kernel.org>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-13-git-send-email-skomatineni@nvidia.com>
 <efc84cff-76d5-78a2-e84e-0342459d3756@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <c82a000a-7766-c933-fd69-24eb4885fc14@nvidia.com>
Date:   Thu, 2 Jul 2020 14:20:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <efc84cff-76d5-78a2-e84e-0342459d3756@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593724744; bh=m/gn6LzfNZLbZK2Es4F3qd/uO2/udwSor8bR8MoCELU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=DF6F1yP0x+ZvpigDgkgCzzAq7ZG8eB/VmAT54tm4bGGJDnmHwESZFAWBAoxNTlkog
         x7act8InfOZSGD0rEKomeCxuEn9T2C2yIhbgFloqcxDHdlBx/SgttuS0bQNIC2xC/I
         icYDYmSW8LzUTMljW63ostU1/kQxr089GuPMPOgzbIU5vVeiIR3j/6mJ7fkS5xCk3W
         ylvDIPisXGGZLBiRTA7wtC5arKBha73ngZzSjH13OBOMA177Uqh3GBzVSWx0SbIWNj
         XC3xxyuINkGU/Od82WVzcEvhpV68DxV9JpjISAz+4YGEkTZP+aPASI8t/0u//gz+TK
         cquvkPBJnClsQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/2/20 6:54 AM, Hans Verkuil wrote:
> On 17/06/2020 03:41, Sowjanya Komatineni wrote:
>> This patch adds selection v4l2 ioctl operations to allow configuring
>> a selection rectangle in the sensor through the Tegra video device
>> node.
>>
>> Some sensor drivers supporting crop uses try_crop rectangle from
>> v4l2_subdev_pad_config during try format for computing binning.
>>
>> So with selection ops support, this patch also updates try format
>> to use try crop rectangle either from subdev frame size enumeration
>> or from subdev crop boundary.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/staging/media/tegra-video/vi.c | 106 +++++++++++++++++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>>
>> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
>> index 506c263..f9eb96b 100644
>> --- a/drivers/staging/media/tegra-video/vi.c
>> +++ b/drivers/staging/media/tegra-video/vi.c
>> @@ -427,6 +427,13 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>>   	struct v4l2_subdev *subdev;
>>   	struct v4l2_subdev_format fmt;
>>   	struct v4l2_subdev_pad_config *pad_cfg;
>> +	struct v4l2_subdev_frame_size_enum fse = {
>> +		.which = V4L2_SUBDEV_FORMAT_TRY,
>> +	};
>> +	struct v4l2_subdev_selection sdsel = {
>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> +		.target = V4L2_SEL_TGT_CROP_BOUNDS,
>> +	};
>>   	int ret;
>>   
>>   	subdev = tegra_channel_get_remote_subdev(chan, true);
>> @@ -449,6 +456,24 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>>   	fmt.which = V4L2_SUBDEV_FORMAT_TRY;
>>   	fmt.pad = 0;
>>   	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
>> +
>> +	/*
>> +	 * Attempt to obtain the format size from subdev.
>> +	 * If not available, try to get crop boundary from subdev.
>> +	 */
>> +	fse.code = fmtinfo->code;
>> +	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, pad_cfg, &fse);
>> +	if (ret) {
>> +		ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
>> +		if (ret)
>> +			return -EINVAL;
>> +		pad_cfg->try_crop.width = sdsel.r.width;
>> +		pad_cfg->try_crop.height = sdsel.r.height;
>> +	} else {
>> +		pad_cfg->try_crop.width = fse.max_width;
>> +		pad_cfg->try_crop.height = fse.max_height;
>> +	}
>> +
>>   	ret = v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
>>   	if (ret < 0)
>>   		return ret;
>> @@ -540,6 +565,85 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
>>   	return 0;
>>   }
>>   
>> +static int tegra_channel_g_selection(struct file *file, void *priv,
>> +				     struct v4l2_selection *sel)
>> +{
>> +	struct tegra_vi_channel *chan = video_drvdata(file);
>> +	struct v4l2_subdev *subdev;
>> +	struct v4l2_subdev_format fmt = {
>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> +	};
>> +	struct v4l2_subdev_selection sdsel = {
>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> +		.target = sel->target,
>> +	};
>> +	int ret;
>> +
>> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>> +		return -ENOTTY;
>> +
>> +	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +	/*
>> +	 * Try the get selection operation and fallback to get format if not
>> +	 * implemented.
>> +	 */
>> +	subdev = tegra_channel_get_remote_subdev(chan, true);
>> +	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
>> +	if (!ret)
>> +		sel->r = sdsel.r;
>> +	if (ret != -ENOIOCTLCMD)
>> +		return ret;
>> +
>> +	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	sel->r.left = 0;
>> +	sel->r.top = 0;
>> +	sel->r.width = fmt.format.width;
>> +	sel->r.height = fmt.format.height;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_channel_s_selection(struct file *file, void *fh,
>> +				     struct v4l2_selection *sel)
>> +{
>> +	struct tegra_vi_channel *chan = video_drvdata(file);
>> +	struct v4l2_subdev *subdev;
>> +	int ret;
>> +	struct v4l2_subdev_selection sdsel = {
>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> +		.target = sel->target,
>> +		.flags = sel->flags,
>> +		.r = sel->r,
>> +	};
>> +
> This function doesn't check if the subdev actually supports set_selection.
> The imx219 is one such driver: it supports get_selection, but not set_selection.
>
> So this code should add these lines to fix the v4l2-compliance fail:
>
>         subdev = tegra_channel_get_remote_subdev(chan, true);
>
>         if (!v4l2_subdev_has_op(subdev, pad, set_selection))
>                 return -ENOTTY;
>
v4l2_subdev_call() does that check and returns -ENOIOCTLCMD when 
specified subdev ops does not exist.
>> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>> +		return -ENOTTY;
>> +
>> +	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +
>> +	if (vb2_is_busy(&chan->queue))
>> +		return -EBUSY;
>> +
>> +	subdev = tegra_channel_get_remote_subdev(chan, true);
> And this line can be dropped.
>
> Regards,
>
> 	Hans
>
>> +	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, &sdsel);
>> +	if (!ret) {
>> +		sel->r = sdsel.r;
>> +		/*
>> +		 * Subdev active format resolution may have changed during
>> +		 * set selection operation. So, update channel format to
>> +		 * the sub-device active format.
>> +		 */
>> +		return tegra_channel_set_subdev_active_fmt(chan);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static int tegra_channel_enum_input(struct file *file, void *fh,
>>   				    struct v4l2_input *inp)
>>   {
>> @@ -597,6 +701,8 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
>>   	.vidioc_streamoff		= vb2_ioctl_streamoff,
>>   	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
>>   	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
>> +	.vidioc_g_selection		= tegra_channel_g_selection,
>> +	.vidioc_s_selection		= tegra_channel_s_selection,
>>   };
>>   
>>   /*
>>

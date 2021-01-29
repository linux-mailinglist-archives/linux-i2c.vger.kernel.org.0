Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B7F308405
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 04:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhA2DCY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 22:02:24 -0500
Received: from mga17.intel.com ([192.55.52.151]:19369 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231165AbhA2DCW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 22:02:22 -0500
IronPort-SDR: 2ZcYV/v0WKseXMDg/K5RQGtalukVjAJoeBhxYfboAFnXV2tumRx8Vy4h/V2dT3f0XR9RNymxCZ
 s5MT/rLUMndw==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="160126206"
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; 
   d="scan'208";a="160126206"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 19:00:35 -0800
IronPort-SDR: +s0t3ZEm8a1DjXCD2DkMMFhlWiEt5E+0aOI34/n8D2J9v7SGiPB1Q2f8PJX507LuU2oGIYFWb8
 B6Z9j75GUHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; 
   d="scan'208";a="370121088"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2021 19:00:31 -0800
Subject: Re: [PATCH v9 6/7] media: i2c: imx319: Support probe while the device
 is off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <20210128232729.16064-6-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <f2a3ed14-ecb8-1bab-a959-f63adb370ad6@linux.intel.com>
Date:   Fri, 29 Jan 2021 10:58:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128232729.16064-6-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/29/21 7:27 AM, Sakari Ailus wrote:
> From: Rajmohan Mani <rajmohan.mani@intel.com>
> 
> Tell ACPI device PM code that the driver supports the device being powered
> off when the driver's probe function is entered.
> 
> Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx319.c | 72 +++++++++++++++++++++++---------------
>  1 file changed, 44 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
> index 8473c0bbb35d6..e0b22e9318fed 100644
> --- a/drivers/media/i2c/imx319.c
> +++ b/drivers/media/i2c/imx319.c
> @@ -140,6 +140,8 @@ struct imx319 {
>  
>  	/* Streaming on/off */
>  	bool streaming;
> +	/* True if the device has been identified */
> +	bool identified;
>  };
>  
>  static const struct imx319_reg imx319_global_regs[] = {
> @@ -2084,6 +2086,31 @@ imx319_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +/* Verify chip ID */
> +static int imx319_identify_module(struct imx319 *imx319)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx319->sd);
> +	int ret;
> +	u32 val;
> +
> +	if (imx319->identified)
> +		return 0;
> +
> +	ret = imx319_read_reg(imx319, IMX319_REG_CHIP_ID, 2, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val != IMX319_CHIP_ID) {
> +		dev_err(&client->dev, "chip id mismatch: %x!=%x",
> +			IMX319_CHIP_ID, val);
> +		return -EIO;
> +	}
> +
> +	imx319->identified = true;
> +
> +	return 0;
> +}
> +
>  /* Start streaming */
>  static int imx319_start_streaming(struct imx319 *imx319)
>  {
> @@ -2091,6 +2118,10 @@ static int imx319_start_streaming(struct imx319 *imx319)
>  	const struct imx319_reg_list *reg_list;
>  	int ret;
>  
> +	ret = imx319_identify_module(imx319);
> +	if (ret)
> +		return ret;
> +
>  	/* Global Setting */
>  	reg_list = &imx319_global_setting;
>  	ret = imx319_write_regs(imx319, reg_list->regs, reg_list->num_of_regs);
> @@ -2208,26 +2239,6 @@ static int __maybe_unused imx319_resume(struct device *dev)
>  	return ret;
>  }
>  
> -/* Verify chip ID */
> -static int imx319_identify_module(struct imx319 *imx319)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(&imx319->sd);
> -	int ret;
> -	u32 val;
> -
> -	ret = imx319_read_reg(imx319, IMX319_REG_CHIP_ID, 2, &val);
> -	if (ret)
> -		return ret;
> -
> -	if (val != IMX319_CHIP_ID) {
> -		dev_err(&client->dev, "chip id mismatch: %x!=%x",
> -			IMX319_CHIP_ID, val);
> -		return -EIO;
> -	}
> -
> -	return 0;
> -}
> -
>  static const struct v4l2_subdev_core_ops imx319_subdev_core_ops = {
>  	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> @@ -2422,6 +2433,7 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct device *dev)
>  static int imx319_probe(struct i2c_client *client)
>  {
>  	struct imx319 *imx319;
> +	bool low_power;
>  	int ret;
>  	u32 i;
>  
> @@ -2434,11 +2446,14 @@ static int imx319_probe(struct i2c_client *client)
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx319->sd, client, &imx319_subdev_ops);
>  
> -	/* Check module identity */
> -	ret = imx319_identify_module(imx319);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to find sensor: %d", ret);
> -		goto error_probe;
> +	low_power = acpi_dev_state_low_power(&client->dev);
> +	if (!low_power) {
> +		/* Check module identity */
> +		ret = imx319_identify_module(imx319);
> +		if (ret) {
> +			dev_err(&client->dev, "failed to find sensor: %d", ret);
> +			goto error_probe;
> +		}
>  	}
>  
>  	imx319->hwcfg = imx319_get_hwcfg(&client->dev);
> @@ -2491,10 +2506,10 @@ static int imx319_probe(struct i2c_client *client)
>  		goto error_media_entity;
>  
>  	/*
> -	 * Device is already turned on by i2c-core with ACPI domain PM.
> -	 * Enable runtime PM and turn off the device.
> +	 * Don't set the device's state to active if it's in a low power state.
>  	 */
> -	pm_runtime_set_active(&client->dev);
> +	if (!low_power)
> +		pm_runtime_set_active(&client->dev);
>  	pm_runtime_enable(&client->dev);
>  	pm_runtime_idle(&client->dev);
>  
> @@ -2547,6 +2562,7 @@ static struct i2c_driver imx319_i2c_driver = {
>  	},
>  	.probe_new = imx319_probe,
>  	.remove = imx319_remove,
> +	.flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
>  };
>  module_i2c_driver(imx319_i2c_driver);
>  
> 

-- 
Best regards,
Bingbu Cao

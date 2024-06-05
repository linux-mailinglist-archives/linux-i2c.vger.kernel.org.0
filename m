Return-Path: <linux-i2c+bounces-3806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BDF8FC7AB
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 11:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6765B1C230F3
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 09:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A5418FDCF;
	Wed,  5 Jun 2024 09:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GJNTnEF3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900584964C;
	Wed,  5 Jun 2024 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717579342; cv=none; b=AxVq9qDW70QYA4Lte3AGpjsKJZ/ZeszZzEI54u3wA94x1cceQjtfUqIxnkJH7Nwjg13uTGgKGHud04VkPNGipAOxKkzqoqSiQhfejMLvPH3CkmcObFOmGo4HfZJqCAFc+M3vtMWUWwigIJJ+O17GpwMRbtEmPj/X4urrZHnG6mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717579342; c=relaxed/simple;
	bh=5/aGtxwNVKAGDUulFpsfUcXXU+o1xS9cGQhBprHrYc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DI73GNeJF46Nj/GZ7e5iHijbCSO6Y26NoWeIFrG4J+l4VpyEEugsWu+vU0bS2vMZMHYMX0RG2pX+EkaX4wgc1w1feJ0P1ivH0Q48JnHEXkwvlvFoYWfNw6p8/2umpDJ1Nxfi7LWaa6lYnld29sZu9fec6hPFdz5Nk29VSFvN8FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GJNTnEF3; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717579334;
	bh=5/aGtxwNVKAGDUulFpsfUcXXU+o1xS9cGQhBprHrYc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJNTnEF3HEQJ4jhr91/Y8i5tw9v46zus/3DTVnyFgEXFFbhKmY6xnVXO14ZIzwh5S
	 EVwwQ5l0qCbqVEja8mol5YuCDY4/aq3s3I5MBXalvdiSKmgweusAXw+ciW/CNDcyP7
	 4z5T+REh0GyWOW/zobpSNL11+4l1suLfaPbsxv3Q=
Date: Wed, 5 Jun 2024 11:22:12 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	=?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, Armin Wolf <W_Armin@gmx.de>, 
	Stephen Horvath <s.horvath@outlook.com.au>
Subject: Re: [PATCH v4a 6/6] hwmon: (spd5118) Add configuration option for
 auto-detection
Message-ID: <85236eae-f5a2-408c-9bbf-fe547b0c32d5@t-8ch.de>
References: <20240604040237.1064024-7-linux@roeck-us.net>
 <20240605021907.4125716-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605021907.4125716-1-linux@roeck-us.net>

On 2024-06-04 19:19:07+0000, Guenter Roeck wrote:
> With SPD5118 chip detection for the most part handled by the i2c-smbus
> core using DMI information, the spd5118 driver no longer needs to
> auto-detect spd5118 compliant chips.
> 
> Auto-detection by the driver is still needed on systems with no DMI support
> or on systems with more than eight DIMMs and can not be removed entirely.
> However, it affects boot time and introduces the risk of mis-identifying
> chips. Add configuration option to be able to disable it on systems where
> chip detection is handled outside the driver.
> 
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Sent as v4a to avoid resending the entire series.
> 
> v4a:
>     Do not auto-select SENSORS_SPD5118_DETECT if DMI is disabled
>     Modify help text of SENSORS_SPD5118_DETECT
>     Default SENSORS_SPD5118_DETECT to y if (!DMI || !X86)
>      
> v4: New patch
> 
>  drivers/hwmon/Kconfig   | 19 +++++++++++++++++++
>  drivers/hwmon/spd5118.c |  4 +++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 7a84e7637b51..d5eced417fc3 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2193,6 +2193,25 @@ config SENSORS_SPD5118
>  	  This driver can also be built as a module. If so, the module
>  	  will be called spd5118.
>  
> +config SENSORS_SPD5118_DETECT
> +	bool "Enable detect function"
> +	depends on SENSORS_SPD5118
> +	default (!DMI || !X86)
> +	help
> +	  If enabled, the driver auto-detects if a chip in the SPD address
> +	  range is compliant to the SPD51888 standard and auto-instantiates
> +	  if that is the case. If disabled, SPD5118 compliant devices have
> +	  to be instantiated by other means. On X86 systems with DMI support
> +	  this will typically be done from DMI DDR detection code in the
> +	  I2C SMBus subsystem. Devicetree based systems will instantiate
> +	  attached devices if the DIMMs are listed in the devicetree file.
> +
> +	  Disabling the detect function will speed up boot time and reduce
> +	  the risk of mis-detecting SPD5118 compliant devices. However, it
> +	  may result in missed DIMMs under some circumstances.
> +
> +	  If unsure, say Y.
> +
>  config SENSORS_TC74
>  	tristate "Microchip TC74"
>  	depends on I2C
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5cb5e52c0a38..19d203283a21 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -313,7 +313,7 @@ static bool spd5118_vendor_valid(u8 bank, u8 id)
>  }
>  
>  /* Return 0 if detection is successful, -ENODEV otherwise */
> -static int spd5118_detect(struct i2c_client *client, struct i2c_board_info *info)
> +static int __maybe_unused spd5118_detect(struct i2c_client *client, struct i2c_board_info *info)
>  {
>  	struct i2c_adapter *adapter = client->adapter;
>  	int regval;
> @@ -647,7 +647,9 @@ static struct i2c_driver spd5118_driver = {
>  	},
>  	.probe		= spd5118_probe,
>  	.id_table	= spd5118_id,
> +#ifdef CONFIG_SENSORS_SPD5118_DETECT
>  	.detect		= spd5118_detect,
> +#endif
>  	.address_list	= normal_i2c,
>  };

For the if-deffery I proposed something during the last review,
I'm not sure if you saw it. If you did, please ignore this comment:


.address_list is also only needed with CONFIG_SENSORS_SPD5118_DETECT.

If you use

.detect         = IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ?  spd5118_detect : NULL,
.address_list   = IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ?  normal_i2c : NULL,

then the need for __maybe_unused goes away and type checking is a tiny
bit better.


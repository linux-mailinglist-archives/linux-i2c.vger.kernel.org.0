Return-Path: <linux-i2c+bounces-3773-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 914168FA955
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 06:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 492D8287026
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 04:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA9D13D8B5;
	Tue,  4 Jun 2024 04:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="aHztsujz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C79113D88F;
	Tue,  4 Jun 2024 04:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717475876; cv=none; b=juUFkqStEOo7I0LvakQKX7N02XNwVex0gGJxFB9CdRm//6QbDru4yA2Pwh64VnzriswwCXlNbVAlMKqS10NDc+1ftq6Al11u9agNzLAr9YZh6EWcB4z+6sn15aW7l3iRxeVM7C+Jf6Cay6NUiQ1Rgf1SXlOpR+jqsVEN/HuTuLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717475876; c=relaxed/simple;
	bh=iVLiMTAtf7/Fl+fz4quBPQf213lTjGcAUNkm2Kpn84o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXTHmwlxxfWx1GrwQKZqz+yf7QHOW+qK/ZAUc0r5plJLbaYyI0Ol9sfiLKAwn1LABfHT8903lqOLnCJ4kEYhrPgsUGxplE3bIIfIDTDExr3i1QKkeAffrajRfdu3m+PLKAhDrqOIUmRU3XjfSf4feLJNcnYBGreRnXGc2FC5ur8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=aHztsujz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717475869;
	bh=iVLiMTAtf7/Fl+fz4quBPQf213lTjGcAUNkm2Kpn84o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHztsujzql/3kj70X0+SleuKO5jRa3jqgLuojMbU1v8x/nmepZa8CvcmFUYQzcsXZ
	 2lXvqJ/7i0xXvr012/qckqYrTA5qEEi2RIG8+O/ndvp4f1nRvAkGRd1uVPQerIjW/+
	 U/oWCk9JWflk/15ItpQ7dC9nqnee3ghZmadUL4oc=
Date: Tue, 4 Jun 2024 06:37:47 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	=?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, Armin Wolf <W_Armin@gmx.de>, 
	Stephen Horvath <s.horvath@outlook.com.au>
Subject: Re: [PATCH v4 6/6] hwmon: (spd5118) Add configuration option for
 auto-detection
Message-ID: <452386bd-8238-4fac-ad6d-6a8f096ecc35@t-8ch.de>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604040237.1064024-7-linux@roeck-us.net>

On 2024-06-03 21:02:37+0000, Guenter Roeck wrote:
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
> v4: New patch
> 
>  drivers/hwmon/Kconfig   | 18 ++++++++++++++++++
>  drivers/hwmon/spd5118.c |  4 +++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 7a84e7637b51..0bb1bdee3e43 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2185,6 +2185,7 @@ config SENSORS_SPD5118
>  	tristate "SPD5118 Compliant Temperature Sensors"
>  	depends on I2C
>  	select REGMAP_I2C
> +	select SENSORS_SPD5118_DETECT if !DMI
>  	help
>  	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
>  	  compliant temperature sensors. Such sensors are found on DDR5 memory
> @@ -2193,6 +2194,23 @@ config SENSORS_SPD5118
>  	  This driver can also be built as a module. If so, the module
>  	  will be called spd5118.
>  
> +config SENSORS_SPD5118_DETECT
> +	bool "Enable detect function"
> +	depends on SENSORS_SPD5118
> +	default y
> +	help
> +	  If enabled, the driver auto-detects if a chip in the SPD address
> +	  range is compliant to the SPD51888 standard and auto-instantiates
> +	  if that is the case. If disabled, SPD5118 compliant devices have
> +	  to be instantiated by other means. On systems with DMI support
> +	  this will typically be done from DMI DDR detection code in the
> +	  I2C SMBus subsystem.
> +	  Disabling the detect function will speed up boot time and reduce
> +	  the risk of mis-detecting SPD5118 compliant devices. In general
> +	  it should only be enabled if necessary.
> +
> +	  If unsure, say Y.

The combination of

"In general it should only be enabled if necessary."

and

"default y" / "If unsure, say Y."

looks weird.


Also right now it is not possible to disable detection on non-DMI
configurations. But when using OF, custom kernel code or userspace
instantiation then neither DMI nor CONFIG_DETECT are necessary.

The following would support those usecases, too:

config SENSORS_SPD5118_DETECT
	bool "Enable detect function"
	depends on SENSORS_SPD5118
	default !DMI

(And no "select SENSORS_SPD5118_DETECT if !DMI")

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

.address_list is also only needed with CONFIG_SENSORS_SPD5118_DETECT.


If you use

.detect         = IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ?  spd5118_detect : NULL,
.address_list   = IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ?  normal_i2c : NULL,

then the need for __maybe_unused goes away and type checking is a tiny
bit better.


Return-Path: <linux-i2c+bounces-3916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BBA900A0F
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 18:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3FD61C23218
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 16:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E993E19A29A;
	Fri,  7 Jun 2024 16:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hM4VwsXl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3A199E9A;
	Fri,  7 Jun 2024 16:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717776551; cv=none; b=S9bbKRCYWSsBZUZrYYe62qqLGP+EgVSHtHfVDFTgxD+hnsqY6v5WHPFkdfAp2zjE2JpPPIwC+zb2llk36mfjFtGhmRHDmPCtuzTgU0DfrWJgAihBjjm3bY76/QJcTd2Lny4XHBJ7bAmuXPfdmHufQD2n7PC65+ppJ42KFlSayz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717776551; c=relaxed/simple;
	bh=0bL0I8IkMYINLSg8BK8N0AeKq4PToRzzG8KCyf7a0B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6mf/GRn05/0ilxTWVQYXDZXV6of6r8O4OO0JXNQxV2Xfxjrwue2Ef/aaRrfUv8Sv304ri4hgpxZJTpfIxAKSXpgkY5j+If+ftXfn0XZgl0Xe30M8eSlCQGt3S7a67rDJT6Fv1XUUpb/TK/ETq7Sk1i5so48jzTqOnB8QR+n5nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hM4VwsXl; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1717776515; x=1718381315; i=w_armin@gmx.de;
	bh=7OGfGQBAdXl5rAGmMZnYjUnABvyc7y+GS9BjNAEJP5c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hM4VwsXlA2DSQdPpLjo6NvwMoMLq2+jLUhUhHA0Hrp+acdFK/kHvTfH2co3ir/bM
	 EMOcH3RRDqfo4PyY2ecbnOGMLwo6WHjIgCWmgoz8ILXQ6FIOs6JwdpsPjwLHp7kj7
	 IdxqDsfXDTte7gGzz04dfSIIm1+xTpHzvMpfn8TeQN+r/1LDj3e/DxdTfgoX9p/D1
	 WABlfON1viTa7NzMkU6MTByu7HPSXBd6Z2K1UbTAgRX3HGDR/6IASQvtuAgfqvsyI
	 EwRHOI4pxE735oe4Nl6Px5goqdJEcXTbEfVQPNg28zFtiDjDhYyw7wxV0/Pr9rik6
	 94tTx2nNc7TCQMMKXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV63q-1rpo6H0T3u-00U9KT; Fri, 07
 Jun 2024 18:08:35 +0200
Message-ID: <90fc6f8c-0f5b-4ed4-8bdb-b6eb9d0298b4@gmx.de>
Date: Fri, 7 Jun 2024 18:08:34 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4a 6/6] hwmon: (spd5118) Add configuration option for
 auto-detection
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-7-linux@roeck-us.net>
 <20240605021907.4125716-1-linux@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20240605021907.4125716-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MKkSufyTnMzwVOJq5udRYV9WMly4F2JfS0rhow53ovMu5CAWRz6
 oz8KaCc1GXC+t+6q4MnRyZ8KeCwy8l9aUw74onihsW0VN0duz3fDcv4jE+emzPY4BHirHUf
 db1gx5UVMPcDsriwzPYrNTovh2whMA+7iFMkTxpYQhHypNDdTZ1V9jcXP5rpNHCKlkMH0da
 DM5U3aaOVtPBEfHHhkPbw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TyLAve/e7hk=;iIp8HhroBI320UomHSANDvoe2ic
 9qEpLl+iEwFsw1VLWTKjmHPA7M4WuRcBjdAsTRzLyQm8037LBMAtU+lnaHhc/pncuguQbW2mQ
 yeCVDLsW9pdN6Rc7GX0/tJ6z7ku8iyk7m1PfgBuXCTJ1WzaCTqKR3Dp+KXqU5lx9zEpdnzg0E
 c9OMD1rIJVOYCOmVgCIo503yy1WomF6l3flPZu7rTgfAHGgkhlO9p3Uov2lc5ag6bqRQewIZP
 7ebCPHTzvSPQa53vYuzVlgRzEadfHUnBs4/wEjHCXO9Jpwtv/+HKJFPL+wtjOgkTPPqpVUxXz
 Aq+9TeyUlXgqpZCNDScvCOJGkSTlJF9Fa4rps96NRTKhdzxRzufEcIKBAGCPAfM3bbsliyu2n
 0s1btnYcTEJQ69YLr1DZt1bJLU9ZhW/N7nDqt5omJ3SPyQuPfozfW+avJLC+GCu0v9VzaQFC/
 ha4Cu6zxpWZmbMq72PemVazRbL7oPFA8a537DlQXLCfbzN52gKqWG2iVZnjc9ngFOiKcP3QqD
 Me8YCojiwT6YgdqkOIYTpTQ7UH9IXrEIqcqcUE2yORX439QIvDVMXdGCBm0FUca6846PYpJCq
 S6BENIkj4HjY+2xfc7z4LfyFqSknTST28ziyAAodClUw3HJfiuUomoVPT3X14jtrAT/IHuDXG
 Kb1N0qPBk5NPz1RenZI1P3bF5H/2VSlhRPbvM1kwxkzTibDW+5uv+THyuIBmMRoK7SW2XKL00
 svRyrzHOJ+v51ckSbQ9Yge/o2InLpYescUwDl02d5Hxg9nymY0xRS/zjN4fRqD1wqCHYvzlWl
 EYYXMsp653HQoO8OSu6MV+2tcE781cDRTgXxtprAur0GE=

Am 05.06.24 um 04:19 schrieb Guenter Roeck:

> With SPD5118 chip detection for the most part handled by the i2c-smbus
> core using DMI information, the spd5118 driver no longer needs to
> auto-detect spd5118 compliant chips.
>
> Auto-detection by the driver is still needed on systems with no DMI supp=
ort
> or on systems with more than eight DIMMs and can not be removed entirely=
.
> However, it affects boot time and introduces the risk of mis-identifying
> chips. Add configuration option to be able to disable it on systems wher=
e
> chip detection is handled outside the driver.

Tested-by: Armin Wolf <W_Armin@gmx.de>

> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Sent as v4a to avoid resending the entire series.
>
> v4a:
>      Do not auto-select SENSORS_SPD5118_DETECT if DMI is disabled
>      Modify help text of SENSORS_SPD5118_DETECT
>      Default SENSORS_SPD5118_DETECT to y if (!DMI || !X86)
>
> v4: New patch
>
>   drivers/hwmon/Kconfig   | 19 +++++++++++++++++++
>   drivers/hwmon/spd5118.c |  4 +++-
>   2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 7a84e7637b51..d5eced417fc3 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2193,6 +2193,25 @@ config SENSORS_SPD5118
>   	  This driver can also be built as a module. If so, the module
>   	  will be called spd5118.
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
>   config SENSORS_TC74
>   	tristate "Microchip TC74"
>   	depends on I2C
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5cb5e52c0a38..19d203283a21 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -313,7 +313,7 @@ static bool spd5118_vendor_valid(u8 bank, u8 id)
>   }
>
>   /* Return 0 if detection is successful, -ENODEV otherwise */
> -static int spd5118_detect(struct i2c_client *client, struct i2c_board_i=
nfo *info)
> +static int __maybe_unused spd5118_detect(struct i2c_client *client, str=
uct i2c_board_info *info)
>   {
>   	struct i2c_adapter *adapter =3D client->adapter;
>   	int regval;
> @@ -647,7 +647,9 @@ static struct i2c_driver spd5118_driver =3D {
>   	},
>   	.probe		=3D spd5118_probe,
>   	.id_table	=3D spd5118_id,
> +#ifdef CONFIG_SENSORS_SPD5118_DETECT
>   	.detect		=3D spd5118_detect,
> +#endif
>   	.address_list	=3D normal_i2c,
>   };
>


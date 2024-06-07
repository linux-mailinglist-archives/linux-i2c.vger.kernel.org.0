Return-Path: <linux-i2c+bounces-3913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3AC9009C3
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 17:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91F061C23105
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 15:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECD119AA48;
	Fri,  7 Jun 2024 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nwZm3TPK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290AD19414D;
	Fri,  7 Jun 2024 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717775909; cv=none; b=tSw2GIxgyPR8pHoIf5Urjfqq3EIzx0VA5Pn0nSCyBp0XKeVqFIe6JCtJU1hJgUYnqQ4YPn089Hkm53ckDrH877pPeSFwtEOQwaIkvyNyhahp99m9ZVmlFIm0GueWUVWtkUJ0O9Sfxpj/XMZ32AEDDYqMWLCJcl/LHVkQ8t+n0qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717775909; c=relaxed/simple;
	bh=UD03nI/JRp+yg2q6GDAap0jrnL8NaMPnmCL+NxM4aTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SenmaHzgj/Hhv0eQwsGJN5REseFB9q9apTAiJAwBqLnFH3z/q8FffPshlpZR7cHTrFUovO41fHM2VnHkZpxjgVWqoupHEZXa0t30T2aJzvVjgKP4YX+KAUOG3/vura9vQ1qLMd3KaBvJYtYVcZYH/UzdNbpb35sgLiCrtNf076A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nwZm3TPK; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1717775877; x=1718380677; i=w_armin@gmx.de;
	bh=LIQ5gm/XO9PGANyCnfv3D1QIlEG8awN23+y/zDLgCNs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nwZm3TPK3DyPglzuwo/s2RE9GzD7bO5d6HQ3U2qectprdRCxPcQJYjt5Tzsue5Eo
	 o/sarPDGrE7fNEsPbwnQcUx1MhapS760VFSbf23mCd8NT77Auvctu4u4SgoYZaUWP
	 oPogiAcFMaqzoTJGx/BUTGgLC5plJL7rDsq0zI6b1JJuCswbYKdhp95w+yw8xa5Ds
	 KLdDGy1l4eSS3/aLo0utmJueNCQuyoUn2sGSyABVfJWOoO4ni+oLCA1/iXCOXS3c3
	 fOUzpqbHhhEn6u5MTFHsxo3TJjvqyEyEMM7VQobgNySZ7CQqiO/SxrV18IEX+u6d/
	 CoipfdpNAnEqDXdORg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9nxt-1sKqm03Puv-00BxhP; Fri, 07
 Jun 2024 17:57:57 +0200
Message-ID: <59485024-f5d0-4553-b567-2a04ec3d2606@gmx.de>
Date: Fri, 7 Jun 2024 17:57:57 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] hwmon: (spd5118) Add suspend/resume support
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-4-linux@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20240604040237.1064024-4-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LJoUkpB8DPisSiKti1MMbMgSWcI7GsvoiWg7nZeNNhGF6uE+/zq
 nnBwf/zfLMyoSJY/atgT4C+020xT5qquiLP0Dc4udy+RRCNempCKcjCHyUzVFBwTGSKPaZM
 q7tH+g9vZOuc+jlyeil5xBhe9VwjFNF3fWABEUWp5nHHai3tRKTPOcwnzs0IMNVnBV9DOPZ
 KS0Mh4DlsK9HpOtpC30Kg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2HKnl6As2Oc=;uXBA4dqF+su/aqsWgUUHwiY1Z/S
 0qWWDY20Qrtra1yFm12pFn4EI9WxbRymN109n+HxXaRD8Ju77jLH/46sLspiXOEscCdDlCSEc
 7glh3bEUuRspDqDnbWRL0IPW8ys4SafpsmeGFFZYtjS3QaW9r53JFJ73EqKX8iCy58YHLcYLo
 MZwucYY8GatM1USmcWTe4W9Zb7OA+RoUk8mGz9DqYXIQbReYiy4/gUjX1i0I/Ls+IscNItU/y
 7SEgpmoEiXTeRBZihLFwfPjHBC/SzGSV1NWIeLbABMv80mWhj2r5UhsbWa8apSV5DxIUuQ/bK
 AHdV4BlF9Zfte7onJ8iI9hRaL5Y43COzSU5/PhzMrpio+OoB9NFHqmFczlqWj6PBHRtfgDjLr
 9+iNxEJmVOFCrjB2sIdZciwsZrfptMTisqKz+GJ0e/bLakx4VcA3SyELdsKkt/ePHSH2N5x2M
 9/AqgkfWZqhzjl0+hm9K26Y6v/gDFtzg8MNu2URQ8RW7wc8MfRlxOyRp9yKTwbpYKU8hYBR72
 G8Z5ZoEwL/j2GWCqxjZvLPuOB5HmdoVwpFRQ+R2Qkv011rF5bWyNgQQlN64lcecFgLan0OGIQ
 bjn/DAV0AZYpTFoNuAFFLSgVLj3O8xowsWv42BEXHxS/0+5N33CEc5YFFfcOIrtjfVXEskreN
 U9FCy3+gm0TdBxfRL8GHs3Wt9UDicOQhpPn25s61aBD6IrPImw2v6QmsAcVpc6ocaz5cJVM87
 JFcHJ3fiBqkJjTVcWtYSAg+db/HZqIsX2ROtVPE6e+KWhJXCaUvj+D2SnXqaCcsWhoQvyhYvQ
 UqSjji8eECvEEdS6jpc+n6oUYLjrBlkuCEAEVA0uJ/4oA=

Am 04.06.24 um 06:02 schrieb Guenter Roeck:

> Add suspend/resume support to ensure that limit and configuration
> registers are updated and synchronized after a suspend/resume cycle.

Tested-by: Armin Wolf <W_Armin@gmx.de>

>
> Cc: Armin Wolf <W_Armin@gmx.de>
> Cc: Stephen Horvath <s.horvath@outlook.com.au>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v4: Fix bug seen if the enable attribute was never read prior
>      to a suspend/resume cycle.
>
> v3: No change
>
> v2: New patch
>
>   drivers/hwmon/spd5118.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index d3fc0ae17743..d55c073ff5fd 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -20,6 +20,7 @@
>   #include <linux/i2c.h>
>   #include <linux/hwmon.h>
>   #include <linux/module.h>
> +#include <linux/pm.h>
>   #include <linux/regmap.h>
>   #include <linux/units.h>
>
> @@ -432,6 +433,8 @@ static int spd5118_probe(struct i2c_client *client)
>   	if (!spd5118_vendor_valid(bank, vendor))
>   		return -ENODEV;
>
> +	dev_set_drvdata(dev, regmap);
> +
>   	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "spd5118",
>   							 regmap, &spd5118_chip_info,
>   							 NULL);
> @@ -449,6 +452,41 @@ static int spd5118_probe(struct i2c_client *client)
>   	return 0;
>   }
>
> +static int spd5118_suspend(struct device *dev)
> +{
> +	struct regmap *regmap =3D dev_get_drvdata(dev);
> +	u32 regval;
> +	int err;
> +
> +	/*
> +	 * Make sure the configuration register in the regmap cache is current
> +	 * before bypassing it.
> +	 */
> +	err =3D regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
> +	if (err < 0)
> +		return err;
> +
> +	regcache_cache_bypass(regmap, true);
> +	regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE=
,
> +			   SPD5118_TS_DISABLE);
> +	regcache_cache_bypass(regmap, false);
> +
> +	regcache_cache_only(regmap, true);
> +	regcache_mark_dirty(regmap);
> +
> +	return 0;
> +}
> +
> +static int spd5118_resume(struct device *dev)
> +{
> +	struct regmap *regmap =3D dev_get_drvdata(dev);
> +
> +	regcache_cache_only(regmap, false);
> +	return regcache_sync(regmap);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd511=
8_resume);
> +
>   static const struct i2c_device_id spd5118_id[] =3D {
>   	{ "spd5118", 0 },
>   	{ }
> @@ -466,6 +504,7 @@ static struct i2c_driver spd5118_driver =3D {
>   	.driver =3D {
>   		.name	=3D "spd5118",
>   		.of_match_table =3D spd5118_of_ids,
> +		.pm =3D pm_sleep_ptr(&spd5118_pm_ops),
>   	},
>   	.probe		=3D spd5118_probe,
>   	.id_table	=3D spd5118_id,


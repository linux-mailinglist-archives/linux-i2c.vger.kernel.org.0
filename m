Return-Path: <linux-i2c+bounces-3789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1948FB195
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 13:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F9AD281E05
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 11:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7BC145B0A;
	Tue,  4 Jun 2024 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Cnx+0caw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE5144D21;
	Tue,  4 Jun 2024 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502365; cv=none; b=cn1qCmJxTtfGFE2WwHTrOw3iHWVpCseBDV+KBcLoip7IG7WEQ1qxalzrpkfeB1cTlS4DJaG8spGFKl2GktFfj2UXz0nC/qpDTu7ieP+vtEpvZF0wv35MUhFfoyCqHEKQuUjuv3nsWwJKV6ImbSPNBejTZF3kLDyReezMz74SORo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502365; c=relaxed/simple;
	bh=N7IccPeB7cyt8LgEFUZ+IfEq5R8RUGQ+2OrOAjj+Pw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugps8N5OpeqwL/SHWVkzMdwB5RjNuT/22ml2LLmTOceLzsTtUXWGHVyA03NYWA4tUV4+fBgpn00yfi5qUrJPw0/gfxEKk15IxeDDoNDppeCjR36cpjO68kNEtxJUOJqCOaCz/w+kOxAraao9ogyExXRt9FnOZo23YPnsjQSBTLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Cnx+0caw; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1717502331; x=1718107131; i=w_armin@gmx.de;
	bh=LbIHGM9kPAblxv6ilzi6d0XHPA+OvMGjgVh9iVCiH2k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Cnx+0cawS1OQyZd/kNlLgDKoHcGWq2THa+IvMmrMkGx8HaeQnAvVFYYJoqFslm8+
	 a0JJd7noYr779VZsOVOhhvxcUczkPXKTMjCXSWkq02P3qRIItd2xt4BMwzKCOJ6VW
	 hIJ8M6VCgBd0n3OVEwiHQmhmRkIHmi1pYfS62poun9ExhvSFLRZszcRz/mJGy8CXu
	 zzBV8cEMNH99956eYpVFgrltGCHA1oxYD4qHKDjxnVT4NA0WH+KMNThiHPytusFUh
	 6BCn4VOKNEvS5aDQ8SPpOoBAi0yzan3AeJvwdsKnSRC25ZMV7xtC2hb9KmpkOSzfK
	 blH/i42dqnFT2W/i4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.104.27] ([141.76.182.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5rU-1rsYCx1X3Q-00PhlC; Tue, 04
 Jun 2024 13:58:51 +0200
Message-ID: <4cfe1004-77d4-432b-b07e-557a2e57de58@gmx.de>
Date: Tue, 4 Jun 2024 13:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] hwmon: (spd5118) Add support for reading SPD data
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-5-linux@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20240604040237.1064024-5-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FaJiiqKVw6XZ0NILOzVHem6KqfsH6EAgvsyE2RdIiHsug8nG2rU
 fL3qiYgKDT6uAADYJokfgK1EN3W7Sq4q/ZzBBDquSVBHRzdkxfIT6g+mwiziAi9TqP2PvZH
 LekY0ZhWA98xstQYEkOElPIzJX5gS9RoLericYeei08ILsbDjn/Iv4+O9l6/dvwG7fQGKWb
 QqUwPg+Yi9VFDMrVSA1Qg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Vp7BnpeyFQM=;gY0ypCqZe1bxEujARkGKJck+dq7
 zrK8xOAGsT51xBajQv6sSsO4ld1yTE0rCg//lQcD7RSk20HR89Z8KZA7QW3DdUoqFN7xZYebN
 CmED0ftSLJf6M0UGV/wnE1tcd60hlMys/rEGOlcOQLtZI7B2v0vJaOxfbI5tfoJ16awac5xvp
 lmqlx/CcRpC7ET3u5WQdLXwDzP8G2SqHCLJsZDc4hfCBTvPyLElP3eEbfXMtqoHOFuwdT29Xt
 38lD9+w1QYFKucYAtkZ+4B5kQSaTZIH/TJMLiGV6AAGDPHCf5CLunkKYidfDKx9iOKrgcLCDx
 rcf0t64YB2DLfJh0hoJvV55a6uziMKZ/ldzaNLsq1YtS10LUmp2pyBVxmk0Xc48DTX0RyTlAL
 Ljn08bhpQx4hMSYVtmTiX1mAkCj2MFnrEC/PdIePlT/PPAXEVq5T4DoSiGfSfsXbW3E7yM7De
 J7Yj2HCr1ysd2jqaEOv8jBXpM19nG9v+tCmaFuW/4kaEoUE8gsKyparGBrZin9ZCIKV1FHsjP
 r6txprkGefVdaRj0Qv9I+n1a5a9kKKiI13RJ062QkjqTQmAlNqrVZOEKT6ST06rrirwuDIh8t
 ypgMgRkQpUzPFEUyZXxDSjiOSMmhrRfOB5G/oXJWgXOTaLQyeY832bfgIquPdE6lQwKKmr19q
 EckdvYMVqqQ4cbFZVr+zedWqN9Ky0BDrmeUhia+8jb5ZhRlPnU/D46Grk6bUR8bOcqm6KwMrF
 /PIiv3MCjrUAGOdUq3hyYJykkqE7P7oB745nDFnyMOX8x7GfUc3Muh2YqOKfcAIbRdKBYDRsZ
 ROCy12x60r6CsGhgStWxVjSRO4IwsfkhPiZr4IlzQkWzY=

Am 04.06.24 um 06:02 schrieb Guenter Roeck:

> Add support for reading SPD NVMEM data from SPD5118 (Jedec JESD300)
> compliant memory modules. NVMEM write operation is not supported.
>
> NVMEM support is optional. If CONFIG_NVMEM is disabled, the driver will
> still instantiate but not provide NVMEM attribute files.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v4: Use NVMEM_DEVID_NONE instead of NVMEM_DEVID_AUTO
>      Ignore nvmem registration failure if nvmem support is disabled
>
> v3: New patch
>
>   Documentation/hwmon/spd5118.rst |   8 ++
>   drivers/hwmon/spd5118.c         | 147 +++++++++++++++++++++++++++++++-
>   2 files changed, 151 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/hwmon/spd5118.rst b/Documentation/hwmon/spd51=
18.rst
> index a15d75aa2066..ef7338f46575 100644
> --- a/Documentation/hwmon/spd5118.rst
> +++ b/Documentation/hwmon/spd5118.rst
> @@ -53,3 +53,11 @@ temp1_crit_alarm	Temperature critical alarm
>
>   Alarm attributes are sticky until read and will be cleared afterwards
>   unless the alarm condition still applies.
> +
> +
> +SPD (Serial Presence Detect) support
> +------------------------------------
> +
> +The driver also supports reading the SPD NVRAM on SPD5118 compatible ch=
ips.
> +SPD data is available from the 'eeprom' binary attribute file attached =
to the
> +chip's I2C device.
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index d55c073ff5fd..5cb5e52c0a38 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -20,6 +20,8 @@
>   #include <linux/i2c.h>
>   #include <linux/hwmon.h>
>   #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
>   #include <linux/pm.h>
>   #include <linux/regmap.h>
>   #include <linux/units.h>
> @@ -53,12 +55,31 @@ static const unsigned short normal_i2c[] =3D {
>
>   #define SPD5118_TS_DISABLE		BIT(0)	/* temperature sensor disable */
>
> +#define SPD5118_LEGACY_MODE_ADDR	BIT(3)
> +#define SPD5118_LEGACY_PAGE_MASK	GENMASK(2, 0)
> +#define SPD5118_LEGACY_MODE_MASK	(SPD5118_LEGACY_MODE_ADDR | SPD5118_LE=
GACY_PAGE_MASK)
> +
> +
> +#define SPD5118_NUM_PAGES		8
> +#define SPD5118_PAGE_SIZE		128
> +#define SPD5118_PAGE_SHIFT		7
> +#define SPD5118_PAGE_MASK		GENMASK(6, 0)
> +#define SPD5118_EEPROM_BASE		0x80
> +#define SPD5118_EEPROM_SIZE		(SPD5118_PAGE_SIZE * SPD5118_NUM_PAGES)
> +
>   /* Temperature unit in millicelsius */
>   #define SPD5118_TEMP_UNIT		(MILLIDEGREE_PER_DEGREE / 4)
>   /* Representable temperature range in millicelsius */
>   #define SPD5118_TEMP_RANGE_MIN		-256000
>   #define SPD5118_TEMP_RANGE_MAX		255750
>
> +struct spd5118_data {
> +	struct regmap *regmap;
> +	struct mutex nvmem_lock;
> +};
> +
> +/* hwmon */
> +
>   static int spd5118_temp_from_reg(u16 reg)
>   {
>   	int temp =3D sign_extend32(reg >> 2, 10);
> @@ -360,9 +381,111 @@ static const struct hwmon_chip_info spd5118_chip_i=
nfo =3D {
>   	.info =3D spd5118_info,
>   };
>
> +/* nvmem */
> +
> +static int spd5118_nvmem_set_page(struct regmap *regmap, int page)
> +{
> +	unsigned int old_page;
> +	int err;
> +
> +	err =3D regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &old_page);
> +	if (err)
> +		return err;
> +
> +	if (page !=3D (old_page & SPD5118_LEGACY_MODE_MASK)) {
> +		/* Update page and explicitly select 1-byte addressing */
> +		err =3D regmap_update_bits(regmap, SPD5118_REG_I2C_LEGACY_MODE,
> +					 SPD5118_LEGACY_MODE_MASK, page);
> +		if (err)
> +			return err;
> +
> +		/* Selected new NVMEM page, drop cached data */
> +		regcache_drop_region(regmap, SPD5118_EEPROM_BASE, 0xff);
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t spd5118_nvmem_read_page(struct regmap *regmap, char *buf=
,
> +				       unsigned int offset, size_t count)
> +{
> +	int err;
> +
> +	err =3D spd5118_nvmem_set_page(regmap, offset >> SPD5118_PAGE_SHIFT);
> +	if (err)
> +		return err;
> +
> +	offset &=3D SPD5118_PAGE_MASK;
> +
> +	/* Can't cross page boundaries */
> +	if (offset + count > SPD5118_PAGE_SIZE)
> +		count =3D SPD5118_PAGE_SIZE - offset;
> +
> +	err =3D regmap_bulk_read(regmap, SPD5118_EEPROM_BASE + offset, buf, co=
unt);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static int spd5118_nvmem_read(void *priv, unsigned int off, void *val, =
size_t count)
> +{
> +	struct spd5118_data *data =3D priv;
> +	char *buf =3D val;
> +	int ret;
> +
> +	if (unlikely(!count))
> +		return count;
> +
> +	if (off + count > SPD5118_EEPROM_SIZE)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->nvmem_lock);
> +
> +	while (count) {
> +		ret =3D spd5118_nvmem_read_page(data->regmap, buf, off, count);
> +		if (ret < 0) {
> +			mutex_unlock(&data->nvmem_lock);
> +			return ret;
> +		}
> +		buf +=3D ret;
> +		off +=3D ret;
> +		count -=3D ret;
> +	}
> +	mutex_unlock(&data->nvmem_lock);
> +	return 0;
> +}
> +
> +static int spd5118_nvmem_init(struct device *dev, struct spd5118_data *=
data)
> +{
> +	struct nvmem_config nvmem_config =3D {
> +		.type =3D NVMEM_TYPE_EEPROM,
> +		.name =3D dev_name(dev),
> +		.id =3D NVMEM_DEVID_NONE,
> +		.dev =3D dev,
> +		.base_dev =3D dev,
> +		.read_only =3D true,
> +		.root_only =3D false,
> +		.owner =3D THIS_MODULE,
> +		.compat =3D true,

Hi,

do we really need this setting here?

> +		.reg_read =3D spd5118_nvmem_read,
> +		.priv =3D data,
> +		.stride =3D 1,
> +		.word_size =3D 1,
> +		.size =3D SPD5118_EEPROM_SIZE,
> +	};
> +	struct nvmem_device *nvmem;
> +
> +	nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> +	return PTR_ERR_OR_ZERO(nvmem);
> +}
> +
> +/* regmap */
> +
>   static bool spd5118_writeable_reg(struct device *dev, unsigned int reg=
)
>   {
>   	switch (reg) {
> +	case SPD5118_REG_I2C_LEGACY_MODE:
>   	case SPD5118_REG_TEMP_CLR:
>   	case SPD5118_REG_TEMP_CONFIG:
>   	case SPD5118_REG_TEMP_MAX:
> @@ -396,7 +519,7 @@ static bool spd5118_volatile_reg(struct device *dev,=
 unsigned int reg)
>   static const struct regmap_config spd5118_regmap_config =3D {
>   	.reg_bits =3D 8,
>   	.val_bits =3D 8,
> -	.max_register =3D SPD5118_REG_TEMP_STATUS,
> +	.max_register =3D 0xff,
>   	.writeable_reg =3D spd5118_writeable_reg,
>   	.volatile_reg =3D spd5118_volatile_reg,
>   	.cache_type =3D REGCACHE_MAPLE,
> @@ -406,10 +529,15 @@ static int spd5118_probe(struct i2c_client *client=
)
>   {
>   	struct device *dev =3D &client->dev;
>   	unsigned int regval, revision, vendor, bank;
> +	struct spd5118_data *data;
>   	struct device *hwmon_dev;
>   	struct regmap *regmap;
>   	int err;
>
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
>   	regmap =3D devm_regmap_init_i2c(client, &spd5118_regmap_config);
>   	if (IS_ERR(regmap))
>   		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
> @@ -433,7 +561,16 @@ static int spd5118_probe(struct i2c_client *client)
>   	if (!spd5118_vendor_valid(bank, vendor))
>   		return -ENODEV;
>
> -	dev_set_drvdata(dev, regmap);
> +	data->regmap =3D regmap;
> +	mutex_init(&data->nvmem_lock);
> +	dev_set_drvdata(dev, data);
> +
> +	err =3D spd5118_nvmem_init(dev, data);
> +	/* Ignore if NVMEM support is disabled */
> +	if (err && err !=3D -EOPNOTSUPP) {

Maybe we can use IS_REACHABLE(CONFIG_NVMEM) here?

Thanks,
Armin Wolf

> +		dev_err_probe(dev, err, "failed to register nvmem\n");
> +		return err;
> +	}
>
>   	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "spd5118",
>   							 regmap, &spd5118_chip_info,
> @@ -454,7 +591,8 @@ static int spd5118_probe(struct i2c_client *client)
>
>   static int spd5118_suspend(struct device *dev)
>   {
> -	struct regmap *regmap =3D dev_get_drvdata(dev);
> +	struct spd5118_data *data =3D dev_get_drvdata(dev);
> +	struct regmap *regmap =3D data->regmap;
>   	u32 regval;
>   	int err;
>
> @@ -479,7 +617,8 @@ static int spd5118_suspend(struct device *dev)
>
>   static int spd5118_resume(struct device *dev)
>   {
> -	struct regmap *regmap =3D dev_get_drvdata(dev);
> +	struct spd5118_data *data =3D dev_get_drvdata(dev);
> +	struct regmap *regmap =3D data->regmap;
>
>   	regcache_cache_only(regmap, false);
>   	return regcache_sync(regmap);


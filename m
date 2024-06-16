Return-Path: <linux-i2c+bounces-4047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EC1909F01
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 20:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C940BB23338
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 18:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B129A3D3AC;
	Sun, 16 Jun 2024 18:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kQHzj+Eq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C53A1DD;
	Sun, 16 Jun 2024 18:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718561445; cv=none; b=JNQUyqJlBYbjGZNMoC5mJSAGM677YeGfmkaGGqudBlOqmvIJo7VDXVBN3Jt5qEAl+h5Ir0LncYm3DxJPfNDhwmmnzKbpLY75FrZUliF0ZSr5SnYxmw++5jacOh3VpaRMVaAJv7rQKfmpgfsBH5R4JUZvTMIp3lF+CTRt93PD9Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718561445; c=relaxed/simple;
	bh=Nig3uNTyR8vjD5jTFzEg3XmHJnf/ueggaLgublC062I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M70+irAWVSRyXbe20iAxMrBqfMHa5pgJe67LMdSuO4ncNMWnkp38wq9yDSJqWyUJ6XlbHBut4qB/zZU9I5jHBs1G1LbNwHXKdLR4NKsZbJNiuVDpc6wAbWGdbUQs8pLd2mvUXlW29EdyHBedNGQU2Zo1iR6aeQqE3tbP9RDtTkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kQHzj+Eq; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718561396; x=1719166196; i=w_armin@gmx.de;
	bh=IbRTuQBD7BFI/aaqYHqhBGM4k/RTE8XCyu5fYp3Ih5g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kQHzj+Eq4F7PRuxBQztCUulVUWs/MdjrT/hKzf7qWNdSrFx9cri4HRKfhs6wejP0
	 tfX9CfvlWJ6EKA2LP3ve8YtXGo539BNdE8H5kVDIxatUyIQtBXGudZ+Y1oIRa0GbV
	 HkSrey/65PpACOg9aWaLo7h/xzccSafvcRwCZEt/xdkgoDYqnoNAENFh6iZgzkWUZ
	 fWxVAA6Mk+MAwVi6Mrv/nTMhGtagHNGRTDB/Yq60eyP1frezzx93UjylAFC+jDrmQ
	 zn8DF3NCYvl/VV7Wktaq0KAnhpow1idl/tF/9IbwcO8vlqRPcZ3Ic9f1KI2CYedCq
	 S0YVoR0CIFS0kAhY2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DJl-1sFKUT1XAb-00EADW; Sun, 16
 Jun 2024 20:09:56 +0200
Message-ID: <2046d2c3-bbf6-4842-bc51-b2f567f33c0a@gmx.de>
Date: Sun, 16 Jun 2024 20:09:54 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] hwmon: (spd5118) Add support for Renesas/ITD SPD5118
 hub controllers
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Sasha Kozachuk <skozachuk@google.com>,
 John Hamrick <johnham@google.com>
References: <20240614185924.604672-1-linux@roeck-us.net>
Content-Language: de-DE, en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20240614185924.604672-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P+n5H0M0pc/dKCHZmSykhondGNb+LzVJGkKGc+I83DB3otpB/pA
 IKtxy8oJqvFgkTCMtu+VzIHmHh0aBCAL382P8GJIf60Hqqu4dxS/aHirlY/6qPyFVWc6OEf
 DANiGn83ESXqzAKI4clqjRBpedRBD3vN1klnAs5rggN4F/FVE7crBOjLHTZaA8n1Qs5kq1u
 g54Su+WhA823eFNiGgl9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LRdSzb/2zho=;5koEug/GHDqxd9lf/G4wNAy97hF
 ADAjmbc9FA3viqllZfutgF2sHx6+5C+viv+W5fczzLAL2PqPjmXdd07czG8lWtN8gai4bkGpO
 l6++BuWFrijEGdwHRRatzlF25w2R3fcRleCs8l7EiySBBjlv9mil9ObM3JdxRzHLe6qG7AcfY
 /HORZHoiWM5VpMagEj2wCrMKD5/xDgbK78GB5HLUCy9IWRVO3eS2MJkCFcNXwP3lYsWg2fjev
 n4elqvnDbpRVKQEhemM+SxLutPb+fukAroWIxk6K1o1GnYjbYDT+Llr/F4q2pGDCvgfQgxO1l
 2JPRp9cU0AVgQqUJ19V7jQqVfZtStRXIC6+zIssHN7ZCX207ZLHkEFf2kudxzjb5YPdsfvjGN
 hlrrVl8P1nE1fsRwksBfV/eLepV9gHhFOIx3bvn62G8sW55yd0U+f3iMyntKZrQ0sxahThM3x
 mooQTnUuFPCRYINyhbxP37mjmldijDYAJybvfPsoRViEtPkq18/lWkhFOAB+k8D6wWkWsw1dV
 ZOibE0tmZdrbGgFjS+iT8MTWiNPOdTufGnT41P4m2uQVypXDScQIX00/0++vpfAxVRqiT9yCx
 g9uJ7pitp/VE1m51qaGxralZfYDkm3ypLA4mauSqNLdSDVDdYiNo5N3R6VJjoPp70E31/GQWG
 +jBs7pbPZI+JT9CpIelIY3HfwBy74/ONgNJdrSYgnKLPRrYZ2dcViGrbjHK1UL1QZeeVTIl61
 7XP4R/oAH2R0yhKPailZK3GS/EnyUJQ5WuXHotjvmIIImqlmpN3dJQ9RF23KFVHGeoN1hyDPu
 ZGxy3t/3UkuOKTweSVNTo8MiQKmwadL5bc9jIlITOxWhc=

Am 14.06.24 um 20:59 schrieb Guenter Roeck:

> The SPD5118 specification says, in its documentation of the page bits
> in the MR11 register:
>
> "
> This register only applies to non-volatile memory (1024) Bytes) access o=
f
> SPD5 Hub device.
> For volatile memory access, this register must be programmed to '000'.
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> "
>
> Renesas/ITD SPD5118 hub controllers take this literally and disable acce=
ss
> to volatile memory if the page selected in MR11 is !=3D 0. Since the BIO=
S or
> ROMMON will access the non-volatile memory and likely select a page !=3D=
 0,
> this means that the driver will not instantiate since it can not identif=
y
> the chip. Even if the driver instantiates, access to volatile registers
> is blocked after a nvram read operation which selects a page other than =
0.
>
> To solve the problem, add initialization code to select page 0 during
> probe. Before doing that, use basic validation to ensure that this is
> really a SPD5118 device and not some random EEPROM. Explicitly select
> page 0 when accessing the volatile register space, and protect volatile
> register access against nvmem access using the device mutex.

Hi,

maybe we can use struct regmap_range_cfg so the paged register accesses ar=
e being
done by the regmap code itself?

Thanks,
Armin Wolf

>
> Cc: Sasha Kozachuk <skozachuk@google.com>
> Cc: John Hamrick <johnham@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> This patch depends on the spd5118 patch series submitted earlier.
>
> RFT: I was only able to test this patch with DDR5 using the Montage
> Technology SPD5118 hub controller. It needs testing with the Renesas
> hub controller, and could use some additional testing with other DIMMs.
>
>   drivers/hwmon/spd5118.c | 164 +++++++++++++++++++++++++++++-----------
>   1 file changed, 119 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index ac94a6779360..96052ef4256b 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -74,7 +74,7 @@ static const unsigned short normal_i2c[] =3D {
>
>   struct spd5118_data {
>   	struct regmap *regmap;
> -	struct mutex nvmem_lock;
> +	struct mutex access_lock;
>   };
>
>   /* hwmon */
> @@ -92,6 +92,29 @@ static u16 spd5118_temp_to_reg(long temp)
>   	return (DIV_ROUND_CLOSEST(temp, SPD5118_TEMP_UNIT) & 0x7ff) << 2;
>   }
>
> +static int spd5118_set_page(struct regmap *regmap, int page)
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
>   static int spd5118_read_temp(struct regmap *regmap, u32 attr, long *va=
l)
>   {
>   	int reg, err;
> @@ -174,28 +197,44 @@ static int spd5118_read_enable(struct regmap *regm=
ap, long *val)
>   static int spd5118_read(struct device *dev, enum hwmon_sensor_types ty=
pe,
>   			u32 attr, int channel, long *val)
>   {
> -	struct regmap *regmap =3D dev_get_drvdata(dev);
> +	struct spd5118_data *data =3D dev_get_drvdata(dev);
> +	struct regmap *regmap =3D data->regmap;
> +	int err;
>
>   	if (type !=3D hwmon_temp)
>   		return -EOPNOTSUPP;
>
> +	mutex_lock(&data->access_lock);
> +
> +	err =3D spd5118_set_page(regmap, 0);
> +	if (err)
> +		goto unlock;
> +
>   	switch (attr) {
>   	case hwmon_temp_input:
>   	case hwmon_temp_max:
>   	case hwmon_temp_min:
>   	case hwmon_temp_crit:
>   	case hwmon_temp_lcrit:
> -		return spd5118_read_temp(regmap, attr, val);
> +		err =3D spd5118_read_temp(regmap, attr, val);
> +		break;
>   	case hwmon_temp_max_alarm:
>   	case hwmon_temp_min_alarm:
>   	case hwmon_temp_crit_alarm:
>   	case hwmon_temp_lcrit_alarm:
> -		return spd5118_read_alarm(regmap, attr, val);
> +		err =3D spd5118_read_alarm(regmap, attr, val);
> +		break;
>   	case hwmon_temp_enable:
> -		return spd5118_read_enable(regmap, val);
> +		err =3D spd5118_read_enable(regmap, val);
> +		break;
>   	default:
> -		return -EOPNOTSUPP;
> +		err =3D -EOPNOTSUPP;
> +		break;
>   	}
> +
> +unlock:
> +	mutex_unlock(&data->access_lock);
> +	return err;
>   }
>
>   static int spd5118_write_temp(struct regmap *regmap, u32 attr, long va=
l)
> @@ -256,14 +295,28 @@ static int spd5118_temp_write(struct regmap *regma=
p, u32 attr, long val)
>   static int spd5118_write(struct device *dev, enum hwmon_sensor_types t=
ype,
>   			 u32 attr, int channel, long val)
>   {
> -	struct regmap *regmap =3D dev_get_drvdata(dev);
> +	struct spd5118_data *data =3D dev_get_drvdata(dev);
> +	struct regmap *regmap =3D data->regmap;
> +	int err;
> +
> +	mutex_lock(&data->access_lock);
> +
> +	err =3D spd5118_set_page(regmap, 0);
> +	if (err)
> +		goto unlock;
>
>   	switch (type) {
>   	case hwmon_temp:
> -		return spd5118_temp_write(regmap, attr, val);
> +		err =3D spd5118_temp_write(regmap, attr, val);
> +		break;
>   	default:
> -		return -EOPNOTSUPP;
> +		err =3D -EOPNOTSUPP;
> +		break;
>   	}
> +
> +unlock:
> +	mutex_unlock(&data->access_lock);
> +	return err;
>   }
>
>   static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor=
_types type,
> @@ -382,35 +435,12 @@ static const struct hwmon_chip_info spd5118_chip_i=
nfo =3D {
>
>   /* nvmem */
>
> -static int spd5118_nvmem_set_page(struct regmap *regmap, int page)
> -{
> -	unsigned int old_page;
> -	int err;
> -
> -	err =3D regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &old_page);
> -	if (err)
> -		return err;
> -
> -	if (page !=3D (old_page & SPD5118_LEGACY_MODE_MASK)) {
> -		/* Update page and explicitly select 1-byte addressing */
> -		err =3D regmap_update_bits(regmap, SPD5118_REG_I2C_LEGACY_MODE,
> -					 SPD5118_LEGACY_MODE_MASK, page);
> -		if (err)
> -			return err;
> -
> -		/* Selected new NVMEM page, drop cached data */
> -		regcache_drop_region(regmap, SPD5118_EEPROM_BASE, 0xff);
> -	}
> -
> -	return 0;
> -}
> -
>   static ssize_t spd5118_nvmem_read_page(struct regmap *regmap, char *bu=
f,
>   				       unsigned int offset, size_t count)
>   {
>   	int err;
>
> -	err =3D spd5118_nvmem_set_page(regmap, offset >> SPD5118_PAGE_SHIFT);
> +	err =3D spd5118_set_page(regmap, offset >> SPD5118_PAGE_SHIFT);
>   	if (err)
>   		return err;
>
> @@ -439,19 +469,19 @@ static int spd5118_nvmem_read(void *priv, unsigned=
 int off, void *val, size_t co
>   	if (off + count > SPD5118_EEPROM_SIZE)
>   		return -EINVAL;
>
> -	mutex_lock(&data->nvmem_lock);
> +	mutex_lock(&data->access_lock);
>
>   	while (count) {
>   		ret =3D spd5118_nvmem_read_page(data->regmap, buf, off, count);
>   		if (ret < 0) {
> -			mutex_unlock(&data->nvmem_lock);
> +			mutex_unlock(&data->access_lock);
>   			return ret;
>   		}
>   		buf +=3D ret;
>   		off +=3D ret;
>   		count -=3D ret;
>   	}
> -	mutex_unlock(&data->nvmem_lock);
> +	mutex_unlock(&data->access_lock);
>   	return 0;
>   }
>
> @@ -524,15 +554,65 @@ static const struct regmap_config spd5118_regmap_c=
onfig =3D {
>   	.cache_type =3D REGCACHE_MAPLE,
>   };
>
> +static int spd5118_init(struct i2c_client *client)
> +{
> +	struct i2c_adapter *adapter =3D client->adapter;
> +	int err, regval, mode;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
> +	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> +	if (regval < 0 || (regval && regval !=3D 0x5118))
> +		return -ENODEV;
> +
> +	/*
> +	 * If the type register returns 0, it is possible that the chip has a
> +	 * non-zero page selected and takes the specification literally, i.e.
> +	 * disables access to volatile registers besides the page register if
> +	 * the page is not 0. Try to identify such chips.
> +	 */
> +	if (!regval) {
> +		mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE=
);
> +		if (mode < 0 || (mode & 0xf0) || !(mode & 0x07))
> +			return -ENODEV;
> +
> +		err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE=
, 0);
> +		if (err)
> +			return -ENODEV;
> +
> +		regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> +		if (regval !=3D 0x5118) {
> +			i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode)=
;
> +			return -ENODEV;
> +		}
> +	}
> +
> +	regval =3D i2c_smbus_read_byte_data(client, SPD5118_REG_CAPABILITY);
> +	if (regval < 0)
> +		return -ENODEV;
> +
> +	if (!(regval & SPD5118_CAP_TS_SUPPORT))
> +		return -ENODEV;
> +
> +	/* We are reasonably sure that this is really a SPD5118 hub controller=
 */
> +	return 0;
> +}
> +
>   static int spd5118_probe(struct i2c_client *client)
>   {
>   	struct device *dev =3D &client->dev;
> -	unsigned int regval, revision, vendor, bank;
> +	unsigned int revision, vendor, bank;
>   	struct spd5118_data *data;
>   	struct device *hwmon_dev;
>   	struct regmap *regmap;
>   	int err;
>
> +	err =3D spd5118_init(client);
> +	if (err)
> +		return err;
> +
>   	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
> @@ -541,12 +621,6 @@ static int spd5118_probe(struct i2c_client *client)
>   	if (IS_ERR(regmap))
>   		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
>
> -	err =3D regmap_read(regmap, SPD5118_REG_CAPABILITY, &regval);
> -	if (err)
> -		return err;
> -	if (!(regval & SPD5118_CAP_TS_SUPPORT))
> -		return -ENODEV;
> -
>   	err =3D regmap_read(regmap, SPD5118_REG_REVISION, &revision);
>   	if (err)
>   		return err;
> @@ -561,7 +635,7 @@ static int spd5118_probe(struct i2c_client *client)
>   		return -ENODEV;
>
>   	data->regmap =3D regmap;
> -	mutex_init(&data->nvmem_lock);
> +	mutex_init(&data->access_lock);
>   	dev_set_drvdata(dev, data);
>
>   	err =3D spd5118_nvmem_init(dev, data);
> @@ -572,7 +646,7 @@ static int spd5118_probe(struct i2c_client *client)
>   	}
>
>   	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "spd5118",
> -							 regmap, &spd5118_chip_info,
> +							 data, &spd5118_chip_info,
>   							 NULL);
>   	if (IS_ERR(hwmon_dev))
>   		return PTR_ERR(hwmon_dev);


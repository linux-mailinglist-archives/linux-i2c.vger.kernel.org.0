Return-Path: <linux-i2c+bounces-3912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 522179009B2
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 17:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE5A21F24456
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 15:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554AF1993A9;
	Fri,  7 Jun 2024 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uPaJudkp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21367194A68;
	Fri,  7 Jun 2024 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717775769; cv=none; b=ADKwcMqGaDrSMW8YOWo8LULuJBJu2QdecGH8djWReJ2+WAFrQjTehFjDYt80Na4aTw2qTr0piy+MErEB+25DDoUeJtpd7S2Dkl6z1YYV7qCXBZQfkkv80oTCdbqSxjamQ2lX7nh3PRoQ+x8dFiiH3iOmA3qeNkB2t8QajiVcfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717775769; c=relaxed/simple;
	bh=2pgxcV1RxE87dpyjpS2ps0O2yOhwMGHZd04YP3fmgWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeN2DsdDwyVGboVtocqWd8pexTtiXvLJuFyR0N1kDz6rjX9RoVdj506JKVsUWOcRMmTSq2Ayq3YPnkJEqI2MUtcxTrqRG6PZI9C8f2K4E3q3GkuR4X7LC4hZks8aOTwrN5JBsockPz+R0eoLLB36Ou5Tb9dPrVI7o2E9nugQ+lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uPaJudkp; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1717775731; x=1718380531; i=w_armin@gmx.de;
	bh=T20KulMosGPEXaxo7Zvy02Q34YNup/Ysp8Ea8x9/9ZE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uPaJudkpwMMf+uI7xn1Wg19+ejyHlV1eEysSSwF73JyumDl8dlyHq8j2YgIaPQWi
	 4X1rDioijlkdPImeTFQlfrzwr9AMsBQxgETFrF3sgGW0jT+2ae3a1ibgul+r7XtNh
	 O7W+cZilywiRyAa9gnILPKR9C2jazxBHezHWH1Aw8B+7ZWpByv4HTm1kAZ2FCHmLg
	 Cgq5vab03WfVL3oYSg8U1RJR3lRXNVo5HwS0bIsi/qlur2JyfiR1/65r6rDt8sy7v
	 RQnIpO0TTKk6cIvxQPEKiIB93XUURBEIr5a8VmNBizrqjUxhK07YmJxEMMgGtwFD0
	 5fdmVixFfTzp/OqLaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTRN-1s3JiA329t-00Q0Tz; Fri, 07
 Jun 2024 17:55:31 +0200
Message-ID: <d80029e2-b9a1-4bbe-9df0-b9ddd565c920@gmx.de>
Date: Fri, 7 Jun 2024 17:55:02 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] hwmon: Add support for SPD5118 compliant
 temperature sensors
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-3-linux@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20240604040237.1064024-3-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bl3aFG080+8rSVw4NE4O8dTPoT0E2c/CNsqHcKLBw4hpvraPEKk
 ph/z0cYqp2CMRUb0N6cP5tYkQofEmsLS8YGBVh+g4KYrHWTg9knKXiLoDB5+0btPw6GncyN
 YhXVEMbUaI83Ukic8vfutsMRNVyKkvIqrmYWCGhYwl1o/6E8GJOPMiLhDJZKFM3iwaK8ciH
 CGOrY09a1+LQx+c26s1Hw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SK8w60EW9ss=;cRauFTzRb2bcJ50F1+87kdNMXDp
 1XWzcbuL6/V1GkYgeYzVNQO653NVoe/z64+Opden7EewBUKXnU/oz2kl156tepBo7MIelP1ou
 09/AexoSKS1YlhHQjJU8ztBfc87RZdcEzLzl1UGTLYWKEgaODfIsRoJqY8QIdk6Ef0+fzyj0Q
 FjYTk79bp/UbvmUiE0bOhziClL5cv5EPL86kKX5RNGqHd2304uw131M9Wc94BvbS0jLNlM4lF
 NW7yNQQ+g+OkIkT08lL3v5tOD0Mcn0BsLTM2RHSLZPuJxw64uQVHgLV+871Xj648PlwoYgxqU
 t4FLjT8JEwc04qj40F2gY5n0/CIdb4XkGD8hEUKA6z8CiaSZGHVZPQBO6M/GCJtiiC4kKyWky
 cpLbK6pgXkK7Ob87uLqm9eZY1uUKN2x8EMlh/QBKxpCVPRqw623X+9hFZ2g3zIPWa4MJ3FV/B
 vgP2H+8zMUdcjL+/xFogR2ZhqxWzC8gcLKuvP5wHZUzRT1svftCxcOSmH+L57qQ+E5hC86cun
 fKdIxEuO5IWuFZLrrcz94K+5RrUe+o79Wmewy/KcHcXSlKsuGp1JxQrImmzYdDIHfFax+uud7
 LbSoQGy4o0ayfHLIa5jcGWsJgI/KVwxjFocT4IIKxBlD8/F59HsfNLdyWobWWWRitVrSdEEIJ
 +KQa/LTblIGKH5cXUmKs8m6E3N9hBaixe3FAe+dJKGki0YT6pzehQkUaFdg2lPBE4HLW9E2U4
 DA2ETZngiJzFtV+OQoYe5oiqR+SUV1IJYh7EMFSJ/iV8xI55UNZw/dG1icJZrsBfffWA8KQGa
 xdlseOiUBWALNak3gPmY4FKVeDInauQCPHNOFoymbn3ew=

Am 04.06.24 um 06:02 schrieb Guenter Roeck:

> Add support for SPD5118 (Jedec JESD300) compliant temperature
> sensors. Such sensors are typically found on DDR5 memory modules.

Tested-by: Armin Wolf <W_Armin@gmx.de>

> Cc: Ren=C3=A9 Rebe <rene@exactcode.de>
> Cc: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Reviewed-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Tested-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v4: No change
>
> v3: Shorten JESD300-5B.01 to JESD300; 5B.01 refers to the version
>      of the standard
>      Drop unnecessary 'attr' parameter from spd5118_{read,write}_enable(=
)
>
> v2: Drop PEC property documentation
>      Add note indicating that alarm attributes are sticky until read
>      to documentation
>      Fix detect function
>      Fix misspelling in Makefile (CONFIG_SENSORS_SPD5118->CONFIG_SENSORS=
_SPD5118)
>
>   Documentation/hwmon/index.rst   |   1 +
>   Documentation/hwmon/spd5118.rst |  55 ++++
>   drivers/hwmon/Kconfig           |  12 +
>   drivers/hwmon/Makefile          |   1 +
>   drivers/hwmon/spd5118.c         | 481 ++++++++++++++++++++++++++++++++
>   5 files changed, 550 insertions(+)
>   create mode 100644 Documentation/hwmon/spd5118.rst
>   create mode 100644 drivers/hwmon/spd5118.c
>
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.r=
st
> index 03d313af469a..6e7b8726b60c 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -215,6 +215,7 @@ Hardware Monitoring Kernel Drivers
>      smsc47m192
>      smsc47m1
>      sparx5-temp
> +   spd5118
>      stpddc60
>      surface_fan
>      sy7636a-hwmon
> diff --git a/Documentation/hwmon/spd5118.rst b/Documentation/hwmon/spd51=
18.rst
> new file mode 100644
> index 000000000000..a15d75aa2066
> --- /dev/null
> +++ b/Documentation/hwmon/spd5118.rst
> @@ -0,0 +1,55 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver spd5118
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Supported chips:
> +
> +  * SPD5118 (JEDEC JESD300) compliant temperature sensor chips
> +
> +    JEDEC standard download:
> +	https://www.jedec.org/standards-documents/docs/jesd300-5b01
> +	(account required)
> +
> +
> +    Prefix: 'spd5118'
> +
> +    Addresses scanned: I2C 0x50 - 0x57
> +
> +Author:
> +	Guenter Roeck <linux@roeck-us.net>
> +
> +
> +Description
> +-----------
> +
> +This driver implements support for SPD5118 (JEDEC JESD300) compliant te=
mperature
> +sensors, which are used on many DDR5 memory modules. Some systems use t=
he sensor
> +to prevent memory overheating by automatically throttling the memory co=
ntroller.
> +
> +The driver auto-detects SPD5118 compliant chips, but can also be instan=
tiated
> +using devicetree/firmware nodes.
> +
> +A SPD5118 compliant chip supports a single temperature sensor. Critical=
 minimum,
> +minimum, maximum, and critical temperature can be configured. There are=
 alarms
> +for low critical, low, high, and critical thresholds.
> +
> +
> +Hardware monitoring sysfs entries
> +---------------------------------
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +temp1_input		Temperature (RO)
> +temp1_lcrit		Low critical high temperature (RW)
> +temp1_min		Minimum temperature (RW)
> +temp1_max		Maximum temperature (RW)
> +temp1_crit		Critical high temperature (RW)
> +
> +temp1_lcrit_alarm	Temperature low critical alarm
> +temp1_min_alarm		Temperature low alarm
> +temp1_max_alarm		Temperature high alarm
> +temp1_crit_alarm	Temperature critical alarm
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Alarm attributes are sticky until read and will be cleared afterwards
> +unless the alarm condition still applies.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e14ae18a973b..7a84e7637b51 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2181,6 +2181,18 @@ config SENSORS_INA3221
>   	  This driver can also be built as a module. If so, the module
>   	  will be called ina3221.
>
> +config SENSORS_SPD5118
> +	tristate "SPD5118 Compliant Temperature Sensors"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
> +	  compliant temperature sensors. Such sensors are found on DDR5 memory
> +	  modules.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called spd5118.
> +
>   config SENSORS_TC74
>   	tristate "Microchip TC74"
>   	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index e3f25475d1f0..6574ca67d761 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -207,6 +207,7 @@ obj-$(CONFIG_SENSORS_SMSC47B397)+=3D smsc47b397.o
>   obj-$(CONFIG_SENSORS_SMSC47M1)	+=3D smsc47m1.o
>   obj-$(CONFIG_SENSORS_SMSC47M192)+=3D smsc47m192.o
>   obj-$(CONFIG_SENSORS_SPARX5)	+=3D sparx5-temp.o
> +obj-$(CONFIG_SENSORS_SPD5118)	+=3D spd5118.o
>   obj-$(CONFIG_SENSORS_STTS751)	+=3D stts751.o
>   obj-$(CONFIG_SENSORS_SURFACE_FAN)+=3D surface_fan.o
>   obj-$(CONFIG_SENSORS_SY7636A)	+=3D sy7636a-hwmon.o
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> new file mode 100644
> index 000000000000..d3fc0ae17743
> --- /dev/null
> +++ b/drivers/hwmon/spd5118.c
> @@ -0,0 +1,481 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for Jedec 5118 compliant temperature sensors
> + *
> + * Derived from https://github.com/Steve-Tech/SPD5118-DKMS
> + * Originally from T/2 driver at https://t2sde.org/packages/linux
> + *	Copyright (c) 2023 Ren=C3=A9 Rebe, ExactCODE GmbH; Germany.
> + *
> + * Copyright (c) 2024 Guenter Roeck
> + *
> + * Inspired by ee1004.c and jc42.c.
> + *
> + * SPD5118 compliant temperature sensors are typically used on DDR5
> + * memory modules.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/bits.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/units.h>
> +
> +/* Addresses to scan */
> +static const unsigned short normal_i2c[] =3D {
> +	0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, I2C_CLIENT_END };
> +
> +/* SPD5118 registers. */
> +#define SPD5118_REG_TYPE		0x00	/* MR0:MR1 */
> +#define SPD5118_REG_REVISION		0x02	/* MR2 */
> +#define SPD5118_REG_VENDOR		0x03	/* MR3:MR4 */
> +#define SPD5118_REG_CAPABILITY		0x05	/* MR5 */
> +#define SPD5118_REG_I2C_LEGACY_MODE	0x0B	/* MR11 */
> +#define SPD5118_REG_TEMP_CLR		0x13	/* MR19 */
> +#define SPD5118_REG_ERROR_CLR		0x14	/* MR20 */
> +#define SPD5118_REG_TEMP_CONFIG		0x1A	/* MR26 */
> +#define SPD5118_REG_TEMP_MAX		0x1c	/* MR28:MR29 */
> +#define SPD5118_REG_TEMP_MIN		0x1e	/* MR30:MR31 */
> +#define SPD5118_REG_TEMP_CRIT		0x20	/* MR32:MR33 */
> +#define SPD5118_REG_TEMP_LCRIT		0x22	/* MR34:MR35 */
> +#define SPD5118_REG_TEMP		0x31	/* MR49:MR50 */
> +#define SPD5118_REG_TEMP_STATUS		0x33	/* MR51 */
> +
> +#define SPD5118_TEMP_STATUS_HIGH	BIT(0)
> +#define SPD5118_TEMP_STATUS_LOW		BIT(1)
> +#define SPD5118_TEMP_STATUS_CRIT	BIT(2)
> +#define SPD5118_TEMP_STATUS_LCRIT	BIT(3)
> +
> +#define SPD5118_CAP_TS_SUPPORT		BIT(1)	/* temperature sensor support */
> +
> +#define SPD5118_TS_DISABLE		BIT(0)	/* temperature sensor disable */
> +
> +/* Temperature unit in millicelsius */
> +#define SPD5118_TEMP_UNIT		(MILLIDEGREE_PER_DEGREE / 4)
> +/* Representable temperature range in millicelsius */
> +#define SPD5118_TEMP_RANGE_MIN		-256000
> +#define SPD5118_TEMP_RANGE_MAX		255750
> +
> +static int spd5118_temp_from_reg(u16 reg)
> +{
> +	int temp =3D sign_extend32(reg >> 2, 10);
> +
> +	return temp * SPD5118_TEMP_UNIT;
> +}
> +
> +static u16 spd5118_temp_to_reg(long temp)
> +{
> +	temp =3D clamp_val(temp, SPD5118_TEMP_RANGE_MIN, SPD5118_TEMP_RANGE_MA=
X);
> +	return (DIV_ROUND_CLOSEST(temp, SPD5118_TEMP_UNIT) & 0x7ff) << 2;
> +}
> +
> +static int spd5118_read_temp(struct regmap *regmap, u32 attr, long *val=
)
> +{
> +	int reg, err;
> +	u8 regval[2];
> +	u16 temp;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		reg =3D SPD5118_REG_TEMP;
> +		break;
> +	case hwmon_temp_max:
> +		reg =3D SPD5118_REG_TEMP_MAX;
> +		break;
> +	case hwmon_temp_min:
> +		reg =3D SPD5118_REG_TEMP_MIN;
> +		break;
> +	case hwmon_temp_crit:
> +		reg =3D SPD5118_REG_TEMP_CRIT;
> +		break;
> +	case hwmon_temp_lcrit:
> +		reg =3D SPD5118_REG_TEMP_LCRIT;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	err =3D regmap_bulk_read(regmap, reg, regval, 2);
> +	if (err)
> +		return err;
> +
> +	temp =3D (regval[1] << 8) | regval[0];
> +
> +	*val =3D spd5118_temp_from_reg(temp);
> +	return 0;
> +}
> +
> +static int spd5118_read_alarm(struct regmap *regmap, u32 attr, long *va=
l)
> +{
> +	unsigned int mask, regval;
> +	int err;
> +
> +	switch (attr) {
> +	case hwmon_temp_max_alarm:
> +		mask =3D SPD5118_TEMP_STATUS_HIGH;
> +		break;
> +	case hwmon_temp_min_alarm:
> +		mask =3D SPD5118_TEMP_STATUS_LOW;
> +		break;
> +	case hwmon_temp_crit_alarm:
> +		mask =3D SPD5118_TEMP_STATUS_CRIT;
> +		break;
> +	case hwmon_temp_lcrit_alarm:
> +		mask =3D SPD5118_TEMP_STATUS_LCRIT;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	err =3D regmap_read(regmap, SPD5118_REG_TEMP_STATUS, &regval);
> +	if (err < 0)
> +		return err;
> +	*val =3D !!(regval & mask);
> +	if (*val)
> +		return regmap_write(regmap, SPD5118_REG_TEMP_CLR, mask);
> +	return 0;
> +}
> +
> +static int spd5118_read_enable(struct regmap *regmap, long *val)
> +{
> +	u32 regval;
> +	int err;
> +
> +	err =3D regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
> +	if (err < 0)
> +		return err;
> +	*val =3D !(regval & SPD5118_TS_DISABLE);
> +	return 0;
> +}
> +
> +static int spd5118_read(struct device *dev, enum hwmon_sensor_types typ=
e,
> +			u32 attr, int channel, long *val)
> +{
> +	struct regmap *regmap =3D dev_get_drvdata(dev);
> +
> +	if (type !=3D hwmon_temp)
> +		return -EOPNOTSUPP;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +	case hwmon_temp_max:
> +	case hwmon_temp_min:
> +	case hwmon_temp_crit:
> +	case hwmon_temp_lcrit:
> +		return spd5118_read_temp(regmap, attr, val);
> +	case hwmon_temp_max_alarm:
> +	case hwmon_temp_min_alarm:
> +	case hwmon_temp_crit_alarm:
> +	case hwmon_temp_lcrit_alarm:
> +		return spd5118_read_alarm(regmap, attr, val);
> +	case hwmon_temp_enable:
> +		return spd5118_read_enable(regmap, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int spd5118_write_temp(struct regmap *regmap, u32 attr, long val=
)
> +{
> +	u8 regval[2];
> +	u16 temp;
> +	int reg;
> +
> +	switch (attr) {
> +	case hwmon_temp_max:
> +		reg =3D SPD5118_REG_TEMP_MAX;
> +		break;
> +	case hwmon_temp_min:
> +		reg =3D SPD5118_REG_TEMP_MIN;
> +		break;
> +	case hwmon_temp_crit:
> +		reg =3D SPD5118_REG_TEMP_CRIT;
> +		break;
> +	case hwmon_temp_lcrit:
> +		reg =3D SPD5118_REG_TEMP_LCRIT;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	temp =3D spd5118_temp_to_reg(val);
> +	regval[0] =3D temp & 0xff;
> +	regval[1] =3D temp >> 8;
> +
> +	return regmap_bulk_write(regmap, reg, regval, 2);
> +}
> +
> +static int spd5118_write_enable(struct regmap *regmap, long val)
> +{
> +	if (val && val !=3D 1)
> +		return -EINVAL;
> +
> +	return regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
> +				  SPD5118_TS_DISABLE,
> +				  val ? 0 : SPD5118_TS_DISABLE);
> +}
> +
> +static int spd5118_temp_write(struct regmap *regmap, u32 attr, long val=
)
> +{
> +	switch (attr) {
> +	case hwmon_temp_max:
> +	case hwmon_temp_min:
> +	case hwmon_temp_crit:
> +	case hwmon_temp_lcrit:
> +		return spd5118_write_temp(regmap, attr, val);
> +	case hwmon_temp_enable:
> +		return spd5118_write_enable(regmap, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int spd5118_write(struct device *dev, enum hwmon_sensor_types ty=
pe,
> +			 u32 attr, int channel, long val)
> +{
> +	struct regmap *regmap =3D dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		return spd5118_temp_write(regmap, attr, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_=
types type,
> +				  u32 attr, int channel)
> +{
> +	if (type !=3D hwmon_temp)
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return 0444;
> +	case hwmon_temp_min:
> +	case hwmon_temp_max:
> +	case hwmon_temp_lcrit:
> +	case hwmon_temp_crit:
> +	case hwmon_temp_enable:
> +		return 0644;
> +	case hwmon_temp_min_alarm:
> +	case hwmon_temp_max_alarm:
> +	case hwmon_temp_crit_alarm:
> +	case hwmon_temp_lcrit_alarm:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static inline bool spd5118_parity8(u8 w)
> +{
> +	w ^=3D w >> 4;
> +	return (0x6996 >> (w & 0xf)) & 1;
> +}
> +
> +/*
> + * Bank and vendor id are 8-bit fields with seven data bits and odd par=
ity.
> + * Vendor IDs 0 and 0x7f are invalid.
> + * See Jedec standard JEP106BJ for details and a list of assigned vendo=
r IDs.
> + */
> +static bool spd5118_vendor_valid(u8 bank, u8 id)
> +{
> +	if (!spd5118_parity8(bank) || !spd5118_parity8(id))
> +		return false;
> +
> +	id &=3D 0x7f;
> +	return id && id !=3D 0x7f;
> +}
> +
> +/* Return 0 if detection is successful, -ENODEV otherwise */
> +static int spd5118_detect(struct i2c_client *client, struct i2c_board_i=
nfo *info)
> +{
> +	struct i2c_adapter *adapter =3D client->adapter;
> +	int regval;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
> +	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> +	if (regval !=3D 0x5118)
> +		return -ENODEV;
> +
> +	regval =3D i2c_smbus_read_word_data(client, SPD5118_REG_VENDOR);
> +	if (regval < 0 || !spd5118_vendor_valid(regval & 0xff, regval >> 8))
> +		return -ENODEV;
> +
> +	regval =3D i2c_smbus_read_byte_data(client, SPD5118_REG_CAPABILITY);
> +	if (regval < 0)
> +		return -ENODEV;
> +	if (!(regval & SPD5118_CAP_TS_SUPPORT) || (regval & 0xfc))
> +		return -ENODEV;
> +
> +	regval =3D i2c_smbus_read_byte_data(client, SPD5118_REG_TEMP_CLR);
> +	if (regval)
> +		return -ENODEV;
> +	regval =3D i2c_smbus_read_byte_data(client, SPD5118_REG_ERROR_CLR);
> +	if (regval)
> +		return -ENODEV;
> +
> +	regval =3D i2c_smbus_read_byte_data(client, SPD5118_REG_REVISION);
> +	if (regval < 0 || (regval & 0xc1))
> +		return -ENODEV;
> +
> +	regval =3D i2c_smbus_read_byte_data(client, SPD5118_REG_TEMP_CONFIG);
> +	if (regval < 0)
> +		return -ENODEV;
> +	if (regval & ~SPD5118_TS_DISABLE)
> +		return -ENODEV;
> +
> +	strscpy(info->type, "spd5118", I2C_NAME_SIZE);
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *spd5118_info[] =3D {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT |
> +			   HWMON_T_LCRIT | HWMON_T_LCRIT_ALARM |
> +			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
> +			   HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> +			   HWMON_T_ENABLE),
> +	NULL
> +};
> +
> +static const struct hwmon_ops spd5118_hwmon_ops =3D {
> +	.is_visible =3D spd5118_is_visible,
> +	.read =3D spd5118_read,
> +	.write =3D spd5118_write,
> +};
> +
> +static const struct hwmon_chip_info spd5118_chip_info =3D {
> +	.ops =3D &spd5118_hwmon_ops,
> +	.info =3D spd5118_info,
> +};
> +
> +static bool spd5118_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case SPD5118_REG_TEMP_CLR:
> +	case SPD5118_REG_TEMP_CONFIG:
> +	case SPD5118_REG_TEMP_MAX:
> +	case SPD5118_REG_TEMP_MAX + 1:
> +	case SPD5118_REG_TEMP_MIN:
> +	case SPD5118_REG_TEMP_MIN + 1:
> +	case SPD5118_REG_TEMP_CRIT:
> +	case SPD5118_REG_TEMP_CRIT + 1:
> +	case SPD5118_REG_TEMP_LCRIT:
> +	case SPD5118_REG_TEMP_LCRIT + 1:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool spd5118_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case SPD5118_REG_TEMP_CLR:
> +	case SPD5118_REG_ERROR_CLR:
> +	case SPD5118_REG_TEMP:
> +	case SPD5118_REG_TEMP + 1:
> +	case SPD5118_REG_TEMP_STATUS:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config spd5118_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D SPD5118_REG_TEMP_STATUS,
> +	.writeable_reg =3D spd5118_writeable_reg,
> +	.volatile_reg =3D spd5118_volatile_reg,
> +	.cache_type =3D REGCACHE_MAPLE,
> +};
> +
> +static int spd5118_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	unsigned int regval, revision, vendor, bank;
> +	struct device *hwmon_dev;
> +	struct regmap *regmap;
> +	int err;
> +
> +	regmap =3D devm_regmap_init_i2c(client, &spd5118_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
> +
> +	err =3D regmap_read(regmap, SPD5118_REG_CAPABILITY, &regval);
> +	if (err)
> +		return err;
> +	if (!(regval & SPD5118_CAP_TS_SUPPORT))
> +		return -ENODEV;
> +
> +	err =3D regmap_read(regmap, SPD5118_REG_REVISION, &revision);
> +	if (err)
> +		return err;
> +
> +	err =3D regmap_read(regmap, SPD5118_REG_VENDOR, &bank);
> +	if (err)
> +		return err;
> +	err =3D regmap_read(regmap, SPD5118_REG_VENDOR + 1, &vendor);
> +	if (err)
> +		return err;
> +	if (!spd5118_vendor_valid(bank, vendor))
> +		return -ENODEV;
> +
> +	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "spd5118",
> +							 regmap, &spd5118_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	/*
> +	 * From JESD300-5B
> +	 *   MR2 bits [5:4]: Major revision, 1..4
> +	 *   MR2 bits [3:1]: Minor revision, 0..8? Probably a typo, assume 1..=
8
> +	 */
> +	dev_info(dev, "DDR5 temperature sensor: vendor 0x%02x:0x%02x revision =
%d.%d\n",
> +		 bank & 0x7f, vendor, ((revision >> 4) & 0x03) + 1, ((revision >> 1) =
& 0x07) + 1);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id spd5118_id[] =3D {
> +	{ "spd5118", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, spd5118_id);
> +
> +static const struct of_device_id spd5118_of_ids[] =3D {
> +	{ .compatible =3D "jedec,spd5118", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, spd5118_of_ids);
> +
> +static struct i2c_driver spd5118_driver =3D {
> +	.class		=3D I2C_CLASS_HWMON,
> +	.driver =3D {
> +		.name	=3D "spd5118",
> +		.of_match_table =3D spd5118_of_ids,
> +	},
> +	.probe		=3D spd5118_probe,
> +	.id_table	=3D spd5118_id,
> +	.detect		=3D spd5118_detect,
> +	.address_list	=3D normal_i2c,
> +};
> +
> +module_i2c_driver(spd5118_driver);
> +
> +MODULE_AUTHOR("Ren=C3=A9 Rebe <rene@exactcode.de>");
> +MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
> +MODULE_DESCRIPTION("SPD 5118 driver");
> +MODULE_LICENSE("GPL");


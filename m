Return-Path: <linux-i2c+bounces-7124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 784D098B51F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 09:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFCFB1F22D92
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 07:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6111BD005;
	Tue,  1 Oct 2024 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nIeltXl4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB618194AD6;
	Tue,  1 Oct 2024 07:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766230; cv=none; b=U7qtsXCyJISCtrQWLTq29JTW1x8R0zJq3nuwI+0dqy9DPTJetsCHTBe1WHbLazBsTSzqkqdJXzZeC9GT5WSNX9P+4P8nupKlP4hqBDTeGFnR/UxFYs6CAju0lzvLnsnbNdIpl+f6yz0AEkSbVQLYzsnWOV+8hGw4KKX943Yohws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766230; c=relaxed/simple;
	bh=zZHpIvlaAgXBCisesrZRFZlGd33t+zZXCKPr8iv6QtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WOrH/XiUPXd7UVysqGIpgti0CPejz7r7ZmCYlJKxPcLWSNghSBnnr+E4gr91WLuhUebIEVX64bcXmGDlEyGi+9Xi+dSlxIIMlvrDMxC+qGHrgy7pbK1S9o6724inqtS7I//IBO8jQ+UO1M7S+ok+c3FiI/RkwIKLqNZkMhK9jow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nIeltXl4; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49173Ggw052192;
	Tue, 1 Oct 2024 02:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727766196;
	bh=71tdP3POOBj8LEnV6RlTq7lvffQPalX91+ccl4P8eoE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nIeltXl4yVCPilhq/WfYKI38/TlkSfeqIoJym0ZPUIod4OtmHLCg+Y9VGMypIyBVc
	 /bYIDxPW/dFlkXy/fNtIyTP25BDC9Bnqk5PzJVdcMev44SecYdPKD+bJonA7NhooDQ
	 y+3l4+Ue6PkjGYJK8CC1kafPX+jZXkioEpCEGQ+k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49173Gba058259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 02:03:16 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Oct 2024 02:03:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Oct 2024 02:03:16 -0500
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49173BlA059613;
	Tue, 1 Oct 2024 02:03:12 -0500
Message-ID: <ece49be3-0605-42a2-8573-8db256c9f9c2@ti.com>
Date: Tue, 1 Oct 2024 12:33:10 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/tps25990): add initial support
To: Jerome Brunet <jbrunet@baylibre.com>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        Patrick Rudolph
	<patrick.rudolph@9elements.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <20240920-tps25990-v2-0-f3e39bce5173@baylibre.com>
 <20240920-tps25990-v2-3-f3e39bce5173@baylibre.com>
Content-Language: en-US
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <20240920-tps25990-v2-3-f3e39bce5173@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jerome,

On 20/09/24 22:26, Jerome Brunet wrote:
> Add initial support for the Texas Instruments TPS25990 eFuse.
> This adds the basic PMBUS telemetry support for the device.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   Documentation/hwmon/index.rst    |   1 +
>   Documentation/hwmon/tps25990.rst | 148 ++++++++++++++
>   drivers/hwmon/pmbus/Kconfig      |  17 ++
>   drivers/hwmon/pmbus/Makefile     |   1 +
>   drivers/hwmon/pmbus/tps25990.c   | 427 +++++++++++++++++++++++++++++++++++++++
>   5 files changed, 594 insertions(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index ea3b5be8fe4f..205ed31c66ff 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -234,6 +234,7 @@ Hardware Monitoring Kernel Drivers
>      tmp464
>      tmp513
>      tps23861
> +   tps25990
>      tps40422
>      tps53679
>      tps546d24
> diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
> new file mode 100644
> index 000000000000..ed9e74d43e2c
> --- /dev/null
> +++ b/Documentation/hwmon/tps25990.rst
> @@ -0,0 +1,148 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver tps25990
> +======================
> +
> +Supported chips:
> +
> +  * TI TPS25990
> +
> +    Prefix: 'tps25990'
> +
> +  * Datasheet
> +
> +    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
> +
> +Author:
> +
> +	Jerome Brunet <jbrunet@baylibre.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for TI TPS25990 eFuse.
> +This is an integrated, high-current circuit protection and power
> +management device with PMBUS interface
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +Device supports direct format for reading input voltages,
> +output voltage, input current, input power and temperature.
> +
> +Due to the specificities of the chip, all history reset attributes
> +are tied together. Resetting the history of a sensor, resets the
> +history of all the sensors.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input current:
> +
> +**curr1_average**
> +
> +**curr1_crit**
> +
> +**curr1_crit_alarm**
> +
> +**curr1_highest**
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
> +
> +**curr1_reset_history**
> +
> +The driver provides the following attributes for main input voltage:
> +
> +**in1_average**
> +
> +**in1_crit**
> +
> +**in1_crit_alarm**
> +
> +**in1_highest**
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_lcrit**
> +
> +**in1_lcrit_alarm**
> +
> +**in1_lowest**
> +
> +**in1_max**
> +
> +**in1_max_alarm**
> +
> +**in1_min**
> +
> +**in1_min_alarm**
> +
> +**in1_reset_history**
> +
> +The driver provides the following attributes for auxiliary input voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in3_average**
> +
> +**in3_input**
> +
> +**in3_label**
> +
> +**in3_lowest**
> +
> +**in3_min**
> +
> +**in3_min_alarm**
> +
> +**in3_reset_history**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_alarm**
> +
> +**power1_average**
> +
> +**power1_input**
> +
> +**power1_input_highest**
> +
> +**power1_label**
> +
> +**power1_max**
> +
> +**power1_reset_history**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_average**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> +
> +**temp1_highest**
> +
> +**temp1_input**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> +
> +**temp1_reset_history**
> +
> +The driver provides the following attributes for sampling:
> +
> +**samples**
> +
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index a4f02cad92fd..a3fd442e0277 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -510,6 +510,23 @@ config SENSORS_TDA38640_REGULATOR
>   	  If you say yes here you get regulator support for Infineon
>   	  TDA38640 as regulator.
>   
> +config SENSORS_TPS25990
> +	tristate "TI TPS25990"
> +	help
> +	  If you say yes here you get hardware monitoring support for TI
> +	  TPS25990.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called tps25990.
> +
> +config SENSORS_TPS25990_REGULATOR
> +	bool "Regulator support for TPS25990 and compatibles"
> +	depends on SENSORS_TPS25990 && REGULATOR
> +	default SENSORS_TPS25990
> +	help
> +	  If you say yes here you get regulator support for Texas Instruments
> +	  TPS25990.
> +
>   config SENSORS_TPS40422
>   	tristate "TI TPS40422"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d00bcc758b97..3d3183f8d2a7 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>   obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
>   obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
>   obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
> +obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
>   obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>   obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>   obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
> new file mode 100644
> index 000000000000..03848d671c10
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tps25990.c
> @@ -0,0 +1,427 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2024 BayLibre, SAS.
> +// Author: Jerome Brunet <jbrunet@baylibre.com>
> +
> +#include <linux/debugfs.h>
> +#include <linux/err.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include "pmbus.h"
> +
> +#define TPS25990_READ_VAUX		0xd0
> +#define TPS25990_READ_VIN_MIN		0xd1
> +#define TPS25990_READ_VIN_PEAK		0xd2
> +#define TPS25990_READ_IIN_PEAK		0xd4
> +#define TPS25990_READ_PIN_PEAK		0xd5
> +#define TPS25990_READ_TEMP_AVG		0xd6
> +#define TPS25990_READ_TEMP_PEAK		0xd7
> +#define TPS25990_READ_VOUT_MIN		0xda
> +#define TPS25990_READ_VIN_AVG		0xdc
> +#define TPS25990_READ_VOUT_AVG		0xdd
> +#define TPS25990_READ_IIN_AVG		0xde
> +#define TPS25990_READ_PIN_AVG		0xdf
> +#define TPS25990_VIREF			0xe0
> +#define TPS25990_PK_MIN_AVG		0xea
> +#define  PK_MIN_AVG_RST_PEAK		BIT(7)
> +#define  PK_MIN_AVG_RST_AVG		BIT(6)
> +#define  PK_MIN_AVG_RST_MIN		BIT(5)
> +#define  PK_MIN_AVG_AVG_CNT		GENMASK(2, 0)
> +#define TPS25990_MFR_WRITE_PROTECT	0xf8
> +#define  TPS25990_UNLOCKED		BIT(7)
> +
> +#define TPS25990_8B_SHIFT		2
> +#define TPS25990_VIN_OVF_NUM		525100
> +#define TPS25990_VIN_OVF_DIV		10163
> +#define TPS25990_VIN_OVF_OFF		155
> +#define TPS25990_IIN_OCF_NUM		953800
> +#define TPS25990_IIN_OCF_DIV		129278
> +#define TPS25990_IIN_OCF_OFF		157
> +
> +#define PK_MIN_AVG_RST_MASK		(PK_MIN_AVG_RST_PEAK | \
> +					 PK_MIN_AVG_RST_AVG  | \
> +					 PK_MIN_AVG_RST_MIN)
> +
> +/*
> + * Arbitrary default Rimon value: 1kOhm
> + * This correspond to an overcurrent limit of 55A, close to the specified limit
> + * of un-stacked TPS25990 and makes further calculation easier to setup in
> + * sensor.conf, if necessary
> + */
> +#define TPS25990_DEFAULT_RIMON		1000000000
> +
> +static void tps25990_set_m(int *m, u32 rimon)
> +{
> +	u64 val = ((u64)*m) * rimon;
> +
> +	/* Make sure m fits the s32 type */
> +	*m = DIV_ROUND_CLOSEST_ULL(val, 1000000);
> +}
> +
> +static int tps25990_mfr_write_protect_set(struct i2c_client *client,
> +					  u8 protect)
> +{
> +	/*
> +	 * The chip has a single protection mode, set it regardless of
> +	 * the specific protection requested
> +	 */
> +	return pmbus_write_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT,
> +				     protect ? 0x0 : 0xa2);
> +}
> +
> +static int tps25990_mfr_write_protect_get(struct i2c_client *client)
> +{
> +	int ret = pmbus_read_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return (ret & TPS25990_UNLOCKED) ? 0 : PB_WP_ALL;
> +}
> +
> +static int tps25990_read_word_data(struct i2c_client *client,
> +				   int page, int phase, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_READ_VIN_MAX:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_VIN_PEAK);
> +		break;
> +
> +	case PMBUS_VIRT_READ_VIN_MIN:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_VIN_MIN);
> +		break;
> +
> +	case PMBUS_VIRT_READ_VIN_AVG:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_VIN_AVG);
> +		break;
> +
> +	case PMBUS_VIRT_READ_VOUT_MIN:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_VOUT_MIN);
> +		break;
> +
> +	case PMBUS_VIRT_READ_VOUT_AVG:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_VOUT_AVG);
> +		break;
> +
> +	case PMBUS_VIRT_READ_IIN_AVG:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_IIN_AVG);
> +		break;
> +
> +	case PMBUS_VIRT_READ_IIN_MAX:
> +		return TPS25990_READ_IIN_PEAK;
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_IIN_PEAK);
> +		break;
> +
> +	case PMBUS_VIRT_READ_TEMP_AVG:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_TEMP_AVG);
> +		break;
> +
> +	case PMBUS_VIRT_READ_TEMP_MAX:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_TEMP_PEAK);
> +		break;
> +
> +	case PMBUS_VIRT_READ_PIN_AVG:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_PIN_AVG);
> +		break;
> +
> +	case PMBUS_VIRT_READ_PIN_MAX:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_PIN_PEAK);
> +		break;
> +
> +	case PMBUS_VIRT_READ_VMON:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_VAUX);
> +		break;
> +
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +		/*
> +		 * These registers provide an 8 bits value instead of a
> +		 * 10bits one. Just shifting twice the register value is
> +		 * enough to make the sensor type conversion work, even
> +		 * if the datasheet provides different m, b and R for
> +		 * those.
> +		 */
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			break;
> +		ret <<= TPS25990_8B_SHIFT;
> +		break;
> +
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			break;
> +		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
> +					TPS25990_VIN_OVF_DIV);
> +		ret += TPS25990_VIN_OVF_OFF;
> +		break;
> +
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		/*
> +		 * VIREF directly sets the over-current limit at which the eFuse
> +		 * will turn the FET off and trigger a fault. Expose it through
> +		 * this generic property instead of a manufacturer specific one.
> +		 */
> +		ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
> +		if (ret < 0)
> +			break;
> +		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
> +					TPS25990_IIN_OCF_DIV);
> +		ret += TPS25990_IIN_OCF_OFF;
> +		break;
> +
> +	case PMBUS_VIRT_SAMPLES:
> +		ret = pmbus_read_byte_data(client, page, TPS25990_PK_MIN_AVG);
> +		if (ret < 0)
> +			break;
> +		ret = 1 << FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
> +		break;
> +
> +	case PMBUS_VIRT_RESET_TEMP_HISTORY:
> +	case PMBUS_VIRT_RESET_VIN_HISTORY:
> +	case PMBUS_VIRT_RESET_IIN_HISTORY:
> +	case PMBUS_VIRT_RESET_PIN_HISTORY:
> +	case PMBUS_VIRT_RESET_VOUT_HISTORY:
> +		ret = 0;
> +		break;
> +
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int tps25990_write_word_data(struct i2c_client *client,
> +				    int page, int reg, u16 value)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +		value >>= TPS25990_8B_SHIFT;
> +		value = clamp_val(value, 0, 0xff);
> +		ret = pmbus_write_word_data(client, page, reg, value);
> +		break;
> +
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +		value -= TPS25990_VIN_OVF_OFF;
> +		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
> +					  TPS25990_VIN_OVF_NUM);
> +		value = clamp_val(value, 0, 0xf);
> +		ret = pmbus_write_word_data(client, page, reg, value);
> +		break;
> +
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		value -= TPS25990_IIN_OCF_OFF;
> +		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
> +					TPS25990_IIN_OCF_NUM);
> +		value = clamp_val(value, 0, 0x3f);
> +		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
> +		break;
> +
> +	case PMBUS_VIRT_SAMPLES:
> +		value = clamp_val(value, 1, 1 << PK_MIN_AVG_AVG_CNT);
> +		value = ilog2(value);
> +		ret = pmbus_update_byte_data(client, page, TPS25990_PK_MIN_AVG,
> +					     PK_MIN_AVG_AVG_CNT,
> +					     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
> +		break;
> +
> +	case PMBUS_VIRT_RESET_TEMP_HISTORY:
> +	case PMBUS_VIRT_RESET_VIN_HISTORY:
> +	case PMBUS_VIRT_RESET_IIN_HISTORY:
> +	case PMBUS_VIRT_RESET_PIN_HISTORY:
> +	case PMBUS_VIRT_RESET_VOUT_HISTORY:
> +		/*
> +		 * TPS25990 has history resets based on MIN/AVG/PEAK instead of per
> +		 * sensor type. Exposing this quirk in hwmon is not desirable so
> +		 * reset MIN, AVG and PEAK together. Even is there effectively only
> +		 * one reset, which resets everything, expose the 5 entries so
> +		 * userspace is not required map a sensor type to another to trigger
> +		 * a reset
> +		 */
> +		ret = pmbus_update_byte_data(client, 0, TPS25990_PK_MIN_AVG,
> +					     PK_MIN_AVG_RST_MASK,
> +					     PK_MIN_AVG_RST_MASK);
> +		break;
> +
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int tps25990_read_byte_data(struct i2c_client *client,
> +				   int page, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_WRITE_PROTECT:
> +		ret = tps25990_mfr_write_protect_get(client);
> +		break;
> +
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int tps25990_write_byte_data(struct i2c_client *client,
> +				    int page, int reg, u8 byte)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_WRITE_PROTECT:
> +		ret = tps25990_mfr_write_protect_set(client, byte);
> +		break;
> +
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
> +static const struct regulator_desc tps25990_reg_desc[] = {
> +	PMBUS_REGULATOR_ONE("vout"),
> +};
> +#endif
> +
> +static const struct pmbus_driver_info tps25990_base_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.m[PSC_VOLTAGE_IN] = 5251,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = -2,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.m[PSC_VOLTAGE_OUT] = 5251,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = -2,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.m[PSC_TEMPERATURE] = 140,
> +	.b[PSC_TEMPERATURE] = 32100,
> +	.R[PSC_TEMPERATURE] = -2,
> +	/*
> +	 * Current and Power measurement depends on the ohm value
> +	 * of Rimon. m is multiplied by 1000 below to have an integer
> +	 * and -3 is added to R to compensate.
> +	 */
> +	.format[PSC_CURRENT_IN] = direct,
> +	.m[PSC_CURRENT_IN] = 9538,
> +	.b[PSC_CURRENT_IN] = 0,
> +	.R[PSC_CURRENT_IN] = -6,
> +	.format[PSC_POWER] = direct,
> +	.m[PSC_POWER] = 4901,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = -7,
> +	.func[0] = (PMBUS_HAVE_VIN |
> +		    PMBUS_HAVE_VOUT |
> +		    PMBUS_HAVE_VMON |
> +		    PMBUS_HAVE_IIN |
> +		    PMBUS_HAVE_PIN |
> +		    PMBUS_HAVE_TEMP |
> +		    PMBUS_HAVE_STATUS_VOUT |
> +		    PMBUS_HAVE_STATUS_IOUT |
> +		    PMBUS_HAVE_STATUS_INPUT |
> +		    PMBUS_HAVE_STATUS_TEMP |
> +		    PMBUS_HAVE_SAMPLES),
> +	.read_word_data = tps25990_read_word_data,
> +	.write_word_data = tps25990_write_word_data,
> +	.read_byte_data = tps25990_read_byte_data,
> +	.write_byte_data = tps25990_write_byte_data,
> +
> +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
> +	.reg_desc = tps25990_reg_desc,
> +	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
> +#endif
> +};
> +
> +static const struct i2c_device_id tps25990_i2c_id[] = {
> +	{ "tps25990" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
> +
> +static const struct of_device_id tps25990_of_match[] = {
> +	{ .compatible = "ti,tps25990" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tps25990_of_match);
> +
> +static int tps25990_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct pmbus_driver_info *info;
> +	u32 rimon = TPS25990_DEFAULT_RIMON;
> +	int ret;
> +
> +	ret = device_property_read_u32(dev, "ti,rimon-micro-ohms", &rimon);
> +	if (ret < 0 && ret != -EINVAL)
> +		return dev_err_probe(dev, ret, "failed to get rimon\n");
> +
> +	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	/* Adapt the current and power scale for each instance */
> +	tps25990_set_m(&info->m[PSC_CURRENT_IN], rimon);
> +	tps25990_set_m(&info->m[PSC_POWER], rimon);
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static struct i2c_driver tps25990_driver = {
> +	.driver = {
> +		.name = "tps25990",
> +		.of_match_table = tps25990_of_match,
> +	},
> +	.probe = tps25990_probe,
> +	.id_table = tps25990_i2c_id,
> +};
> +module_i2c_driver(tps25990_driver);
> +
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
> +MODULE_DESCRIPTION("PMBUS driver for TPS25990 eFuse");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);

Tested basic telemetry and control functionality on TPS25990 EVM with 
J722S EVM :
https://gist.github.com/vaishnavachath/5d2f3190955799f72fda1374aab36cb0

Tested-by: Vaishnav Achath <vaishnav.a@ti.com>

Thanks and Regards,
Vaishnav

> 


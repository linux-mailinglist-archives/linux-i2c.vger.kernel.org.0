Return-Path: <linux-i2c+bounces-3957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431FE902675
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 18:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13DD3B290F4
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40A7142E8D;
	Mon, 10 Jun 2024 16:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGm0ldrL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDC981754;
	Mon, 10 Jun 2024 16:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718036288; cv=none; b=FJ4kdZh8xjsBi0zL/gLPli363Oudgqw5dEYCjeGeAYhJwBPAYzKsDH8qxpY4wranxN0Er6fcRYAKcw0+7TLUvV2KsGqE143qe/S4jXGS/jlmzTk4u//fFg08FcCr6pJjbv6af/GnZULMdJNUmvo2EvOOgai4SVWN5iIcVgMSbQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718036288; c=relaxed/simple;
	bh=43TfM2P3A++j+EMSf6hEWEfQWdXevV8mRS4jFAB+OkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Betvdo2eDC5bGeNczqEwkp4aFg1cXUOYM/P1lUJ8hM/FJK12P85Tb2PPVR+iaZdQip9lDvOSbf9oipmruvgGD44KTxszFhdOxuZpHVpnE83SCgSa/4+44LmhK8FGj/4nxiQkeOAqBC1NSpV0eB7li4haY/u+/uFE8SSUa8M1im0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGm0ldrL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6c4926bf9baso3480818a12.2;
        Mon, 10 Jun 2024 09:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718036286; x=1718641086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YFSU1AMbQmM5JG+1v5JBmBSiiAdcho0ST5jb1i74DvQ=;
        b=XGm0ldrLTMvZTxFYCHVn8A10iwypp5MoPi/M/LthqQKgWWwkzUKx4DItx7Tu8dj5sS
         mihNPsyxTpokcR/lnQgX7EL4bAFJo5XFWGmfAlZ6flD19ggFQV4qk7bSY97kM4HSul0B
         zm0t3nYq5++p7iLN+gvoCNRDzD42WfkdgjF8T53uF4QxyzYDsNsFBV1eX3HTkOFduOfW
         cyqKhLFckYxyi4oQYdprfdwmShtm/VL+CqUEu+vF+4+UXr4LWNoSTc2dHTGowtl54WYV
         n3Ih9ZKzvSAksjGgHL17pv5vooaqj3n66bchov+Yj8GnzE7jVZjo7sb07ZXoz0nQFrUE
         VkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718036286; x=1718641086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFSU1AMbQmM5JG+1v5JBmBSiiAdcho0ST5jb1i74DvQ=;
        b=qlrajXJcB7hICKMhE/ZnlX/S7Gg4aczGkJ38PbaI2YExlqgrezUlyx4vndKJofWeTc
         uwXlHvHyBDWXm8WS2caPuqKbJVsTM27vsqFYnd5k+KwUbW7rFFUk18E5kGGK/vUbMaXm
         xSDNaXV3qt0CZiVc20xITqFxy2GxKkMCb8gRvyRC50KLq8ZPXs/sPStAqnGF8AZPraBO
         +bENl5DRnpT6ouNVC18WfKrTF1ocN6aVBe6EPG1vdUYbXBwXXdWRV6slROLrisR0/JpH
         nW0nyavfxLWVbF4nRM0PrWU7Kbzli8asRUD3HIK8LlnVyYmb6DgGVhicIKmsRmjI6pDk
         tDwg==
X-Forwarded-Encrypted: i=1; AJvYcCW3x4oBIXId5FbVKJWk641HhfOZ1ZomWST+PZb3SYrZk5h9kvLRlkg9wToAnoCr61gU3uVi51wh7WKZHNOpwYHGbCd3D6aC1Q6NqC8xyqpC4w9DP3ieJHpkeqhnd8e+Cf7N6oxT2SH6d2WfWs5yQz1/oLTafAk0joSXpEWu6mlYAvwll9wope8cvLpAQyhKXeD0wNtrPlVihct5OjOT4l6kH4V5mkCdr6eCZNgpGsAIgv3NIzMvQZs5OV2O
X-Gm-Message-State: AOJu0YwMvjWTHh7sILz9pIwuregqmV29YcQHR3pq3QPUJDUGr0y96z2C
	jZac0ZRWdlA4Q6BQcIWk4Hfw7QvzHPNPrr5TtKf62W8DNwPuAAWK
X-Google-Smtp-Source: AGHT+IEkSY+UaSdOxovkzda/uN7DrJuP1I8025qSaRS7w1qYU1/YCQqd2cBMWHOvwruubsr7nuWTaw==
X-Received: by 2002:a17:902:c401:b0:1f6:7ee8:8942 with SMTP id d9443c01a7336-1f6d031142bmr109751335ad.40.1718036285903;
        Mon, 10 Jun 2024 09:18:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6e76a272csm57784905ad.177.2024.06.10.09.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 09:18:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3c89a559-2e2a-4f2b-842b-8130358d2a36@roeck-us.net>
Date: Mon, 10 Jun 2024 09:18:02 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hwmon: add MP9941 driver
To: Noah Wang <noahwang.wang@outlook.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, jdelvare@suse.com
Cc: corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com, peteryin.openbmc@gmail.com,
 javier.carrasco.cruz@gmail.com, patrick.rudolph@9elements.com,
 bhelgaas@google.com, lukas@wunner.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240607090544.466833-1-noahwang.wang@outlook.com>
 <SEYPR04MB6482644FAB35EC76FD0CC26CFAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <SEYPR04MB6482644FAB35EC76FD0CC26CFAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/24 02:05, Noah Wang wrote:
> Add support for MPS step-down converter mp9941. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
> ---
>   Documentation/hwmon/index.rst  |   1 +
>   Documentation/hwmon/mp9941.rst |  92 +++++++++
>   MAINTAINERS                    |   7 +
>   drivers/hwmon/pmbus/Kconfig    |   9 +
>   drivers/hwmon/pmbus/Makefile   |   1 +
>   drivers/hwmon/pmbus/mp9941.c   | 328 +++++++++++++++++++++++++++++++++
>   6 files changed, 438 insertions(+)
>   create mode 100644 Documentation/hwmon/mp9941.rst
>   create mode 100644 drivers/hwmon/pmbus/mp9941.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 9d9d55b889f2..9ff8149d9a9d 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -169,6 +169,7 @@ Hardware Monitoring Kernel Drivers
>      mp2993
>      mp5023
>      mp5990
> +   mp9941
>      mpq8785
>      nct6683
>      nct6775
> diff --git a/Documentation/hwmon/mp9941.rst b/Documentation/hwmon/mp9941.rst
> new file mode 100644
> index 000000000000..1274fa20e256
> --- /dev/null
> +++ b/Documentation/hwmon/mp9941.rst
> @@ -0,0 +1,92 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp9941
> +====================
> +
> +Supported chips:
> +
> +  * MPS mp9941
> +
> +    Prefix: 'mp9941'
> +
> +  * Datasheet
> +    https://scnbwymvp-my.sharepoint.com/:f:/g/personal/admin_scnbwy_com/Eth4kX1_J1hMsaASHiOYL4QBHU5a75r-tRfLKbHnJFdKLQ?e=vxj3DF
> +
> +Author:
> +
> +	Noah Wang <noahwang.wang@outlook.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +MP9941 digital step-down converter.
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_crit**
> +
> +**in1_crit_alarm**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +**in2_lcrit**
> +
> +**in2_lcrit_alarm**
> +
> +**in2_rated_max**
> +
> +**in2_rated_min**
> +
> +The driver provides the following attributes for input current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr2_input**
> +
> +**curr2_label**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> +
> +The driver provides the following attributes for output power:
> +
> +**power2_input**
> +
> +**power2_label**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f47f3e13b004..d4600533a3ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15265,6 +15265,13 @@ F:	drivers/video/backlight/mp3309c.c
>   +F:	Documentation/hwmon/mp2993.rst
>   +F:	drivers/hwmon/pmbus/mp2993.c
>   
> ++MPS MP9941 DRIVER
> ++M:	Noah Wang <noahwang.wang@outlook.com>
> ++L:	linux-hwmon@vger.kernel.org
> ++S:	Maintained
> ++F:	Documentation/hwmon/mp9941.rst
> ++F:	drivers/hwmon/pmbus/mp9941.c
> +
>   MR800 AVERMEDIA USB FM RADIO DRIVER
>   M:	Alexey Klimov <klimov.linux@gmail.com>
>   L:	linux-media@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index d875d31ce84c..7d32cfc19820 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -380,6 +380,15 @@ config SENSORS_MP5990
>   	  This driver can also be built as a module. If so, the module will
>   	  be called mp5990.
>   
> +config SENSORS_MP9941
> +	tristate "MPS MP9941"
> +	help
> +	  If you say yes here you get hardware monitoring support for MPS
> +	  MP9941.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mp9941.
> +
>   config SENSORS_MPQ7932_REGULATOR
>   	bool "Regulator support for MPQ7932"
>   	depends on SENSORS_MPQ7932 && REGULATOR
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 312d3f0c0540..6c7177fde355 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -40,6 +40,7 @@ obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>   obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
>   obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
>   obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
> +obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
>   obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
>   obj-$(CONFIG_SENSORS_MPQ8785)	+= mpq8785.o
>   obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
> diff --git a/drivers/hwmon/pmbus/mp9941.c b/drivers/hwmon/pmbus/mp9941.c
> new file mode 100644
> index 000000000000..d24e98671e16
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp9941.c
> @@ -0,0 +1,328 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP9941)
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include "pmbus.h"
> +
> +/*
> + * Vender specific registers. The MFR_ICC_MAX(0x02) is used to
> + * config the iin scale. The MFR_RESO_SET(0xC7) is used to
> + * config the vout format. The MFR_VR_MULTI_CONFIG_R1(0x0D) is
> + * used to identify the vout vid step.
> + */
> +#define MFR_ICC_MAX	0x02
> +#define MFR_RESO_SET	0xC7
> +#define MFR_VR_MULTI_CONFIG_R1	0x0D
> +
> +#define MP9941_VIN_LIMIT_UINT	1
> +#define MP9941_VIN_LIMIT_DIV	8
> +#define MP9941_READ_VIN_UINT	1
> +#define MP9941_READ_VIN_DIV	32
> +
> +#define MP9941_PAGE_NUM	1
> +
> +#define MP9941_RAIL1_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
> +							PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | \
> +							PMBUS_HAVE_TEMP | PMBUS_HAVE_PIN | \
> +							PMBUS_HAVE_IIN | \
> +							PMBUS_HAVE_STATUS_VOUT | \
> +							PMBUS_HAVE_STATUS_IOUT | \
> +							PMBUS_HAVE_STATUS_TEMP | \
> +							PMBUS_HAVE_STATUS_INPUT)
> +
> +struct mp9941_data {
> +	struct pmbus_driver_info info;
> +	int vid_resolution;
> +};
> +
> +#define to_mp9941_data(x) container_of(x, struct mp9941_data, info)
> +
> +static int mp2993_set_vout_format(struct i2c_client *client)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_read_word_data(client, MFR_RESO_SET);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * page = 0, MFR_RESO_SET[7:6] defines the vout format
> +	 * 2'b11 set the vout format as direct
> +	 */
> +	ret = (ret & ~GENMASK(7, 6)) | FIELD_PREP(GENMASK(7, 6), 3);
> +
> +	ret = i2c_smbus_write_word_data(client, MFR_RESO_SET, ret);
> +	if (ret < 0)
> +		return ret;
> +

i2c_smbus_write_word_data() returns 0 or an error code. The above
is therefore not necessary.
	return i2c_smbus_write_word_data(client, MFR_RESO_SET, ret);
is sufficient. Same everythere else where the same pattern is used.

Thanks,
Guenter



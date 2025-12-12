Return-Path: <linux-i2c+bounces-14526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 657B7CB98BD
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 19:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BF0E305F648
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 18:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07633019BF;
	Fri, 12 Dec 2025 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTAFrB8m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977E2301710
	for <linux-i2c@vger.kernel.org>; Fri, 12 Dec 2025 18:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765563673; cv=none; b=hNL3FLDs5svSh/i4iLfwD3n6duq/+IjJHHAvg+gEBsc0Jdv2uvWnprZoKAvQpdn3GWWRDrZQN6PtPFg3WYoVBGp+fqMxQs8ePDLMj6dWuK6yQoDofZMyUgWk5Afb2VQ8WbBbM8UsekLmWvwz1bNNqKgjIGwoFDpsLZQ47us0hKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765563673; c=relaxed/simple;
	bh=CR3i9ZfeK7vgrvUjln+20brNqBLwBwgcu0mAHVs2da0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TV+NTtjg4RsO/m2ewKxJgwtbpNGidE8ky4fLOPVL/42nWxPI8+LzhVdVLvM7tOE8xzSlIS5YZdwIBDaL69BO7rksBJvDLNBgAoTsFLk39r3/OIWVinDhnFP/cmKlGj7Hg0vYmW2CxdEpRVCyIJijIFNH62ovg0xIIEbadWS/jW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTAFrB8m; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b9387df58cso2246441b3a.3
        for <linux-i2c@vger.kernel.org>; Fri, 12 Dec 2025 10:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765563668; x=1766168468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hB3cZ2WQZPicl3MYmnszfY/TO/CzwI8J7PmE+kdYZCY=;
        b=NTAFrB8m0iYIRvVt0AvUbTyZuN5gKgcGybKgOrJan29JEbT6ZaAAFmVWKBlmvjNqxb
         bEZB1MU7bNFNOmUrnsQhp6Qe9ltDdFipmr993Fai/Vd5KbQzkziyNbbQc67XtwbS7SQL
         Ve7zZ0KLKMmp0qy5DSuar6Gcdcfly9RaVfnfOChzAvhLTV4+DDHw6r7xwHsbBiT1LP1M
         By2z3/5bBelb2K/6Gi9Hp6A47EMPmrBcU2wYOmO7HKkCRuIj5TBO5xuzZDcq8AdhAvda
         fwY02yFs3oFwwtCgbiuqFrUkZQV2wSLlo8K3DIa11UP1GrQCaJbjhbM2wj1HgSplxLc+
         DP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765563668; x=1766168468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hB3cZ2WQZPicl3MYmnszfY/TO/CzwI8J7PmE+kdYZCY=;
        b=OTX6FvpffLiJ7uBlmb4KfWhNwz+3ZRiqm+qk0CeWV5g/v6Trdc9Gh1rWBfM89v82Qm
         G8CF7Gn+Z9vzDzO8OwL4DssZJDnKgr7KRb6D134pF8EKop0ut+/38ibNKuLU4+Zuwgpu
         O5pxWyfZwygR3wCCsrqo2gmsMTK4DP0/hXJG3CNsQSGz8dEueMgAT6wRQpbhsSAEH4K+
         pgddu0jOpYIxPzmFh0+u+cnm0aMwwWJNmv/hA2u+hSCElWlEIYCJpTwE5F0EYzAzXnbL
         /Dbc8RqG4ww6USiZfYk8hGj1fC1C+sA4mqkOzZNIi9MOCsd3YzqTkn6sTHjYNPLlPyvd
         pqLg==
X-Forwarded-Encrypted: i=1; AJvYcCWBOzPDf2WpCblsfijddtWpLWu0wzfP51JlBdDz8rVnqZfiaxavSAY3Lf8DaNgQR0id7v1qFPyrxng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDkax3AaoVyDWjse71qBcYbaGbDQFbbiH5wxf/GDUGHgkfC2ws
	4b8Ez4t6oQrE2Kqzo6xgFtgtKxL6/DmUJtnXWK+SN8BZSTDrboxzE0YN
X-Gm-Gg: AY/fxX59cT6ysfzXTHTcKA+ITSbZ269uzOZuloPm6gI0OCif1JSLwV1FW+z9W6xz83p
	qcJAivNE0juEyurIkJ+EFbcJO0xugDOM5BKDyGzU4c+DGV5HTgkF9MkDGtcnzwr9udMqlAhtjrP
	doeGdQEOfYSDUH5fjPND7Sa1BzmTSUsaShq0GMD/Kqn7G5KlqWjgdE1LvyFP6GrofKySQVBF56u
	h85/DT65BedjHHmHOZ/DujAkDWadRheElkeVvOLbBopO/3TIahQcOQcZ4BfiZG+A1NtxxwUv0Sz
	wuHDHIeMBbVm2vfu9/GInex3VXCobNyGszMzMvDfd9IzfUtZlQmLjQk7vG7CJZ5I+Xa5nKa0gp6
	Hlhammto+5gjeS3Ueu4Y82AL4o+Yz3mzBXW/ZviGQEw6LRLgMlExWZIWWEbY+zCH02Y69WLvcJE
	W9hB13+h8v2tyAk3CNDprIE3g=
X-Google-Smtp-Source: AGHT+IF3m7yCMLLkl2XAvF0/1WUoK+uPc8b/WflcecrYvszrOj5LsvD+GWVrr3M53pYormaol8LS+A==
X-Received: by 2002:a05:7022:628c:b0:11a:126f:ee7d with SMTP id a92af1059eb24-11f34c42dccmr2393717c88.35.1765563667880;
        Fri, 12 Dec 2025 10:21:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b46f5sm19164059c88.5.2025.12.12.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 10:21:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 12 Dec 2025 10:21:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	Wenkai Chung <wenkai.chung@advantech.com.tw>,
	Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>,
	Hongzhi Wang <hongzhi.wang@advantech.com>,
	Mikhail Tsukerman <mikhail.tsukerman@advantech.com>,
	Thomas Kastner <thomas.kastner@advantech.com>
Subject: Re: [PATCH 3/8] Add Advantech EIO Hardware Monitor driver
Message-ID: <ed9f6395-ee98-42e5-98e7-c1de16440b7f@roeck-us.net>
References: <20251212-upstream-v1-v1-0-d50d40ec8d8a@advantech.com>
 <20251212-upstream-v1-v1-3-d50d40ec8d8a@advantech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-upstream-v1-v1-3-d50d40ec8d8a@advantech.com>

On Fri, Dec 12, 2025 at 05:40:54PM +0100, Ramiro Oliveira wrote:
> This driver controls the Hardware Monitor block of the Advantech EIO chip.
> 
> Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
> ---
>  MAINTAINERS               |   1 +
>  drivers/hwmon/Kconfig     |  10 ++
>  drivers/hwmon/Makefile    |   1 +
>  drivers/hwmon/eio-hwmon.c | 344 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 356 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 359d4a13f212..fdd39b152f41 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -620,6 +620,7 @@ ADVANTECH EIO DRIVER
>  M:	Ramiro Oliveira <ramiro.oliveira@advantech.com>
>  S:	Maintained
>  F:	drivers/gpio/gpio-eio.c
> +F:	drivers/hwmon/eio-hwmon.c
>  F:	drivers/mfd/eio_core.c
>  F:	include/linux/mfd/eio.h
>  
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 157678b821fc..08993b993596 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2043,6 +2043,16 @@ config SENSORS_DME1737
>  	  This driver can also be built as a module. If so, the module
>  	  will be called dme1737.
>  
> +config SENSORS_EIO
> +	tristate "Advantech EIO HWMON"
> +	depends on MFD_EIO
> +	help
> +	  If you say yes here you get support for the Advantech EIO
> +	  temperature, voltage and fan speed monitoring block.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called eio-hwmon
> +
>  config SENSORS_EMC1403
>  	tristate "SMSC EMC1403/23 thermal sensor"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index eade8e3b1bde..e69f03b41fae 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -72,6 +72,7 @@ obj-$(CONFIG_SENSORS_DME1737)	+= dme1737.o
>  obj-$(CONFIG_SENSORS_DRIVETEMP)	+= drivetemp.o
>  obj-$(CONFIG_SENSORS_DS620)	+= ds620.o
>  obj-$(CONFIG_SENSORS_DS1621)	+= ds1621.o
> +obj-$(CONFIG_SENSORS_EIO)	+= eio-hwmon.o
>  obj-$(CONFIG_SENSORS_EMC1403)	+= emc1403.o
>  obj-$(CONFIG_SENSORS_EMC2103)	+= emc2103.o
>  obj-$(CONFIG_SENSORS_EMC2305)	+= emc2305.o
> diff --git a/drivers/hwmon/eio-hwmon.c b/drivers/hwmon/eio-hwmon.c
> new file mode 100644
> index 000000000000..164591aa31a7
> --- /dev/null
> +++ b/drivers/hwmon/eio-hwmon.c
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * GPIO driver for Advantech EIO embedded controller.
> + *
> + * Copyright (C) 2025 Advantech Corporation. All rights reserved.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/eio.h>
> +#include <linux/module.h>
> +
> +#define MAX_DEV 128
> +#define MAX_NAME 32
> +
> +static uint timeout;
> +module_param(timeout, uint, 0444);
> +MODULE_PARM_DESC(timeout,
> +		 "Default pmc command timeout in micro-seconds.\n");
> +

It does not make sense to me to have this as module parameter for each of
the drivers.

> +struct eio_hwmon_dev {
> +	struct device *mfd;
> +};
> +
> +enum _sen_type {
> +	NONE,
> +	VOLTAGE,
> +	CURRENT,
> +	TEMP,
> +	PWM,
> +	TACHO,
> +	FAN,
> +	CASEOPEN,
> +};
> +
> +struct eio_key {
> +	enum _sen_type type;
> +	u8 chan;
> +	u8 item;
> +	u8 label_idx;
> +};
> +
> +struct eio_attr {
> +	struct sensor_device_attribute sda;
> +	struct eio_key key;
> +};
> +
> +static struct {
> +	u8   cmd;
> +	u8   max;
> +	signed int shift;
> +	char name[32];
> +	u8   ctrl[16];
> +	u16  multi[16];
> +	char item[16][32];
> +	char labels[32][32];
> +
> +} sen_info[] = {
> +	{ 0x00, 0, 0, "none" },
> +	{ 0x12, 8, 0, "in",
> +		{ 0xFF, 0x10, 0x11, 0x12 },
> +		{ 1,    10,   10,   10 },
> +		{ "label", "input", "max", "min" },
> +		{ "5V", "5Vs5", "12V", "12Vs5",
> +		  "3V3", "3V3", "5Vsb", "3Vsb",
> +		  "Vcmos", "Vbat", "Vdc", "Vstb",
> +		  "Vcore_a", "Vcore_b", "", "",
> +		  "Voem0", "Voem1", "Voem2", "Voem3"
> +		},
> +	},
> +	{ 0x1a, 2, 0, "curr",
> +		{ 0xFF, 0x10, 0x11, 0x12 },
> +		{ 1,    10,   10,   10 },
> +		{ "label", "input", "max", "min" },
> +		{ "dc", "oem0" },
> +	},
> +	{ 0x10, 4, -2731, "temp",
> +		{ 0xFF, 0x10, 0x11, 0x12, 0x21, 0x41 },
> +		{ 1,    100,  100,  100,  100,  100 },
> +		{ "label", "input", "max", "min", "crit", "emergency" },
> +		{ "cpu0", "cpu1", "cpu2", "cpu3",
> +		  "sys0", "sys1", "sys2", "sys3",
> +		  "aux0", "aux1", "aux2", "aux3",
> +		  "dimm0", "dimm1", "dimm2", "dimm3",
> +		  "pch", "gpu", "", "",
> +		  "", "", "", "",
> +		  "", "", "", "",
> +		  "oem0", "oem1", "oem", "oem3" },
> +	},
> +	{ 0x14, 0, 0, "pwm",
> +		{ 0xFF, 0x11, 0x12 },
> +		{ 1, 1, 1 },
> +		{ "label", "polarity", "freq" },
> +		{ "pwm0", "pwm0", "pwm0", "pwm0" },
> +	},
> +	{ 0x16, 2, 0, "tacho",
> +		{ 0xFF, 0x10 },
> +		{ 1, 1 },
> +		{ "label", "input"},
> +		{ "cpu0", "cpu1", "cpu2", "cpu3",
> +		  "sys0", "sys1", "sys2", "sys3",
> +		  "", "", "", "", "", "", "", "",
> +		  "", "", "", "", "", "", "", "",
> +		  "", "", "", "",
> +		  "oem0", "oem1", "oem2", "oem3"
> +		},
> +	},
> +	{ 0x24, 4, 0, "fan",
> +		{ 0xFF, 0x1A },
> +		{ 1, 1 },
> +		{ "label", "input"},
> +		{ "cpu0", "cpu1", "cpu2", "cpu3",
> +		  "sys0", "sys1", "sys2", "sys3",
> +		  "", "", "", "", "", "", "", "",
> +		  "", "", "", "", "", "", "", "",
> +		  "", "", "", "",
> +		  "oem0", "oem1", "oem2", "oem3",
> +		},
> +	},
> +	{ 0x28, 1, 0, "intrusion",
> +		{ 0xFF, 0x02 },
> +		{ 1, 1 },
> +		{ "label", "input" },
> +		{ "case_open" }
> +	}
> +};
> +
> +static struct {
> +	enum _sen_type type;
> +	u8   ctrl;
> +	int  size;
> +	bool write;
> +
> +} ctrl_para[] = {
> +	{ NONE,     0x00, 0, false },
> +
> +	{ VOLTAGE,  0x00, 1, false }, { VOLTAGE,  0x01, 1, false },
> +	{ VOLTAGE,  0x10, 2, false }, { VOLTAGE,  0x11, 2, false },
> +	{ VOLTAGE,  0x12, 2, false },
> +
> +	{ CURRENT,  0x00, 1, false }, { CURRENT,  0x01, 1, false },
> +	{ CURRENT,  0x10, 2, false }, { CURRENT,  0x11, 2, false },
> +	{ CURRENT,  0x12, 2, false },
> +
> +	{ TEMP,	    0x00, 2, false }, { TEMP,	  0x01, 1, false },
> +	{ TEMP,     0x04, 1, false }, { TEMP,	  0x10, 2, false },
> +	{ TEMP,     0x11, 2, false }, { TEMP,	  0x12, 2, false },
> +	{ TEMP,     0x21, 2, false }, { TEMP,	  0x41, 2, false },
> +
> +	{ PWM,      0x00, 1, false }, { PWM,	  0x10, 1, true  },
> +	{ PWM,      0x11, 1, true  }, { PWM,	  0x12, 4, true  },
> +
> +	{ TACHO,    0x00, 1, false }, { TACHO,	  0x01, 1, false },
> +	{ TACHO,    0x10, 4, true  },
> +
> +	{ FAN,      0x00, 1, false }, { FAN,	  0x01, 1, false },
> +	{ FAN,      0x03, 1, true  }, { FAN,	  0x1A, 2, false },
> +
> +	{ CASEOPEN, 0x00, 1, false }, { CASEOPEN, 0x02, 1, true  },
> +};
> +
> +static int para_idx(enum _sen_type type, u8 ctrl)
> +{
> +	int i;
> +
> +	for (i = 1 ; i < ARRAY_SIZE(ctrl_para) ; i++)
> +		if (type == ctrl_para[i].type &&
> +		    ctrl == ctrl_para[i].ctrl)
> +			return i;
> +
> +	return 0;
> +}
> +
> +static int pmc_read(struct device *mfd, enum _sen_type type, u8 dev_id, u8 ctrl, void *data)
> +{
> +	int idx = para_idx(type, ctrl);
> +	int ret = 0;
> +
> +	if (idx == 0)
> +		return -EINVAL;
> +
> +	if (WARN_ON(!data))
> +		return -EINVAL;
> +
> +	struct pmc_op op = {
> +		 .cmd       = sen_info[type].cmd | EIO_FLAG_PMC_READ,
> +		 .control   = ctrl,
> +		 .device_id = dev_id,
> +		 .size	    = ctrl_para[idx].size,
> +		 .payload   = (u8 *)data,
> +		 .timeout   = timeout,
> +	};
> +
> +	ret = eio_core_pmc_operation(mfd, &op);
> +	return ret;
> +}
> +
> +static ssize_t eio_show(struct device *dev, struct device_attribute *attr,
> +			char *buf)
> +{
> +	struct eio_hwmon_dev *eio_hwmon = dev_get_drvdata(dev);
> +	struct eio_attr *eio_attr =
> +		container_of(attr, struct eio_attr, sda.dev_attr);
> +	const struct eio_key *eio_key = &eio_attr->key;
> +	int ret;
> +	u8 data[2];
> +	u32 temp_val;
> +	signed int final_val;
> +
> +	switch (eio_key->item) {
> +	case 0:
> +		return sysfs_emit(buf, "%s\n",
> +				  sen_info[eio_key->type].labels[eio_key->label_idx]);
> +
> +	default:
> +		ret = pmc_read(eio_hwmon->mfd, eio_key->type, eio_key->chan,
> +			       sen_info[eio_key->type].ctrl[eio_key->item],
> +			       &data);
> +		if (ret)
> +			return ret;
> +
> +		temp_val = data[0] | data[1] << 8;
> +
> +		final_val = (signed int)temp_val + (signed int)(sen_info[eio_key->type].shift);
> +		final_val = final_val * (signed int)sen_info[eio_key->type].multi[eio_key->item];
> +
> +		return sysfs_emit(buf, "%d\n", final_val);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static char devname[MAX_DEV][MAX_NAME];
> +static struct eio_attr devattrs[MAX_DEV];
> +static struct attribute *attrs[MAX_DEV];
> +
> +static struct attribute_group group = {
> +	.attrs = attrs,
> +};
> +
> +static const struct attribute_group *groups[] = {
> +	&group,
> +	NULL
> +};
> +
> +static int hwmon_init(struct device *mfd, struct eio_hwmon_dev *eio_hwmon)
> +{
> +	enum _sen_type type;
> +	u8 i, j, data[16];
> +	int sum = 0;
> +	int ret;
> +
> +	for (type = VOLTAGE ; type <= CASEOPEN ; type++) {
> +		int cnt = 1;
> +
> +		for (i = 0 ; i < sen_info[type].max ; i++) {
> +			if (pmc_read(mfd, type, i, 0x00, data) ||
> +			    (data[0] & 0x01) == 0)
> +				continue;
> +
> +			memset(data, 0, sizeof(data));
> +			ret = pmc_read(mfd, type, i, 0x01, data);
> +			if (ret != 0 && ret != -EINVAL) {
> +				dev_info(mfd, "read type id error\n");
> +				continue;
> +			}
> +
> +			for (j = 0 ; j < ARRAY_SIZE(sen_info->item) ; j++) {
> +				struct eio_attr *eio_attr;
> +
> +				if (sen_info[type].item[j][0] == 0)
> +					continue;
> +
> +				eio_attr = &devattrs[sum];
> +
> +				eio_attr->key.type      = type;
> +				eio_attr->key.chan      = i;
> +				eio_attr->key.item      = j;
> +				eio_attr->key.label_idx = data[0];
> +
> +				snprintf(devname[sum], sizeof(devname[sum]),
> +					 "%s%d_%s", sen_info[type].name, cnt,
> +					 sen_info[type].item[j]);
> +
> +				eio_attr->sda.dev_attr.attr.name = devname[sum];
> +				eio_attr->sda.dev_attr.attr.mode = 0444;
> +				eio_attr->sda.dev_attr.show      = eio_show;
> +
> +				attrs[sum] = &eio_attr->sda.dev_attr.attr;
> +
> +				if (++sum >= MAX_DEV)
> +					break;
> +			}
> +			cnt++;
> +		}
> +	}
> +
> +	return sum;
> +}
> +
> +static int hwmon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =  &pdev->dev;
> +	struct eio_hwmon_dev *eio_hwmon;
> +	struct eio_dev *eio_dev = dev_get_drvdata(dev->parent);
> +	struct device *hwmon;
> +
> +	if (!eio_dev) {
> +		dev_err(dev, "Error contact eio_core\n");
> +		return -ENODEV;
> +	}
> +
> +	eio_hwmon = devm_kzalloc(dev, sizeof(*eio_hwmon), GFP_KERNEL);
> +	if (!eio_hwmon)
> +		return -ENOMEM;
> +
> +	eio_hwmon->mfd = dev->parent;
> +	platform_set_drvdata(pdev, eio_hwmon);
> +
> +	if (hwmon_init(dev->parent, eio_hwmon) <= 0)
> +		return -ENODEV;
> +
> +	hwmon =	devm_hwmon_device_register_with_groups(dev, KBUILD_MODNAME,
> +						       eio_hwmon,
> +						       groups);

This API is deprecated. Please rework to use
devm_hwmon_device_register_with_info().

Also, it is highly unusual to have both a hardware monitoring driver
and a thermal driver (instead of instantiating the thermal device
from the hardware monitoring driver). This warrants a detailed
explanation.

Thanks,
Guenter

> +	return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
> +static struct platform_driver eio_hwmon_driver = {
> +	.probe  = hwmon_probe,
> +	.driver = {
> +		.name = "eio_hwmon",
> +	},
> +};
> +
> +module_platform_driver(eio_hwmon_driver);
> +
> +MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
> +MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
> +MODULE_DESCRIPTION("Hardware monitor driver for Advantech EIO embedded controller");
> +MODULE_LICENSE("GPL");
> +
> 
> -- 
> 2.43.0
> 
> 


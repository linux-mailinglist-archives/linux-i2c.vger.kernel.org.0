Return-Path: <linux-i2c+bounces-12832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B4EB517D8
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 15:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EF30162D2A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC5E2773D1;
	Wed, 10 Sep 2025 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8/zfAbZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49861F03F3;
	Wed, 10 Sep 2025 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510780; cv=none; b=ACrMGzUmKfHD0RMyQbgJsj7GuGSBsFCsBCyf6dikzLdiRafKCTED/4C6zjLJ5kDjoCtzd7a06vY//aFitvUwbNksJwQ2IEDxH55VDDEkujrd7Doxk70LWh2QHNq03hT8dFSGlEsckXtPkxo5AjlG5cpOiueKYtRiw5ZmO6QQJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510780; c=relaxed/simple;
	bh=tHqTgeCMhHwVQ9Zw4Z+jalU/1/EG6i17DOIyfe8tCpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDE6onuWbSC/8exFR/1Kgr89TXvwvvSqX9erd0hoe5V3qNEL5b6KNyAFXawhH4aHRs3HhRdSAlah5FIMG+4hBWx4nOnqS5Dvt/2PRqvHMmsXA4ppgKc9iVKdJEtR5REYonNikAVMx5y8T91eO1NfJxTRMiiIHcKrAQyP/LJ0d1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8/zfAbZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E517C4CEF0;
	Wed, 10 Sep 2025 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757510779;
	bh=tHqTgeCMhHwVQ9Zw4Z+jalU/1/EG6i17DOIyfe8tCpo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q8/zfAbZ8J19rKxBbdTsyrkQRPWzsUBvyl1QKH1oUuUHzFDdbNDyRYRY7bsGux/wK
	 ogAuULIUUgzfkDpXAGYy1h7WAd4ehOHUK0rnF4+pOSXZzIB+i2WShRmuFj7zuq3wSH
	 aNfUd5PdaAM2MtkwOTLAQY3yREA+fxc7TRFDTY//SBUmHmwTkFMA70mxFILtNO0+S2
	 QKDId6IlgqCuDuGW8n/sU0zYvrmGEj+4JRV3h5LeCAlbUy3EOeh2avwao2FGyixP6Z
	 Vj9c12v6KhISoHoWcxSqzN7D8p4jnmqcgbunB/htgQ7EDvPPRPPWgaxK87Q1owcq1f
	 uQfDDU0MY6nFQ==
Message-ID: <426acfa1-82a4-4465-9d70-6566fb9504a1@kernel.org>
Date: Wed, 10 Sep 2025 15:26:15 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] gpio: Add Intel USBIO GPIO driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Richard Hughes
 <rhughes@redhat.com>, linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250910121749.63853-1-hansg@kernel.org>
 <CAMRc=MdLJSd7JOA5Z=FP7q-XVc2WYMhnj7zO+hk8_0JhB9MTUA@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAMRc=MdLJSd7JOA5Z=FP7q-XVc2WYMhnj7zO+hk8_0JhB9MTUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10-Sep-25 3:20 PM, Bartosz Golaszewski wrote:
> On Wed, Sep 10, 2025 at 2:17 PM Hans de Goede <hansg@kernel.org> wrote:
>>
>> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>>
>> Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
>> IO-expander used by the MIPI cameras on various new (Meteor Lake and
>> later) Intel laptops.
>>
>> Co-developed-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>> ---
>> Changes in v3:
>> - Drop (offset >= gc->ngpio) check and make usbio_gpio_get_bank_and_pin()
>>   return void
>> - Propagate usbio_gpio_set() ret val in usbio_gpio_direction_output()
>> - Use devm_gpiochip_add_data() and drop auxiliary_driver remove() callback
>>
>> Changes in v2:
>> - Add a config_mutex protect usbio_gpio_update_config() calls, which
>>   read-modify-write banks[x].config, racing with each other
>> - Adjust usbio_gpio_get() to have an int return value and propagate the
>>   usbio_control_msg() return value
>> - Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
>> - Some small style fixes from Sakari's review
>> ---
>>  MAINTAINERS               |   1 +
>>  drivers/gpio/Kconfig      |  11 ++
>>  drivers/gpio/Makefile     |   1 +
>>  drivers/gpio/gpio-usbio.c | 250 ++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 263 insertions(+)
>>  create mode 100644 drivers/gpio/gpio-usbio.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3410699ad0b2..53694bd91861 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -12699,6 +12699,7 @@ M:      Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>>  M:     Hans de Goede <hansg@kernel.org>
>>  R:     Sakari Ailus <sakari.ailus@linux.intel.com>
>>  S:     Maintained
>> +F:     drivers/gpio/gpio-usbio.c
>>  F:     drivers/usb/misc/usbio.c
>>  F:     include/linux/usb/usbio.h
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index e43abb322fa6..5d3ca3dd2687 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -1448,6 +1448,17 @@ config GPIO_LJCA
>>           This driver can also be built as a module. If so, the module
>>           will be called gpio-ljca.
>>
>> +config GPIO_USBIO
>> +       tristate "Intel USBIO GPIO support"
>> +       depends on USB_USBIO
>> +       default USB_USBIO
>> +       help
>> +         Select this option to enable GPIO driver for the INTEL
>> +         USBIO driver stack.
>> +
>> +         This driver can also be built as a module. If so, the module
>> +         will be called gpio_usbio.
>> +
>>  config GPIO_LP3943
>>         tristate "TI/National Semiconductor LP3943 GPIO expander"
>>         depends on MFD_LP3943
>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>> index 379f55e9ed1e..8c55e2d5de42 100644
>> --- a/drivers/gpio/Makefile
>> +++ b/drivers/gpio/Makefile
>> @@ -90,6 +90,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)           += gpio-janz-ttl.o
>>  obj-$(CONFIG_GPIO_KEMPLD)              += gpio-kempld.o
>>  obj-$(CONFIG_GPIO_LATCH)               += gpio-latch.o
>>  obj-$(CONFIG_GPIO_LJCA)                += gpio-ljca.o
>> +obj-$(CONFIG_GPIO_USBIO)               += gpio-usbio.o
>>  obj-$(CONFIG_GPIO_LOGICVC)             += gpio-logicvc.o
>>  obj-$(CONFIG_GPIO_LOONGSON1)           += gpio-loongson1.o
>>  obj-$(CONFIG_GPIO_LOONGSON)            += gpio-loongson.o
>> diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
>> new file mode 100644
>> index 000000000000..31a376e91877
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-usbio.c
>> @@ -0,0 +1,250 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025 Intel Corporation.
>> + * Copyright (c) 2025 Red Hat, Inc.
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/dev_printk.h>
> 
> No need to pull this if you include device.h.

Ok, I'll fix this for v4, which I will delay till
I've a full v4 series to send.

> 
>> +       usbio_acpi_bind(gpio->adev, usbio_gpio_acpi_hids);
>> +
>> +       for (bank = 0; bank < USBIO_MAX_GPIOBANKS && bank_desc[bank].bmap; bank++)
>> +               gpio->banks[bank].bitmap = le32_to_cpu(bank_desc[bank].bmap);
>> +
>> +       gpio->gc.label = ACPI_COMPANION(dev) ?
>> +                                       acpi_dev_name(ACPI_COMPANION(dev)) : dev_name(dev);
>> +       gpio->gc.parent = dev;
>> +       gpio->gc.owner = THIS_MODULE;
>> +       gpio->gc.get_direction = usbio_gpio_get_direction;
>> +       gpio->gc.direction_input = usbio_gpio_direction_input;
>> +       gpio->gc.direction_output = usbio_gpio_direction_output;
>> +       gpio->gc.get = usbio_gpio_get;
>> +       gpio->gc.set = usbio_gpio_set;
>> +       gpio->gc.set_config = usbio_gpio_set_config;
>> +       gpio->gc.base = -1;
>> +       gpio->gc.ngpio = bank * USBIO_GPIOSPERBANK;
>> +       gpio->gc.can_sleep = true;
>> +
>> +       auxiliary_set_drvdata(adev, gpio);
>> +
> 
> Now you no longer need this as there's no remove() anymore.

Ack, I'll fix this for v4.

Regards,

Hans



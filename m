Return-Path: <linux-i2c+bounces-12825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF6B515D3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9C39563BEC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 11:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A1F27816B;
	Wed, 10 Sep 2025 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uaG1LPUS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A854023A9AE;
	Wed, 10 Sep 2025 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757504076; cv=none; b=sKHh2ETs1u8Bvx/9kWfPZ8X9jKkb6ZWRhXB4CeATAVMqzR/9+gfOGQ3N2g5GxLVOtCflH1zYiAOw6rNOpT5lxg9iRbjcclVzEYx6sJsUyVc6PgkhVuu85CPz4gTBD/m1p6q1FLxz7QKNtyYfOjYXs6F/m6d1thhlYKI6sw3LRHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757504076; c=relaxed/simple;
	bh=hZHA1JcWn5VlSgjLR2nnUIPVLLhvKbYHL5YwHsn6OhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ibgggx7odHXkbv58zYHkiHYwdh2vDERaZF9jBrr/KHkPHrwlgDt0p6AzKaoU5cCZ7MLe1TcrxVKaupmTfJPzWF8rc5aeH5cqQupIMHfdu2/p+yuEMM0IKF49gvxVdDlDEbh6GvFu+PdgdC3FkaCDcltqxqyWolCu+r/BJ6GBFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uaG1LPUS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0838C4CEF0;
	Wed, 10 Sep 2025 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757504076;
	bh=hZHA1JcWn5VlSgjLR2nnUIPVLLhvKbYHL5YwHsn6OhA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uaG1LPUS4U/bRFiOxCtRdJbVkQ8jA6qxeXMrOh5Mg6pRSEQSJGRZq/eejhiSaif99
	 fV+UVDbrt1CxRmLlHPxbILbYW0PV+5S+mdCbY4cJXopFPx9Ri2yMjvR2wNcL4Juxzm
	 OazM9Esn1wZqmZAnMmfBbtDiMy5buVymIp2gFlJ9Br6EwtD3CvDGvxCFUWBlLMBnfL
	 D0YWQmIRfs8+ftCNkB690aDV0S/qn9z9n+/6phdDViog7mUhcMOnz+t+u/RHxRX6Vf
	 PGxImqpID1YjFokyTrgV7BoioWRq8nAiwBP8EkRT6lNXAsQWWMHokUWqyALIQx6vkH
	 wzQlOydrOc8gg==
Message-ID: <a77d0593-4001-4315-b8de-22c4b85f213f@kernel.org>
Date: Wed, 10 Sep 2025 13:34:32 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] gpio: Add Intel USBIO GPIO driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250907175056.47314-1-hansg@kernel.org>
 <20250907175056.47314-3-hansg@kernel.org>
 <CAMRc=Mcwez1bebe4KBxh2V23+U3A6Fhz3q_dC1XmnT1DfD2Yig@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAMRc=Mcwez1bebe4KBxh2V23+U3A6Fhz3q_dC1XmnT1DfD2Yig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

Thank you for the review.

On 9-Sep-25 11:58 AM, Bartosz Golaszewski wrote:
> On Sun, 7 Sep 2025 19:50:55 +0200, Hans de Goede <hansg@kernel.org> said:
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
>>  drivers/gpio/gpio-usbio.c | 267 ++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 280 insertions(+)
>>  create mode 100644 drivers/gpio/gpio-usbio.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3410699ad0b2..53694bd91861 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -12699,6 +12699,7 @@ M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>>  M:	Hans de Goede <hansg@kernel.org>
>>  R:	Sakari Ailus <sakari.ailus@linux.intel.com>
>>  S:	Maintained
>> +F:	drivers/gpio/gpio-usbio.c
>>  F:	drivers/usb/misc/usbio.c
>>  F:	include/linux/usb/usbio.h
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index e43abb322fa6..5d3ca3dd2687 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -1448,6 +1448,17 @@ config GPIO_LJCA
>>  	  This driver can also be built as a module. If so, the module
>>  	  will be called gpio-ljca.
>>
>> +config GPIO_USBIO
>> +	tristate "Intel USBIO GPIO support"
>> +	depends on USB_USBIO
>> +	default USB_USBIO
>> +	help
>> +	  Select this option to enable GPIO driver for the INTEL
>> +	  USBIO driver stack.
>> +
>> +	  This driver can also be built as a module. If so, the module
>> +	  will be called gpio_usbio.
>> +
>>  config GPIO_LP3943
>>  	tristate "TI/National Semiconductor LP3943 GPIO expander"
>>  	depends on MFD_LP3943
>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>> index 379f55e9ed1e..8c55e2d5de42 100644
>> --- a/drivers/gpio/Makefile
>> +++ b/drivers/gpio/Makefile
>> @@ -90,6 +90,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
>>  obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
>>  obj-$(CONFIG_GPIO_LATCH)		+= gpio-latch.o
>>  obj-$(CONFIG_GPIO_LJCA) 		+= gpio-ljca.o
>> +obj-$(CONFIG_GPIO_USBIO) 		+= gpio-usbio.o
>>  obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
>>  obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
>>  obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
>> diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
>> new file mode 100644
>> index 000000000000..1df32105cf51
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-usbio.c
>> @@ -0,0 +1,267 @@
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
>> +#include <linux/device.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +#include <linux/usb/usbio.h>
>> +
>> +struct usbio_gpio_bank {
>> +	u8 config[USBIO_GPIOSPERBANK];
>> +	u32 bitmap;
>> +};
>> +
>> +struct usbio_gpio {
>> +	struct mutex config_mutex; /* Protects banks[x].config */
>> +	struct usbio_gpio_bank banks[USBIO_MAX_GPIOBANKS];
>> +	struct gpio_chip gc;
>> +	struct auxiliary_device *adev;
>> +};
>> +
>> +static const struct acpi_device_id usbio_gpio_acpi_hids[] = {
>> +	{ "INTC1007" }, /* MTL */
>> +	{ "INTC10B2" }, /* ARL */
>> +	{ "INTC10B5" }, /* LNL */
>> +	{ "INTC10E2" }, /* PTL */
>> +	{ }
>> +};
>> +
>> +static bool usbio_gpio_get_bank_and_pin(struct gpio_chip *gc, unsigned int offset,
>> +					struct usbio_gpio_bank **bank_ret,
>> +					unsigned int *pin_ret)
>> +{
>> +	struct usbio_gpio *gpio = gpiochip_get_data(gc);
>> +	struct device *dev = &gpio->adev->dev;
>> +	struct usbio_gpio_bank *bank;
>> +	unsigned int pin;
>> +
>> +	if (offset >= gc->ngpio)
>> +		return false;
>> +
> 
> No need for that, GPIO core will make sure this never happens.

Ack, will fix for v3. That also allows making this function
return void further simplyfying things.

>> +	bank = &gpio->banks[offset / USBIO_GPIOSPERBANK];
>> +	pin = offset % USBIO_GPIOSPERBANK;
>> +	if (~bank->bitmap & BIT(pin)) {
>> +		/* The FW bitmap sometimes is invalid, warn and continue */
>> +		dev_warn_once(dev, FW_BUG "GPIO %u is not in FW pins bitmap\n", offset);
>> +	}
>> +
>> +	*bank_ret = bank;
>> +	*pin_ret = pin;
>> +	return true;
>> +}

...

>> +static int usbio_gpio_direction_output(struct gpio_chip *gc,
>> +		unsigned int offset, int value)
>> +{
>> +	int ret;
>> +
>> +	ret = usbio_gpio_update_config(gc, offset, USBIO_GPIO_PINMOD_MASK,
>> +				       USBIO_GPIO_SET_PINMOD(USBIO_GPIO_PINMOD_OUTPUT));
>> +	if (ret)
>> +		return ret;
>> +
>> +	usbio_gpio_set(gc, offset, value);
>> +	return 0;
> 
> return usbio_gpio_set(gc, offset, value);?

Ack, usbio_gpio_set() returned void in v1, hence this
construct. Will fix for v3.

>> +}

...

>> +static int usbio_gpio_probe(struct auxiliary_device *adev,
>> +		const struct auxiliary_device_id *adev_id)
>> +{

...

>> +	auxiliary_set_drvdata(adev, gpio);
>> +
>> +	ret = gpiochip_add_data(&gpio->gc, gpio);
> 
> Please use the devres variant, you'll be able to drop the remove() callback.

Ack, will fix for v3.

>> +	if (ret)
>> +		return ret;
>> +
>> +	if (has_acpi_companion(dev))
>> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
>> +
>> +	return 0;
>> +}
>> +
>> +static void usbio_gpio_remove(struct auxiliary_device *adev)
>> +{
>> +	struct usbio_gpio *gpio = auxiliary_get_drvdata(adev);
>> +
>> +	gpiochip_remove(&gpio->gc);
>> +}
>> +
>> +static const struct auxiliary_device_id usbio_gpio_id_table[] = {
>> +	{ "usbio.usbio-gpio" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(auxiliary, usbio_gpio_id_table);
>> +
>> +static struct auxiliary_driver usbio_gpio_driver = {
>> +	.name = USBIO_GPIO_CLIENT,
>> +	.probe = usbio_gpio_probe,
>> +	.remove = usbio_gpio_remove,
>> +	.id_table = usbio_gpio_id_table
>> +};
>> +module_auxiliary_driver(usbio_gpio_driver);
>> +
>> +MODULE_DESCRIPTION("Intel USBIO GPIO driver");
>> +MODULE_AUTHOR("Israel Cepeda <israel.a.cepeda.lopez@intel.com>");
>> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("USBIO");
>> --
>> 2.51.0
>>
>>
> 
> Looks good otherwise.

Thank you I'll go and preparare a standalone v3
(since the other 2 patches have no reviews yet).

As mentioned in the cover-letter it is probably easiest
if Greg merges the entire series through his usb tree
once everything has been reviewed.

Once I've send it, can you please ack v3 for merging through
Greg's USB tree?

Regards,

Hans




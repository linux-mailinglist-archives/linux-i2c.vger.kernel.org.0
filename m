Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E4F5515B9
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jun 2022 12:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239358AbiFTKZi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 06:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239255AbiFTKZi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 06:25:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A4DE027;
        Mon, 20 Jun 2022 03:25:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5E4F6B80FEA;
        Mon, 20 Jun 2022 10:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E31C3411C;
        Mon, 20 Jun 2022 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655720734;
        bh=TALh6YaxoFwAOs0mabuCsruXhRKNt0t30b757wW+AR8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E4qAbXVEaj+txKOqcdQRLsT4L6Iqu6mZHXxEcodJMOVZw5zS8Bw/NZOpmca9SfWrj
         KpgCGYoK03TomGrkM2sjrffboS8sIsumQ5HB7pjQRlYEsXaB1K/Jt+HcN6avhoc/oY
         byTigLllp2UwS7OHqgT0XSysCIkmBNhG7A0Ztg00gA4zzKzCPuw035SDjl45HEHJCU
         0aXOrmLZAWrUYBuDOGaUKiIk8gAn8rpNqbvGPeerNL2VJz4bhTtcqXhr0U2fmx5tw9
         t4O1yIgx4Z/8tFTaSP1dt01Xb+5a2+61BF0yx24xt2dI1oEYbW8EGeunf1d8a2S/1f
         8I+rMdmajFOEA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3Eb2-0008N5-Ba; Mon, 20 Jun 2022 12:25:29 +0200
Date:   Mon, 20 Jun 2022 12:25:28 +0200
From:   Johan Hovold <johan@kernel.org>
To:     frank zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, linux-usb@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 2/4] gpio: ch341: add GPIO MFD cell driver for the
 CH341
Message-ID: <YrBLGMD/Gzfv0W6F@hovoldconsulting.com>
References: <20220616013747.126051-1-frank@zago.net>
 <20220616013747.126051-3-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616013747.126051-3-frank@zago.net>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 15, 2022 at 08:37:45PM -0500, frank zago wrote:
> The GPIO interface offers 16 GPIOs. 6 are read/write, and 10 are
> read-only.

Please mention the single interrupt line here too.

> Signed-off-by: frank zago <frank@zago.net>
> ---
>  MAINTAINERS               |   1 +
>  drivers/gpio/Kconfig      |  10 +
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-ch341.c | 385 ++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/ch341.h |   8 +
>  5 files changed, 405 insertions(+)
>  create mode 100644 drivers/gpio/gpio-ch341.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 628eeaa9bf68..8b93f6192704 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21479,6 +21479,7 @@ WINCHIPHEAD CH341 I2C/GPIO MFD DRIVER
>  M:	Frank Zago <frank@zago.net>
>  L:	linux-usb@vger.kernel.org
>  S:	Maintained
> +F:	drivers/gpio/gpio-ch341.c
>  F:	drivers/mfd/ch341-core.c
>  F:	include/linux/mfd/ch341.h
>  
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b01961999ced..473b6e7226ca 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1653,6 +1653,16 @@ endmenu
>  menu "USB GPIO expanders"
>  	depends on USB
>  
> +config GPIO_CH341
> +	tristate "CH341 USB to GPIO support"
> +	select MFD_CH341

This should be "depends" (for all subdrivers).

> +	help
> +	  If you say yes to this option, GPIO support will be included for the
> +	  WCH CH341, a USB to I2C/SPI/GPIO interface.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called gpio-ch341.
> +
>  config GPIO_VIPERBOARD
>  	tristate "Viperboard GPIO a & b support"
>  	depends on MFD_VIPERBOARD

[ and other MFD drivers as you see here ]

> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 14352f6dfe8e..beef802cbfb1 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
>  obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
>  obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
>  obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
> +obj-$(CONFIG_GPIO_CH341)		+= gpio-ch341.o
>  obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
>  obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
>  obj-$(CONFIG_GPIO_CRYSTAL_COVE)		+= gpio-crystalcove.o
> diff --git a/drivers/gpio/gpio-ch341.c b/drivers/gpio/gpio-ch341.c
> new file mode 100644
> index 000000000000..233dfe1f2ae8
> --- /dev/null
> +++ b/drivers/gpio/gpio-ch341.c
> @@ -0,0 +1,385 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * GPIO cell driver for the CH341A and CH341B chips.
> + *
> + * Copyright 2022, Frank Zago

How about using a unified format for these lines?

> + * Copyright (c) 2017 Gunar Schorcht (gunar@schorcht.net)
> + * Copyright (c) 2016 Tse Lun Bien
> + * Copyright (c) 2014 Marco Gittler
> + * Copyright (c) 2006-2007 Till Harbaum (Till@Harbaum.org)
> + */
> +
> +/*
> + * Notes.
> + *
> + * For the CH341, 0=IN, 1=OUT, but for the GPIO subsystem, 1=IN and
> + * 0=OUT. Translation happens in a couple places.
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/ch341.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/usb.h>
> +
> +#define CH341_GPIO_NUM_PINS         16    /* Number of GPIO pins */
> +
> +/* GPIO chip commands */
> +#define CH341_PARA_CMD_STS          0xA0  /* Get pins status */
> +#define CH341_CMD_UIO_STREAM        0xAB  /* pin IO stream command */
> +
> +#define CH341_CMD_UIO_STM_OUT       0x80  /* pin IO interface OUT command (D0~D5) */
> +#define CH341_CMD_UIO_STM_DIR       0x40  /* pin IO interface DIR command (D0~D5) */
> +#define CH341_CMD_UIO_STM_END       0x20  /* pin IO interface END command */
> +
> +#define CH341_USB_MAX_INTR_SIZE 8
> +
> +struct ch341_gpio {
> +	struct gpio_chip gpio;
> +	struct mutex gpio_lock;
> +	u16 gpio_dir;		/* 1 bit per pin, 0=IN, 1=OUT. */
> +	u16 gpio_last_read;	/* last GPIO values read */
> +	u16 gpio_last_written;	/* last GPIO values written */
> +	union {
> +		u8 gpio_buf[SEG_SIZE];
> +		__le16 gpio_buf_status;
> +	};

This one should be allocated separately from the containing structure
since it may be mapped for DMA.

> +
> +	struct urb *irq_urb;
> +	struct usb_anchor irq_urb_out;
> +	u8 irq_buf[CH341_USB_MAX_INTR_SIZE];

Same here.

You may need to check other drivers too.

> +	struct irq_chip irq_chip;
> +
> +	struct ch341_ddata *ddata;
> +};
> +
> +/*
> + * Masks to describe the 16 GPIOs. Pins D0 to D5 (mapped to GPIOs 0 to
> + * 5) can do input/output, but the other pins are input-only.
> + */
> +static const u16 pin_can_output = 0b111111;
> +
> +/* Only GPIO 10 (INT# line) has hardware interrupt */
> +#define CH341_GPIO_INT_LINE 10
> +
> +/* Send a command and get a reply if requested */
> +static int gpio_transfer(struct ch341_gpio *dev, int out_len, int in_len)
> +{
> +	struct ch341_ddata *ddata = dev->ddata;
> +	int actual;
> +	int ret;
> +
> +	mutex_lock(&ddata->usb_lock);
> +
> +	ret = usb_bulk_msg(ddata->usb_dev,
> +			   usb_sndbulkpipe(ddata->usb_dev, ddata->ep_out),
> +			   dev->gpio_buf, out_len,
> +			   &actual, DEFAULT_TIMEOUT_MS);
> +	if (ret < 0)
> +		goto out_unlock;
> +
> +	if (in_len == 0)
> +		goto out_unlock;
> +
> +	ret = usb_bulk_msg(ddata->usb_dev,
> +			   usb_rcvbulkpipe(ddata->usb_dev, ddata->ep_in),
> +			   dev->gpio_buf, SEG_SIZE, &actual, DEFAULT_TIMEOUT_MS);
> +
> +out_unlock:
> +	mutex_unlock(&ddata->usb_lock);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return actual;
> +}

> +static void ch341_complete_intr_urb(struct urb *urb)
> +{
> +	struct ch341_gpio *dev = urb->context;
> +	int ret;
> +
> +	if (urb->status) {
> +		usb_unanchor_urb(dev->irq_urb);

Again, why is this here?

> +	} else {
> +		/*
> +		 * Data is 8 bytes. Byte 0 might be the length of
> +		 * significant data, which is 3 more bytes. Bytes 1
> +		 * and 2, and possibly 3, are the pin status. The byte
> +		 * order is different than for the GET_STATUS
> +		 * command. Byte 1 is GPIOs 8 to 15, and byte 2 is
> +		 * GPIOs 0 to 7.
> +		 */
> +
> +		handle_nested_irq(irq_find_mapping(dev->gpio.irq.domain,
> +						   CH341_GPIO_INT_LINE));
> +
> +		ret = usb_submit_urb(dev->irq_urb, GFP_ATOMIC);
> +		if (ret)
> +			usb_unanchor_urb(dev->irq_urb);

Ditto. This isn't how anchors are used.

> +	}
> +}
> +
> +static int ch341_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
> +{
> +	const unsigned long offset = irqd_to_hwirq(data);
> +
> +	if (offset != CH341_GPIO_INT_LINE || flow_type != IRQ_TYPE_EDGE_RISING)
> +		return -EINVAL;

Ok, I missed this check before, sorry. So you do have a single interrupt
line.

You should probably add a comment in the enable() callback since this is
easy to miss.

> +
> +	return 0;
> +}
> +
> +static void ch341_gpio_irq_enable(struct irq_data *data)
> +{
> +	struct ch341_gpio *dev = irq_data_get_irq_chip_data(data);
> +	int ret;
> +
> +	/*
> +	 * The URB might have just been unlinked in
> +	 * ch341_gpio_irq_disable, but the completion handler hasn't
> +	 * been called yet.
> +	 */
> +	if (!usb_wait_anchor_empty_timeout(&dev->irq_urb_out, 5000))
> +		usb_kill_anchored_urbs(&dev->irq_urb_out);

You cannot sleep in this function.

> +
> +	usb_anchor_urb(dev->irq_urb, &dev->irq_urb_out);
> +	ret = usb_submit_urb(dev->irq_urb, GFP_KERNEL);
> +	if (ret)
> +		usb_unanchor_urb(dev->irq_urb);
> +}
> +
> +static void ch341_gpio_irq_disable(struct irq_data *data)
> +{
> +	struct ch341_gpio *dev = irq_data_get_irq_chip_data(data);
> +
> +	usb_unlink_urb(dev->irq_urb);
> +}
> +
> +static int ch341_gpio_remove(struct platform_device *pdev)
> +{
> +	struct ch341_gpio *dev = platform_get_drvdata(pdev);
> +
> +	usb_kill_anchored_urbs(&dev->irq_urb_out);

Again, this is racy as the gpio chip is still registered. And you don't
need an anchor to stop a single URB.

> +	gpiochip_remove(&dev->gpio);
> +	usb_free_urb(dev->irq_urb);
> +
> +	return 0;
> +}
> +
> +static const struct irq_chip ch341_irqchip = {
> +	.name = "CH341",
> +	.irq_set_type = ch341_gpio_irq_set_type,
> +	.irq_enable = ch341_gpio_irq_enable,
> +	.irq_disable = ch341_gpio_irq_disable,
> +	.flags = IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
> +static int ch341_gpio_probe(struct platform_device *pdev)
> +{
> +	struct ch341_ddata *ddata = dev_get_drvdata(pdev->dev.parent);
> +	struct gpio_irq_chip *girq;
> +	struct ch341_gpio *dev;
> +	struct gpio_chip *gpio;
> +	int ret;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (dev == NULL)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, dev);
> +	dev->ddata = ddata;
> +	mutex_init(&dev->gpio_lock);
> +
> +	gpio = &dev->gpio;
> +	gpio->label = dev_name(&pdev->dev);
> +	gpio->parent = &pdev->dev;
> +	gpio->owner = THIS_MODULE;
> +	gpio->get_direction = ch341_gpio_get_direction;
> +	gpio->direction_input = ch341_gpio_direction_input;
> +	gpio->direction_output = ch341_gpio_direction_output;
> +	gpio->get = ch341_gpio_get;
> +	gpio->get_multiple = ch341_gpio_get_multiple;
> +	gpio->set = ch341_gpio_set;
> +	gpio->set_multiple = ch341_gpio_set_multiple;
> +	gpio->base = -1;
> +	gpio->ngpio = CH341_GPIO_NUM_PINS;
> +	gpio->can_sleep = true;
> +
> +	girq = &gpio->irq;
> +	gpio_irq_chip_set_chip(girq, &ch341_irqchip);
> +	girq->handler = handle_simple_irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +
> +	/* Create an URB for handling interrupt */
> +	dev->irq_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!dev->irq_urb)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Cannot allocate the int URB\n");

This isn't how dev_err_probe() is used.

And allocation failures are already logged so just return -ENOMEM here.

> +
> +	usb_fill_int_urb(dev->irq_urb, ddata->usb_dev,
> +			 usb_rcvintpipe(ddata->usb_dev, ddata->ep_intr),
> +			 dev->irq_buf, CH341_USB_MAX_INTR_SIZE,
> +			 ch341_complete_intr_urb, dev, ddata->ep_intr_interval);
> +
> +	init_usb_anchor(&dev->irq_urb_out);
> +
> +	ret = gpiochip_add_data(gpio, dev);
> +	if (ret) {
> +		ret = dev_err_probe(&pdev->dev, ret, "Could not add GPIO\n");
> +		goto release_urb;
> +	}
> +
> +	return 0;
> +
> +release_urb:
> +	usb_free_urb(dev->irq_urb);
> +
> +	return ret;
> +}

Johan

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99EE055D7BF
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 15:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236613AbiF0OEi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jun 2022 10:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236592AbiF0OEh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jun 2022 10:04:37 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EDB12096
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jun 2022 07:04:36 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id n1so13201581wrg.12
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jun 2022 07:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0l/VKWYVQYUILKHgUYVfRFznW8ESnk3f9wu78mOXDpQ=;
        b=fr6mv6TnpMpTlXuFkKPP4lOMfCrmwbEBAqT6sTs2WU1P5iVjUAvI7uc/M9w7s80gB1
         e/se7CqifL1OHrTNbyHhvxo+UtbyjjKbQXH63175sLjIo4MVP+T5LoBteSmCsmyE+28w
         4L5mSclfxQcbvxV5b6LzHQqIalkYvGayIfWLlbaClViFJS+MYtKDw/3NgVL1+pQyVR3m
         5Wmv7z1bfxcmEoI93hJxj2Om16bD07GhWWxpkuCT++NEZ5FWt3ul7Zs3r2vOaPy8/ExF
         7IKHQ+Dj7BuhZRfNQjFFLAptDa6yfQBlRRa4WRv9xNXN09f+IlOVf8Pe+BwkoK/F01W8
         mEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0l/VKWYVQYUILKHgUYVfRFznW8ESnk3f9wu78mOXDpQ=;
        b=xalOSdf+xyqXMRkrMnIXMzplc8SgsqFJb3t97mN+ztRWdkXPc8r3LLQA5CYCkCzUK1
         DNHkqAodhUfT3y/Lxf0V/DiIdfKi7opdyZawsyG0q139bCxc36tW8JFPPogrzVcVgrsU
         HmwBhIAQEXi9ftPul435baMa5A+Oxe3z9uNv3WlxJCeU46P+aiqcHYDJCOfKiZAaBfk2
         VR+TeqCS0Hts5b4yUIMKD19zCKLY1dRlflToStkYqaMKx2/2U7xZuwKsDfwvFlvYCakl
         H3dDzMzUIaaCl2Xh6slJs06dfw2TJu+FxXa1+EY6zqV03FT/+MCutAgCxFKN0VMpdoyN
         Df5A==
X-Gm-Message-State: AJIora83IwXavA6sMBG1ZdHzO9CgQ0pcW3sNlR8nrpJ9XWvY7SJ8lZ+2
        g5kVq+coKd3AL5hQd3CV+jQTOA==
X-Google-Smtp-Source: AGRyM1vvWxz6nF9L1dodsmukjEyzuMTKpQETdXdUB4Q85bp26hqLCSY/unFPZHKLoXk0uhvoU6atsg==
X-Received: by 2002:a05:6000:2c8:b0:21d:1660:e32 with SMTP id o8-20020a05600002c800b0021d16600e32mr1744303wry.99.1656338674652;
        Mon, 27 Jun 2022 07:04:34 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id h3-20020adfe983000000b0021b97ffa2a9sm10844166wrm.46.2022.06.27.07.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 07:04:34 -0700 (PDT)
Date:   Mon, 27 Jun 2022 15:04:32 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     frank zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 1/4] mfd: ch341: add core driver for the WCH CH341 in
 I2C/SPI/GPIO mode
Message-ID: <Yrm48AYxkmoUgdwr@google.com>
References: <20220616013747.126051-1-frank@zago.net>
 <20220616013747.126051-2-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220616013747.126051-2-frank@zago.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

USB review please.

> The CH341 is a multifunction chip, presenting 3 different USB PID. One
> 
> of these functions is for I2C/SPI/GPIO. This new set of drivers will
> manage I2C and GPIO.
> 
> Signed-off-by: frank zago <frank@zago.net>
> ---
>  MAINTAINERS               |  7 +++
>  drivers/mfd/Kconfig       | 10 +++++
>  drivers/mfd/Makefile      |  1 +
>  drivers/mfd/ch341-core.c  | 90 +++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/ch341.h | 18 ++++++++
>  5 files changed, 126 insertions(+)
>  create mode 100644 drivers/mfd/ch341-core.c
>  create mode 100644 include/linux/mfd/ch341.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 43d3d07afccd..628eeaa9bf68 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21475,6 +21475,13 @@ M:	David Härdeman <david@hardeman.nu>
>  S:	Maintained
>  F:	drivers/media/rc/winbond-cir.c
>  
> +WINCHIPHEAD CH341 I2C/GPIO MFD DRIVER
> +M:	Frank Zago <frank@zago.net>
> +L:	linux-usb@vger.kernel.org
> +S:	Maintained
> +F:	drivers/mfd/ch341-core.c
> +F:	include/linux/mfd/ch341.h
> +
>  WINSYSTEMS EBC-C384 WATCHDOG DRIVER
>  M:	William Breathitt Gray <vilhelm.gray@gmail.com>
>  L:	linux-watchdog@vger.kernel.org
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3b59456f5545..893acc821a42 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1784,6 +1784,16 @@ config MFD_LOCHNAGAR
>  	help
>  	  Support for Cirrus Logic Lochnagar audio development board.
>  
> +config MFD_CH341
> +	tristate "WinChipHead CH341 in I2C/SPI/GPIO mode"
> +	depends on USB
> +	help
> +	  If you say yes to this option, support for the CH341 series
> +	  of chips, running in I2C/SPI/GPIO mode will be included.
> +
> +	  This driver can also be built as a module.  If so, the
> +	  module will be called ch341-core.
> +
>  config MFD_ARIZONA
>  	select REGMAP
>  	select REGMAP_IRQ
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 858cacf659d6..fd615ab3929f 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_MFD_ASIC3)		+= asic3.o tmio_core.o
>  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
>  obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
>  obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
> +obj-$(CONFIG_MFD_CH341)		+= ch341-core.o
>  obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
>  obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
>  obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
> diff --git a/drivers/mfd/ch341-core.c b/drivers/mfd/ch341-core.c
> new file mode 100644
> index 000000000000..f08a67dd6074
> --- /dev/null
> +++ b/drivers/mfd/ch341-core.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Core driver for the CH341A, CH341B and CH341T in I2C/SPI/GPIO
> + * mode. There are cell drivers available for I2C and GPIO. SPI is not
> + * yet supported.
> + *
> + * Copyright 2022, Frank Zago
> + * Copyright (c) 2017 Gunar Schorcht (gunar@schorcht.net)
> + * Copyright (c) 2016 Tse Lun Bien
> + * Copyright (c) 2014 Marco Gittler
> + * Copyright (c) 2006-2007 Till Harbaum (Till@Harbaum.org)
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/mfd/ch341.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +
> +static const struct mfd_cell ch341_devs[] = {
> +	{
> +		.name = "ch341-gpio",
> +	},
> +	{
> +		.name = "ch341-i2c",
> +	},
> +};
> +
> +static int ch341_usb_probe(struct usb_interface *iface,
> +			   const struct usb_device_id *usb_id)
> +{
> +	struct usb_endpoint_descriptor *bulk_out;
> +	struct usb_endpoint_descriptor *bulk_in;
> +	struct usb_endpoint_descriptor *intr_in;
> +	struct ch341_ddata *ddata;
> +	int ret;
> +
> +	ddata = devm_kzalloc(&iface->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->usb_dev = interface_to_usbdev(iface);
> +	mutex_init(&ddata->usb_lock);
> +
> +	ret = usb_find_common_endpoints(iface->cur_altsetting, &bulk_in,
> +					&bulk_out, &intr_in, NULL);
> +	if (ret) {
> +		dev_err(&iface->dev, "Could not find all endpoints\n");
> +		return -ENODEV;
> +	}
> +
> +	ddata->ep_in = bulk_in->bEndpointAddress;
> +	ddata->ep_out = bulk_out->bEndpointAddress;
> +	ddata->ep_intr = intr_in->bEndpointAddress;
> +	ddata->ep_intr_interval = intr_in->bInterval;
> +
> +	usb_set_intfdata(iface, ddata);
> +
> +	ret = mfd_add_devices(&iface->dev, PLATFORM_DEVID_AUTO, ch341_devs,
> +			      ARRAY_SIZE(ch341_devs), NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(&iface->dev, ret,
> +				     "Failed to register child devices\n");
> +
> +	return 0;
> +}
> +
> +static void ch341_usb_disconnect(struct usb_interface *usb_if)
> +{
> +	mfd_remove_devices(&usb_if->dev);
> +}
> +
> +static const struct usb_device_id ch341_usb_table[] = {
> +	{ USB_DEVICE(0x1a86, 0x5512) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(usb, ch341_usb_table);
> +
> +static struct usb_driver ch341_usb_driver = {
> +	.name       = "ch341-mfd",
> +	.id_table   = ch341_usb_table,
> +	.probe      = ch341_usb_probe,
> +	.disconnect = ch341_usb_disconnect,
> +};
> +module_usb_driver(ch341_usb_driver);
> +
> +MODULE_AUTHOR("Frank Zago <frank@zago.net>");
> +MODULE_DESCRIPTION("CH341 USB to I2C/SPI/GPIO adapter");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/ch341.h b/include/linux/mfd/ch341.h
> new file mode 100644
> index 000000000000..44f5da0720bd
> --- /dev/null
> +++ b/include/linux/mfd/ch341.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Definitions for the CH341 driver */
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +struct usb_device;
> +struct usb_interface;
> +
> +struct ch341_ddata {
> +	struct usb_device *usb_dev;
> +	struct mutex usb_lock;
> +
> +	int ep_in;
> +	int ep_out;
> +	int ep_intr;
> +	u8 ep_intr_interval;
> +};

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

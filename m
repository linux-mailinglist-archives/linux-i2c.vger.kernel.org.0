Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14FB36B7EB2
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 18:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjCMRFX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 13:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjCMRFV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 13:05:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DB83A875;
        Mon, 13 Mar 2023 10:04:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CCC05613F1;
        Mon, 13 Mar 2023 17:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAFDC433D2;
        Mon, 13 Mar 2023 17:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678727029;
        bh=2fV05cI4GhiMYR3KLrK2+mj2n5gX/Sc5m5PDzzFmPmA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D5yxDdV/g8lOgNvM0+Tf37WN30x0RU+VsxZfRNgo8qM5DQdy4gwHaZi/PfSg5P+Xc
         67NSPT9po5fYmCQnF9jN3qFLI018d+WEhzX+U+ZzDBRbe0OIAz7XlF4mfmGp7QZCj3
         QPf+2U0NuBf1D83uQpjaG8b10lfgx3lANZUlX8hwI8r1AAxEn+G8tEIo5sf9pPRA+N
         p3aVsdpjCDBN9OrmURoICCgDdKmvL1ZeIlFhlNf7R+N2oI+2ouJEL4E5EgYdpXICJ5
         8E0CJKfdya6IXQXFEhck1P0k5z9qsnZKf8LMaZiHqvmzEWsYG0knSq9l0g9DqtoHJY
         5adQFRayEByKQ==
Date:   Mon, 13 Mar 2023 17:03:41 +0000
From:   Lee Jones <lee@kernel.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Message-ID: <20230313170341.GV9667@google.com>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312190435.3568212-2-xiang.ye@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 13 Mar 2023, Ye Xiang wrote:

> This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA).
>
> The communication between the various LJCA module drivers and the
> hardware will be muxed/demuxed by this driver. The sub-module of
> LJCA can use ljca_transfer() to issue a transfer between host
> and hardware.
>
> Each sub-module of LJCA device is identified by type field within
> the LJCA message header.
>
> The minimum code in ASL that covers this board is
> Scope (\_SB.PCI0.DWC3.RHUB.HS01)
>     {
>         Device (GPIO)
>         {
>             Name (_ADR, Zero)
>             Name (_STA, 0x0F)
>         }
>
>         Device (I2C)
>         {
>             Name (_ADR, One)
>             Name (_STA, 0x0F)
>         }
>
>         Device (SPI)
>         {
>             Name (_ADR, 0x02)
>             Name (_STA, 0x0F)
>         }
>     }
>
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/usb/misc/Kconfig  |  13 +
>  drivers/usb/misc/Makefile |   1 +
>  drivers/usb/misc/ljca.c   | 998 ++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/ljca.h  |  95 ++++
>  4 files changed, 1107 insertions(+)
>  create mode 100644 drivers/usb/misc/ljca.c
>  create mode 100644 include/linux/usb/ljca.h
>
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index a5f7652db7da..59ec120c26d4 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -273,6 +273,19 @@ config USB_LINK_LAYER_TEST
>  	  Layer Test Device. Say Y only when you want to conduct USB Super Speed
>  	  Link Layer Test for host controllers.
>
> +config USB_LJCA
> +	tristate "Intel La Jolla Cove Adapter support"
> +	select MFD_CORE
> +	depends on USB
> +	help
> +	  This adds support for Intel La Jolla Cove USB-I2C/SPI/GPIO
> +	  Master Adapter (LJCA). Additional drivers such as I2C_LJCA,
> +	  GPIO_LJCA and SPI_LJCA must be enabled in order to use the
> +	  functionality of the device.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called ljca.
> +
>  config USB_CHAOSKEY
>  	tristate "ChaosKey random number generator driver support"
>  	depends on HW_RANDOM
> diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
> index 93581baec3a8..6f6adfbe17e0 100644
> --- a/drivers/usb/misc/Makefile
> +++ b/drivers/usb/misc/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_USB_HUB_USB251XB)		+= usb251xb.o
>  obj-$(CONFIG_USB_HSIC_USB3503)		+= usb3503.o
>  obj-$(CONFIG_USB_HSIC_USB4604)		+= usb4604.o
>  obj-$(CONFIG_USB_CHAOSKEY)		+= chaoskey.o
> +obj-$(CONFIG_USB_LJCA)			+= ljca.o
>
>  obj-$(CONFIG_USB_SISUSBVGA)		+= sisusbvga/
>  obj-$(CONFIG_USB_LINK_LAYER_TEST)	+= lvstest.o
> diff --git a/drivers/usb/misc/ljca.c b/drivers/usb/misc/ljca.c
> new file mode 100644
> index 000000000000..ab98deaf0074
> --- /dev/null
> +++ b/drivers/usb/misc/ljca.c
> @@ -0,0 +1,998 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel La Jolla Cove Adapter USB driver
> + *
> + * Copyright (c) 2023, Intel Corporation.
> + */
> +
> +#include <linux/dev_printk.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>

Please don't use the MFD API outside of drivers/mfd.

If you wish to use the API, please do.

Strip out (only) the MFD parts and move them into drivers/mfd.

> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/usb.h>
> +#include <linux/usb/ljca.h>

--
Lee Jones [李琼斯]

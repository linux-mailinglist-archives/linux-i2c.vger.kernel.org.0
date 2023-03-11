Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F13BD6B5B81
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Mar 2023 13:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjCKMNo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Mar 2023 07:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjCKMNn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Mar 2023 07:13:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36DE4B801;
        Sat, 11 Mar 2023 04:13:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 78E36B8253D;
        Sat, 11 Mar 2023 12:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650A5C433D2;
        Sat, 11 Mar 2023 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678536818;
        bh=Jmys9D/Bt14NGqtzH8mgYLL/hPZ/jfcn8FUZuSdwx80=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VCoxrqyDejkhr8QN6RBhsOSb1JuZrKbH4WCGOjOo7/mUkWtM9/k7jp0+ti6dw5SVo
         xguvU/F/a4CpuIcYigvSurf4kL8eFk+0z7RLnzN+OwXHHunvNz3eQdNm1h+QQ7mtVs
         nWfU76JCcDi9cO0TiMBbX2WB3J+NaSi55hsDefdTiVDflpBVD+lBscXx3HGn5VLvIo
         yuMbRhtBOvM+7xY8EMlOzT6tki18rgCZcfFnshxtX5sk+yDywsRAEDQ2fJOwpmjuWx
         JOUQD9bu7KyLP8t8CkGF/Ur1dF7osJrqBg35UmJuDoTM3AkZ8JHyTocVLvPlCQYkUh
         aq63VIedMRf0g==
Message-ID: <89c7a6f9-5911-6613-6e58-b93d8f73be2a@kernel.org>
Date:   Sat, 11 Mar 2023 13:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
To:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230309071100.2856899-3-xiang.ye@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/03/2023 08:10, Ye Xiang wrote:
> This patch implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
> GPIO module with specific protocol through interfaces exported by LJCA USB
> driver.
> 
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig     |  12 ++
>  drivers/gpio/Makefile    |   1 +
>  drivers/gpio/gpio-ljca.c | 454 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 467 insertions(+)
>  create mode 100644 drivers/gpio/gpio-ljca.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 13be729710f2..8be697f9f621 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1253,6 +1253,18 @@ config GPIO_KEMPLD
>  	  This driver can also be built as a module. If so, the module will be
>  	  called gpio-kempld.
>  
> +config GPIO_LJCA
> +	tristate "INTEL La Jolla Cove Adapter GPIO support"
> +	depends on MFD_LJCA
> +	select GPIOLIB_IRQCHIP
> +	default MFD_LJCA
> +	help
> +	  Select this option to enable GPIO driver for the INTEL
> +	  La Jolla Cove Adapter (LJCA) board.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called gpio-ljca.
> +
>  config GPIO_LP3943
>  	tristate "TI/National Semiconductor LP3943 GPIO expander"
>  	depends on MFD_LP3943
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index c048ba003367..eb59524d18c0 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -77,6 +77,7 @@ obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
>  obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
>  obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
>  obj-$(CONFIG_GPIO_LATCH)		+= gpio-latch.o
> +obj-$(CONFIG_GPIO_LJCA) 		+= gpio-ljca.o
>  obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
>  obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
>  obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
> diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> new file mode 100644
> index 000000000000..87863f0230f5
> --- /dev/null
> +++ b/drivers/gpio/gpio-ljca.c
> @@ -0,0 +1,454 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel La Jolla Cove Adapter USB-GPIO driver
> + *
> + * Copyright (c) 2023, Intel Corporation.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/dev_printk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/kref.h>
> +#include <linux/mfd/ljca.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +/* GPIO commands */
> +#define LJCA_GPIO_CONFIG	1
> +#define LJCA_GPIO_READ		2
> +#define LJCA_GPIO_WRITE		3
> +#define LJCA_GPIO_INT_EVENT	4
> +#define LJCA_GPIO_INT_MASK	5
> +#define LJCA_GPIO_INT_UNMASK	6
> +
> +#define LJCA_GPIO_CONF_DISABLE		BIT(0)
> +#define LJCA_GPIO_CONF_INPUT		BIT(1)
> +#define LJCA_GPIO_CONF_OUTPUT		BIT(2)
> +#define LJCA_GPIO_CONF_PULLUP		BIT(3)
> +#define LJCA_GPIO_CONF_PULLDOWN		BIT(4)
> +#define LJCA_GPIO_CONF_DEFAULT		BIT(5)
> +#define LJCA_GPIO_CONF_INTERRUPT	BIT(6)
> +#define LJCA_GPIO_INT_TYPE		BIT(7)
> +
> +#define LJCA_GPIO_CONF_EDGE	FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
> +#define LJCA_GPIO_CONF_LEVEL	FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
> +
> +/* Intentional overlap with PULLUP / PULLDOWN */
> +#define LJCA_GPIO_CONF_SET	BIT(3)
> +#define LJCA_GPIO_CONF_CLR	BIT(4)
> +
> +struct gpio_op {
> +	u8 index;
> +	u8 value;
> +} __packed;
> +
> +struct gpio_packet {
> +	u8 num;
> +	struct gpio_op item[];
> +} __packed;
> +
> +#define LJCA_GPIO_BUF_SIZE 60
> +struct ljca_gpio_dev {
> +	struct platform_device *pdev;
> +	struct gpio_chip gc;
> +	struct ljca_gpio_info *gpio_info;
> +	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> +	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> +	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> +	u8 *connect_mode;
> +	/* mutex to protect irq bus */
> +	struct mutex irq_lock;
> +	struct work_struct work;
> +	/* lock to protect package transfer to Hardware */
> +	struct mutex trans_lock;
> +
> +	u8 obuf[LJCA_GPIO_BUF_SIZE];
> +	u8 ibuf[LJCA_GPIO_BUF_SIZE];
> +};
> +
> +static int gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id, u8 config)
> +{
> +	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
> +	int ret;
> +
> +	mutex_lock(&ljca_gpio->trans_lock);
> +	packet->item[0].index = gpio_id;
> +	packet->item[0].value = config | ljca_gpio->connect_mode[gpio_id];
> +	packet->num = 1;
> +
> +	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_CONFIG, packet,
> +			    struct_size(packet, item, packet->num), NULL, NULL);
> +	mutex_unlock(&ljca_gpio->trans_lock);
> +	return ret;
> +}
> +
> +static int ljca_gpio_read(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id)
> +{
> +	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
> +	struct gpio_packet *ack_packet = (struct gpio_packet *)ljca_gpio->ibuf;
> +	unsigned int ibuf_len = LJCA_GPIO_BUF_SIZE;
> +	int ret;
> +
> +	mutex_lock(&ljca_gpio->trans_lock);
> +	packet->num = 1;
> +	packet->item[0].index = gpio_id;
> +	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_READ, packet,
> +			    struct_size(packet, item, packet->num), ljca_gpio->ibuf, &ibuf_len);
> +	if (ret)
> +		goto out_unlock;
> +
> +	if (!ibuf_len || ack_packet->num != packet->num) {
> +		dev_err(&ljca_gpio->pdev->dev, "failed gpio_id:%u %u", gpio_id, ack_packet->num);
> +		ret = -EIO;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&ljca_gpio->trans_lock);
> +	if (ret)
> +		return ret;
> +	return ack_packet->item[0].value > 0;
> +}
> +
> +static int ljca_gpio_write(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
> +			   int value)
> +{
> +	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
> +	int ret;
> +
> +	mutex_lock(&ljca_gpio->trans_lock);
> +	packet->num = 1;
> +	packet->item[0].index = gpio_id;
> +	packet->item[0].value = value & 1;
> +
> +	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_WRITE, packet,
> +			    struct_size(packet, item, packet->num), NULL, NULL);
> +	mutex_unlock(&ljca_gpio->trans_lock);

Everywhere you have unusual coding pattern around return. There is
almost always line break before return. Adjust to the kernel style.

> +	return ret;
> +}

(...)

> +
> +#define LJCA_GPIO_DRV_NAME "ljca-gpio"
> +static const struct platform_device_id ljca_gpio_id[] = {
> +	{ LJCA_GPIO_DRV_NAME, 0 },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, ljca_gpio_id);

ljca_gpio_id is unused (except module autoloading). How do you bind your
devices?

> +
> +static struct platform_driver ljca_gpio_driver = {
> +	.driver.name = LJCA_GPIO_DRV_NAME,
> +	.probe = ljca_gpio_probe,
> +	.remove = ljca_gpio_remove,



Best regards,
Krzysztof


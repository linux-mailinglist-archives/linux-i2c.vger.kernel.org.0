Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D61F0723BEF
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jun 2023 10:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235920AbjFFIfn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Jun 2023 04:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237301AbjFFIfC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Jun 2023 04:35:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE0A10F4
        for <linux-i2c@vger.kernel.org>; Tue,  6 Jun 2023 01:34:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E233461210
        for <linux-i2c@vger.kernel.org>; Tue,  6 Jun 2023 08:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AD9C433EF;
        Tue,  6 Jun 2023 08:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686040479;
        bh=gitvahsxBvn1CKOLaa5h3NmVUddOQLrq7r29DpVLKD4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JFZtPmknuvwMARh5O0iexv/3UC0FgRRSWs3gm0CrymmaWMp34+0wfOBLrZ6n7aZPb
         z1FaGzObim071WJteDCaCs9+gEIrTqHQqvUl+eUhrBdAUbX/xhRfoe8jJQMND6jOqJ
         Yix86a7BPv2eTpyIGdIiJgRKN1F6SRn4drdE2CDjt1AUPP+dzd/O/O0GGFkerid3Wk
         Cg/55sNuXDjEqsB3lt5GTaoAGTCWGJazI962b0B0T5nPxQIO8XgTNQWMxYh5267Xwh
         2338HJ/KjDGpRkwbHoxdaQF+mgvE+VnC3brcoGuaTbQ9gEij1/legZgeTTo5cZz6iP
         Ui+3TpEU8l/cA==
Message-ID: <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>
Date:   Tue, 6 Jun 2023 10:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
Content-Language: en-US
To:     Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
        linux-i2c@vger.kernel.org
Cc:     cobechen@zhaoxin.com, TonyWWang@zhaoxin.com
References: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/06/2023 07:01, Hans Hu wrote:
> Add Zhaoxin I2C controller driver. It provides the access to the i2c
> busses, which connects to the touchpad, eeprom, etc.
> 
> Zhaoxin I2C controller has two separate busses, so may accommodate up
> to two I2C adapters. Those adapters are listed in the ACPI namespace
> with the "IIC1D17" HID, and probed by a platform driver.
> 
> The driver works with IRQ mode, and supports basic I2C features. Flags
> I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
> the unsupported access.
> 
> Change since v2:
>   * fixed some code style issues
>   * check if "timeout == 0" first, then check if event $condition is true
>   * add warnning message for "timeout == 1"
>   Link: https://lore.kernel.org/all/20230531110058.n7ubjp2kzlx7tuoc@intel.intel/
> 
> Change since v1:
>   * remove some useless include files and sort the rest.
>   * use mmio bar distinguish host index.
>   * use pci-dev's name and i2c-dev's name rename adapter's name.
>   * remove some debug code, fix some code style issue.
>   Link: https://lore.kernel.org/all/20230504060043.13155-1-hanshu-oc@zhaoxin.com/
> 
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
> ---
>  drivers/i2c/busses/Kconfig       |  10 +
>  drivers/i2c/busses/Makefile      |   1 +
>  drivers/i2c/busses/i2c-zhaoxin.c | 645 +++++++++++++++++++++++++++++++
>  3 files changed, 656 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-zhaoxin.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 87600b4aacb3..4c2d302184aa 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -333,6 +333,16 @@ config I2C_VIAPRO
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-viapro.
>  
> +config I2C_ZHAOXIN
> +	tristate "ZHAOXIN I2C Interface"
> +	depends on PCI && ACPI

Why this cannot be compile tested?

> +	help
> +	  If you say yes to this option, support will be included for the
> +	  ZHAOXIN I2C interface
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-zhaoxin.
> +
>  if ACPI
>  
>  comment "ACPI drivers"
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index af56fe2c75c0..cc470ce470ca 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_I2C_SIS630)	+= i2c-sis630.o
>  obj-$(CONFIG_I2C_SIS96X)	+= i2c-sis96x.o
>  obj-$(CONFIG_I2C_VIA)		+= i2c-via.o
>  obj-$(CONFIG_I2C_VIAPRO)	+= i2c-viapro.o
> +obj-$(CONFIG_I2C_ZHAOXIN)	+= i2c-zhaoxin.o
>  
>  # Mac SMBus host controller drivers
>  obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
> diff --git a/drivers/i2c/busses/i2c-zhaoxin.c b/drivers/i2c/busses/i2c-zhaoxin.c
> new file mode 100644
> index 000000000000..61807da9c170
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-zhaoxin.c
> @@ -0,0 +1,645 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  i2c-zhaoxin-i2c.c - Zhaoxin I2C controller driver
> + *
> + *  Copyright(c) 2021 Shanghai Zhaoxin Semiconductor Corporation.
> + *                    All rights reserved.
> + *
> + *  CONTACTS:
> + *
> + *  Hans Hu             hanshu@zhaoxin.com
> + *  Cobe Chen           cobechen@zhaoxin.com
> + */
> +
> +#define DRIVER_VERSION "1.4.0"
> +

Drop. Linux already has a version.

> +
> +static int zxi2c_parse_resources(struct zxi2c *i2c)
> +{
> +	struct platform_device *pdev = to_platform_device(i2c->dev);
> +	struct resource *res;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	i2c->regs = devm_ioremap_resource(&pdev->dev, res);

There is a helper for these two.

> +	if (IS_ERR(i2c->regs))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->regs),
> +				"get base addr failed\n");
> +
> +	if (res->start & 0x20)
> +		i2c->reset_bitmask = BIT(4);
> +	else
> +		i2c->reset_bitmask = BIT(5);
> +
> +	i2c->irq = platform_get_irq(pdev, 0);
> +	if (i2c->irq < 0)
> +		return dev_err_probe(&pdev->dev, i2c->irq,
> +				"get irq failed\n");
> +
> +	zxi2c_get_bus_speed(i2c);
> +
> +	i2c->hrv = get_reversion(i2c->regs);
> +
> +	i2c->dynamic = get_dynamic_clock(i2c->regs);
> +	set_dynamic_clock(i2c->regs, i2c->dynamic);
> +
> +	i2c->fstp = get_fstp_value(i2c->regs);
> +	zxi2c_set_bus_speed(i2c);
> +
> +	return 0;
> +}
> +
> +static int zxi2c_probe(struct platform_device *pdev)
> +{
> +	int error;
> +	struct zxi2c *i2c;
> +	struct pci_dev *pci;
> +	struct device *dev;
> +
> +	/* make sure this is zhaoxin platform */

Why? How can you match to different platform?

> +	dev = pdev->dev.parent;
> +	if (dev && dev_is_pci(dev)) {
> +		pci = to_pci_dev(dev);
> +		if (pci->vendor != 0x1d17 || pci->device != 0x1001)
> +			return -ENODEV;
> +	} else {
> +		return -ENODEV;
> +	}
> +
> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> +	if (IS_ERR(i2c)) {
> +		return dev_err_probe(&pdev->dev, -ENOMEM,
> +				"devm_kzalloc failed\n");

Don't print ENOMEM.

Run:
1. Checkpatch
2. Coccinelle
to fix trivial issues.

> +	}
> +
> +	i2c->pci = pci;
> +	i2c->dev = &pdev->dev;
> +	error = zxi2c_parse_resources(i2c);
> +	if (error)
> +		return error;
> +
> +	platform_set_drvdata(pdev, (void *)i2c);
> +
> +	error = devm_request_irq(&pdev->dev, i2c->irq, zxi2c_irq_handle,
> +			     IRQF_SHARED, pdev->name, i2c);
> +	if (error < 0)
> +		return dev_err_probe(i2c->dev, error,
> +				"IRQ%d request failed\n",
> +				i2c->irq);
> +
> +	init_waitqueue_head(&i2c->waitq);
> +
> +	i2c->adap.owner = THIS_MODULE;
> +	i2c->adap.algo = &zxi2c_algorithm;
> +	i2c->adap.retries = 2;
> +	i2c->adap.quirks = &zxi2c_quirks;
> +	i2c->adap.dev.parent = &pdev->dev;
> +	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
> +	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
> +		 "%s-%s", dev_name(&pci->dev), dev_name(i2c->dev));
> +	i2c_set_adapdata(&i2c->adap, i2c);
> +
> +	error = i2c_add_adapter(&i2c->adap);
> +	if (unlikely(error))
> +		return dev_err_probe(i2c->dev, error,
> +				"adapter registration failed\n");
> +
> +	dev_info(i2c->dev, "adapter /dev/i2c-%d registered. hw version %x\n",
> +		 i2c->adap.nr, i2c->hrv);
> +
> +	return 0;
> +}
> +
> +static int zxi2c_remove(struct platform_device *pdev)
> +{
> +	struct zxi2c *i2c = platform_get_drvdata(pdev);
> +
> +	i2c_lock_bus(&i2c->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +	zxi2c_module_reset(i2c);
> +	master_regs_reset(i2c->regs);
> +
> +	devm_free_irq(&pdev->dev, i2c->irq, i2c);
> +
> +	i2c_unlock_bus(&i2c->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +	i2c_del_adapter(&i2c->adap);
> +
> +	platform_set_drvdata(pdev, NULL);
> +	devm_kfree(&pdev->dev, i2c);

Why do you do it? Its devm.

> +
> +	dev_info(&pdev->dev, "adapter unregistered\n");

Drop simple probe or function success statuses. Kernel has other ways to
get this information.


...


> +		.acpi_match_table = ACPI_PTR(zxi2c_acpi_match),

Drop ACPI_PTR. This will cause warnings.


Best regards,
Krzysztof


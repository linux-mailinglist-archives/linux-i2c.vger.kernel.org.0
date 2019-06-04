Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4FE035073
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 21:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfFDTwR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 15:52:17 -0400
Received: from mx.0dd.nl ([5.2.79.48]:39502 "EHLO mx.0dd.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfFDTwQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 15:52:16 -0400
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.0dd.nl (Postfix) with ESMTPS id 3D563601B2;
        Tue,  4 Jun 2019 21:52:12 +0200 (CEST)
Authentication-Results: mx.0dd.nl;
        dkim=pass (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="EJClsqV4";
        dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.vdorst.com (Postfix) with ESMTPSA id E41681BA4F12;
        Tue,  4 Jun 2019 21:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com E41681BA4F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
        s=default; t=1559677931;
        bh=BCg6cgqiWoknyTvcdoQbGpkKX1gsrHh0tBZRYsSxGs4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EJClsqV4vVJ2UTZV6qePjnsoJ6TOy8G4t2IYMVQHvwRD8GectwEJM1OS25mjPSj2D
         X4tO5Pabsdn1yg/RjtfhvvGFDx/EPLLd8UHR8XzogX5TvV84wTEsJGZuwoVRoA5scf
         j0sYIixz3FBq+XxTftmpir5rq4c4sTtkR/DjGNC9hMIpTLt4mvtSA6njt8kasrKxuv
         aPKxdH+EzpTf917yPdHUBF8+6OjR6Ok2ZP9bBZDpz0LTuY049x/8BP6TkpSmuJlzf7
         HIHo+/jKG/LR6qoSMIBI21c5SYV/tlEvz+y8JDDsEr47eWEwuB+RK7pPR2q9cR9qH9
         Yf4CDGEf3OnWA==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Tue, 04 Jun 2019 19:52:11 +0000
Date:   Tue, 04 Jun 2019 19:52:11 +0000
Message-ID: <20190604195211.Horde.I6hSrv4FWEZ9-NxgcLutKHc@www.vdorst.com>
From:   =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Jan Breuer <jan.breuer@jaybee.cz>,
        John Crispin <john@phrozen.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 2/2 v3] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C
 driver
References: <20190604113407.8948-1-sr@denx.de>
 <20190604113407.8948-2-sr@denx.de>
In-Reply-To: <20190604113407.8948-2-sr@denx.de>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Stefan Roese <sr@denx.de>:

> This patch adds a driver for the I2C controller found on the MediaTek
> MT7621/7628/7688 SoC's. The base version of this driver was done by
> Steven Liu (according to the copyright and MODULE_AUTHOR lines). It
> can be found in the OpenWRT repositories (v4.14 at the time I looked).
>
> The base driver had many issues, which are disccussed here:
>
> https://en.forum.labs.mediatek.com/t/openwrt-15-05-loads-non-working-i2c-kernel-module-for-mt7688/1286/3
>
> From this link an enhanced driver version (complete rewrite, mayor
> changes: support clock stretching, repeated start, ACK handling and
> unlimited message length) from Jan Breuer can be found here:
>
> https://gist.github.com/j123b567/9b555b635c2b4069d716b24198546954
>
> This patch now adds this enhanced I2C driver to mainline.
>
> Changes by Stefan Roese for upstreaming:
> - Add devicetree bindings
> - checkpatch clean
> - Use module_platform_driver()
> - Minor cosmetic enhancements
> - Removed IO warpped functions
> - Use readl_relaxed_poll_timeout() and drop poll_down_timeout()
> - Removed superfluous barrier() in mtk_i2c_reset()
> - Use i2c_8bit_addr_from_msg()
> - Added I2C_FUNC_PROTOCOL_MANGLING
> - Removed adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Jan Breuer <jan.breuer@jaybee.cz>
> Cc: John Crispin <john@phrozen.org>
> Cc: René van Dorst <opensource@vdorst.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v3:
> - Added myself as maintainer for this driver
> - Added René van Dorst to Cc as he tested an earlier version of this
>   driver. The tested-by tag is not added, as the driver has now
>   undergone some notable changes. A new testing would be very welcome.
> - Removed Steven Liu from Cc, as his email address is not valid any
>   more
> - Moved bindings documentation into separate patch
> - Removed IO warpped functions
> - Use readl_relaxed_poll_timeout() and drop poll_down_timeout()
> - Removed superfluous barrier() in mtk_i2c_reset()
> - Use i2c_8bit_addr_from_msg()
> - Added I2C_FUNC_PROTOCOL_MANGLING
> - Removed adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
> - Misc minor mostly cosmitic enhancements suggested by Wolfram
>
> v2:
> - Configure I2C controller to open-drain instead of push-pull, as
>   noticed and suggested by Jan (misleading bit description)
>
>  MAINTAINERS                     |   7 +
>  drivers/i2c/busses/Kconfig      |   8 +
>  drivers/i2c/busses/Makefile     |   1 +
>  drivers/i2c/busses/i2c-mt7621.c | 346 ++++++++++++++++++++++++++++++++
>  4 files changed, 362 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-mt7621.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a6954776a37e..8472dfbffcfa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9957,6 +9957,13 @@ L:	linux-wireless@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/wireless/mediatek/mt7601u/
>
> +MEDIATEK MT7621/28/88 I2C DRIVER
> +M:	Stefan Roese <sr@denx.de>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	drivers/i2c/busses/i2c-mt7621.c
> +F:	Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
> +
>  MEDIATEK NAND CONTROLLER DRIVER
>  M:	Xiaolei Li <xiaolei.li@mediatek.com>
>  L:	linux-mtd@lists.infradead.org
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index ee5dfb5aee2a..f9ae8bcd4d8b 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -746,6 +746,14 @@ config I2C_MT65XX
>  	  If you want to use MediaTek(R) I2C interface, say Y or M here.
>  	  If unsure, say N.
>
> +config I2C_MT7621
> +	tristate "MT7621/MT7628 I2C Controller"
> +	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || COMPILE_TEST
> +	select OF_I2C
> +	help
> +	  Say Y here to include support for I2C controller in the
> +	  MediaTek MT7621/MT7628 SoCs.
> +
>  config I2C_MV64XXX
>  	tristate "Marvell mv64xxx I2C Controller"
>  	depends on MV64X60 || PLAT_ORION || ARCH_SUNXI || ARCH_MVEBU
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index a3245231b0b7..80c23895eaaf 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -77,6 +77,7 @@ obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
>  obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
>  obj-$(CONFIG_I2C_MPC)		+= i2c-mpc.o
>  obj-$(CONFIG_I2C_MT65XX)	+= i2c-mt65xx.o
> +obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
>  obj-$(CONFIG_I2C_MV64XXX)	+= i2c-mv64xxx.o
>  obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
>  obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
> diff --git a/drivers/i2c/busses/i2c-mt7621.c  
> b/drivers/i2c/busses/i2c-mt7621.c
> new file mode 100644
> index 000000000000..ff8f8c80aa27
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -0,0 +1,346 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * drivers/i2c/busses/i2c-mt7621.c
> + *
> + * Copyright (C) 2013 Steven Liu <steven_liu@mediatek.com>
> + * Copyright (C) 2016 Michael Lee <igvtee@gmail.com>
> + * Copyright (C) 2018 Jan Breuer <jan.breuer@jaybee.cz>
> + *
> + * Improve driver for i2cdetect from i2c-tools to detect i2c  
> devices on the bus.
> + * (C) 2014 Sittisak <sittisaks@hotmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/reset.h>
> +
> +#define REG_SM0CFG2_REG		0x28
> +#define REG_SM0CTL0_REG		0x40
> +#define REG_SM0CTL1_REG		0x44
> +#define REG_SM0D0_REG		0x50
> +#define REG_SM0D1_REG		0x54
> +#define REG_PINTEN_REG		0x5c
> +#define REG_PINTST_REG		0x60
> +#define REG_PINTCL_REG		0x64
> +
> +/* REG_SM0CFG2_REG */
> +#define SM0CFG2_IS_AUTOMODE	BIT(0)
> +
> +/* REG_SM0CTL0_REG */
> +#define SM0CTL0_ODRAIN		BIT(31)
> +#define SM0CTL0_CLK_DIV_MASK	(0x7ff << 16)
> +#define SM0CTL0_CLK_DIV_MAX	0x7ff
> +#define SM0CTL0_CS_STATUS       BIT(4)
> +#define SM0CTL0_SCL_STATE       BIT(3)
> +#define SM0CTL0_SDA_STATE       BIT(2)
> +#define SM0CTL0_EN              BIT(1)
> +#define SM0CTL0_SCL_STRETCH     BIT(0)
> +
> +/* REG_SM0CTL1_REG */
> +#define SM0CTL1_ACK_MASK	(0xff << 16)
> +#define SM0CTL1_PGLEN_MASK	(0x7 << 8)
> +#define SM0CTL1_PGLEN(x)	((((x) - 1) << 8) & SM0CTL1_PGLEN_MASK)
> +#define SM0CTL1_READ		(5 << 4)
> +#define SM0CTL1_READ_LAST	(4 << 4)
> +#define SM0CTL1_STOP		(3 << 4)
> +#define SM0CTL1_WRITE		(2 << 4)
> +#define SM0CTL1_START		(1 << 4)
> +#define SM0CTL1_MODE_MASK	(0x7 << 4)
> +#define SM0CTL1_TRI		BIT(0)
> +
> +/* timeout waiting for I2C devices to respond */
> +#define TIMEOUT_MS		1000
> +
> +#define MT76XX_I2C_INPUT_CLOCK	40000000
> +
> +struct mtk_i2c {
> +	void __iomem *base;
> +	struct device *dev;
> +	struct i2c_adapter adap;
> +	u32 bus_freq;
> +	u32 clk_div;
> +	u32 flags;
> +};
> +
> +static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
> +					 val, !(val & SM0CTL1_TRI),
> +					 10, TIMEOUT_MS * 1000);
> +	if (ret)
> +		dev_dbg(i2c->dev, "idle err(%d)\n", ret);
> +
> +	return ret;
> +}
> +
> +static void mtk_i2c_reset(struct mtk_i2c *i2c)
> +{
> +	int ret;
> +
> +	ret = device_reset(i2c->adap.dev.parent);
> +	if (ret)
> +		dev_err(i2c->dev, "I2C reset failed!\n");
> +
> +	/*
> +	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
> +	 * configure open-drain mode, this bit needs to be cleared.
> +	 */
> +	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
> +		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
> +	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
> +}
> +
> +static void mtk_i2c_dump_reg(struct mtk_i2c *i2c)
> +{
> +	dev_dbg(i2c->dev,
> +		"SM0CFG2 %08x, SM0CTL0 %08x, SM0CTL1 %08x, SM0D0 %08x, SM0D1 %08x\n",
> +		ioread32(i2c->base + REG_SM0CFG2_REG),
> +		ioread32(i2c->base + REG_SM0CTL0_REG),
> +		ioread32(i2c->base + REG_SM0CTL1_REG),
> +		ioread32(i2c->base + REG_SM0D0_REG),
> +		ioread32(i2c->base + REG_SM0D1_REG));
> +}
> +
> +static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
> +{
> +	u32 ack = readl_relaxed(i2c->base + REG_SM0CTL1_REG);
> +	u32 ack_expected = (expected << 16) & SM0CTL1_ACK_MASK;
> +
> +	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
> +}
> +
> +static int mtk_i2c_master_start(struct mtk_i2c *i2c)
> +{
> +	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
> +	return mtk_i2c_wait_idle(i2c);
> +}
> +
> +static int mtk_i2c_master_stop(struct mtk_i2c *i2c)
> +{
> +	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
> +	return mtk_i2c_wait_idle(i2c);
> +}
> +
> +static int mtk_i2c_master_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
> +{
> +	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
> +		  i2c->base + REG_SM0CTL1_REG);
> +	return mtk_i2c_wait_idle(i2c);
> +}
> +
> +static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct  
> i2c_msg *msgs,
> +			       int num)
> +{
> +	struct mtk_i2c *i2c;
> +	struct i2c_msg *pmsg;
> +	u16 addr;
> +	int i, j, ret, len, page_len;
> +	u32 cmd;
> +	u32 data[2];
> +
> +	i2c = i2c_get_adapdata(adap);
> +
> +	for (i = 0; i < num; i++) {
> +		pmsg = &msgs[i];
> +
> +		/* wait hardware idle */
> +		ret = mtk_i2c_wait_idle(i2c);
> +		if (ret)
> +			goto err_timeout;
> +
> +		/* start sequence */
> +		ret = mtk_i2c_master_start(i2c);
> +		if (ret)
> +			goto err_timeout;
> +
> +		/* write address */
> +		if (pmsg->flags & I2C_M_TEN) {
> +			/* 10 bits address */
> +			addr = 0xf0 | ((pmsg->addr >> 7) & 0x06);
> +			addr |= (pmsg->addr & 0xff) << 8;
> +			if (pmsg->flags & I2C_M_RD)
> +				addr |= 1;
> +			iowrite32(addr, i2c->base + REG_SM0D0_REG);
> +			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 2);
> +			if (ret)
> +				goto err_timeout;
> +		} else {
> +			/* 7 bits address */
> +			addr = i2c_8bit_addr_from_msg(pmsg);
> +			iowrite32(addr, i2c->base + REG_SM0D0_REG);
> +			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 1);
> +			if (ret)
> +				goto err_timeout;
> +		}
> +
> +		/* check address ACK */
> +		if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
> +			ret = mtk_i2c_check_ack(i2c, BIT(0));
> +			if (ret)
> +				goto err_ack;
> +		}
> +
> +		/* transfer data */
> +		for (len = pmsg->len, j = 0; len > 0; len -= 8, j += 8) {
> +			page_len = (len >= 8) ? 8 : len;
> +
> +			if (pmsg->flags & I2C_M_RD) {
> +				cmd = (len > 8) ?
> +					SM0CTL1_READ : SM0CTL1_READ_LAST;
> +			} else {
> +				memcpy(data, &pmsg->buf[j], page_len);
> +				iowrite32(data[0], i2c->base + REG_SM0D0_REG);
> +				iowrite32(data[1], i2c->base + REG_SM0D1_REG);
> +				cmd = SM0CTL1_WRITE;
> +			}
> +
> +			ret = mtk_i2c_master_cmd(i2c, cmd, page_len);
> +			if (ret)
> +				goto err_timeout;
> +
> +			if (pmsg->flags & I2C_M_RD) {
> +				data[0] = ioread32(i2c->base + REG_SM0D0_REG);
> +				data[1] = ioread32(i2c->base + REG_SM0D1_REG);
> +				memcpy(&pmsg->buf[j], data, page_len);
> +			} else {
> +				if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
> +					ret = mtk_i2c_check_ack(i2c,
> +								(1 << page_len)
> +								- 1);
> +					if (ret)
> +						goto err_ack;
> +				}
> +			}
> +		}
> +	}
> +
> +	ret = mtk_i2c_master_stop(i2c);
> +	if (ret)
> +		goto err_timeout;
> +
> +	/* the return value is number of executed messages */
> +	return i;
> +
> +err_ack:
> +	ret = mtk_i2c_master_stop(i2c);
> +	if (ret)
> +		goto err_timeout;
> +	return -ENXIO;
> +
> +err_timeout:
> +	mtk_i2c_dump_reg(i2c);
> +	mtk_i2c_reset(i2c);
> +	return ret;
> +}
> +
> +static u32 mtk_i2c_func(struct i2c_adapter *a)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
> +}
> +
> +static const struct i2c_algorithm mtk_i2c_algo = {
> +	.master_xfer	= mtk_i2c_master_xfer,
> +	.functionality	= mtk_i2c_func,
> +};
> +
> +static const struct of_device_id i2c_mtk_dt_ids[] = {
> +	{ .compatible = "mediatek,mt7621-i2c" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, i2c_mtk_dt_ids);
> +
> +static void mtk_i2c_init(struct mtk_i2c *i2c)
> +{
> +	i2c->clk_div = MT76XX_I2C_INPUT_CLOCK / i2c->bus_freq - 1;
> +	if (i2c->clk_div < 99)
> +		i2c->clk_div = 99;
> +	if (i2c->clk_div > SM0CTL0_CLK_DIV_MAX)
> +		i2c->clk_div = SM0CTL0_CLK_DIV_MAX;
> +
> +	mtk_i2c_reset(i2c);
> +}
> +
> +static int mtk_i2c_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct mtk_i2c *i2c;
> +	struct i2c_adapter *adap;
> +	int ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	i2c = devm_kzalloc(&pdev->dev, sizeof(struct mtk_i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	i2c->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(i2c->base))
> +		return PTR_ERR(i2c->base);
> +
> +	i2c->dev = &pdev->dev;
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "clock-frequency",
> +				 &i2c->bus_freq))
> +		i2c->bus_freq = 100000;
> +
> +	if (i2c->bus_freq == 0) {
> +		dev_warn(i2c->dev,
> +			 "clock-frequency 0 not supported, using 1\n");
> +		i2c->bus_freq = 1;
> +	}
> +
> +	adap = &i2c->adap;
> +	adap->owner = THIS_MODULE;
> +	adap->algo = &mtk_i2c_algo;
> +	adap->retries = 3;
> +	adap->dev.parent = &pdev->dev;
> +	i2c_set_adapdata(adap, i2c);
> +	adap->dev.of_node = pdev->dev.of_node;
> +	strlcpy(adap->name, dev_name(&pdev->dev), sizeof(adap->name));
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	mtk_i2c_init(i2c);
> +
> +	ret = i2c_add_adapter(adap);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_info(&pdev->dev, "clock %u kHz\n", i2c->bus_freq / 1000);
> +
> +	return ret;
> +}
> +
> +static int mtk_i2c_remove(struct platform_device *pdev)
> +{
> +	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&i2c->adap);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver mtk_i2c_driver = {
> +	.probe		= mtk_i2c_probe,
> +	.remove		= mtk_i2c_remove,
> +	.driver		= {
> +		.owner	= THIS_MODULE,
> +		.name	= "i2c-mt7621",
> +		.of_match_table = i2c_mtk_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(mtk_i2c_driver);
> +
> +MODULE_AUTHOR("Steven Liu <steven_liu@mediatek.com>");
> +MODULE_DESCRIPTION("MT7621 I2C host driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:MT7621-I2C");
> --
> 2.21.0

I was using the openwrt version for a while on my Ubiquity ER-X-SFP
router on top of the net-next tree.
But I was unable to readout the SFP module because i2c message size
limit of 64 bytes.
Without additional patches my console was spamming me with
-EOPNOTSUPP because SFP code tries to read +90 bytes in one go.

With this driver the sfp code can readout the module successfully.

Both the SFP module and the GPIO expander on the bus are working.

Tested-by: René van Dorst <opensource@vdorst.com>

Greats,

René


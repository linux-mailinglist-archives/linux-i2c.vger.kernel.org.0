Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE8DA1458D
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 09:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbfEFHsF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 03:48:05 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43423 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfEFHsF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 03:48:05 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1hNYLt-0004oo-G7; Mon, 06 May 2019 09:47:57 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1hNYLs-0007Ii-Mu; Mon, 06 May 2019 09:47:56 +0200
Date:   Mon, 6 May 2019 09:47:56 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Chuanhua Han <chuanhua.han@nxp.com>
Cc:     shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, festevam@gmail.com, linux-imx@nxp.com,
        wsa+renesas@sang-engineering.com, u.kleine-koenig@pengutronix.de,
        eha@deif.com, linux@rempel-privat.de, l.stach@pengutronix.de,
        peda@axentia.se, sumit.batra@nxp.com
Subject: Re: [PATCH 1/2] i2c: imx: I2C Driver doesn't consider I2C_IPGCLK_SEL
 RCW bit when using ls1046a SoC
Message-ID: <20190506074756.mdegqdhirclipg7q@pengutronix.de>
References: <20190430044719.30720-1-chuanhua.han@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430044719.30720-1-chuanhua.han@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:41:12 up 48 days, 18:51, 81 users,  load average: 1.46, 1.30,
 1.28
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

In case we end up with the handling of this issue in the i2c driver,
here are the things to consider for v2.

On Tue, Apr 30, 2019 at 12:47:18PM +0800, Chuanhua Han wrote:
> The current kernel driver does not consider I2C_IPGCLK_SEL (424 bit
> of RCW) in deciding  i2c_clk_rate in function i2c_imx_set_clk()
> { 0 Platform clock/4, 1 Platform clock/2}.
> 
> When using ls1046a SoC, this populates incorrect value in IBFD register
> if I2C_IPGCLK_SEL = 0, which generates half of the desired Clock.
> 
> Therefore, if ls1046a SoC is used, we need to set the i2c clock
> according to the corresponding RCW.
> 
> Signed-off-by: Sumit Batra <sumit.batra@nxp.com>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 64 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 422f1a445b55..7186cf3c7d24 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -45,6 +45,8 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> +#include <linux/fsl/guts.h>
> +#include <linux/sys_soc.h>
>  
>  /* This will be the driver name the kernel reports */
>  #define DRIVER_NAME "imx-i2c"
> @@ -109,6 +111,21 @@
>  
>  #define I2C_PM_TIMEOUT		10 /* ms */
>  
> +/* 14-1 Since array index starts from 0 */
> +#define RCW_I2C_IPGCLK_WORD (14 - 1)
> +/*
> + * Set mask for RCW 424th bit, reading from DCFG_CCSR RCW Status Registers
> + * Since this register in RM depicted as big endian,
> + * so consider 31st bit as LSB for creating the mask.
> + */
> +#define RCW_I2C_IPGCLK_MASK    0x800000
> +int i2c_ipgclk_sel = 1;

should be static.

> +
> +static const struct soc_device_attribute ls1046a_soc[] = {
> +	       {.family = "QorIQ LS1046A"},
> +	       { /* sentinel */ }
> +};
> +
>  /*
>   * sorted list of clock divider, register value pairs
>   * taken from table 26-5, p.26-9, Freescale i.MX
> @@ -304,6 +321,11 @@ static const struct platform_device_id imx_i2c_devtype[] = {
>  };
>  MODULE_DEVICE_TABLE(platform, imx_i2c_devtype);
>  
> +static const struct of_device_id guts_device_ids[] = {
> +	{ .compatible = "fsl,qoriq-device-config", },
> +	{}
> +};
> +
>  static const struct of_device_id i2c_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx1-i2c", .data = &imx1_i2c_hwdata, },
>  	{ .compatible = "fsl,imx21-i2c", .data = &imx21_i2c_hwdata, },
> @@ -533,6 +555,9 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
>  	unsigned int div;
>  	int i;
>  
> +	if (!i2c_ipgclk_sel)
> +		i2c_clk_rate = i2c_clk_rate / 2;

It would be nice to have the variable inverted. You wouldn't have to
initialize a global variable with something else but 0 then.

> +
>  	/* Divider value calculation */
>  	if (i2c_imx->cur_clk == i2c_clk_rate)
>  		return;
> @@ -551,6 +576,10 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
>  	/* Store divider value */
>  	i2c_imx->ifdr = i2c_clk_div[i].val;
>  
> +	pr_alert("[%s] CLK Rate=%u Bitrate =%u Div =%u Value =%d\n",
> +		 __func__, i2c_clk_rate, i2c_imx->bitrate,
> +		 div, i2c_clk_div[i].val);

Please drop your debugging aids, for sure they shouldn't be pr_alert.

> +
>  	/*
>  	 * There dummy delay is calculated.
>  	 * It should be about one I2C clock period long.
> @@ -1116,6 +1145,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	int irq, ret;
>  	dma_addr_t phy_addr;
>  	u32 mul_value;
> +	struct device_node *guts_node;
> +	static struct ccsr_guts __iomem *guts_regs;
> +	u32 rcw_reg;
>  
>  	dev_dbg(&pdev->dev, "<%s>\n", __func__);
>  
> @@ -1135,6 +1167,38 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	if (!i2c_imx)
>  		return -ENOMEM;
>  
> +	if (soc_device_match(ls1046a_soc)) {
> +		/*
> +		 * Make device node for GUTS/DCFG (global utilities block)
> +		 * to read RCW.
> +		 */
> +		guts_node = of_find_matching_node(NULL, guts_device_ids);
> +		if (!guts_node) {
> +			dev_err(&pdev->dev, "Could not find GUTS node\n");
> +			return -ENODEV;
> +		}
> +		/*
> +		 * Memory (IO)  MAP the DCFG registers(for RCW) to
> +		 * be used in kernel virtual address space.
> +		 */
> +		guts_regs = of_iomap(guts_node, 0);
> +		of_node_put(guts_node);
> +		if (!guts_regs) {
> +			dev_err(&pdev->dev, "IOREMAP of GUTS node failed\n");
> +			return -ENOMEM;
> +		}
> +		/* Read rcw bit 424 (starting from 0) */
> +		rcw_reg = ioread32be(&guts_regs->rcwsr[RCW_I2C_IPGCLK_WORD]);
> +		pr_alert("RCW REG[%d]=0x%x\n", RCW_I2C_IPGCLK_WORD, rcw_reg);
> +		if (rcw_reg & RCW_I2C_IPGCLK_MASK) {
> +			pr_alert("Div by 2 Case Detected in RCW\n");
> +			i2c_ipgclk_sel = 1;
> +		} else {
> +			pr_alert("Div by 4 Case Detected in RCW\n");
> +			i2c_ipgclk_sel = 0;
> +		}
> +	}

This is done once per i2c controller, but it sets a variable valid for
all controllers. Either execute this code once outside of device
specific context or use a variable in driver data and not a global one.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

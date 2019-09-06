Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98898ABB23
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2019 16:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394531AbfIFOju (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Sep 2019 10:39:50 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42509 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394504AbfIFOju (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Sep 2019 10:39:50 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1i6FOm-0005ih-UF; Fri, 06 Sep 2019 16:39:40 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1i6FOk-0008Ns-3e; Fri, 06 Sep 2019 16:39:38 +0200
Date:   Fri, 6 Sep 2019 16:39:38 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     andy.shevchenko@gmail.com, rafael@kernel.org, leoyang.li@nxp.com,
        meenakshi.aggarwal@nxp.com, udit.kumar@nxp.com, wsa@the-dreams.de,
        rjw@rjwysocki.net, chuanhua.han@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [v2] ACPI: support for NXP i2c controller
Message-ID: <20190906143938.weqs6rvdvlnrzpau@pengutronix.de>
References: <20190906075319.21244-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906075319.21244-1-biwen.li@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:09:03 up 111 days, 20:27, 66 users,  load average: 0.07, 0.06,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 06, 2019 at 03:53:19PM +0800, Biwen Li wrote:
> From: Chuanhua Han <chuanhua.han@nxp.com>
> 
> Enable NXP i2c controller to boot with ACPI
> 
> Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
> Signed-off-by: Udit Kumar <udit.kumar@nxp.com>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>

for i2c-imx.c:
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested on iMX6Q SabreSD
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
> Change in v2:
> 	- Simplify code
> 	- Adjust header file order
> 	- Not use ACPI_PTR()
> 
>  drivers/acpi/acpi_apd.c      |  7 +++++++
>  drivers/i2c/busses/i2c-imx.c | 17 +++++++++++++----
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> index 7cd0c9ac71ea..71511ae2dfcd 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -160,11 +160,17 @@ static const struct apd_device_desc hip08_i2c_desc = {
>  	.setup = acpi_apd_setup,
>  	.fixed_clk_rate = 250000000,
>  };
> +
>  static const struct apd_device_desc thunderx2_i2c_desc = {
>  	.setup = acpi_apd_setup,
>  	.fixed_clk_rate = 125000000,
>  };
>  
> +static const struct apd_device_desc nxp_i2c_desc = {
> +	.setup = acpi_apd_setup,
> +	.fixed_clk_rate = 350000000,
> +};
> +
>  static const struct apd_device_desc hip08_spi_desc = {
>  	.setup = acpi_apd_setup,
>  	.fixed_clk_rate = 250000000,
> @@ -238,6 +244,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
>  	{ "HISI02A1", APD_ADDR(hip07_i2c_desc) },
>  	{ "HISI02A2", APD_ADDR(hip08_i2c_desc) },
>  	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
> +	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
>  #endif
>  	{ }
>  };
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 15f6cde6452f..a3b61336fe55 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -20,6 +20,7 @@
>   *
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
> @@ -255,6 +256,12 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, i2c_imx_dt_ids);
>  
> +static const struct acpi_device_id i2c_imx_acpi_ids[] = {
> +	{"NXP0001", .driver_data = (kernel_ulong_t)&vf610_i2c_hwdata},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, i2c_imx_acpi_ids);
> +
>  static inline int is_imx1_i2c(struct imx_i2c_struct *i2c_imx)
>  {
>  	return i2c_imx->hwdata->devtype == IMX1_I2C;
> @@ -1048,14 +1055,13 @@ static const struct i2c_algorithm i2c_imx_algo = {
>  
>  static int i2c_imx_probe(struct platform_device *pdev)
>  {
> -	const struct of_device_id *of_id = of_match_device(i2c_imx_dt_ids,
> -							   &pdev->dev);
>  	struct imx_i2c_struct *i2c_imx;
>  	struct resource *res;
>  	struct imxi2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
>  	void __iomem *base;
>  	int irq, ret;
>  	dma_addr_t phy_addr;
> +	const struct imx_i2c_hwdata *match;
>  
>  	dev_dbg(&pdev->dev, "<%s>\n", __func__);
>  
> @@ -1075,8 +1081,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	if (!i2c_imx)
>  		return -ENOMEM;
>  
> -	if (of_id)
> -		i2c_imx->hwdata = of_id->data;
> +	match = device_get_match_data(&pdev->dev);
> +	if (match)
> +		i2c_imx->hwdata = match;
>  	else
>  		i2c_imx->hwdata = (struct imx_i2c_hwdata *)
>  				platform_get_device_id(pdev)->driver_data;
> @@ -1089,6 +1096,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	i2c_imx->adapter.nr		= pdev->id;
>  	i2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
>  	i2c_imx->base			= base;
> +	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
>  
>  	/* Get I2C clock */
>  	i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
> @@ -1247,6 +1255,7 @@ static struct platform_driver i2c_imx_driver = {
>  		.name = DRIVER_NAME,
>  		.pm = &i2c_imx_pm_ops,
>  		.of_match_table = i2c_imx_dt_ids,
> +		.acpi_match_table = i2c_imx_acpi_ids,
>  	},
>  	.id_table = imx_i2c_devtype,
>  };
> -- 
> 2.17.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

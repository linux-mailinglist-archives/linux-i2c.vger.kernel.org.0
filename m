Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A871E4518
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 16:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730295AbgE0ODL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 10:03:11 -0400
Received: from mga14.intel.com ([192.55.52.115]:22382 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730223AbgE0ODL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 10:03:11 -0400
IronPort-SDR: r/4ATgdkcr+ps5SIEpyqO27fq5WSHIVyU4BgjAHX8va7g/C1sMOeuefScOSM/PNe37b+HqNROX
 yTmM1vPhdQfw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 07:03:03 -0700
IronPort-SDR: kVfTv44ByvoiRwTa9ezty4HukQfhnC4Cj0DDjAdOOFEVuPCx1YSoGBs80XDRBLcG6hd4Kd8HXV
 /q0Dm8tUY/hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="345541183"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 27 May 2020 07:03:00 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdwe7-009EtN-9L; Wed, 27 May 2020 17:03:03 +0300
Date:   Wed, 27 May 2020 17:03:03 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/11] i2c: designware: Add Baikal-T1 System I2C
 support
Message-ID: <20200527140303.GC1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-12-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527120111.5781-12-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 03:01:11PM +0300, Serge Semin wrote:
> Baikal-T1 System Controller is equipped with a dedicated I2C Controller
> which functionality is based on the DW APB I2C IP-core, the only
> difference in a way it' registers are accessed. There are three access
> register provided in the System Controller registers map, which indirectly
> address the normal DW APB I2C registers space. So in order to have the
> Baikal-T1 System I2C Controller supported by the common DW APB I2C driver
> we created a dedicated Dw I2C controller model quirk, which retrieves the
> syscon regmap from the parental dt node and creates a new regmap based on
> it.

Yes, you see how cool it is now! FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> 
> ---
> 
> Changelog v3:
> - This is a new patch, which has been created due to declining the
>   glue-layer approach.
> 
> Changelog v4:
> - Use PTR_ERR_OR_ZERO() helper in the bt1_i2c_request_regs() method.
> ---
>  drivers/i2c/busses/Kconfig                  |  3 +-
>  drivers/i2c/busses/i2c-designware-core.h    |  3 +
>  drivers/i2c/busses/i2c-designware-platdrv.c | 78 ++++++++++++++++++++-
>  3 files changed, 81 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 259e2325712a..0cf7aea30138 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -541,8 +541,9 @@ config I2C_DESIGNWARE_SLAVE
>  
>  config I2C_DESIGNWARE_PLATFORM
>  	tristate "Synopsys DesignWare Platform"
> -	select I2C_DESIGNWARE_CORE
>  	depends on (ACPI && COMMON_CLK) || !ACPI
> +	select I2C_DESIGNWARE_CORE
> +	select MFD_SYSCON if MIPS_BAIKAL_T1
>  	help
>  	  If you say yes to this option, support will be included for the
>  	  Synopsys DesignWare I2C adapter.
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index f5bbe3d6bcf8..556673a1f61b 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -183,6 +183,7 @@ struct reset_control;
>   * struct dw_i2c_dev - private i2c-designware data
>   * @dev: driver model device node
>   * @map: IO registers map
> + * @sysmap: System controller registers map
>   * @base: IO registers pointer
>   * @ext: Extended IO registers pointer
>   * @cmd_complete: tx completion indicator
> @@ -235,6 +236,7 @@ struct reset_control;
>  struct dw_i2c_dev {
>  	struct device		*dev;
>  	struct regmap		*map;
> +	struct regmap		*sysmap;
>  	void __iomem		*base;
>  	void __iomem		*ext;
>  	struct completion	cmd_complete;
> @@ -290,6 +292,7 @@ struct dw_i2c_dev {
>  #define ACCESS_NO_IRQ_SUSPEND	0x00000002
>  
>  #define MODEL_MSCC_OCELOT	0x00000100
> +#define MODEL_BAIKAL_BT1	0x00000200
>  #define MODEL_MASK		0x00000f00
>  
>  int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 061c8d506c7c..d9c5337bb22b 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -18,6 +18,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_data/i2c-designware.h>
> @@ -25,6 +26,7 @@
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> @@ -58,6 +60,63 @@ MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
>  #endif
>  
>  #ifdef CONFIG_OF
> +#define BT1_I2C_CTL			0x100
> +#define BT1_I2C_CTL_ADDR_MASK		GENMASK(7, 0)
> +#define BT1_I2C_CTL_WR			BIT(8)
> +#define BT1_I2C_CTL_GO			BIT(31)
> +#define BT1_I2C_DI			0x104
> +#define BT1_I2C_DO			0x108
> +
> +static int bt1_i2c_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct dw_i2c_dev *dev = context;
> +	int ret;
> +
> +	/*
> +	 * Note these methods shouldn't ever fail because the system controller
> +	 * registers are memory mapped. We check the return value just in case.
> +	 */
> +	ret = regmap_write(dev->sysmap, BT1_I2C_CTL,
> +			   BT1_I2C_CTL_GO | (reg & BT1_I2C_CTL_ADDR_MASK));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_read(dev->sysmap, BT1_I2C_DO, val);
> +}
> +
> +static int bt1_i2c_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct dw_i2c_dev *dev = context;
> +	int ret;
> +
> +	ret = regmap_write(dev->sysmap, BT1_I2C_DI, val);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(dev->sysmap, BT1_I2C_CTL,
> +		BT1_I2C_CTL_GO | BT1_I2C_CTL_WR | (reg & BT1_I2C_CTL_ADDR_MASK));
> +}
> +
> +static struct regmap_config bt1_i2c_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.fast_io = true,
> +	.reg_read = bt1_i2c_read,
> +	.reg_write = bt1_i2c_write,
> +	.max_register = DW_IC_COMP_TYPE
> +};
> +
> +static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
> +{
> +	dev->sysmap = syscon_node_to_regmap(dev->dev->of_node->parent);
> +	if (IS_ERR(dev->sysmap))
> +		return PTR_ERR(dev->sysmap);
> +
> +	dev->map = devm_regmap_init(dev->dev, NULL, dev, &bt1_i2c_cfg);
> +	return PTR_ERR_OR_ZERO(dev->map);
> +}
> +
>  #define MSCC_ICPU_CFG_TWI_DELAY		0x0
>  #define MSCC_ICPU_CFG_TWI_DELAY_ENABLE	BIT(0)
>  #define MSCC_ICPU_CFG_TWI_SPIKE_FILTER	0x4
> @@ -90,10 +149,16 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
>  static const struct of_device_id dw_i2c_of_match[] = {
>  	{ .compatible = "snps,designware-i2c", },
>  	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
> +	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
>  #else
> +static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline int dw_i2c_of_configure(struct platform_device *pdev)
>  {
>  	return -ENODEV;
> @@ -111,10 +176,19 @@ static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
>  static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev->dev);
> +	int ret;
>  
> -	dev->base = devm_platform_ioremap_resource(pdev, 0);
> +	switch (dev->flags & MODEL_MASK) {
> +	case MODEL_BAIKAL_BT1:
> +		ret = bt1_i2c_request_regs(dev);
> +		break;
> +	default:
> +		dev->base = devm_platform_ioremap_resource(pdev, 0);
> +		ret = PTR_ERR_OR_ZERO(dev->base);
> +		break;
> +	}
>  
> -	return PTR_ERR_OR_ZERO(dev->base);
> +	return ret;
>  }
>  
>  static int dw_i2c_plat_probe(struct platform_device *pdev)
> -- 
> 2.26.2
> 

-- 
With Best Regards,
Andy Shevchenko



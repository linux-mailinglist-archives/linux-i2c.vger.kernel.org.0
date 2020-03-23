Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 146A818F47C
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 13:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbgCWM0B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 08:26:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:15783 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727108AbgCWM0B (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Mar 2020 08:26:01 -0400
IronPort-SDR: rlPi9dzFfWCmb233r3ZnrXeYMxPlfe9mUQvhv3YwKnqt01Bb5fjmHc4wqubPSjr8w05AIbQpdr
 y0fWc0Q4wjig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 05:26:01 -0700
IronPort-SDR: ApZhTsoC0ljwgMIPYbeM1FhZ48BDnPTgxLAZaoNlHlNJJxjyUTWYfjAaFKCgU2dcebu6pzaCJ1
 RY5n9RpoBh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; 
   d="scan'208";a="281143221"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2020 05:26:00 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGM9a-00CExJ-Kr; Mon, 23 Mar 2020 14:26:02 +0200
Date:   Mon, 23 Mar 2020 14:26:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v1 1/2] i2c: designware: Make master module optional
Message-ID: <20200323122602.GK1922688@smile.fi.intel.com>
References: <20200323100451.28808-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323100451.28808-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 23, 2020 at 12:04:50PM +0200, Andy Shevchenko wrote:
> In some cases we know that the controller will be always used in slave mode and
> master is just a bulk. In order to drop that, introduce a separate configuration
> parameter for master mode. Default it to core to avoid regressions.
> 

This series depends to [1] "Provide generic definitions for bus frequencies".

[1]: http://patchwork.ozlabs.org/patch/1259203/

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/Kconfig                  | 10 ++++++++++
>  drivers/i2c/busses/Makefile                 |  5 ++++-
>  drivers/i2c/busses/i2c-designware-core.h    | 19 ++++++++++++++++++-
>  drivers/i2c/busses/i2c-designware-master.c  |  4 ++--
>  drivers/i2c/busses/i2c-designware-pcidrv.c  |  2 +-
>  drivers/i2c/busses/i2c-designware-platdrv.c |  6 +-----
>  6 files changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 2ddca08f8a76..1df238ff8dd0 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -527,6 +527,16 @@ config I2C_DAVINCI
>  config I2C_DESIGNWARE_CORE
>  	tristate
>  
> +config I2C_DESIGNWARE_MASTER
> +	bool "Synopsys DesignWare Master"
> +	default I2C_DESIGNWARE_CORE
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  Synopsys DesignWare I2C master adapter.
> +
> +	  This is not a standalone module, this module compiles together with
> +	  i2c-designware-core.
> +
>  config I2C_DESIGNWARE_PLATFORM
>  	tristate "Synopsys DesignWare Platform"
>  	select I2C_DESIGNWARE_CORE
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 25d60889713c..829731d4a1f9 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -49,7 +49,10 @@ obj-$(CONFIG_I2C_CBUS_GPIO)	+= i2c-cbus-gpio.o
>  obj-$(CONFIG_I2C_CPM)		+= i2c-cpm.o
>  obj-$(CONFIG_I2C_DAVINCI)	+= i2c-davinci.o
>  obj-$(CONFIG_I2C_DESIGNWARE_CORE)	+= i2c-designware-core.o
> -i2c-designware-core-objs := i2c-designware-common.o i2c-designware-master.o
> +i2c-designware-core-objs := i2c-designware-common.o
> +ifeq ($(CONFIG_I2C_DESIGNWARE_MASTER),y)
> +i2c-designware-core-objs += i2c-designware-master.o
> +endif
>  ifeq ($(CONFIG_I2C_DESIGNWARE_SLAVE),y)
>  i2c-designware-core-objs += i2c-designware-slave.o
>  endif
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index b220ad64c38d..2d34c15dca75 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -314,13 +314,30 @@ static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
>  
>  void __i2c_dw_disable(struct dw_i2c_dev *dev);
>  
> -extern int i2c_dw_probe(struct dw_i2c_dev *dev);
> +#if IS_ENABLED(CONFIG_I2C_DESIGNWARE_MASTER)
> +extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
> +#else
> +static inline int i2c_dw_probe_master(struct dw_i2c_dev *dev) { return -EINVAL; }
> +#endif
>  #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_SLAVE)
>  extern int i2c_dw_probe_slave(struct dw_i2c_dev *dev);
>  #else
>  static inline int i2c_dw_probe_slave(struct dw_i2c_dev *dev) { return -EINVAL; }
>  #endif
>  
> +static inline int i2c_dw_probe(struct dw_i2c_dev *dev)
> +{
> +	switch (dev->mode) {
> +	case DW_IC_SLAVE:
> +		return i2c_dw_probe_slave(dev);
> +	case DW_IC_MASTER:
> +		return i2c_dw_probe_master(dev);
> +	default:
> +		dev_err(dev->dev, "Wrong operation mode: %d\n", dev->mode);
> +		return -EINVAL;
> +	}
> +}
> +
>  #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
>  extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
>  #else
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 3a58eef20936..9d2af87f45f1 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -678,7 +678,7 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>  	return 0;
>  }
>  
> -int i2c_dw_probe(struct dw_i2c_dev *dev)
> +int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  {
>  	struct i2c_adapter *adap = &dev->adapter;
>  	unsigned long irq_flags;
> @@ -745,7 +745,7 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(i2c_dw_probe);
> +EXPORT_SYMBOL_GPL(i2c_dw_probe_master);
>  
>  MODULE_DESCRIPTION("Synopsys DesignWare I2C bus master adapter");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 7a0b65b5b5b5..cbab5346e311 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -290,7 +290,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>  	adap->nr = controller->bus_num;
>  
> -	r = i2c_dw_probe(dev);
> +	r = i2c_dw_probe_master(dev);
>  	if (r) {
>  		pci_free_irq_vectors(pdev);
>  		return r;
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index c98befe2a92e..0edcebe2168f 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -371,11 +371,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> -	if (dev->mode == DW_IC_SLAVE)
> -		ret = i2c_dw_probe_slave(dev);
> -	else
> -		ret = i2c_dw_probe(dev);
> -
> +	ret = i2c_dw_probe(dev);
>  	if (ret)
>  		goto exit_probe;
>  
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko



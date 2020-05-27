Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E971E4AA3
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 18:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730276AbgE0QoT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 12:44:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:25417 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728129AbgE0QoT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 12:44:19 -0400
IronPort-SDR: vTzDfB+iWrqjFWNTKPBnE2PfUOBTUrf2TkpeLEwvASu5sp4jRQU+fW2fPHhCwgDQgQzVdXFBDF
 aJniuULRdJjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 09:44:18 -0700
IronPort-SDR: NXhaJwZSrfCiJadlYGhqDCXZBDzr40P9bNTIC5BgUGuO0KalcetBwgmC9U7QZZmAzcAu5HhRW0
 QprPDY0h+jEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; 
   d="scan'208";a="284860670"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 27 May 2020 09:44:15 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdzAA-009GKI-KC; Wed, 27 May 2020 19:44:18 +0300
Date:   Wed, 27 May 2020 19:44:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 06/11] i2c: designware: Add Baytrail sem config DW I2C
 platform dependency
Message-ID: <20200527164418.GS1634618@smile.fi.intel.com>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527153046.6172-7-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 06:30:41PM +0300, Serge Semin wrote:
> Currently Intel Baytrail I2C semaphore is a feature of the DW APB I2C
> platform driver. It's a bit confusing to see it's config in the menu at
> some separated place with no reference to the platform code. Let's move the
> config definition to be below the I2C_DESIGNWARE_PLATFORM config and mark
> it with "depends on I2C_DESIGNWARE_PLATFORM" statement. By doing so the
> config menu will display the feature right below the DW I2C platform
> driver item and will indent it to the right so signifying its belonging.

After clarification Serge gave, it makes sense.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> 
> ---
> 
> Changelog v3:
> - Replace if-endif clause around the I2C_DESIGNWARE_BAYTRAIL config
>   with "depends on" operator.
> ---
>  drivers/i2c/busses/Kconfig | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 7f92f6a96042..7cd279c36898 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -549,20 +549,10 @@ config I2C_DESIGNWARE_PLATFORM
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-designware-platform.
>  
> -config I2C_DESIGNWARE_PCI
> -	tristate "Synopsys DesignWare PCI"
> -	depends on PCI
> -	select I2C_DESIGNWARE_CORE
> -	help
> -	  If you say yes to this option, support will be included for the
> -	  Synopsys DesignWare I2C adapter. Only master mode is supported.
> -
> -	  This driver can also be built as a module.  If so, the module
> -	  will be called i2c-designware-pci.
> -
>  config I2C_DESIGNWARE_BAYTRAIL
>  	bool "Intel Baytrail I2C semaphore support"
>  	depends on ACPI
> +	depends on I2C_DESIGNWARE_PLATFORM
>  	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
>  		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
>  	help
> @@ -572,6 +562,17 @@ config I2C_DESIGNWARE_BAYTRAIL
>  	  the platform firmware controlling it. You should say Y if running on
>  	  a BayTrail system using the AXP288.
>  
> +config I2C_DESIGNWARE_PCI
> +	tristate "Synopsys DesignWare PCI"
> +	depends on PCI
> +	select I2C_DESIGNWARE_CORE
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  Synopsys DesignWare I2C adapter. Only master mode is supported.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-designware-pci.
> +
>  config I2C_DIGICOLOR
>  	tristate "Conexant Digicolor I2C driver"
>  	depends on ARCH_DIGICOLOR || COMPILE_TEST
> -- 
> 2.26.2
> 

-- 
With Best Regards,
Andy Shevchenko



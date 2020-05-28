Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3F21E5CB1
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 12:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387715AbgE1KGh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 06:06:37 -0400
Received: from mga03.intel.com ([134.134.136.65]:6225 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387706AbgE1KGg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 May 2020 06:06:36 -0400
IronPort-SDR: E06La9BxAu65vz/ApsD0ZMw8/L+savWliUpSXTupIXts+Na4uV3KNJ9a2zJtAV/+bhyQDdRZFc
 enfXGNHM426Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 03:06:35 -0700
IronPort-SDR: AN2/jzQ5CBTrxQLBA8tjjMQka8qHDC7uGh+gVH3nlbqGnxJHhnsuXSoVGQNX6eOlmvWlM1b1D6
 Yya/j8512gZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,444,1583222400"; 
   d="scan'208";a="267165215"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 28 May 2020 03:06:32 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jeFQp-009PBt-1u; Thu, 28 May 2020 13:06:35 +0300
Date:   Thu, 28 May 2020 13:06:35 +0300
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
Subject: Re: [PATCH v6 07/11] i2c: designware: Discard Cherry Trail model flag
Message-ID: <20200528100635.GH1634618@smile.fi.intel.com>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
 <20200528093322.23553-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528093322.23553-8-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 28, 2020 at 12:33:17PM +0300, Serge Semin wrote:
> A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
> since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
> bus pm_disabled workaround"), but the flag most likely by mistake has been
> left in the Dw I2C drivers. Let's remove it. Since MODEL_MSCC_OCELOT is
> the only model-flag left, redefine it to be 0x100 so setting a very first
> bit in the MODEL_MASK bits range.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Conditionally, in case Wolfram and Jarkko are fine with shuffling model
defines, which I consider an unneeded churn.

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> 
> ---
> 
> Changelog v3:
> - Since MSCC and Baikal-T1 will be a part of the platform driver code, we
>   have to preserve the MODEL_MASK macro to use it to filter the model
>   flags during the IP-specific quirks activation.
> ---
>  drivers/i2c/busses/i2c-designware-core.h    | 3 +--
>  drivers/i2c/busses/i2c-designware-pcidrv.c  | 1 -
>  drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
>  3 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 150de5e5c31b..b9ef9b0deef0 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -289,8 +289,7 @@ struct dw_i2c_dev {
>  #define ACCESS_INTR_MASK	0x00000004
>  #define ACCESS_NO_IRQ_SUSPEND	0x00000008
>  
> -#define MODEL_CHERRYTRAIL	0x00000100
> -#define MODEL_MSCC_OCELOT	0x00000200
> +#define MODEL_MSCC_OCELOT	0x00000100
>  #define MODEL_MASK		0x00000f00
>  
>  u32 dw_readl(struct dw_i2c_dev *dev, int offset);
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 11a5e4751eab..947c096f86e3 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -149,7 +149,6 @@ static struct dw_pci_controller dw_pci_controllers[] = {
>  	},
>  	[cherrytrail] = {
>  		.bus_num = -1,
> -		.flags = MODEL_CHERRYTRAIL,
>  		.scl_sda_cfg = &byt_config,
>  	},
>  	[elkhartlake] = {
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index f6d2c96e35ce..ca057aa9eac4 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -44,7 +44,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
>  	{ "INT3432", 0 },
>  	{ "INT3433", 0 },
>  	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
> -	{ "808622C1", ACCESS_NO_IRQ_SUSPEND | MODEL_CHERRYTRAIL },
> +	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
>  	{ "AMD0010", ACCESS_INTR_MASK },
>  	{ "AMDI0010", ACCESS_INTR_MASK },
>  	{ "AMDI0510", 0 },
> -- 
> 2.26.2
> 

-- 
With Best Regards,
Andy Shevchenko



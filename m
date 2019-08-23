Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A89B99B03D
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2019 15:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393400AbfHWM7t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Aug 2019 08:59:49 -0400
Received: from mga07.intel.com ([134.134.136.100]:63280 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731861AbfHWM7t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 23 Aug 2019 08:59:49 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Aug 2019 05:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; 
   d="scan'208";a="179161763"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2019 05:59:47 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i19AP-00038I-OE; Fri, 23 Aug 2019 15:59:45 +0300
Date:   Fri, 23 Aug 2019 15:59:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] i2c: designware-pci: Add support for Elkhart Lake
 PSE I2C
Message-ID: <20190823125945.GT30120@smile.fi.intel.com>
References: <20190815142944.18334-1-jarkko.nikula@linux.intel.com>
 <20190815142944.18334-2-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815142944.18334-2-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 15, 2019 at 05:29:44PM +0300, Jarkko Nikula wrote:
> Add support for Intel(R) Programmable Services Engine (Intel(R) PSE) I2C
> controller in Intel Elkhart Lake when interface is assigned to the host
> processor.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 249ee3ee2a09..050adda7c1bd 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -33,6 +33,7 @@ enum dw_pci_ctl_id_t {
>  	baytrail,
>  	cherrytrail,
>  	haswell,
> +	elkhartlake,
>  };
>  
>  struct dw_scl_sda_cfg {
> @@ -168,6 +169,14 @@ static struct dw_pci_controller dw_pci_controllers[] = {
>  		.flags = MODEL_CHERRYTRAIL,
>  		.scl_sda_cfg = &byt_config,
>  	},
> +	[elkhartlake] = {
> +		.bus_num = -1,
> +		.bus_cfg = INTEL_MID_STD_CFG | DW_IC_CON_SPEED_FAST,
> +		.tx_fifo_depth = 32,
> +		.rx_fifo_depth = 32,
> +		.functionality = I2C_FUNC_10BIT_ADDR,
> +		.clk_khz = 100000,
> +	},
>  };
>  
>  #ifdef CONFIG_PM
> @@ -340,6 +349,15 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
>  	{ PCI_VDEVICE(INTEL, 0x22C5), cherrytrail },
>  	{ PCI_VDEVICE(INTEL, 0x22C6), cherrytrail },
>  	{ PCI_VDEVICE(INTEL, 0x22C7), cherrytrail },
> +	/* Elkhart Lake (PSE I2C) */
> +	{ PCI_VDEVICE(INTEL, 0x4bb9), elkhartlake },
> +	{ PCI_VDEVICE(INTEL, 0x4bba), elkhartlake },
> +	{ PCI_VDEVICE(INTEL, 0x4bbb), elkhartlake },
> +	{ PCI_VDEVICE(INTEL, 0x4bbc), elkhartlake },
> +	{ PCI_VDEVICE(INTEL, 0x4bbd), elkhartlake },
> +	{ PCI_VDEVICE(INTEL, 0x4bbe), elkhartlake },
> +	{ PCI_VDEVICE(INTEL, 0x4bbf), elkhartlake },
> +	{ PCI_VDEVICE(INTEL, 0x4bc0), elkhartlake },
>  	{ 0,}
>  };
>  MODULE_DEVICE_TABLE(pci, i2_designware_pci_ids);
> -- 
> 2.23.0.rc1
> 

-- 
With Best Regards,
Andy Shevchenko



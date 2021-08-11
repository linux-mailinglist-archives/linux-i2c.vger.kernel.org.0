Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBD7E3E94F5
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 17:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233276AbhHKPrx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 11:47:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:59657 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233602AbhHKPrT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 11:47:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="213294940"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="213294940"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 08:46:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="507061137"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 08:46:50 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mDqRI-008ByU-93; Wed, 11 Aug 2021 18:46:44 +0300
Date:   Wed, 11 Aug 2021 18:46:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 5/9] i2c: i801: Remove not needed check for
 PCI_COMMAND_INTX_DISABLE
Message-ID: <YRPw5AR7MbHWPuJF@smile.fi.intel.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <9ac8ff4b-3e2a-278d-f7f6-65534b43eec7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ac8ff4b-3e2a-278d-f7f6-65534b43eec7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 06, 2021 at 11:15:51PM +0200, Heiner Kallweit wrote:
> do_pci_enable_device() takes care that PCI_COMMAND_INTX_DISABLE
> is cleared if a legacy interrupt is used.

Makes sense, but needs to be tested.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f56060fcf..7fa06b85f 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1827,19 +1827,12 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		priv->features &= ~FEATURE_IRQ;
>  
>  	if (priv->features & FEATURE_IRQ) {
> -		u16 pcictl, pcists;
> +		u16 pcists;
>  
>  		/* Complain if an interrupt is already pending */
>  		pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
>  		if (pcists & PCI_STATUS_INTERRUPT)
>  			dev_warn(&dev->dev, "An interrupt is pending!\n");
> -
> -		/* Check if interrupts have been disabled */
> -		pci_read_config_word(priv->pci_dev, PCI_COMMAND, &pcictl);
> -		if (pcictl & PCI_COMMAND_INTX_DISABLE) {
> -			dev_info(&dev->dev, "Interrupts are disabled\n");
> -			priv->features &= ~FEATURE_IRQ;
> -		}
>  	}
>  
>  	if (priv->features & FEATURE_IRQ) {
> -- 
> 2.32.0
> 
> 

-- 
With Best Regards,
Andy Shevchenko



Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7113B401808
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Sep 2021 10:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240682AbhIFIbP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Sep 2021 04:31:15 -0400
Received: from mga17.intel.com ([192.55.52.151]:16828 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240675AbhIFIbN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Sep 2021 04:31:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="200127585"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="200127585"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 01:30:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="546120504"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 01:30:06 -0700
Received: from andy by smile with local (Exim 4.95-RC2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mNA0y-000Ros-2H;
        Mon, 06 Sep 2021 11:30:04 +0300
Date:   Mon, 6 Sep 2021 11:30:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Use PCI bus rescan mutex to protect P2SB
 access
Message-ID: <YTXRjMABZhHocFUA@smile.fi.intel.com>
References: <7521c130-d777-6a26-bd14-1ed784f828cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7521c130-d777-6a26-bd14-1ed784f828cc@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 05, 2021 at 05:59:42PM +0200, Heiner Kallweit wrote:
> As pointed out by Andy in [0] using a local mutex here isn't strictly
> wrong but not sufficient. We should hold the PCI rescan lock for P2SB
> operations.

Thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> [0] https://www.spinics.net/lists/linux-i2c/msg52717.html
> 
> Fixes: 1a987c69ce2c ("i2c: i801: make p2sb_spinlock a mutex")
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 89ae78ef1..1f929e6c3 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1493,7 +1493,6 @@ static struct platform_device *
>  i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  		 struct resource *tco_res)
>  {
> -	static DEFINE_MUTEX(p2sb_mutex);
>  	struct resource *res;
>  	unsigned int devfn;
>  	u64 base64_addr;
> @@ -1506,7 +1505,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  	 * enumerated by the PCI subsystem, so we need to unhide/hide it
>  	 * to lookup the P2SB BAR.
>  	 */
> -	mutex_lock(&p2sb_mutex);
> +	pci_lock_rescan_remove();
>  
>  	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 1);
>  
> @@ -1524,7 +1523,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  	/* Hide the P2SB device, if it was hidden before */
>  	if (hidden)
>  		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
> -	mutex_unlock(&p2sb_mutex);
> +	pci_unlock_rescan_remove();
>  
>  	res = &tco_res[1];
>  	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)
> -- 
> 2.33.0
> 

-- 
With Best Regards,
Andy Shevchenko



Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79ECF31ECFD
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 18:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhBRRMR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 12:12:17 -0500
Received: from mga14.intel.com ([192.55.52.115]:5039 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231173AbhBRPjS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Feb 2021 10:39:18 -0500
IronPort-SDR: 7/ID0Oep/tvTT7ZFHj3+5fi6r+ksqIYRcdw5CWOqrRfmGt2QV13rXq6Q0cdWO9q9WMdaCAKB6L
 FAr4YPivEKXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="182743191"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="182743191"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 07:35:26 -0800
IronPort-SDR: Jf9QAV+Q8Uj40xLFxyt+iyEzDFTa+gsXAj7hC4bl3PYJgAqhZ97tw0QErHi6WLmqoGB29Vd+0B
 R7hoI5aI5ehQ==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="378440303"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 07:35:23 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lClKq-005yoo-6T; Thu, 18 Feb 2021 17:35:20 +0200
Date:   Thu, 18 Feb 2021 17:35:20 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] i2c: designware: Use the correct name of
 device-managed function
Message-ID: <YC6JONTb8QdREZ1h@smile.fi.intel.com>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-4-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218150458.798347-4-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 18, 2021 at 11:04:57PM +0800, Dejin Zheng wrote:
> Use the new function pcim_alloc_irq_vectors() to allocate IRQ vectors,
> the pcim_alloc_irq_vectors() function, an explicit device-managed version
> of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
> before, then pci_alloc_irq_vectors() is actually a device-managed
> function. It is used here as a device-managed function, So replace it
> with pcim_alloc_irq_vectors(). At the same time, Remove the
> pci_free_irq_vectors() function to simplify the error handling path.
> the freeing resources will take automatically when device is gone.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
One side note below.

> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v3 -> v4:
> 	- add some commit comments.
> v2 -> v3:
> 	- simplify the error handling path.
> v1 -> v2:
> 	- Modify some commit messages.
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 55c83a7a24f3..620b41e373b6 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -219,7 +219,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  	if (!dev)
>  		return -ENOMEM;
>  
> -	r = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
> +	r = pcim_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
>  	if (r < 0)
>  		return r;
>  
> @@ -234,10 +234,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  
>  	if (controller->setup) {
>  		r = controller->setup(pdev, controller);
> -		if (r) {
> -			pci_free_irq_vectors(pdev);
> +		if (r)
>  			return r;
> -		}
>  	}
>  
>  	i2c_dw_adjust_bus_speed(dev);
> @@ -246,10 +244,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  		i2c_dw_acpi_configure(&pdev->dev);
>  
>  	r = i2c_dw_validate_speed(dev);
> -	if (r) {
> -		pci_free_irq_vectors(pdev);
> +	if (r)
>  		return r;
> -	}
>  
>  	i2c_dw_configure(dev);
>  
> @@ -269,10 +265,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  	adap->nr = controller->bus_num;
>  
>  	r = i2c_dw_probe(dev);
> -	if (r) {
> -		pci_free_irq_vectors(pdev);
> +	if (r)
>  		return r;
> -	}
>  
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
>  	pm_runtime_use_autosuspend(&pdev->dev);
> @@ -292,7 +286,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
>  
>  	i2c_del_adapter(&dev->adapter);
>  	devm_free_irq(&pdev->dev, dev->irq, dev);
> -	pci_free_irq_vectors(pdev);

I'm wondering if we need explicit devm_free_irq() call now. If we don't, it can
be cleaned up in the separate change with a motivation that we got to device
managed PCI IRQ allocation and thus the ordering will be correct (needs a
double check!).

>  }
>  
>  /* work with hotplug and coldplug */
> -- 
> 2.25.0
> 

-- 
With Best Regards,
Andy Shevchenko



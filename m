Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52B439E308
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 18:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhFGQUo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 12:20:44 -0400
Received: from mga02.intel.com ([134.134.136.20]:54783 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232854AbhFGQSm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 12:18:42 -0400
IronPort-SDR: 2w+2UHEFNX+hK7Tsj6O84T+0Rbu9b7HzkHWozpDYCzWXxpg4HzSpShY3VscSdV7bQ7FNVe7Gd/
 2sPaAGk7CKIg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="191762789"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="191762789"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 09:12:41 -0700
IronPort-SDR: hwTF/d0PSJzT8DaJop5ijgP34ZODvolJBQ1e/CpKvcxfagopM1M8baCGk4Ga6c3vhyxTnRv1fy
 015MpZ9v1d+g==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="469137294"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 09:12:38 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lqHre-000Iba-Oq; Mon, 07 Jun 2021 19:12:34 +0300
Date:   Mon, 7 Jun 2021 19:12:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, Sanket.Goswami@amd.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YL5FcivbsIBnVvo0@smile.fi.intel.com>
References: <20210607153916.1021016-1-zhengdejin5@gmail.com>
 <20210607153916.1021016-2-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607153916.1021016-2-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 11:39:13PM +0800, Dejin Zheng wrote:
> Introduce pcim_alloc_irq_vectors(), a device-managed version of
> pci_alloc_irq_vectors(). Introducing this function can simplify
> the error handling path in many drivers.
> 
> And use pci_free_irq_vectors() to replace some code in pcim_release(),
> they are equivalent, and no functional change. It is more explicit
> that pcim_alloc_irq_vectors() is a device-managed function.

...

> When CONFIG_PCI=n, there is no stub for pci_is_managed(), but
> pcim_alloc_irq_vectors() will use it, so add one like other similar stubs.
> Otherwise there can be build errors, as here by kernel test robot
> reported:
> include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
>     1847 |  if (!pci_is_managed(dev))
>          |       ^~~~~~~~~~~~~~

This is rather changelog related material. No need to pollute commit message
with this.

...

> Reported-by: kernel test robot <lkp@intel.com>

It's new functionality. Why this tag is here?
Use comments (similar location than changelog) to give a credit if you wish.

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Robert Richter <rric@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v6 -> v7:
> 	- rebase to PCI next branch
> 	- add a stub for pci_is_managed() when disable PCI for
> 	  fix build error in sparc architecture.
> v5 -> v6:
> 	- rebase to 5.13-rc4
> v4 -> v5:
> 	- Remove the check of enable device in pcim_alloc_irq_vectors()
> 	  and make it as a static line function.
> v3 -> v4:
> 	- No change
> v2 -> v3:
> 	- Add some commit comments for replace some codes in
> 	  pcim_release() by pci_free_irq_vectors().
> v1 -> v2:
> 	- Use pci_free_irq_vectors() to replace some code in
> 	  pcim_release().
> 	- Modify some commit messages.
> 
>  drivers/pci/pci.c   |  5 +----
>  include/linux/pci.h | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 452351025a09..e3b3fc59bd35 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1989,10 +1989,7 @@ static void pcim_release(struct device *gendev, void *res)
>  	struct pci_devres *this = res;
>  	int i;
>  
> -	if (dev->msi_enabled)
> -		pci_disable_msi(dev);
> -	if (dev->msix_enabled)
> -		pci_disable_msix(dev);
> +	pci_free_irq_vectors(dev);
>  
>  	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
>  		if (this->region_mask & (1 << i))
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index c20211e59a57..5783262c4643 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1730,6 +1730,7 @@ static inline struct pci_dev *pci_get_class(unsigned int class,
>  
>  static inline void pci_set_master(struct pci_dev *dev) { }
>  static inline int pci_enable_device(struct pci_dev *dev) { return -EIO; }
> +static inline int pci_is_managed(struct pci_dev *pdev) { return 0; }
>  static inline void pci_disable_device(struct pci_dev *dev) { }
>  static inline int pcim_enable_device(struct pci_dev *pdev) { return -EIO; }
>  static inline int pci_assign_resource(struct pci_dev *dev, int i)
> @@ -1825,6 +1826,30 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>  					      NULL);
>  }
>  
> +/**
> + * pcim_alloc_irq_vectors - a device-managed pci_alloc_irq_vectors()
> + * @dev:		PCI device to operate on
> + * @min_vecs:		minimum number of vectors required (must be >= 1)
> + * @max_vecs:		maximum (desired) number of vectors
> + * @flags:		flags or quirks for the allocation
> + *
> + * Return the number of vectors allocated, (which might be smaller than
> + * @max_vecs) if successful, or a negative error code on error. If less
> + * than @min_vecs interrupt vectors are available for @dev the function
> + * will fail with -ENOSPC.
> + *
> + * It depends on calling pcim_enable_device() to make IRQ resources
> + * manageable.
> + */
> +static inline int
> +pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> +			unsigned int max_vecs, unsigned int flags)
> +{
> +	if (!pci_is_managed(dev))
> +		return -EINVAL;
> +	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> +}
> +
>  /* Include architecture-dependent settings and functions */
>  
>  #include <asm/pci.h>
> -- 
> 2.30.1
> 

-- 
With Best Regards,
Andy Shevchenko



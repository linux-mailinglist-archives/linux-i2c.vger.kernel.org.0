Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7CC31FB15
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 15:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhBSOkw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 09:40:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:34178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230228AbhBSOkw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Feb 2021 09:40:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEAE964D9A;
        Fri, 19 Feb 2021 14:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613745611;
        bh=kPDjLkzDqMQC2vYnKBAO3peQT2EGftnLubeGjVNTazY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wy8z45n22on2rIUpYib4h1RONCNZ0Lhp7CCAja3deSrtesd5CicxIZFccVlomnsXX
         knSZv2Ee1Ho+PlOq7RUnxoUUYauFqixsGZsB1yAGwGn/gQ3IrQDc9r9NeNRuaVkwQc
         Y7c8sVqsTumDnFm4kFixmrBwHvOijrOzaZbNhGA/at6MKrRa5x1QAe86rex+hP6o4w
         aVggxOgpRYmAaKQc15R9QlXkwS1UUu4jWVdav7HSErguV7+KqICAaxuYx/ZYQcknqF
         qLPuAC0anFVrGsj7M14esR5r2iBQbV6Kpe5aepyHYcyKRhP5bX0ih9e8+aoG+rtrZp
         xBKzQzr3YqeDQ==
Date:   Fri, 19 Feb 2021 15:40:05 +0100
From:   Robert Richter <rric@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YC/NxfsQn2RKkrp8@rric.localdomain>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218150458.798347-2-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18.02.21 23:04:55, Dejin Zheng wrote:
> Introduce pcim_alloc_irq_vectors(), a device-managed version of
> pci_alloc_irq_vectors(). Introducing this function can simplify
> the error handling path in many drivers.
> 
> And use pci_free_irq_vectors() to replace some code in pcim_release(),
> they are equivalent, and no functional change. It is more explicit
> that pcim_alloc_irq_vectors() is a device-managed function.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
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
>  drivers/pci/pci.c   | 33 +++++++++++++++++++++++++++++----
>  include/linux/pci.h |  3 +++
>  2 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index b67c4327d307..db799d089c85 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1969,10 +1969,7 @@ static void pcim_release(struct device *gendev, void *res)
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
> @@ -2054,6 +2051,34 @@ void pcim_pin_device(struct pci_dev *pdev)
>  }
>  EXPORT_SYMBOL(pcim_pin_device);
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
> +int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> +				unsigned int max_vecs, unsigned int flags)
> +{
> +	struct pci_devres *dr;
> +
> +	dr = find_pci_dr(dev);
> +	if (!dr || !dr->enabled)
> +		return -EINVAL;
> +
> +	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> +}
> +EXPORT_SYMBOL(pcim_alloc_irq_vectors);

If it is just about having a pcim-* counterpart why not just an inline
function like the one below.

> +
>  /*
>   * pcibios_add_device - provide arch specific hooks when adding device dev
>   * @dev: the PCI device being added
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 86c799c97b77..d75ba85ddfc5 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1818,6 +1818,9 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>  					      NULL);
>  }
>  
> +int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> +				unsigned int max_vecs, unsigned int flags);
> +

static inline int pcim_alloc_irq_vectors(struct pci_dev *dev,
	unsigned int min_vecs, unsigned int max_vecs, unsigned int flags)
{
	if (!pci_is_managed(dev, min_vecs, max_vecs, flags))
		return -EINVAL;

	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
}

All those stub functions with EXPORT_SYMBOLS etc. could be dropped
then.

With some macro magic added a list of functions could easily being
created that are already managed but just need a pcim* counterpart.

-Robert

>  /* Include architecture-dependent settings and functions */
>  
>  #include <asm/pci.h>
> -- 
> 2.25.0
> 

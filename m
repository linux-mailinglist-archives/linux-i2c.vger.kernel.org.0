Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8BD346D89
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 23:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbhCWWrc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 18:47:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:46108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233908AbhCWWrR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Mar 2021 18:47:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B552E6044F;
        Tue, 23 Mar 2021 22:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616539637;
        bh=11JtZEcq3IKgiIIgu80BAiSlfm+ye/04q50fmAGg3jg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=JmKMS58xYat0cbG/A2nxsstga6nHPOupcFJEpL9nbqpUxD3RTXLZtxEN0np5zLGoc
         dbqkegEUrvHYbGZibt1Rrb508T82Y6ELq/BW8MDMCUussGg95w4OAW5mR2fh7s7vnd
         PuLIajwUK717b6ELznVp0ENfac/RQDrugSp6AaVaK6DB68Cdn334HgK8iD6NyBNBcJ
         PvepB4xX/FVTA99EaVMkUBMiyOHggbbz+32vQ1m7AJY5P41MWKX7oxYVu9ruyxehc+
         8qWSM7YUN5NR/lsinxoaTP4E9WwW/duwoYQn0haJ3uufgMlgd+2a0yMMTzbaj/ZhgR
         lRKSCmtRfNWuQ==
Date:   Tue, 23 Mar 2021 17:47:10 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexander Gordeev <agordeev@redhat.com>,
        Jonathan Derrick <jonathan.derrick@intel.com>,
        Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v5 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210323224710.GA610170@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226155056.1068534-2-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[+cc Christoph, Thomas, Alexander, in case you're interested]
[+cc Jonathan, Kurt, Logan: vmd.c and switchtec.c use managed resources
and pci_alloc_irq_vectors()]

On Fri, Feb 26, 2021 at 11:50:53PM +0800, Dejin Zheng wrote:
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

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Let me know if you'd like me to take the series.

> ---
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
>  include/linux/pci.h | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 16a17215f633..fecfdc0add2f 100644
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
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 86c799c97b77..5cafd7d65fd7 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1818,6 +1818,30 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
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
> 2.25.0
> 

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C596B3A3743
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jun 2021 00:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhFJWnm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Jun 2021 18:43:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhFJWnl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Jun 2021 18:43:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C75D061364;
        Thu, 10 Jun 2021 22:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623364905;
        bh=1EzAaDvaFtP7Jm3FouqrhNK+M8umJ1dLnxcuadWZZyM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=g82LyrLtHJp7n9C1Fx1pxaYvj9XON2CaM/MB4WCFLewGEEtjxSTSVKJvrrkPjaW1y
         dKPI6lw30iEApcacy1AWsuW9xysCexDR+NzTYrnZ3XW6HdQbAOjpfA2x9ogU5CGxlw
         LE2Uwof9jb+h+eM3CmCAMyj6HoLXf18Yx2/aeaeMWqTl1L4RUTZJ8Hi5UFBB/vpSqh
         jp/tVDVI+NYkUtesKw+oedi3RN2OQQ4FcFl/qqWnrrXxdklPKZr5JCpduLEP8BJlm7
         JfOF3em9A6lw0aVB5ePzSWUytakcyfxm+96yHwyo0mrW4HUwUSBArTm/ZEdldxYcnc
         nQvVI8GgSPakQ==
Date:   Thu, 10 Jun 2021 17:41:43 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        Sanket.Goswami@amd.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210610224143.GA2785655@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607153916.1021016-2-zhengdejin5@gmail.com>
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

If I understand correctly, this hunk is a nice simplification, but
actually has nothing to do with making pcim_alloc_irq_vectors().  I
have it split to a separate patch in my local tree.  Or am I wrong
about that?

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

This is great, but can you explain how pci_alloc_irq_vectors()
magically becomes a managed interface if we've already called
pcim_enable_device()?

I certainly believe it does; I'd just like to put a hint in the commit
log since my 5 minutes of grepping around didn't make it obvious to
me.

I see that pcim_enable_device() sets pdev->is_managed, but I didn't
find the connection between that and pci_alloc_irq_vectors().

> +}
> +
>  /* Include architecture-dependent settings and functions */
>  
>  #include <asm/pci.h>
> -- 
> 2.30.1
> 

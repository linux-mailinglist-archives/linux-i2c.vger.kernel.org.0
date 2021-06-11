Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0667A3A3F2E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jun 2021 11:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhFKJja (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Jun 2021 05:39:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:47274 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230212AbhFKJj2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Jun 2021 05:39:28 -0400
IronPort-SDR: puOWw2PipAMhE0MswnCQQR0CQNVLrmt4ESfTwB6YD4BsQ/v8S2kR9SUkvp3oTSq4/e5FCpngnA
 lpYHK2q13H0A==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192604928"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192604928"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 02:37:28 -0700
IronPort-SDR: dEdwZkSLj4c82XWEYGbelxuZ8NfYI8SeepYSlSx/1baMh1E9tGVruNrwZpuKyphY5DopEx43XL
 532JHWRu7tzQ==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="402965434"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 02:37:25 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lrdbO-001TP3-3G; Fri, 11 Jun 2021 12:37:22 +0300
Date:   Fri, 11 Jun 2021 12:37:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        Sanket.Goswami@amd.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YMMu0kgEn1emRQvo@smile.fi.intel.com>
References: <20210607153916.1021016-2-zhengdejin5@gmail.com>
 <20210610224143.GA2785655@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610224143.GA2785655@bjorn-Precision-5520>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 10, 2021 at 05:41:43PM -0500, Bjorn Helgaas wrote:
> On Mon, Jun 07, 2021 at 11:39:13PM +0800, Dejin Zheng wrote:
> > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > pci_alloc_irq_vectors(). Introducing this function can simplify
> > the error handling path in many drivers.
> > 
> > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > they are equivalent, and no functional change. It is more explicit
> > that pcim_alloc_irq_vectors() is a device-managed function.

...

> > @@ -1989,10 +1989,7 @@ static void pcim_release(struct device *gendev, void *res)
> >  	struct pci_devres *this = res;
> >  	int i;
> >  
> > -	if (dev->msi_enabled)
> > -		pci_disable_msi(dev);
> > -	if (dev->msix_enabled)
> > -		pci_disable_msix(dev);
> > +	pci_free_irq_vectors(dev);
> 
> If I understand correctly, this hunk is a nice simplification, but
> actually has nothing to do with making pcim_alloc_irq_vectors().  I
> have it split to a separate patch in my local tree.  Or am I wrong
> about that?

It's a good simplification that had to be done when pci_free_irq_vectors()
appeared. But here is the fact that indirectly it's related to the pcim_*()
APIs, i.e. pcim_alloc_irq_vectors(), because you may noticed this is inside
pcim_release().

...

> > +/**
> > + * pcim_alloc_irq_vectors - a device-managed pci_alloc_irq_vectors()
> > + * @dev:		PCI device to operate on
> > + * @min_vecs:		minimum number of vectors required (must be >= 1)
> > + * @max_vecs:		maximum (desired) number of vectors
> > + * @flags:		flags or quirks for the allocation
> > + *
> > + * Return the number of vectors allocated, (which might be smaller than
> > + * @max_vecs) if successful, or a negative error code on error. If less
> > + * than @min_vecs interrupt vectors are available for @dev the function
> > + * will fail with -ENOSPC.
> > + *
> > + * It depends on calling pcim_enable_device() to make IRQ resources
> > + * manageable.
> > + */
> > +static inline int
> > +pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> > +			unsigned int max_vecs, unsigned int flags)
> > +{
> > +	if (!pci_is_managed(dev))
> > +		return -EINVAL;
> > +	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> 
> This is great, but can you explain how pci_alloc_irq_vectors()
> magically becomes a managed interface if we've already called
> pcim_enable_device()?
> 
> I certainly believe it does; I'd just like to put a hint in the commit
> log since my 5 minutes of grepping around didn't make it obvious to
> me.
> 
> I see that pcim_enable_device() sets pdev->is_managed, but I didn't
> find the connection between that and pci_alloc_irq_vectors().

One needs to read and understand the code, I agree. The explanation is spread
between pcim_release() and __pci_enable_msi/x_range().

The call chain is

msi_capability_init() / msix_capability_init()
  ...
  <- __pci_enable_msi/x_range()
    <- pci_alloc_irq_vectors_affinity()
      <- pci_alloc_irq_vectors()

where device msi_enabled / msix_enabled is set.

So, it may deserve to be explained in the commit message.

> > +}

-- 
With Best Regards,
Andy Shevchenko



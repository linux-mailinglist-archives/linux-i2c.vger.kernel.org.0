Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53A6364E826
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 09:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiLPIeb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 03:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLPIeb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 03:34:31 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04A036C50;
        Fri, 16 Dec 2022 00:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671179669; x=1702715669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ISx9ZT5BV8APiVcYWp4g+X/AwH2S2dleKDTZ5WoERoE=;
  b=VqJAQe9MRvXzHeZT38vbvCVMzevLN+9yK6YRl97NZZAaMbRHx3aKeDC2
   f/CgeMJjuIiogNuFve/hnFy/YRM+F1o0z0JBMXHw/fhKIo3ICN5DeuaLK
   5JYHvxpDUejxOrVFjF1CXjqiMpLDL2x9N3ASnwVUqPChLsPDB+pM6kTxw
   patUo/yPLmuJ/QujIWOFGIUfqmdqSALd14QB7uU6hM0Piy1trcbD85Qx5
   4s+4/n0R9WTXvsHq+EbikfpPyPDO4ZXzaSHOs3/+EN4tcFn59q7RrpiKK
   49Mbm6AdKgHfQTxQeeruVF/Af6nLWGRQXw1r2xyyomkhakEvJNod23E88
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="298588418"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="298588418"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 00:34:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="791990626"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="791990626"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2022 00:34:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p66Ag-00AkW7-2U;
        Fri, 16 Dec 2022 10:34:22 +0200
Date:   Fri, 16 Dec 2022 10:34:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        Sanket.Goswami@amd.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <Y5wtgLmIeT4CEaiM@smile.fi.intel.com>
References: <YMtMELqsY0O7djB4@smile.fi.intel.com>
 <20210617155823.GA3077181@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617155823.GA3077181@bjorn-Precision-5520>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 17, 2021 at 10:58:23AM -0500, Bjorn Helgaas wrote:
> On Thu, Jun 17, 2021 at 04:20:16PM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 16, 2021 at 02:25:43PM -0500, Bjorn Helgaas wrote:
> > > On Fri, Jun 11, 2021 at 12:37:22PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Jun 10, 2021 at 05:41:43PM -0500, Bjorn Helgaas wrote:
> > > > > On Mon, Jun 07, 2021 at 11:39:13PM +0800, Dejin Zheng wrote:
> > > > > > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > > > > > pci_alloc_irq_vectors(). Introducing this function can simplify
> > > > > > the error handling path in many drivers.
> > > > > > 
> > > > > > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > > > > > they are equivalent, and no functional change. It is more explicit
> > > > > > that pcim_alloc_irq_vectors() is a device-managed function.

...

> > > > > > @@ -1989,10 +1989,7 @@ static void pcim_release(struct device *gendev, void *res)
> > > > > >  	struct pci_devres *this = res;
> > > > > >  	int i;
> > > > > >  
> > > > > > -	if (dev->msi_enabled)
> > > > > > -		pci_disable_msi(dev);
> > > > > > -	if (dev->msix_enabled)
> > > > > > -		pci_disable_msix(dev);
> > > > > > +	pci_free_irq_vectors(dev);
> > > > > 
> > > > > If I understand correctly, this hunk is a nice simplification, but
> > > > > actually has nothing to do with making pcim_alloc_irq_vectors().  I
> > > > > have it split to a separate patch in my local tree.  Or am I wrong
> > > > > about that?
> > > > 
> > > > It's a good simplification that had to be done when pci_free_irq_vectors()
> > > > appeared.
> > > 
> > > Sorry to be pedantic.  You say the simplification "had to be done,"
> > > but AFAICT there was no actual *requirement* for this simplification
> > > to be done since pci_free_irq_vectors() is functionally identical to
> > > the previous code.
> > > I think we should do it because it's a little
> > > simpler, but not because it *fixes* anything.
> > 
> > It makes things more straightforward. So it definitely "fixes" something, but
> > not the code in this case, rather how we maintain this code.
> > 
> > > > But here is the fact that indirectly it's related to the pcim_*()
> > > > APIs, i.e. pcim_alloc_irq_vectors(), because you may noticed this is inside
> > > > pcim_release().
> > > 
> > > Yes.  For posterity, my notes about the call chain (after applying
> > > this patch):
> > > 
> > >   pci_alloc_irq_vectors
> > >     pci_alloc_irq_vectors_affinity
> > >       __pci_enable_msix_range                 # MSI-X path
> > >         __pci_enable_msix
> > >           msix_capability_init
> > >             msix_setup_entries
> > >               for (...)
> > >                 entry = alloc_msi_entry
> > >                   kzalloc(msi_desc)           <--- alloc
> > >                   kmemdup(msi_desc->affinity) <--- alloc
> > >             dev->msix_enabled = 1             # MSI-X enabled
> > >       __pci_enable_msi_range                  # MSI path
> > >         msi_capability_init
> > >           msi_setup_entry
> > >             alloc_msi_entry                   <--- alloc
> > >           dev->msi_enabled = 1                # MSI enabled
> > > 
> > >   pcim_release
> > >     pci_free_irq_vectors
> > >       pci_disable_msix                        # MSI-X
> > >         if (!dev->msix_enabled)
> > >           return
> > >         pci_msix_shutdown
> > >           dev->msix_enabled = 0               # MSI-X disabled
> > >         free_msi_irqs
> > >           list_for_each_entry_safe(..., msi_list, ...)
> > >             free_msi_entry
> > >               kfree(msi_desc->affinity)       <--- free
> > >               kfree(msi_desc)                 <--- free
> > >       pci_disable_msi                         # MSI
> > >         if (!dev->msi_enabled)
> > >           return
> > >         pci_msi_shutdown
> > >           dev->msi_enabled = 0                # MSI disabled
> > >         free_msi_irqs                         <--- free
> > > 
> > > So I *think* (correct me if I'm wrong):
> > > 
> > >   - If a driver calls pcim_enable_device(), we will call
> > >     pcim_release() when the last reference to the device is dropped.
> > > 
> > >   - pci_alloc_irq_vectors() allocates msi_desc and irq_affinity_desc
> > >     structures via msix_setup_entries() or msi_setup_entry().
> > > 
> > >   - pcim_release() will free those msi_desc and irq_affinity_desc
> > >     structures.
> > > 
> > >   - Even before this series, pcim_release() frees msi_desc and
> > >     irq_affinity_desc structures by calling pci_disable_msi() and
> > >     pci_disable_msix().
> > > 
> > >   - Calling pci_free_irq_vectors() (or pci_disable_msi() or
> > >     pci_disable_msix()) twice is unnecessary but probably harmless
> > >     because they bail out early.
> > 
> > > So this series actually does not fix any problems whatsoever.
> > 
> > I tend to disagree.
> > 
> > The PCI managed API is currently inconsistent and what you got is
> > what I already know and had been using until (see below) Christoph
> > told not to do [1].
> > 
> > Even do you as PCI maintainer it took some time to figure this out.
> > But current APIs make it hard for mere users who wants to use it in
> > the drivers.
> > 
> > So, main point of fix here is _API inconsistency_ [0].
> > 
> > But hey, I believe you have been Cc'ed to the initial submission of
> > the pci_*_irq_vector*() rework done by Christoph [2] (hmm... don't
> > see your name there). And he updated documentation as well [3].
> > 
> > Moreover, he insisted to use pci_free_irq_vectors() whenever we are
> > using pci_alloc_irq_vectors(). And he suggested if we want to avoid
> > this we have to make pcim_ variant of the API (see [1] again).
> 
> I'd like to consider this, but it's hard without a reference :)

Sorry it took a bit too long to answer here.

https://lore.kernel.org/linux-serial/0250c46e-da6c-71f3-50ae-b7c17fd0bd2c@siemens.com/T/#u

> I do think it would be helpful to have clear guidance about when
> drivers need to use pci_free_irq_vectors().  The existing text in
> msi-howto.rst doesn't address pcim_ at all.

Christoph suggested to create an explicit managed API. For now it may be
looking the same as non-managed, but by design it will require different
approaches in case it divert.

> > Maybe you, guys, should got some agreement and clarify it in the
> > documentation?
> 
> I agree that the pcim_*() API is confusing at best and it would be
> nice to improve it and document it, but I don't think this series
> really does it.
> 
> There are several MSI-related interfaces that use alloc_msi_entry()
> and hence magically become managed if we call pcim_enable_device():
> 
>   pci_alloc_irq_vectors()            # ~150 callers
>   pci_alloc_irq_vectors_affinity()   #  ~10 callers
>   pci_enable_msix_exact()            #  ~20 callers (deprecated)
>   pci_enable_msix_range()            #  ~50 callers (deprecated)
>   pci_enable_msi()                   # ~100 callers (deprecated)
> 
> This series adds pcim_alloc_irq_vectors(), which sort of fixes *one*
> of them and makes this sequence look nice:
> 
>   pcim_enable_device();
>   pcim_alloc_irq_vectors();
> 
> but all the others are still potentially managed even though the name
> doesn't indicate it.

> And it really doesn't improve the documentation.
> 
> Possible steps forward:
> 
>   - Add comments in include/linux/pci.h to indicate deprecation
>     (AFAICS, deprecation is currently only mentioned in
>     msi-howto.rst).
> 
>   - Migrate callers away from deprecated interfaces (a lot of work).

AFAIU you the proposal is to convert all drivers to use explicit
error handling for pci_alloc_irq_vectors() and then undo that after
introducing pcim_alloc_irq_vectors().

Why not having less churn by applying this series and then clean up things?
We have a lot of unneeded churn now because of this rather lexicographical
issue.

>   - Remove deprecated interfaces.
> 
>   - Add pcim_ variants of remaining interfaces (I think only
>     pci_alloc_*()).  Consider returning error for pci_alloc_*() usage
>     by managed drivers.
> 
>   - Convert managed callers from pci_alloc_*() to pcim_alloc_*() and
>     remove usage of pci_free_irq_vectors(), pci_disable_msi(),
>     pci_disable_msix().

Seems to me a lot of useless churn, but maybe I'm missing the point?

> > [0]: We have a few functions with pcim_ prefix, few without and some from the
> >      latter group imply to behave _differently_ when pcim_enable_device() had
> >      been called.
> > [1]: I'm not able to find the archive of the mailing, but I remember that it
> >      was something like that IIRC during 8250_lpss.c development.
> > [2]: https://lore.kernel.org/linux-pci/1467621574-8277-1-git-send-email-hch@lst.de/
> > [3]: https://www.kernel.org/doc/html/latest/PCI/msi-howto.html#using-msi
> > 
> > > It *does* remove unnecessary pci_free_irq_vectors() calls from
> > > i2c-designware-pcidrv.c.
> > > 
> > > But because pci_alloc_irq_vectors() and related interfaces are
> > > *already* managed as soon as a driver calls pcim_enable_device(),
> > > we can simply remove the pci_free_irq_vectors() without doing anything
> > > else.
> > > 
> > > I don't think we *should* do anything else.
> > 
> > See above.
> > 
> > > There are many callers of
> > > pcim_enable_device() that also call pci_alloc_irq_vectors(),
> > > pci_enable_msix_range(), etc.  We don't have pcim_enable_msix_range(),
> > > pcim_enable_msi(), pcim_alloc_irq_vectors_affinity(), etc.  I don't
> > > think it's worth the churn of adding all those and changing all the
> > > callers to use pcim_*() (as in patch 4/4 here).
> > > 
> > > Browsing the output of this:
> > > 
> > >   git grep -En "pcim_enable_device|pci_alloc_irq_vectors|pci_enable_msix_|pci_free_irq_vectors|pci_disable_msi"
> > > 
> > > leads me to believe there are similar calls of pci_free_irq_vectors()
> > > that could be removed here:
> > > 
> > >   mtip_pci_probe
> > >   sp_pci_probe
> > >   dw_edma_pcie_probe
> > >   hisi_dma_probe
> > >   ioat_pci_probe
> > >   plx_dma_probe
> > >   cci_pci_probe
> > >   hibmc_pci_probe
> > >   ...
> > > 
> > > and many more, but I got tired of looking.
> > > 
> > > > > > +/**
> > > > > > + * pcim_alloc_irq_vectors - a device-managed pci_alloc_irq_vectors()
> > > > > > + * @dev:		PCI device to operate on
> > > > > > + * @min_vecs:		minimum number of vectors required (must be >= 1)
> > > > > > + * @max_vecs:		maximum (desired) number of vectors
> > > > > > + * @flags:		flags or quirks for the allocation
> > > > > > + *
> > > > > > + * Return the number of vectors allocated, (which might be smaller than
> > > > > > + * @max_vecs) if successful, or a negative error code on error. If less
> > > > > > + * than @min_vecs interrupt vectors are available for @dev the function
> > > > > > + * will fail with -ENOSPC.
> > > > > > + *
> > > > > > + * It depends on calling pcim_enable_device() to make IRQ resources
> > > > > > + * manageable.
> > > > > > + */
> > > > > > +static inline int
> > > > > > +pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> > > > > > +			unsigned int max_vecs, unsigned int flags)
> > > > > > +{
> > > > > > +	if (!pci_is_managed(dev))
> > > > > > +		return -EINVAL;
> > > > > > +	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> > > > > 
> > > > > This is great, but can you explain how pci_alloc_irq_vectors()
> > > > > magically becomes a managed interface if we've already called
> > > > > pcim_enable_device()?
> > > > > 
> > > > > I certainly believe it does; I'd just like to put a hint in the commit
> > > > > log since my 5 minutes of grepping around didn't make it obvious to
> > > > > me.
> > > > > 
> > > > > I see that pcim_enable_device() sets pdev->is_managed, but I didn't
> > > > > find the connection between that and pci_alloc_irq_vectors().
> > > > 
> > > > One needs to read and understand the code, I agree. The explanation is spread
> > > > between pcim_release() and __pci_enable_msi/x_range().
> > > > 
> > > > The call chain is
> > > > 
> > > > msi_capability_init() / msix_capability_init()
> > > >   ...
> > > >   <- __pci_enable_msi/x_range()
> > > >     <- pci_alloc_irq_vectors_affinity()
> > > >       <- pci_alloc_irq_vectors()
> > > > 
> > > > where device msi_enabled / msix_enabled is set.
> > > > 
> > > > So, it may deserve to be explained in the commit message.
> > > > 
> > > > > > +}

-- 
With Best Regards,
Andy Shevchenko



Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92953ABA87
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jun 2021 19:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbhFQRT4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Jun 2021 13:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232317AbhFQRTy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Jun 2021 13:19:54 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB35C06175F;
        Thu, 17 Jun 2021 10:17:46 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id h16so4164970pjv.2;
        Thu, 17 Jun 2021 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RwOFnqgJRGk5eQnR0vm4gk5DVHcaazaxQdWaNoDTohk=;
        b=Vl+JL8iKb5xKeVJIHnPGQUZrBkrV5c5W6R8d1bVXzRsso1PUxR2fMQBdb61iZ8fyn1
         ngyAqPqivqqAaCiDVJ13bQFLQ1MJZc6ayJdDvdyoyfieIzNvTENHqcofRsIOAKwj1Jht
         juAJirL+/4gIFhNHqzSZ48CndwipDKPY3llXp4ThZ0fk1J6vqld+6ydHajwqb3kNMPTc
         FFMTqFSofV9WC1Ms5mFcrv669gX1MbPbqBXqFf8JhkIpCHocXiVrnqIbQwahotknKXL6
         wEs9jG+mFYqhGzUbGo/yUle8BfN08Zc1JA3pt5AShuXPUPpwuHWvIARgRici/a8uZiVA
         PMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RwOFnqgJRGk5eQnR0vm4gk5DVHcaazaxQdWaNoDTohk=;
        b=mwWl4xdp17PTxp6/yZyEbsOWkFLh3bHTvlCKmS02HmCbIkf9Y76PGsxVz+eeTZg7cU
         Aw/fCvapjbCaa10HjY7TXrnhdS/oGV2y54UoxF+n6Qjk7I7KMBoCtMMDjczKCb2KyMqF
         S7/MJK0C25jWpludj9Z7Do7bt6kceDN0CNK6YpXXGW6IfD1V8JLbDPiPR6vE63wPNcUk
         VAoXQGi/5yWlgvpxSH8Yx5zczmkkyO9eo52ZY5+0V4AZZX/uXrmFTH0+UbyYIxV2G5nj
         k4ZUYJJ+5G8fDC9Ydz7Iwo09xWLtnNrldnPevoxCicKZLVPAsF3WbUcRx5vI5/m/doMW
         fwiw==
X-Gm-Message-State: AOAM531Ifur74ycPmvr16tQ99GkbO1ntXCG8QFKLnD7bBMzfTpzUFDv6
        8iFz1kQtqSIAvxosDzjsgru664kfHaBy4Ayd
X-Google-Smtp-Source: ABdhPJxnjGYTFV3rbY6GAxLvGKKDEJK0A4G0UEDus4aQojmijj+quOAb3RsfBvyvBEFoBOfpFU47yg==
X-Received: by 2002:a17:902:ba8b:b029:120:1d2b:f94b with SMTP id k11-20020a170902ba8bb02901201d2bf94bmr980076pls.44.1623950266154;
        Thu, 17 Jun 2021 10:17:46 -0700 (PDT)
Received: from localhost (89.208.244.161.16clouds.com. [89.208.244.161])
        by smtp.gmail.com with ESMTPSA id d6sm6200077pgq.88.2021.06.17.10.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 10:17:45 -0700 (PDT)
Date:   Fri, 18 Jun 2021 01:17:43 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, Christoph Hellwig <hch@lst.de>,
        corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, Sanket.Goswami@amd.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210617171743.GA168292@nuc8i5>
References: <YMMu0kgEn1emRQvo@smile.fi.intel.com>
 <20210616192543.GA2924004@bjorn-Precision-5520>
 <YMtMELqsY0O7djB4@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YMtMELqsY0O7djB4@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 17, 2021 at 04:20:16PM +0300, Andy Shevchenko wrote:
> Dejin, why Christoph's email suddenly disappeared during updating?
>
Due to my negligence, I forgot to add Christoph to mail list.

Hi Christoph,

I can't tell you how sorry I am, I will be more careful in the future��

BR��
Dejin

> On Wed, Jun 16, 2021 at 02:25:43PM -0500, Bjorn Helgaas wrote:
> > On Fri, Jun 11, 2021 at 12:37:22PM +0300, Andy Shevchenko wrote:
> > > On Thu, Jun 10, 2021 at 05:41:43PM -0500, Bjorn Helgaas wrote:
> > > > On Mon, Jun 07, 2021 at 11:39:13PM +0800, Dejin Zheng wrote:
> > > > > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > > > > pci_alloc_irq_vectors(). Introducing this function can simplify
> > > > > the error handling path in many drivers.
> > > > > 
> > > > > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > > > > they are equivalent, and no functional change. It is more explicit
> > > > > that pcim_alloc_irq_vectors() is a device-managed function.
> > > 
> > > ...
> > > 
> > > > > @@ -1989,10 +1989,7 @@ static void pcim_release(struct device *gendev, void *res)
> > > > >  	struct pci_devres *this = res;
> > > > >  	int i;
> > > > >  
> > > > > -	if (dev->msi_enabled)
> > > > > -		pci_disable_msi(dev);
> > > > > -	if (dev->msix_enabled)
> > > > > -		pci_disable_msix(dev);
> > > > > +	pci_free_irq_vectors(dev);
> > > > 
> > > > If I understand correctly, this hunk is a nice simplification, but
> > > > actually has nothing to do with making pcim_alloc_irq_vectors().  I
> > > > have it split to a separate patch in my local tree.  Or am I wrong
> > > > about that?
> > > 
> > > It's a good simplification that had to be done when pci_free_irq_vectors()
> > > appeared.
> > 
> > Sorry to be pedantic.  You say the simplification "had to be done,"
> > but AFAICT there was no actual *requirement* for this simplification
> > to be done since pci_free_irq_vectors() is functionally identical to
> > the previous code.
> > I think we should do it because it's a little
> > simpler, but not because it *fixes* anything.
> 
> It makes things more straightforward. So it definitely "fixes" something, but
> not the code in this case, rather how we maintain this code.
> 
> > > But here is the fact that indirectly it's related to the pcim_*()
> > > APIs, i.e. pcim_alloc_irq_vectors(), because you may noticed this is inside
> > > pcim_release().
> > 
> > Yes.  For posterity, my notes about the call chain (after applying
> > this patch):
> > 
> >   pci_alloc_irq_vectors
> >     pci_alloc_irq_vectors_affinity
> >       __pci_enable_msix_range                 # MSI-X path
> >         __pci_enable_msix
> >           msix_capability_init
> >             msix_setup_entries
> >               for (...)
> >                 entry = alloc_msi_entry
> >                   kzalloc(msi_desc)           <--- alloc
> >                   kmemdup(msi_desc->affinity) <--- alloc
> >             dev->msix_enabled = 1             # MSI-X enabled
> >       __pci_enable_msi_range                  # MSI path
> >         msi_capability_init
> >           msi_setup_entry
> >             alloc_msi_entry                   <--- alloc
> >           dev->msi_enabled = 1                # MSI enabled
> > 
> >   pcim_release
> >     pci_free_irq_vectors
> >       pci_disable_msix                        # MSI-X
> >         if (!dev->msix_enabled)
> >           return
> >         pci_msix_shutdown
> >           dev->msix_enabled = 0               # MSI-X disabled
> >         free_msi_irqs
> >           list_for_each_entry_safe(..., msi_list, ...)
> >             free_msi_entry
> >               kfree(msi_desc->affinity)       <--- free
> >               kfree(msi_desc)                 <--- free
> >       pci_disable_msi                         # MSI
> >         if (!dev->msi_enabled)
> >           return
> >         pci_msi_shutdown
> >           dev->msi_enabled = 0                # MSI disabled
> >         free_msi_irqs                         <--- free
> > 
> > So I *think* (correct me if I'm wrong):
> > 
> >   - If a driver calls pcim_enable_device(), we will call
> >     pcim_release() when the last reference to the device is dropped.
> > 
> >   - pci_alloc_irq_vectors() allocates msi_desc and irq_affinity_desc
> >     structures via msix_setup_entries() or msi_setup_entry().
> > 
> >   - pcim_release() will free those msi_desc and irq_affinity_desc
> >     structures.
> > 
> >   - Even before this series, pcim_release() frees msi_desc and
> >     irq_affinity_desc structures by calling pci_disable_msi() and
> >     pci_disable_msix().
> > 
> >   - Calling pci_free_irq_vectors() (or pci_disable_msi() or
> >     pci_disable_msix()) twice is unnecessary but probably harmless
> >     because they bail out early.
> 
> > So this series actually does not fix any problems whatsoever.
> 
> I tend to disagree.
> 
> The PCI managed API is currently inconsistent and what you got is what I
> already know and had been using until (see below) Christoph told not to do [1].
> 
> Even do you as PCI maintainer it took some time to figure this out. But current
> APIs make it hard for mere users who wants to use it in the drivers.
> 
> So, main point of fix here is _API inconsistency_ [0].
> 
> But hey, I believe you have been Cc'ed to the initial submission of the
> pci_*_irq_vector*() rework done by Christoph [2] (hmm... don't see your
> name there). And he updated documentation as well [3].
> 
> Moreover, he insisted to use pci_free_irq_vectors() whenever we are using
> pci_alloc_irq_vectors(). And he suggested if we want to avoid this we have to
> make pcim_ variant of the API (see [1] again).
> 
> Maybe you, guys, should got some agreement and clarify it in the documentation?
> 
> [0]: We have a few functions with pcim_ prefix, few without and some from the
>      latter group imply to behave _differently_ when pcim_enable_device() had
>      been called.
> [1]: I'm not able to find the archive of the mailing, but I remember that it
>      was something like that IIRC during 8250_lpss.c development.
> [2]: https://lore.kernel.org/linux-pci/1467621574-8277-1-git-send-email-hch@lst.de/
> [3]: https://www.kernel.org/doc/html/latest/PCI/msi-howto.html#using-msi
> 
> > It *does* remove unnecessary pci_free_irq_vectors() calls from
> > i2c-designware-pcidrv.c.
> > 
> > But because pci_alloc_irq_vectors() and related interfaces are
> > *already* managed as soon as a driver calls pcim_enable_device(),
> > we can simply remove the pci_free_irq_vectors() without doing anything
> > else.
> > 
> > I don't think we *should* do anything else.
> 
> See above.
> 
> > There are many callers of
> > pcim_enable_device() that also call pci_alloc_irq_vectors(),
> > pci_enable_msix_range(), etc.  We don't have pcim_enable_msix_range(),
> > pcim_enable_msi(), pcim_alloc_irq_vectors_affinity(), etc.  I don't
> > think it's worth the churn of adding all those and changing all the
> > callers to use pcim_*() (as in patch 4/4 here).
> > 
> > Browsing the output of this:
> > 
> >   git grep -En "pcim_enable_device|pci_alloc_irq_vectors|pci_enable_msix_|pci_free_irq_vectors|pci_disable_msi"
> > 
> > leads me to believe there are similar calls of pci_free_irq_vectors()
> > that could be removed here:
> > 
> >   mtip_pci_probe
> >   sp_pci_probe
> >   dw_edma_pcie_probe
> >   hisi_dma_probe
> >   ioat_pci_probe
> >   plx_dma_probe
> >   cci_pci_probe
> >   hibmc_pci_probe
> >   ...
> > 
> > and many more, but I got tired of looking.
> > 
> > > > > +/**
> > > > > + * pcim_alloc_irq_vectors - a device-managed pci_alloc_irq_vectors()
> > > > > + * @dev:		PCI device to operate on
> > > > > + * @min_vecs:		minimum number of vectors required (must be >= 1)
> > > > > + * @max_vecs:		maximum (desired) number of vectors
> > > > > + * @flags:		flags or quirks for the allocation
> > > > > + *
> > > > > + * Return the number of vectors allocated, (which might be smaller than
> > > > > + * @max_vecs) if successful, or a negative error code on error. If less
> > > > > + * than @min_vecs interrupt vectors are available for @dev the function
> > > > > + * will fail with -ENOSPC.
> > > > > + *
> > > > > + * It depends on calling pcim_enable_device() to make IRQ resources
> > > > > + * manageable.
> > > > > + */
> > > > > +static inline int
> > > > > +pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> > > > > +			unsigned int max_vecs, unsigned int flags)
> > > > > +{
> > > > > +	if (!pci_is_managed(dev))
> > > > > +		return -EINVAL;
> > > > > +	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> > > > 
> > > > This is great, but can you explain how pci_alloc_irq_vectors()
> > > > magically becomes a managed interface if we've already called
> > > > pcim_enable_device()?
> > > > 
> > > > I certainly believe it does; I'd just like to put a hint in the commit
> > > > log since my 5 minutes of grepping around didn't make it obvious to
> > > > me.
> > > > 
> > > > I see that pcim_enable_device() sets pdev->is_managed, but I didn't
> > > > find the connection between that and pci_alloc_irq_vectors().
> > > 
> > > One needs to read and understand the code, I agree. The explanation is spread
> > > between pcim_release() and __pci_enable_msi/x_range().
> > > 
> > > The call chain is
> > > 
> > > msi_capability_init() / msix_capability_init()
> > >   ...
> > >   <- __pci_enable_msi/x_range()
> > >     <- pci_alloc_irq_vectors_affinity()
> > >       <- pci_alloc_irq_vectors()
> > > 
> > > where device msi_enabled / msix_enabled is set.
> > > 
> > > So, it may deserve to be explained in the commit message.
> > > 
> > > > > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

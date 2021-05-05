Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2383A373FC1
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 18:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234069AbhEEQ2R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 12:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbhEEQ2Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 May 2021 12:28:16 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB05DC061574;
        Wed,  5 May 2021 09:27:19 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id m190so2199276pga.2;
        Wed, 05 May 2021 09:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QuiR/14QIg+HRSrKvEjh46+17/5lNNOb1LFG1tZkvKk=;
        b=Ybzgvm+TW5ke7Xovz8fGkdanRRv9DbfloS5P8GgCKJvz3I+a/qdAt8lp3QtW3DxsW2
         n08xOIuhEBO+sJpt6Pv/ShxACZMAvdHS3YW76LcauNQRkK4U61mqnLOPPstocp0TmcuU
         53PhamcsqOFRYss7CSb0ruqosRkO1bKqgDbJgyJA9wAZQphq5bRT9cP1ez1o6wwTlg3J
         Ce6ufn/4Q1JXcA8NppP570P+EcW1rhLTdQAR7eeoEBu68wSbKroIUBCUh7X09j/L7exz
         v9c6Vp1d1r6JEEMIVZY0PED5vYVkZ6hdi5OovPNkAy9iT+tFb00qIwDwkjCaXdg5V4Oz
         asYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QuiR/14QIg+HRSrKvEjh46+17/5lNNOb1LFG1tZkvKk=;
        b=gW36iZa1THe5UPDSbBN07OfpqwzyL0sDrbkoozUBM+UXTSNrkYQFWyBlJA8jx/Lah1
         wrwTSI+p2P13bv1Ul+egYXZfg9JkhJM3u7WceXkOI7DegwuLKyfcruWJMT3/6MStd/Tc
         kyO/+9Mhrs4VDq48uOZ7MeWWgKl9+b9Dg/eCQQVV9z3P5DyP9z9WITWhk8trRxw0DtsZ
         L8IMJetOuzY5YuLyimdXZBLwsaK75t5aCmXVt8KutITCI/K9S9fsAfYlkeCV9Kb9z9RU
         FmLlmncluNOBV8OyBS2kFgimXUfF0+ltcXg1IsfrMbpH6bvadxanm9lPfXzr1cSetEUg
         30Tg==
X-Gm-Message-State: AOAM532RQPFvkE6EfS5iWS4ykXAgt3gsxv9ZNjAy3ZSwJlpPf7xs0eRI
        wo4V5Miv3sO1a9FbZ61xj18=
X-Google-Smtp-Source: ABdhPJwP9jGwbq3oB08OjZQ6UPlB63GLE9oGR3t0CF3D5eUfWqFyX3MAuFoEnI/tFyP6VFrLA8S2RQ==
X-Received: by 2002:a62:8208:0:b029:289:112f:d43d with SMTP id w8-20020a6282080000b0290289112fd43dmr27878538pfd.61.1620232039350;
        Wed, 05 May 2021 09:27:19 -0700 (PDT)
Received: from localhost (185.212.56.149.16clouds.com. [185.212.56.149])
        by smtp.gmail.com with ESMTPSA id 128sm15552248pfy.194.2021.05.05.09.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 09:27:18 -0700 (PDT)
Date:   Thu, 6 May 2021 00:27:16 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <20210505162716.GB1851@nuc8i5>
References: <20210226155056.1068534-2-zhengdejin5@gmail.com>
 <20210323224710.GA610170@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323224710.GA610170@bjorn-Precision-5520>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 23, 2021 at 05:47:10PM -0500, Bjorn Helgaas wrote:
> [+cc Christoph, Thomas, Alexander, in case you're interested]
> [+cc Jonathan, Kurt, Logan: vmd.c and switchtec.c use managed resources
> and pci_alloc_irq_vectors()]
> 
> On Fri, Feb 26, 2021 at 11:50:53PM +0800, Dejin Zheng wrote:
> > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > pci_alloc_irq_vectors(). Introducing this function can simplify
> > the error handling path in many drivers.
> > 
> > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > they are equivalent, and no functional change. It is more explicit
> > that pcim_alloc_irq_vectors() is a device-managed function.
> > 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> Let me know if you'd like me to take the series.
>
Hi Bjorn,

These patches are still invisible on the mainline, could you help me to
take it? Thanks very much!

BR,
Dejin

> > ---
> > v4 -> v5:
> > 	- Remove the check of enable device in pcim_alloc_irq_vectors()
> > 	  and make it as a static line function.
> > v3 -> v4:
> > 	- No change
> > v2 -> v3:
> > 	- Add some commit comments for replace some codes in
> > 	  pcim_release() by pci_free_irq_vectors().
> > v1 -> v2:
> > 	- Use pci_free_irq_vectors() to replace some code in
> > 	  pcim_release().
> > 	- Modify some commit messages.
> > 
> >  drivers/pci/pci.c   |  5 +----
> >  include/linux/pci.h | 24 ++++++++++++++++++++++++
> >  2 files changed, 25 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 16a17215f633..fecfdc0add2f 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -1969,10 +1969,7 @@ static void pcim_release(struct device *gendev, void *res)
> >  	struct pci_devres *this = res;
> >  	int i;
> >  
> > -	if (dev->msi_enabled)
> > -		pci_disable_msi(dev);
> > -	if (dev->msix_enabled)
> > -		pci_disable_msix(dev);
> > +	pci_free_irq_vectors(dev);
> >  
> >  	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
> >  		if (this->region_mask & (1 << i))
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 86c799c97b77..5cafd7d65fd7 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -1818,6 +1818,30 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> >  					      NULL);
> >  }
> >  
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
> > +}
> > +
> >  /* Include architecture-dependent settings and functions */
> >  
> >  #include <asm/pci.h>
> > -- 
> > 2.25.0
> > 

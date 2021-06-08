Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E8039F8E4
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 16:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233185AbhFHOXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 10:23:07 -0400
Received: from mail-pg1-f178.google.com ([209.85.215.178]:36390 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbhFHOXG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 10:23:06 -0400
Received: by mail-pg1-f178.google.com with SMTP id 27so16637387pgy.3;
        Tue, 08 Jun 2021 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JtHZTnQSoYh0AEkVETNPL+hjy9vyaWFCSiTeWDIJXLo=;
        b=ssWmJBv/KgfH3Dp+nlZZ1rNCnEwlYwUK7JEgZT0Cc/0kL6BeIdf+g//8fo5KF9kCHe
         RavVPhWuyfAo3QqdT68vg9Cjqej8tmF4Fxu01juOc4s7GDJQvBgZhRdmr/lZFFxfueto
         HVInMcqBwQgT6pTu/MzyO95nt4KYhbrTG/UpIkUmULt8pO0Ko041gEBSWFnDZvDl+QGF
         DejO7EpI8/vcjjG6qBE4zu4aHLiQ0VlTw5Et2HBFaNxQVJfVf4ue0ZXcrY11XPsuGHm+
         9tklUQx9MLhFfC/YqlQmM5idmPkJSdIoaCYUmDEFhQJ1C4G0SX3KfBP42m/xsSVDxDvh
         ef2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JtHZTnQSoYh0AEkVETNPL+hjy9vyaWFCSiTeWDIJXLo=;
        b=WTPOm7T1omzUTUDKmtpZAcTRjp+LVEHedGXoesd++KOn5dM+k0VUc+6/vso1QDxgG1
         OHqlIiI2P5H2SNBhbtZfOtI14xgOsENwfkMhkcCuCr/hyJCnOXu9TkwQLSrGxD0ejK6p
         igVlxPrSVsXljjtkg5FRrZCHn2R/O8EYeE2rhHnhUz97bCDTXQVmlPy/UTyz8WSIJUBD
         nPQJWEXFPUPfMaMtfYHQlYI1V6aD/BmfB4bF76l2XINc1i6Y+wA77JaGelLGgIjDqDB0
         ORPbCmVBFAD3eor//VbT2LP2CfMgkyBtJJVEAJ4p5aRcWEUv9ewbNQ/b33mTIRgnzqj4
         MKhw==
X-Gm-Message-State: AOAM532lz9yS61CFWEviw3XdHl8R+q0X4Wg3fqYtBKtv1NnmEuJW1YOF
        aFEFPzpdUfjc5wd1e8eE3WJA8UZHTaoBIiFG
X-Google-Smtp-Source: ABdhPJw8YkK1dHLFMft90Rc+UoTgKLQ/mfuldPMHIkGGF7+wWat2/pnIL3EAgh4NHXHaVSejbETY5g==
X-Received: by 2002:a05:6a00:a89:b029:2ee:da59:e89c with SMTP id b9-20020a056a000a89b02902eeda59e89cmr113082pfl.17.1623162013560;
        Tue, 08 Jun 2021 07:20:13 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id j24sm8718437pfe.58.2021.06.08.07.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:20:13 -0700 (PDT)
Date:   Tue, 8 Jun 2021 22:20:11 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, Sanket.Goswami@amd.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210608142011.GA1030842@nuc8i5>
References: <20210607153916.1021016-1-zhengdejin5@gmail.com>
 <20210607153916.1021016-2-zhengdejin5@gmail.com>
 <YL5FcivbsIBnVvo0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5FcivbsIBnVvo0@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 07:12:34PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 07, 2021 at 11:39:13PM +0800, Dejin Zheng wrote:
> > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > pci_alloc_irq_vectors(). Introducing this function can simplify
> > the error handling path in many drivers.
> > 
> > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > they are equivalent, and no functional change. It is more explicit
> > that pcim_alloc_irq_vectors() is a device-managed function.
> 
> ...
> 
> > When CONFIG_PCI=n, there is no stub for pci_is_managed(), but
> > pcim_alloc_irq_vectors() will use it, so add one like other similar stubs.
> > Otherwise there can be build errors, as here by kernel test robot
> > reported:
> > include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> > >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
> >     1847 |  if (!pci_is_managed(dev))
> >          |       ^~~~~~~~~~~~~~
> 
> This is rather changelog related material. No need to pollute commit message
> with this.
>
Okey.

> ...
> 
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> It's new functionality. Why this tag is here?
> Use comments (similar location than changelog) to give a credit if you wish.
>
Got it, Thanks!

> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Robert Richter <rric@kernel.org>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > ---
> > v6 -> v7:
> > 	- rebase to PCI next branch
> > 	- add a stub for pci_is_managed() when disable PCI for
> > 	  fix build error in sparc architecture.
> > v5 -> v6:
> > 	- rebase to 5.13-rc4
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
> >  include/linux/pci.h | 25 +++++++++++++++++++++++++
> >  2 files changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 452351025a09..e3b3fc59bd35 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -1989,10 +1989,7 @@ static void pcim_release(struct device *gendev, void *res)
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
> > index c20211e59a57..5783262c4643 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -1730,6 +1730,7 @@ static inline struct pci_dev *pci_get_class(unsigned int class,
> >  
> >  static inline void pci_set_master(struct pci_dev *dev) { }
> >  static inline int pci_enable_device(struct pci_dev *dev) { return -EIO; }
> > +static inline int pci_is_managed(struct pci_dev *pdev) { return 0; }
> >  static inline void pci_disable_device(struct pci_dev *dev) { }
> >  static inline int pcim_enable_device(struct pci_dev *pdev) { return -EIO; }
> >  static inline int pci_assign_resource(struct pci_dev *dev, int i)
> > @@ -1825,6 +1826,30 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
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
> > 2.30.1
> > 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

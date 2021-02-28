Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1D232720B
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Feb 2021 12:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhB1LRA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Feb 2021 06:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhB1LQz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Feb 2021 06:16:55 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88267C06174A;
        Sun, 28 Feb 2021 03:16:15 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id z11so191340plg.10;
        Sun, 28 Feb 2021 03:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lr7+wUtE/UXV3NLdgslp5g7j2zlr5/EKdw5MadZdrJA=;
        b=EcTyzKRQ7NPqSaALlB0z51XoLa7MzONLEpJg4hrE3rie4UEZ9/lSMW8qT/9qXcrqz6
         5VkUMwZe5gLFWil3KfYShnvu8a4ft5m0lLn1p9yHT/xxbSlznpxei89PsBI70D8sVHV+
         OzUfvfWYHI/7idrMg5MEzHEiuaTDAL12zqePPONxU8IWjf3v9P/JrDSjUQWdKuWguc4t
         NTrF+hKrux6Cx5SIYyCsx4OAXVF1g2/kdzfo0WnTma887LEaOXyTTFjFJFC2UsoStxOO
         Dn5Oie/ojUj94Y7cwRaS1IbZY4t+QtwqZDWsmS+96sZxv+KDeP1jMoxiirpYxmTxrhRS
         900Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lr7+wUtE/UXV3NLdgslp5g7j2zlr5/EKdw5MadZdrJA=;
        b=YeNwqx0IMRH1bKKKPaV7XONXsrey8sN3zGY01OduKJMY8NacFBcvBLtMI65s3pg0Mr
         7GZ6getvz2MQsgW8P60aRqY6/UGnIWv4mjllbTeuytsud7aAJnYiMmAqILcm/x9vknfG
         vOV5pNmeGcUNi6gIhXHA+06ZRbwfqMec7MZpMXkdFmUCXr1Zi7nh+ItEV4AKey80IuLh
         +tyJC0ESgTdwpeVcXKTeWrTiw4YwBpyWM7FhHw3hR+zh7p4RL2j9Qwno206Zq6J2OqEp
         2qrR46adTnh3QtDQAYZhqZO5OuOZqPCWSAwe6G6GOl09sfZD4JsLRUOE4MuU1qY8odWp
         iWjQ==
X-Gm-Message-State: AOAM531aHJG3kxmC7lmqqGSfOUHW2fvlzWJj78hytQTMQwRWJtfTNESj
        XZkbZuv0f2sluWL5yE4PU2A=
X-Google-Smtp-Source: ABdhPJwyCFPH2AT/jALaLTk66XeUHLPPAX91wsaHDuppKxR+ChABx/w2JAjXUX6P8JNxQMIEJFWQ5Q==
X-Received: by 2002:a17:90b:515:: with SMTP id r21mr1239989pjz.42.1614510974926;
        Sun, 28 Feb 2021 03:16:14 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id b7sm13470221pgh.37.2021.02.28.03.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 03:16:14 -0800 (PST)
Date:   Sun, 28 Feb 2021 19:16:12 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210228111612.GA1091046@nuc8i5>
References: <20210226155056.1068534-1-zhengdejin5@gmail.com>
 <20210226155056.1068534-2-zhengdejin5@gmail.com>
 <YDkgZoscLyOnc5l6@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDkgZoscLyOnc5l6@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 26, 2021 at 06:23:02PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 26, 2021 at 11:50:53PM +0800, Dejin Zheng wrote:
> > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > pci_alloc_irq_vectors(). Introducing this function can simplify
> > the error handling path in many drivers.
> > 
> > And use pci_free_irq_vectors() to replace some code in pcim_release(),
> > they are equivalent, and no functional change. It is more explicit
> > that pcim_alloc_irq_vectors() is a device-managed function.
> 
> Thanks!
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
Andy, Thanks!

> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
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
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

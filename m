Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F83A31FD60
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 17:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhBSQrq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 11:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhBSQre (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Feb 2021 11:47:34 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACDAC061574;
        Fri, 19 Feb 2021 08:46:54 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id d2so4485972pjs.4;
        Fri, 19 Feb 2021 08:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gyD0O44OuFPHQqdM1wRapc1LcuE15W3160bQsjYFhPI=;
        b=ASvBUnekhY67h1i1Ybkbk48wt4RanRZWV0Lcmwh418bM2g7KLrZYTuhsli69GCqEBT
         EXlwaqpaikOrF+z1bK8IY+Lc7E0bCoshEPfN0f5cqGMngRLRNlrKVfnHzqYZ9FJqvjGz
         ztKVBzbkJuXe4pkXRvi8iPILN68yDEDtMfW8J+SCBAOtui87eiMaraEEE94ANfd251aK
         W809FfZCC7v+SmtufuC6weNGQhDtszS77SP1qRHW4zdAZlni6UPZiCAQ/rs//Cma1b4F
         GLuMCprbabF6GZZ3tgHjQxUpCtkPNYykqKVedGjl+v55qu7JgiQY29rEyenynTzdzksm
         BBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gyD0O44OuFPHQqdM1wRapc1LcuE15W3160bQsjYFhPI=;
        b=R2XoTmT/yMA4E/VbMZB6mZG+klccTJbEA8mBpODBdp/VBFLzW33w1uWEJ4Q/qhRRG8
         QGQL3SPgh2Yj8Bnceu56OGSdESxiw7Ws9Gln55xKYXO28Mwd8Q/HY5XsSJETSZX+la3H
         0k5xLP81OAl91YXW6EETvHKUSU3mdp7CrbxpmoEKCWqrOZNlNrOJ/H95a6ddNGHcXgP7
         6QgC+hjgYihZ6Dc7peyP+w/aCh2klzFm+J8/JMSeYCJyeF6aMjHkeAHs3o+IZnkJD5mP
         T/T+dTgbpJRgAlVNk7ojPwvi6dLJfUThMXb/8HylGxtBw2Znpfh73x6bcfkYRTtoWuL8
         X3Sg==
X-Gm-Message-State: AOAM531/vDo/Kq27/X2j9CL2jv7JFCYEUAV3LBgJcC7cFT3lRVk6CMuc
        wtEuzHEvDgQVNAIgSo2N+jU=
X-Google-Smtp-Source: ABdhPJyRJH/ZakwPj3IEMp53yZ5Z6zpZOZY11vzpn3W+7++rxjyZNd577w7d9F1wgYOTni9PD9hSQA==
X-Received: by 2002:a17:90b:4d06:: with SMTP id mw6mr9672170pjb.24.1613753213724;
        Fri, 19 Feb 2021 08:46:53 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id u31sm9979605pgl.9.2021.02.19.08.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 08:46:52 -0800 (PST)
Date:   Sat, 20 Feb 2021 00:46:49 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Robert Richter <rric@kernel.org>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210219164649.GA814637@nuc8i5>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YC/NxfsQn2RKkrp8@rric.localdomain>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 19, 2021 at 03:40:05PM +0100, Robert Richter wrote:
> On 18.02.21 23:04:55, Dejin Zheng wrote:
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
> > ---
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
> >  drivers/pci/pci.c   | 33 +++++++++++++++++++++++++++++----
> >  include/linux/pci.h |  3 +++
> >  2 files changed, 32 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index b67c4327d307..db799d089c85 100644
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
> > @@ -2054,6 +2051,34 @@ void pcim_pin_device(struct pci_dev *pdev)
> >  }
> >  EXPORT_SYMBOL(pcim_pin_device);
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
> > +int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> > +				unsigned int max_vecs, unsigned int flags)
> > +{
> > +	struct pci_devres *dr;
> > +
> > +	dr = find_pci_dr(dev);
> > +	if (!dr || !dr->enabled)
> > +		return -EINVAL;
> > +
> > +	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> > +}
> > +EXPORT_SYMBOL(pcim_alloc_irq_vectors);
> 
> If it is just about having a pcim-* counterpart why not just an inline
> function like the one below.
>
Robert and Andy,

First of all, thank you very much for your suggestions and help.
I think this is not just a pcim-* counterpart, I may not explain this
place clearly. In addition to calling pci_alloc_irq_vectors(), the
pcim_alloc_irq_vectors() function also checks whether the pci device is
enabled and whether the pci device resource has been managed. If any one
is wrong, it will return failure. Therefore, I think it should be used
as a function. For novices, maybe I understand it incorrectly, so I look
forward to your suggestions.

> > +	dr = find_pci_dr(dev);
static struct pci_devres *find_pci_dr(struct pci_dev *pdev)
{
        if (pci_is_managed(pdev))
                return devres_find(&pdev->dev, pcim_release, NULL, NULL);                                                         
        return NULL;
}
here checks whether the pci device resource has been managed.

> > +	if (!dr || !dr->enabled)
here checks whether the pci device is enabled.

int pcim_enable_device(struct pci_dev *pdev)
{
        struct pci_devres *dr;
        int rc;

        dr = get_pci_dr(pdev);
        if (unlikely(!dr))
                return -ENOMEM;
        if (dr->enabled)
                return 0;

        rc = pci_enable_device(pdev);
        if (!rc) {
                pdev->is_managed = 1;
                dr->enabled = 1;
        }
        return rc;
}

BR,
Dejin

> > +
> >  /*
> >   * pcibios_add_device - provide arch specific hooks when adding device dev
> >   * @dev: the PCI device being added
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 86c799c97b77..d75ba85ddfc5 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -1818,6 +1818,9 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> >  					      NULL);
> >  }
> >  
> > +int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> > +				unsigned int max_vecs, unsigned int flags);
> > +
> 
> static inline int pcim_alloc_irq_vectors(struct pci_dev *dev,
> 	unsigned int min_vecs, unsigned int max_vecs, unsigned int flags)
> {
> 	if (!pci_is_managed(dev, min_vecs, max_vecs, flags))
> 		return -EINVAL;
> 
> 	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> }
> 
> All those stub functions with EXPORT_SYMBOLS etc. could be dropped
> then.
> 
> With some macro magic added a list of functions could easily being
> created that are already managed but just need a pcim* counterpart.
> 
> -Robert
> 
> >  /* Include architecture-dependent settings and functions */
> >  
> >  #include <asm/pci.h>
> > -- 
> > 2.25.0
> > 

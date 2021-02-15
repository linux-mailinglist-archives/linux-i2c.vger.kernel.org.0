Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BFA31C34B
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 21:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhBOUzv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 15:55:51 -0500
Received: from mail-lf1-f52.google.com ([209.85.167.52]:46200 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhBOUzu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 15:55:50 -0500
Received: by mail-lf1-f52.google.com with SMTP id v5so12523407lft.13;
        Mon, 15 Feb 2021 12:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=whwMqTlS1WBk9AS5zpBCAK3G8DSK1CxTvfiZRNL1dTI=;
        b=k1HeO8dLyXkPikOGp8cuKd5IS2IQX6E9lpvA99tqqGcZI26e/NiknPZEpmHeaB+N0r
         NWuk01l+XRvYH/KSpbXYF6jMb5uqnvAUuxUn/aZM3Tc+xdZoIZbfS+TTFMxp/1FU9YJm
         TLz3iYmAhwbx2o6u98f4Ul837tTvSmbRphjsVgLhVuGhabhFoErEp6ZqUkhx7FSM83VK
         6GIhc1T0klpnQql9jV+KlXNTFQS05nJkmPyWzH5f1e+l10B17/TL11/k7h4On50EpyEv
         wcBzAsXblRAE0JWNsLuNIxL38SWdq9qIKtntBkofjV+VKXCTyKJyYIli6sjruynuZ6nu
         x72Q==
X-Gm-Message-State: AOAM530EeIQ5bZFVFHXtK5xwECuIgHFGbrYUxTmWs3bD6CgxKLLMVYhU
        ryMNU4xcS8eJriLr8Gja2CE=
X-Google-Smtp-Source: ABdhPJzl4f8o29TEkIis3q7JbqLJp6lJCJmwVeq0HyGGLbB9OVwiNeC/gqum50UkbyjMTg9eFj74uw==
X-Received: by 2002:a19:6b17:: with SMTP id d23mr2984143lfa.103.1613422507756;
        Mon, 15 Feb 2021 12:55:07 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id d4sm2898773lfi.117.2021.02.15.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 12:55:07 -0800 (PST)
Date:   Mon, 15 Feb 2021 21:55:06 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YCrfqungNSSxe5lK@rocinante>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
 <20210215181550.714101-2-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210215181550.714101-2-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dejin,

Thank you for all the work here!

The subject and the commit message could be improved to include a little
more details about why do you want to do it, and what problems does it
aims to solve.

> Introduce pcim_alloc_irq_vectors(), a explicit device-managed version of
> pci_alloc_irq_vectors().

You can probably drop the "explicit" word from the sentence above.
 
> +/**
> + * pcim_alloc_irq_vectors - a device-managed pci_alloc_irq_vectors()
> + *
> + * It depends on calling pcim_enable_device() to make irq resources manageable.
> + */

It would be "IRQ" in the sentence above.  Also see [1] for more details
about how to make a patch ready to be accepted.

Also, this comment looks like it's intended to be compliant with the
kernel-doc format, and if so, then you should describe each argument as
the bare minimum, so that the entire comment would become this function
documentation making it also a little more useful.  See [2] for an
example of how to use kernel-doc.

> +int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> +				unsigned int max_vecs, unsigned int flags)
> +{
> +	struct pci_devres *dr;
> +
> +       /*Ensure that the pcim_enable_device() function has been called*/

The comment above has to be correctly aligned and it's also missing
spaces around the sentence to be properly formatted, see [3].

> +	dr = find_pci_dr(dev);
> +	if (!dr || !dr->enabled)
> +		return -EINVAL;
> +
> +	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> +}

Question: wouldn't you need to call pci_free_irq_vectors() somewhere,
possibly to pcim_release() callback?  Although, I am not sure where the
right place would be.

I am asking, as the documentation (see [4]) suggests that one would have
to release allocated IRQ vectors (relevant exceprt):

>> To automatically use MSI or MSI-X interrupt vectors, use the following
>> function:
>>
>>  int pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>>		unsigned int max_vecs, unsigned int flags);
>>
>> which allocates up to max_vecs interrupt vectors for a PCI device.
>>
>> (...)
>>
>> Any allocated resources should be freed before removing the device using
>> the following function:
>>
>>  void pci_free_irq_vectors(struct pci_dev *dev);

What do you think?

1. https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com/
2. https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html
3. https://www.kernel.org/doc/html/latest/process/coding-style.html
4. https://www.kernel.org/doc/html/latest/PCI/msi-howto.html

Krzysztof

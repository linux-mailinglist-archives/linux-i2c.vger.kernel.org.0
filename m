Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B97D31CFA8
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 18:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhBPRxu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 12:53:50 -0500
Received: from mail-wr1-f52.google.com ([209.85.221.52]:46308 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhBPRxr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 12:53:47 -0500
Received: by mail-wr1-f52.google.com with SMTP id t15so14179932wrx.13;
        Tue, 16 Feb 2021 09:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7hhHvpEu7DYQ/v3259Si6b7b7fdDorTWBHQPYgf+p1g=;
        b=O7sYqKD0lyXl1Z9urDW3W9AJAmgss/tYxxr5NtL27y5VqzkyTNDVhGZGWXzL4ZDOrk
         ZPNWf2BWT2iqMlwa6FfjUjiSkH2V1vBn0xNUkCP2rpO6c+OcZeDA5p3B0I23AKXXDxKk
         srUH//BST2nYcM131+qvUqv4afalzW3P3Qgxjah/Vqjg6AH/m87n0D/+0iE5miIAsl+7
         5FMGjaETwf6h945Snkka6izbu+nXoJad8w8duCnjX65lgM8vQnxtJFEZMtmpWt6qzqKI
         rvoItzbIy/D67POqncgMlvYi6l77ulb417+z6V0m/PFq2m4VrMzTTfoKOjPkUF0FQ6Hv
         W6qQ==
X-Gm-Message-State: AOAM5328ACeQYjbw+eYDtvd8Ld0XgY+DFxYWNpXjlm+Oj+GwyE3+c3Ok
        8Rtd6hbYqgSeg8jBErEJoLP6hR2nwmkMrBAB
X-Google-Smtp-Source: ABdhPJyKRH+/w2TsWmJRABBfaVeAEhmkriZ2GBYNFBuXEAklP1cU/1zK4rwGyaqIlORN8mGDczAh/g==
X-Received: by 2002:a5d:5149:: with SMTP id u9mr22325162wrt.348.1613497984879;
        Tue, 16 Feb 2021 09:53:04 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id n187sm4664269wmf.29.2021.02.16.09.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 09:53:04 -0800 (PST)
Date:   Tue, 16 Feb 2021 18:53:03 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YCwGf6vSsNoVxgPp@rocinante>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <20210216160249.749799-2-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210216160249.749799-2-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dejin,

> Introduce pcim_alloc_irq_vectors(), a device-managed version of
> pci_alloc_irq_vectors(). Introducing this function can simplify
> the error handling path in many drivers.
> 
> And use pci_free_irq_vectors() to replace some code in pcim_release(),
> they are equivalent, and no functional change. It is more explicit
> that pcim_alloc_irq_vectors() is a device-managed function.
[...]

Some suggestions about the commit message as per:

  https://lore.kernel.org/linux-pci/YCwE2cf9X%2FGd6lWy@rocinante/

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
> +int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> +				unsigned int max_vecs, unsigned int flags)
> +{
> +	struct pci_devres *dr;
> +
> +	dr = find_pci_dr(dev);
> +	if (!dr || !dr->enabled)
> +		return -EINVAL;
> +
> +	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> +}
> +EXPORT_SYMBOL(pcim_alloc_irq_vectors);
[...]

Looks good!  Thank you for adding kernel-doc here!  Much appreciated.

Reviewed-by: Krzysztof Wilczyński <kw@linux.com>

Krzysztof

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F16431CF82
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 18:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhBPRqu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 12:46:50 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:38634 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbhBPRqq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 12:46:46 -0500
Received: by mail-lf1-f47.google.com with SMTP id m22so17250915lfg.5;
        Tue, 16 Feb 2021 09:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7KMcXCD/b8icwHFarNkS1sFwXOCJDzvsOL0/W59FEY0=;
        b=osvsS3whHDVdPV6kkd2W6Fqvy1GZCiO7trQhO2N8yaqPdBObE4p4YgAoTasO8AVBk5
         oAhuAc2UGcu0nmIiBKwUvXyTdyS6msD37tcyUAjn2MIg2ZtKIV86SEGVV8UQTS+wgcQL
         zZcIl/N3OU0neIWtNc+bhroMzD04YGUZ3xVQmMiZaJWwQHw5+QIaP1Ov1Pds6kblbipZ
         SR79tkge90BUOMgnUEWDmIiRPJaywxValBln8ZyyoTh6xlAHYr1zFl5bPTqxhqVtlQuK
         nBsM7DCcA5dj3DlKOGAHHPCsB6qz3uFuZFIgosvgxu2iuflz2UglQNBzDHqKnuh8BZGQ
         VEdw==
X-Gm-Message-State: AOAM530r7+8TUiwXy/LTLoMEs2xm5c6I9s3fqfiUkwdyMTUPpQS3RhgN
        K4X6FZvTLadgxg4sOmq25gdga9VbCcYytX35
X-Google-Smtp-Source: ABdhPJz1QN1cmTLZQRKiAHUxEk6a6acGCwDRBNCWaE4UuAYpLjEzV0L3S6+MUOMyl/iPDu+TvQRDlw==
X-Received: by 2002:ac2:4c41:: with SMTP id o1mr13309969lfk.537.1613497563337;
        Tue, 16 Feb 2021 09:46:03 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id x1sm3935751ljh.62.2021.02.16.09.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 09:46:02 -0800 (PST)
Date:   Tue, 16 Feb 2021 18:46:01 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] i2c: designware: Use the correct name of
 device-managed function
Message-ID: <YCwE2cf9X/Gd6lWy@rocinante>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <20210216160249.749799-4-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210216160249.749799-4-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dejin,

Thank you for all the changes, looks good!

You could improve the subject line, as it is very vague - what is the
new function name more correct?  Was the other and/or the previous one
not correct?  Seems like you are correcting a typo of sorts, rather than
introducing a new function in this file.

> Use the new function pcim_alloc_irq_vectors() to allocate IRQ vectors,
> the pcim_alloc_irq_vectors() function, an explicit device-managed
> version of pci_alloc_irq_vectors(). If pcim_enable_device() has been
> called before, then pci_alloc_irq_vectors() is actually
> a device-managed function. It is used here as a device-managed
> function, So replace it with pcim_alloc_irq_vectors().

The commit is good, but it could use some polish, so to speak.

A few suggestions to think about:

  - What are we adding and/or changing, and why
  - Why is using pcim_alloc_irq_vectors(), which is part
    of the managed devices framework, a better alternative
    to the pci_alloc_irq_vectors()
  - And finally why this change allowed us to remove the
    pci_free_irq_vectors()

> At the same time, simplify the error handling path.

The change simplifies the error handling path, how?  A line of two which
explains how it has been achieved might help should someone reads the
commit message in the future.

[...]
>  	if (controller->setup) {
>  		r = controller->setup(pdev, controller);
> -		if (r) {
> -			pci_free_irq_vectors(pdev);
> +		if (r)
>  			return r;
> -		}
>  	}
>  
>  	i2c_dw_adjust_bus_speed(dev);
> @@ -246,10 +244,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  		i2c_dw_acpi_configure(&pdev->dev);
>  
>  	r = i2c_dw_validate_speed(dev);
> -	if (r) {
> -		pci_free_irq_vectors(pdev);
> +	if (r)
>  		return r;
> -	}
>  
>  	i2c_dw_configure(dev);
>  
> @@ -269,10 +265,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  	adap->nr = controller->bus_num;
>  
>  	r = i2c_dw_probe(dev);
> -	if (r) {
> -		pci_free_irq_vectors(pdev);
> +	if (r)
>  		return r;
> -	}
>  
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
>  	pm_runtime_use_autosuspend(&pdev->dev);
> @@ -292,7 +286,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
>  
>  	i2c_del_adapter(&dev->adapter);
>  	devm_free_irq(&pdev->dev, dev->irq, dev);
> -	pci_free_irq_vectors(pdev);

If pcim_release() is called should the pci_driver's probe callback fail,
and I assume that this is precisely the case, then all of the above make
sense in the view of using pcim_alloc_irq_vectors().

Reviewed-by: Krzysztof Wilczyński <kw@linux.com>

Krzysztof

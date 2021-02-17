Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB03231D8A7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Feb 2021 12:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbhBQLni (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Feb 2021 06:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbhBQLnc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Feb 2021 06:43:32 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC11EC06178C;
        Wed, 17 Feb 2021 03:40:18 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id z15so8240628pfc.3;
        Wed, 17 Feb 2021 03:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=645THBJSX2gD2j8qlDKgO7ipMGXMkXchUslhmTUGCSo=;
        b=f7LuYmoiqK+h+c4JOKA5/5O/NUjR1n1RFFecrkqaL5USPvrCHPNree9C6uJu1seq/S
         tHV3xXzOj7boCXHXKyvlYsNQ52f4biaTldoeqQx24X5Z2K7uxJdrybICrBjN736ibs/W
         v7vbddMvG2+WTjILLvmKLzyb5LKeXHrqeESRmc606sIgXu4TORzes+RY+V9H8euym8hR
         x8yhqs6CgBkhhtUgtohQJ0qkklvzRX69yVmTZSqfbTdtpSblSPdMLl0JCE1bc2gYWNrC
         FUMiVuMPyUT7CL56zfFuoQRtFxB0jVvGAK0jEgzAGZ7sbrp/CG9hk0rBfr8196lrQyLj
         l1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=645THBJSX2gD2j8qlDKgO7ipMGXMkXchUslhmTUGCSo=;
        b=qSa9+zqLU3bu0Vpe/1dEaKDtW6QkZtdJaW2kz2cT9kdxkd0ZkGdnIKAhxcrhndXN98
         R9Gyp7x6fc3ZXIlxChDQWh0L4d5bEcnIE0WH9rL5MEd2pCMsMergw7JTeO4JhVxeJO0L
         DeaUu/P9a79xHQ2MJKZD6HaqLPOZTMGCPpx7lmdBhiDSNOAjHanMqWTeMj4WJ0Ed6/rA
         7r4NUnjIyf0XHcK8XudfQ8oCJ1EoDvCjrGjhK2agwb2iUKGT50w0cMTd5P04wd2TsZWl
         LAOSYrOL9nqR7u2yidWaXRp9AfIkL53AR8BBxwDtFZZI6qKv/9Lm8TJb9t/miFVQv5fP
         CRWg==
X-Gm-Message-State: AOAM530etrAeXYMy0D1dIVPQQSc+dZ7MxSD6cpicQ0r+8U0JkJaiVd8c
        MmWb595I7twtvgSBaOn1DCo=
X-Google-Smtp-Source: ABdhPJzMUXObPeYAJTsYVaU5Q5UdOBH3zomQSroHpD5o3nnkv4SvHp+sL9tHYOW1Afc88wB25YlwrQ==
X-Received: by 2002:a05:6a00:787:b029:1da:643b:6d41 with SMTP id g7-20020a056a000787b02901da643b6d41mr24735094pfu.31.1613562017723;
        Wed, 17 Feb 2021 03:40:17 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id c18sm2255853pgm.88.2021.02.17.03.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:40:17 -0800 (PST)
Date:   Wed, 17 Feb 2021 19:40:14 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] i2c: designware: Use the correct name of
 device-managed function
Message-ID: <20210217114014.GB766103@nuc8i5>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <20210216160249.749799-4-zhengdejin5@gmail.com>
 <YCwE2cf9X/Gd6lWy@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YCwE2cf9X/Gd6lWy@rocinante>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 16, 2021 at 06:46:01PM +0100, Krzysztof Wilczyński wrote:
Hi Krzysztof,
> Hi Dejin,
> 
> Thank you for all the changes, looks good!
> 
> You could improve the subject line, as it is very vague - what is the
> new function name more correct?  Was the other and/or the previous one
> not correct?  Seems like you are correcting a typo of sorts, rather than
> introducing a new function in this file.
>
If you have read the following commit comments, As you know, the
pci_alloc_irq_vectors() is not a real device-managed function. But
in some specific cases, it will act as an device-managed function.
Such naming will cause controversy, So In the case of need device-managed,
should be used pcim_alloc_irq_vectors(), an explicit device-managed
function. So the subject name is "Use the correct name of device-managed function".

> > Use the new function pcim_alloc_irq_vectors() to allocate IRQ vectors,
> > the pcim_alloc_irq_vectors() function, an explicit device-managed
> > version of pci_alloc_irq_vectors(). If pcim_enable_device() has been
> > called before, then pci_alloc_irq_vectors() is actually
> > a device-managed function. It is used here as a device-managed
> > function, So replace it with pcim_alloc_irq_vectors().
> 
> The commit is good, but it could use some polish, so to speak.
> 
> A few suggestions to think about:
> 
>   - What are we adding and/or changing, and why
>   - Why is using pcim_alloc_irq_vectors(), which is part
>     of the managed devices framework, a better alternative
>     to the pci_alloc_irq_vectors()
>   - And finally why this change allowed us to remove the
>     pci_free_irq_vectors()
> 
These are all explained by the device-managed function mechanism.

> > At the same time, simplify the error handling path.
> 
> The change simplifies the error handling path, how?  A line of two which
> explains how it has been achieved might help should someone reads the
> commit message in the future.
> 
To put it simply, if the driver probe fail, the device-managed function
mechanism will automatically call pcim_release(), then the pci_free_irq_vectors()
will be executed. For details, please see the relevant code.

> [...]
> >  	if (controller->setup) {
> >  		r = controller->setup(pdev, controller);
> > -		if (r) {
> > -			pci_free_irq_vectors(pdev);
> > +		if (r)
> >  			return r;
> > -		}
> >  	}
> >  
> >  	i2c_dw_adjust_bus_speed(dev);
> > @@ -246,10 +244,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
> >  		i2c_dw_acpi_configure(&pdev->dev);
> >  
> >  	r = i2c_dw_validate_speed(dev);
> > -	if (r) {
> > -		pci_free_irq_vectors(pdev);
> > +	if (r)
> >  		return r;
> > -	}
> >  
> >  	i2c_dw_configure(dev);
> >  
> > @@ -269,10 +265,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
> >  	adap->nr = controller->bus_num;
> >  
> >  	r = i2c_dw_probe(dev);
> > -	if (r) {
> > -		pci_free_irq_vectors(pdev);
> > +	if (r)
> >  		return r;
> > -	}
> >  
> >  	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
> >  	pm_runtime_use_autosuspend(&pdev->dev);
> > @@ -292,7 +286,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
> >  
> >  	i2c_del_adapter(&dev->adapter);
> >  	devm_free_irq(&pdev->dev, dev->irq, dev);
> > -	pci_free_irq_vectors(pdev);
> 
> If pcim_release() is called should the pci_driver's probe callback fail,
Yes, you guessed right.

> and I assume that this is precisely the case, then all of the above make
> sense in the view of using pcim_alloc_irq_vectors().
> 
> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> 
> Krzysztof

BR,
Dejin

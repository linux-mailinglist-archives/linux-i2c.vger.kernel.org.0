Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA1B2AEF0C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Nov 2020 11:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgKKK53 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Nov 2020 05:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgKKK52 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Nov 2020 05:57:28 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24C9C0613D1;
        Wed, 11 Nov 2020 02:57:28 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id f12so524335pjp.4;
        Wed, 11 Nov 2020 02:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Am7vF03M3y7nZWhSx5oc2uWbFc0LDWaXtZFle9eRs8=;
        b=C+xKOoyxAz5GjK3Rf4UzrNHirPH+2MrY7rzjV05ZEdn21y4VBaFilCaUbqUtqj4LJx
         f/Cf7GpSUUk3P7pC/pfXQHC19ro+nkqFGuGSZnOQ/u4OaUzQpB0b/TzpqpfmaQWyDhII
         MLabBrSE6Qx241lHyxhFLYEKs5BmOSfm/ToIfeK3hPWgvShWMJY38H+cQjwTEdEI1cYD
         ilyb5rCSbAHd6XikT+x9MdH50c5/FDW9p41ZoUUn/MAb+U3abkVhaM5LBn0mdULDqwQp
         dJfWJ9cr6i/46q/T0f9+n5xsrIpXhZq8w9ZH3hwO7uB/SLLeWdMhXo1fwmHDOdhTDSo5
         Bn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Am7vF03M3y7nZWhSx5oc2uWbFc0LDWaXtZFle9eRs8=;
        b=rIoN5ffqfV9O7BcX0xYKWLkwUa8EJrEvWKuZuVhQkLAyC47IjcLl/sYzYm7/hUyIaR
         7NL3x3mBZwjIhxqo7CEkoeNnZr+3h+pCuOpXw69t4cVmpX2eRCuae5/LxisYMKLeLE8U
         SoTvzuiWyy7lzBr+w9H9YfiCesXpjtfzD/a0Xr7iHUAKOJgvT8YxLX/rmGG+KwPJ8leQ
         FMgRR9UFzMC8AZSHlx78jjf9u7qUJAc5Nx632kGHa6qGdzd50DgtYW92racMSY4OkGlE
         9i36miX1S01PrABx0GFoz/qTs9QTjm0Nudo/JDD0ClmtNkWDYhUdimfvYklRJfGLZsA9
         HHlg==
X-Gm-Message-State: AOAM5303MgcwkSz+aZwtFB2qXkkUuJ0HFQt5xu2SpHGDQSTRdgO92nrg
        UkP+w7ndHsF7PQ3uRS2xC+k=
X-Google-Smtp-Source: ABdhPJwyc4vJvvMcDMXCe69l7ZZqkonGl8+87q5v0vl2ApQT+zK3Li1ebVOaMc5AgV+4CvcBly7etw==
X-Received: by 2002:a17:90a:5508:: with SMTP id b8mr3331730pji.85.1605092248166;
        Wed, 11 Nov 2020 02:57:28 -0800 (PST)
Received: from gmail.com ([223.179.149.110])
        by smtp.gmail.com with ESMTPSA id y23sm2228745pje.41.2020.11.11.02.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 02:57:27 -0800 (PST)
Date:   Wed, 11 Nov 2020 16:24:58 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Ajay Gupta <ajayg@nvidia.com>, Bjorn Helgaas <helgaas@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v1] i2c: nvidia-gpu: drop empty stub for runtime pm
Message-ID: <X6vDAttVkugjceaX@gmail.com>
References: <20201107082151.58239-1-vaibhavgupta40@gmail.com>
 <20201107090442.GA107675@gmail.com>
 <6989eb51-a36c-6e43-86f3-9b02ab490d95@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6989eb51-a36c-6e43-86f3-9b02ab490d95@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 10, 2020 at 02:33:43PM +0200, Jarkko Nikula wrote:
> On 11/7/20 11:04 AM, Vaibhav Gupta wrote:
> > On Sat, Nov 07, 2020 at 01:51:51PM +0530, Vaibhav Gupta wrote:
> > > After the commit c5eb1190074c ("PCI / PM: Allow runtime PM without callback
> > > functions") we no more need empty stubs for runtime-pm to work.
> > > 
> > > The driver has no device specific task(s) for .suspend() . The stub was
> > > placed just for runtime-pm, which can be dropped now.
> > > 
> > > Reported-by: Bjorn Helgaas <bhelgaas@google.com>
> > > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > > ---
> > >   drivers/i2c/busses/i2c-nvidia-gpu.c | 10 +---------
> > >   1 file changed, 1 insertion(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> > > index f9a69b109e5c..6b20601ffb13 100644
> > > --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> > > +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> > > @@ -353,15 +353,7 @@ static void gpu_i2c_remove(struct pci_dev *pdev)
> > >   	pci_free_irq_vectors(pdev);
> > >   }
> > > -/*
> > > - * We need gpu_i2c_suspend() even if it is stub, for runtime pm to work
> > > - * correctly. Without it, lspci shows runtime pm status as "D0" for the card.
> > > - * Documentation/power/pci.rst also insists for driver to provide this.
> > > - */
> > > -static __maybe_unused int gpu_i2c_suspend(struct device *dev)
> > > -{
> > > -	return 0;
> > > -}
> > > +#define gpu_i2c_suspend NULL
> Perhaps we can put NULL directly into UNIVERSAL_DEV_PM_OPS() for the suspend
> callback?
> 
Yes. I have noticed that the approach for this is random. Many drivers pass
NULL directly to the dev_pm_ops type variable, and rest of them use a macro.

I used it for symmetry. I mean there is 'gpu_i2c_resume', so although a macro,
I have put a 'gpu_i2c_suspend'.

Although it won't make any significant change, but if required, I can send
another patch where NULL is passed into UNIVERSAL_DEV_PM_OPS() instead.
> > >   static __maybe_unused int gpu_i2c_resume(struct device *dev)
> > >   {
> > > -- 
> > > 2.28.0
> > > 
> > The patch is only compile-tested.
> > 
> It should work also system suspend point of view. This patch affects also it
> since callbacks are set with the UNIVERSAL_DEV_PM_OPS(). Means the same
> callback is used for runtime PM and system suspend.
> 
> I quickly debugged this with an another driver and PCI stack does put the
> device into D3 state in system suspend from pci_prepare_to_sleep() if the
> suspend callback is not set and device was on prior it.
> 
> Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>


Thanks for debugging. Theoretically too, according to generic framework, drivers
are supposed to do only device specific jobs. If there is none, or callback is
set as NULL, remaining work to put the device in lower power state is PCI
stack's task.

--Vaibhav

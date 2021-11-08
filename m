Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7DF449E4D
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 22:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238219AbhKHVjq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 16:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238157AbhKHVjp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 16:39:45 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DE0C061714
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 13:37:00 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id bl27so27042407oib.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 13:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=swiecki.net; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IsLQjaQdlMGXIqecV4wPF8ML0lgecFSezbvs+txi9VE=;
        b=dO/8dgSkwsbaWeZhkST1HoJnZWRSi9WmJh6Z+KGnOn/I5nSUwEdWTYmTuxCFpoL0ms
         QXtz+2H8zmEf/z8pvOeYPDdyaAxvAganwCNlM7m6EOfImqGW9PSSYCfU1pt7DRoFDDXA
         MTmEbkAfnMFwS5N3tZ/HnExYQtnOEtpv8bknU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IsLQjaQdlMGXIqecV4wPF8ML0lgecFSezbvs+txi9VE=;
        b=WDB/HC0zrpG+uOGfI67aYcNvAPU0QXK+XvArY5/RW8daf9W2Tkki8DjVMF14K3A+Km
         jShM/fRA1FGAfc4Cq7iQccjiIXaSWnqmeA082b0mZ5OEjJro/g+T8BHhzGs7U6XtmvmI
         aDqyfdO0fLRhI8h/3It8dxCTybHVCebXjuK8coxhsaF3Vy+tc4bVg6FuNKsNtDks/WPI
         gHaj6+ssRj5L843C9nR0IP0hNFQDqz4vBuiVbin6cM4ohzAbPe3W3P5Ms+wSOzpYtwTF
         rZ2YrUt5lYli6z+hYUaZb0m+ufCfgT+bynJfMfqducuaHMnzJsvxostSp0/mKg/s5n7P
         KsZw==
X-Gm-Message-State: AOAM533iIjKwq7Qat3cFjRkF/gXNTltZ+8FloerpZSnP7iiMDY/SsfIV
        jvEFNZzh7KwgQUq1orEXCj5cRCxvFo16IzEJ0YCtIg==
X-Google-Smtp-Source: ABdhPJxdmLSrnfD8gVnnutOGCvmzv2yNsvvaDMK3Mj2LQK2LTxpzAtdqhn4xDaUdcEVCmY4+jYIJjvEhNWnCKQH/g0Q=
X-Received: by 2002:a54:4e98:: with SMTP id c24mr1286748oiy.144.1636407419924;
 Mon, 08 Nov 2021 13:36:59 -0800 (PST)
MIME-Version: 1.0
References: <CAP145phj7jEy6tkdFMdW-rzPprMTUckaaSrtrVysE-u+S+=Lcg@mail.gmail.com>
 <20211108185823.GA1101310@bhelgaas> <20211108212226.253mwl4wp7xjckqz@pengutronix.de>
In-Reply-To: <20211108212226.253mwl4wp7xjckqz@pengutronix.de>
From:   =?UTF-8?B?Um9iZXJ0IMWad2nEmWNraQ==?= <robert@swiecki.net>
Date:   Mon, 8 Nov 2021 22:36:49 +0100
Message-ID: <CAP145phFHh+pMTXbdwwQK6bgxLBcF2JgQKwz2L+2vJRs2dMiVg@mail.gmail.com>
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, linux-i2c@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

> > Here's the call tree:
> >
> >     really_probe
> >       dev->driver = drv;                       # <--
> >       call_driver_probe
> >         dev->bus->probe
> >           pci_device_probe
> >             __pci_device_probe
> >               pci_call_probe
> >                 local_pci_probe
> >                   pm_runtime_get_sync
> >                     ...
> >                     pci_pm_runtime_resume
> >   -                   if (!pci_dev->driver)    # 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of pci_dev->driver")
> >   +                   if (!to_pci_driver(dev->driver))
> >                         return 0
> >                       pm->runtime_resume
> >                         i2c_dw_pci_resume
> >                           i_dev->init()        # <-- NULL ptr deref
> >   -                 pci_dev->driver = pci_drv  # b5f9c644eb1b ("PCI: Remove struct pci_dev->driver")
> >                   pci_drv->probe
> >                     i2c_dw_pci_probe
>
> I think this analysis is right.
>
> I didn't test this patch, @Robert, maybe you can do this?
>
> Best regards
> Uwe
>
>  drivers/pci/pci-driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 1d98c974381c..202533654012 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -1299,7 +1299,7 @@ static int pci_pm_runtime_resume(struct device *dev)
>          */
>         pci_restore_standard_config(pci_dev);
>
> -       if (!to_pci_driver(dev->driver))
> +       if (!device_is_bound(dev))
>                 return 0;
>
>         pci_fixup_device(pci_fixup_resume_early, pci_dev);

Yes, that fixes it. Thanks for the patch.

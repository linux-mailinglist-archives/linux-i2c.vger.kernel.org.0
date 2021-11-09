Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6AD44B2E2
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 19:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242765AbhKISzG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 9 Nov 2021 13:55:06 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:45829 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242769AbhKISzF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 13:55:05 -0500
Received: by mail-oi1-f177.google.com with SMTP id u2so351125oiu.12;
        Tue, 09 Nov 2021 10:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bFenRzuO5dINHJKhrBAdIcXc5IDUu3Mc99we7/TSBKc=;
        b=yP5FigzMPITjqF6cDkesqwyqRMADf4Mt3Cb+77VngOiqOdq6Jx3akb/eSofujhL2Tb
         WmW/hrmeg3eHNKqL1oYElqzkKrZXqKr9mxOmr5vVMxygCCV7sZU5hDkpHIfovOtSq5wn
         KIGorEjGBRqegH35l0AONt6Q/T+lBZoLRpxDivnw87MMY3vOyfUVybAuhQSP5BhXeRlt
         MQvtMXDnymL6+yJHjVozU3QuZrkKMLKs5ibfxcF0OyLMTlqCQgisl589mk63nMt4bQ7F
         vyCny7PvEmlOyR1rvUiPnS+p3I+EBiLLO6vAzuK7hY8Yj3A5+p5oUw1bI4VK0rf5dN8b
         i48g==
X-Gm-Message-State: AOAM531+CFei7TjYZ8PQngtFCCMaDwmzbb+1TJ9+SKJMZ9B9i59cQgZK
        Lp79yAT0+Vbn4SXwulePCCYP7MqkOTDn5n4YQF0=
X-Google-Smtp-Source: ABdhPJyFrP72JR6TSlNut61lE41q6zdVmiRY8LFT2z6BBX4Q4On4Cd4LZyLmiOXvPDJ1ZdvpK7ZPcmU5Zd+a1nM6vg0=
X-Received: by 2002:a05:6808:14d0:: with SMTP id f16mr7728814oiw.51.1636483939099;
 Tue, 09 Nov 2021 10:52:19 -0800 (PST)
MIME-Version: 1.0
References: <CAJZ5v0hEKO-RFBzkBU+orcM68shODd-qjiuxaYGxhvh2b=NDXA@mail.gmail.com>
 <20211109181224.GA1162053@bhelgaas>
In-Reply-To: <20211109181224.GA1162053@bhelgaas>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 9 Nov 2021 19:52:08 +0100
Message-ID: <CAJZ5v0izp7462vpmJ+=AarPPLSBLmFea-GvZErobX5Q4Du-oeA@mail.gmail.com>
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        =?UTF-8?B?Um9iZXJ0IMWad2nEmWNraQ==?= <robert@swiecki.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 9, 2021 at 7:12 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, Nov 09, 2021 at 06:18:18PM +0100, Rafael J. Wysocki wrote:
> > On Tue, Nov 9, 2021 at 7:59 AM Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Mon, Nov 08, 2021 at 08:56:19PM -0600, Bjorn Helgaas wrote:
> > > > [+cc Greg: new device_is_bound() use]
> > >
> > > ack, that's what I would have suggested now, too.
> > >
> > > > On Mon, Nov 08, 2021 at 10:22:26PM +0100, Uwe Kleine-König wrote:
> > > > > pci_pm_runtime_resume() exits early when the device to resume isn't
> > > > > bound yet:
> > > > >
> > > > >     if (!to_pci_driver(dev->driver))
> > > > >             return 0;
> > > > >
> > > > > This however isn't true when the device currently probes and
> > > > > local_pci_probe() calls pm_runtime_get_sync() because then the driver
> > > > > core already setup dev->driver. As a result the driver's resume callback
> > > > > is called before the driver's probe function is called and so more often
> > > > > than not required driver data isn't setup yet.
> > > > >
> > > > > So replace the check for the device being unbound by a check that only
> > > > > becomes true after .probe() succeeded.
> > > >
> > > > I like the fact that this patch is short and simple.
> > > >
> > > > But there are 30+ users of to_pci_driver().  This patch asserts that
> > > > *one* of them, pci_pm_runtime_resume(), is special and needs to test
> > > > device_is_bound() instead of using to_pci_driver().
> > >
> > > Maybe for the other locations using device_is_bound(&pdev->dev) instead
> > > of to_pci_driver(pdev) != NULL would be nice, too?
> > >
> > > I have another doubt: device_is_bound() should (according to its
> > > kernel-doc) be called with the device lock held. For the call stack that
> > > is (maybe) fixed here, the lock is held (by __device_attach). We
> > > probably should check if the lock is also held for the other calls of
> > > pci_pm_runtime_resume().
> > >
> > > Hmm, the device lock is a mutex, the pm functions might be called in
> > > atomic context, right?
> > >
> > > > It's special because the current PM implementation calls it via
> > > > pm_runtime_get_sync() before the driver's .probe() method.  That
> > > > connection is a little bit obscure and fragile.  What if the PM
> > > > implementation changes?
> > >
> > > Maybe a saver bet would be to not use pm_runtime_get_sync() in
> > > local_pci_probe()?
> >
> > Yes, in principle it might be replaced with pm_runtime_get_noresume().
> >
> > In theory, that may be problematic if a device is put into a low-power
> > state on remove and then the driver is bound again to it.
> >
> > > I wonder if the same problem exists on remove, i.e. pci_device_remove()
> > > calls pm_runtime_put_sync() after the driver's .remove() callback was
> > > called.
> >
> > If it is called after ->remove() and before clearing the device's
> > driver pointer, then yes.
>
> Yes, that is the case:
>
>   pci_device_remove
>     if (drv->remove) {
>       pm_runtime_get_sync
>       drv->remove()                # <-- driver ->remove() method
>       pm_runtime_put_noidle
>     }
>     ...
>     pm_runtime_put_sync            # <-- after ->remove()
>
> So pm_runtime_put_sync() is called after drv->remove(), and it may
> call drv->pm->runtime_idle().  I think the driver may not expect this.
>
> > If this is turned into pm_runtime_put_noidle(), all should work.
>
> pci_device_remove() already calls pm_runtime_put_noidle() immediately
> after calling the driver ->remove() method.
>
> Are you saying we should do this, which means pci_device_remove()
> would call pm_runtime_put_noidle() twice?

Well, they are both needed to keep the PM-runtime reference counting in balance.

This still has an issue, though, because user space would be able to
trigger a runtime suspend via sysfs after we've dropped the last
reference to the device in pci_device_remove().

So instead, we can drop the pm_runtime_get_sync() and
pm_runtime_put_sync() from local_pci_probe() and pci_device_remove(),
respectively, and add pm_runtine_get_noresume() to pci_pm_init(),
which will prevent PM-runtime from touching the device until it has a
driver that supports PM-runtime.

We'll lose the theoretical ability to put unbound devices into D3 this
way, but we learned some time ago that this isn't safe in all cases
anyway.

> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 1d98c974381c..79c1a920fdc8 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -318,7 +318,7 @@ static long local_pci_probe(void *_ddi)
>          * count, in its probe routine and pm_runtime_get_noresume() in
>          * its remove routine.
>          */
> -       pm_runtime_get_sync(dev);
> +       pm_runtime_get_noresume(dev);
>         rc = pci_drv->probe(pci_dev, ddi->id);
>         if (!rc)
>                 return rc;
> @@ -465,7 +465,7 @@ static void pci_device_remove(struct device *dev)
>         pci_iov_remove(pci_dev);
>
>         /* Undo the runtime PM settings in local_pci_probe() */
> -       pm_runtime_put_sync(dev);
> +       pm_runtime_put_noidle(dev);
>
>         /*
>          * If the device is still on, set the power state as "unknown",

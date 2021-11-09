Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A48344B2F4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 19:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242863AbhKITBp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 9 Nov 2021 14:01:45 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:42873 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241264AbhKITBp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 14:01:45 -0500
Received: by mail-oi1-f180.google.com with SMTP id n66so414199oia.9;
        Tue, 09 Nov 2021 10:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=frb7kS8HmXREiQdmx+yFRxmThz8AvACPqHesIv7E4Aw=;
        b=HL9Gd3EmJ9yRdJXJyRPu8b3nFycRTi089ZvELx+Xz/kBC5U3LmS6wMnwjpTojl1uww
         uDGACGA5xfeA1H69iWZA2lPrgOevho2vn3tkJz0g2POY1cJ7qfs3EPvD/KWDyy4nB7fc
         K+G75syvsTmY3kjoFMGfD/L3l6NwDOWyjIv6DfbqX5c9X5rhHVabul3qkinaA3PNnuxm
         SVxbkwcnhRVvSAhXJPAme5B8y78AtZhFe63Uz/As7RqJujS9M8HbmZZZPfptHjRLEQL6
         mv2DmQ5QTRGrJ+eXedaHm1yBdWMjRnY4K0w2nKTsOc/rolNTEnBDSoMxNQm31jpIePZN
         vM7w==
X-Gm-Message-State: AOAM533/vEeJ4LpHPz1uyXc1JkO1euRespRerQmuqTNBkWQ80KVmO9MM
        0sKieIk8vzC+wUN/WJJSvGLI4DzoOjA10J2CScA=
X-Google-Smtp-Source: ABdhPJx0yeUlgvW7kMf3D7/x3OAW0ra7EScODfw2UX1sWCUwQ9cYC8Dzkwe/tzfmDaNxW1pGZ+S11DpETWLE0kTIeiE=
X-Received: by 2002:a05:6808:e90:: with SMTP id k16mr7765017oil.166.1636484338712;
 Tue, 09 Nov 2021 10:58:58 -0800 (PST)
MIME-Version: 1.0
References: <CAJZ5v0hEKO-RFBzkBU+orcM68shODd-qjiuxaYGxhvh2b=NDXA@mail.gmail.com>
 <20211109181224.GA1162053@bhelgaas> <CAJZ5v0izp7462vpmJ+=AarPPLSBLmFea-GvZErobX5Q4Du-oeA@mail.gmail.com>
In-Reply-To: <CAJZ5v0izp7462vpmJ+=AarPPLSBLmFea-GvZErobX5Q4Du-oeA@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 9 Nov 2021 19:58:47 +0100
Message-ID: <CAJZ5v0impb8uscbp8LUTBMExfMoGz=cPrTWhSGh0GF_SANNKPQ@mail.gmail.com>
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

On Tue, Nov 9, 2021 at 7:52 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Tue, Nov 9, 2021 at 7:12 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Tue, Nov 09, 2021 at 06:18:18PM +0100, Rafael J. Wysocki wrote:
> > > On Tue, Nov 9, 2021 at 7:59 AM Uwe Kleine-König
> > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > On Mon, Nov 08, 2021 at 08:56:19PM -0600, Bjorn Helgaas wrote:
> > > > > [+cc Greg: new device_is_bound() use]
> > > >
> > > > ack, that's what I would have suggested now, too.
> > > >
> > > > > On Mon, Nov 08, 2021 at 10:22:26PM +0100, Uwe Kleine-König wrote:
> > > > > > pci_pm_runtime_resume() exits early when the device to resume isn't
> > > > > > bound yet:
> > > > > >
> > > > > >     if (!to_pci_driver(dev->driver))
> > > > > >             return 0;
> > > > > >
> > > > > > This however isn't true when the device currently probes and
> > > > > > local_pci_probe() calls pm_runtime_get_sync() because then the driver
> > > > > > core already setup dev->driver. As a result the driver's resume callback
> > > > > > is called before the driver's probe function is called and so more often
> > > > > > than not required driver data isn't setup yet.
> > > > > >
> > > > > > So replace the check for the device being unbound by a check that only
> > > > > > becomes true after .probe() succeeded.
> > > > >
> > > > > I like the fact that this patch is short and simple.
> > > > >
> > > > > But there are 30+ users of to_pci_driver().  This patch asserts that
> > > > > *one* of them, pci_pm_runtime_resume(), is special and needs to test
> > > > > device_is_bound() instead of using to_pci_driver().
> > > >
> > > > Maybe for the other locations using device_is_bound(&pdev->dev) instead
> > > > of to_pci_driver(pdev) != NULL would be nice, too?
> > > >
> > > > I have another doubt: device_is_bound() should (according to its
> > > > kernel-doc) be called with the device lock held. For the call stack that
> > > > is (maybe) fixed here, the lock is held (by __device_attach). We
> > > > probably should check if the lock is also held for the other calls of
> > > > pci_pm_runtime_resume().
> > > >
> > > > Hmm, the device lock is a mutex, the pm functions might be called in
> > > > atomic context, right?
> > > >
> > > > > It's special because the current PM implementation calls it via
> > > > > pm_runtime_get_sync() before the driver's .probe() method.  That
> > > > > connection is a little bit obscure and fragile.  What if the PM
> > > > > implementation changes?
> > > >
> > > > Maybe a saver bet would be to not use pm_runtime_get_sync() in
> > > > local_pci_probe()?
> > >
> > > Yes, in principle it might be replaced with pm_runtime_get_noresume().
> > >
> > > In theory, that may be problematic if a device is put into a low-power
> > > state on remove and then the driver is bound again to it.
> > >
> > > > I wonder if the same problem exists on remove, i.e. pci_device_remove()
> > > > calls pm_runtime_put_sync() after the driver's .remove() callback was
> > > > called.
> > >
> > > If it is called after ->remove() and before clearing the device's
> > > driver pointer, then yes.
> >
> > Yes, that is the case:
> >
> >   pci_device_remove
> >     if (drv->remove) {
> >       pm_runtime_get_sync
> >       drv->remove()                # <-- driver ->remove() method
> >       pm_runtime_put_noidle
> >     }
> >     ...
> >     pm_runtime_put_sync            # <-- after ->remove()
> >
> > So pm_runtime_put_sync() is called after drv->remove(), and it may
> > call drv->pm->runtime_idle().  I think the driver may not expect this.
> >
> > > If this is turned into pm_runtime_put_noidle(), all should work.
> >
> > pci_device_remove() already calls pm_runtime_put_noidle() immediately
> > after calling the driver ->remove() method.
> >
> > Are you saying we should do this, which means pci_device_remove()
> > would call pm_runtime_put_noidle() twice?
>
> Well, they are both needed to keep the PM-runtime reference counting in balance.
>
> This still has an issue, though, because user space would be able to
> trigger a runtime suspend via sysfs after we've dropped the last
> reference to the device in pci_device_remove().
>
> So instead, we can drop the pm_runtime_get_sync() and
> pm_runtime_put_sync() from local_pci_probe() and pci_device_remove(),
> respectively, and add pm_runtine_get_noresume() to pci_pm_init(),
> which will prevent PM-runtime from touching the device until it has a
> driver that supports PM-runtime.
>
> We'll lose the theoretical ability to put unbound devices into D3 this
> way, but we learned some time ago that this isn't safe in all cases
> anyway.

IOW, something like this (untested and most likely white-space-damaged).

---
 drivers/pci/pci-driver.c |   13 -------------
 drivers/pci/pci.c        |    7 +++++++
 2 files changed, 7 insertions(+), 13 deletions(-)

Index: linux-pm/drivers/pci/pci-driver.c
===================================================================
--- linux-pm.orig/drivers/pci/pci-driver.c
+++ linux-pm/drivers/pci/pci-driver.c
@@ -309,16 +309,6 @@ static long local_pci_probe(void *_ddi)
     struct device *dev = &pci_dev->dev;
     int rc;

-    /*
-     * Unbound PCI devices are always put in D0, regardless of
-     * runtime PM status.  During probe, the device is set to
-     * active and the usage count is incremented.  If the driver
-     * supports runtime PM, it should call pm_runtime_put_noidle(),
-     * or any other runtime PM helper function decrementing the usage
-     * count, in its probe routine and pm_runtime_get_noresume() in
-     * its remove routine.
-     */
-    pm_runtime_get_sync(dev);
     pci_dev->driver = pci_drv;
     rc = pci_drv->probe(pci_dev, ddi->id);
     if (!rc)
@@ -470,9 +460,6 @@ static void pci_device_remove(struct dev
         pci_iov_remove(pci_dev);
     }

-    /* Undo the runtime PM settings in local_pci_probe() */
-    pm_runtime_put_sync(dev);
-
     /*
      * If the device is still on, set the power state as "unknown",
      * since it might change by the next time we load the driver.
Index: linux-pm/drivers/pci/pci.c
===================================================================
--- linux-pm.orig/drivers/pci/pci.c
+++ linux-pm/drivers/pci/pci.c
@@ -3048,7 +3048,14 @@ void pci_pm_init(struct pci_dev *dev)
     u16 pmc;

     pm_runtime_forbid(&dev->dev);
+    /*
+     * Unbound PCI devices are always put in D0.  If the driver supports
+     * runtime PM, it should call pm_runtime_put_noidle(), or any other
+     * runtime PM helper function decrementing the usage count, in its
+     * probe routine and pm_runtime_get_noresume() in its remove routine.
+     */
     pm_runtime_set_active(&dev->dev);
+    pm_runtime_get_noresume(&dev->dev);
     pm_runtime_enable(&dev->dev);
     device_enable_async_suspend(&dev->dev);
     dev->wakeup_prepared = false;

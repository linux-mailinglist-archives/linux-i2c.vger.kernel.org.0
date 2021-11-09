Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9B044B3B1
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 21:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244131AbhKIUIG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 15:08:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:39012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244130AbhKIUIG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Nov 2021 15:08:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E332461057;
        Tue,  9 Nov 2021 20:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636488320;
        bh=pAYP5FsfQrBCb1kV+iD+1m630Cp0TkRt5IHiAykV0/I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=DWdHh7mPShwm0JICakWt13I1cDfFoxveS1bjg+BF/4rAKVtk9zKEQ/XGkPYBzzr6g
         heqCNVM7Zxq0s7fZCpQ5ZTCHR7k9CpbXjB9CVosnh1d35ZJy1KIJ3sAPSCN1dhOoDj
         1i68IcAvyVK5MpP0VRCOreAoZZEjoHrhsKPoHFRf+6ab3cewM7ADoZy846v2c054nT
         EgMYVaGaXhJceh5pvBLlU7cHN2owuanFd8gUrGw9pci7JMXzpLjHPn3n8TN/fngWVg
         KOp8rkKfcPJcVPagfjYrYMksMDFz/b+n4yZTsjx6pVKUHzKkFgJABKKkvrUE3E8Mo3
         QqIPioqLJ6Upw==
Date:   Tue, 9 Nov 2021 14:05:18 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
Message-ID: <20211109200518.GA1176309@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0impb8uscbp8LUTBMExfMoGz=cPrTWhSGh0GF_SANNKPQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 09, 2021 at 07:58:47PM +0100, Rafael J. Wysocki wrote:
> On Tue, Nov 9, 2021 at 7:52 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > On Tue, Nov 9, 2021 at 7:12 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Tue, Nov 09, 2021 at 06:18:18PM +0100, Rafael J. Wysocki wrote:
> > > > On Tue, Nov 9, 2021 at 7:59 AM Uwe Kleine-König
> > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > On Mon, Nov 08, 2021 at 08:56:19PM -0600, Bjorn Helgaas wrote:
> > > > > > [+cc Greg: new device_is_bound() use]
> > > > >
> > > > > ack, that's what I would have suggested now, too.
> > > > >
> > > > > > On Mon, Nov 08, 2021 at 10:22:26PM +0100, Uwe Kleine-König wrote:
> > > > > > > pci_pm_runtime_resume() exits early when the device to resume isn't
> > > > > > > bound yet:
> > > > > > >
> > > > > > >     if (!to_pci_driver(dev->driver))
> > > > > > >             return 0;
> > > > > > >
> > > > > > > This however isn't true when the device currently probes and
> > > > > > > local_pci_probe() calls pm_runtime_get_sync() because then the driver
> > > > > > > core already setup dev->driver. As a result the driver's resume callback
> > > > > > > is called before the driver's probe function is called and so more often
> > > > > > > than not required driver data isn't setup yet.
> > > > > > >
> > > > > > > So replace the check for the device being unbound by a check that only
> > > > > > > becomes true after .probe() succeeded.
> > > > > >
> > > > > > I like the fact that this patch is short and simple.
> > > > > >
> > > > > > But there are 30+ users of to_pci_driver().  This patch asserts that
> > > > > > *one* of them, pci_pm_runtime_resume(), is special and needs to test
> > > > > > device_is_bound() instead of using to_pci_driver().
> > > > >
> > > > > Maybe for the other locations using device_is_bound(&pdev->dev) instead
> > > > > of to_pci_driver(pdev) != NULL would be nice, too?
> > > > >
> > > > > I have another doubt: device_is_bound() should (according to its
> > > > > kernel-doc) be called with the device lock held. For the call stack that
> > > > > is (maybe) fixed here, the lock is held (by __device_attach). We
> > > > > probably should check if the lock is also held for the other calls of
> > > > > pci_pm_runtime_resume().
> > > > >
> > > > > Hmm, the device lock is a mutex, the pm functions might be called in
> > > > > atomic context, right?
> > > > >
> > > > > > It's special because the current PM implementation calls it via
> > > > > > pm_runtime_get_sync() before the driver's .probe() method.  That
> > > > > > connection is a little bit obscure and fragile.  What if the PM
> > > > > > implementation changes?
> > > > >
> > > > > Maybe a saver bet would be to not use pm_runtime_get_sync() in
> > > > > local_pci_probe()?
> > > >
> > > > Yes, in principle it might be replaced with pm_runtime_get_noresume().
> > > >
> > > > In theory, that may be problematic if a device is put into a low-power
> > > > state on remove and then the driver is bound again to it.
> > > >
> > > > > I wonder if the same problem exists on remove, i.e. pci_device_remove()
> > > > > calls pm_runtime_put_sync() after the driver's .remove() callback was
> > > > > called.
> > > >
> > > > If it is called after ->remove() and before clearing the device's
> > > > driver pointer, then yes.
> > >
> > > Yes, that is the case:
> > >
> > >   pci_device_remove
> > >     if (drv->remove) {
> > >       pm_runtime_get_sync
> > >       drv->remove()                # <-- driver ->remove() method
> > >       pm_runtime_put_noidle
> > >     }
> > >     ...
> > >     pm_runtime_put_sync            # <-- after ->remove()
> > >
> > > So pm_runtime_put_sync() is called after drv->remove(), and it may
> > > call drv->pm->runtime_idle().  I think the driver may not expect this.
> > >
> > > > If this is turned into pm_runtime_put_noidle(), all should work.
> > >
> > > pci_device_remove() already calls pm_runtime_put_noidle() immediately
> > > after calling the driver ->remove() method.
> > >
> > > Are you saying we should do this, which means pci_device_remove()
> > > would call pm_runtime_put_noidle() twice?
> >
> > Well, they are both needed to keep the PM-runtime reference counting in balance.
> >
> > This still has an issue, though, because user space would be able to
> > trigger a runtime suspend via sysfs after we've dropped the last
> > reference to the device in pci_device_remove().
> >
> > So instead, we can drop the pm_runtime_get_sync() and
> > pm_runtime_put_sync() from local_pci_probe() and pci_device_remove(),
> > respectively, and add pm_runtine_get_noresume() to pci_pm_init(),
> > which will prevent PM-runtime from touching the device until it has a
> > driver that supports PM-runtime.
> >
> > We'll lose the theoretical ability to put unbound devices into D3 this
> > way, but we learned some time ago that this isn't safe in all cases
> > anyway.
> 
> IOW, something like this (untested and most likely white-space-damaged).

Thanks!  I applied this manually to for-linus in hopes of making the
the next linux-next build.

Please send any testing reports and corrections to the patch and
commit log!

commit dd414877b58b ("PCI/PM: Prevent runtime PM until claimed by a driver that supports it")
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Tue Nov 9 13:36:09 2021 -0600

    PCI/PM: Prevent runtime PM until claimed by a driver that supports it
    
    Previously we had a path that could call a driver's ->runtime_resume()
    method before calling the driver's ->probe() method, which is a problem
    because ->runtime_resume() often relies on initialization done in
    ->probe():
    
      local_pci_probe
        pm_runtime_get_sync
          ...
            pci_pm_runtime_resume
              if (!pci_dev->driver)
                return 0;                          <-- early exit
              dev->driver->pm->runtime_resume();   <-- driver ->runtime_resume()
        pci_dev->driver = pci_drv;
        pci_drv->probe()                           <-- driver ->probe()
    
    Prior to 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of
    pci_dev->driver"), we took the early exit, which avoided the problem.  But
    2a4d9408c9e8 removed pci_dev->driver (since it's redundant with
    device->driver), so we no longer take the early exit, which leads to havoc
    in ->runtime_resume().
    
    Similarly, we could call the driver's ->runtime_idle() method after its
    ->remove() method.
    
    Avoid the problem by dropping the pm_runtime_get_sync() and
    pm_runtime_put_sync() from local_pci_probe() and pci_device_remove(),
    respectively.
    
    Add pm_runtime_get_noresume(), which uses no driver PM callbacks, to the
    pci_pm_init() enumeration path.  This will prevent PM-runtime from touching
    the device until it has a driver that supports PM-runtime.
    
    Link: https://lore.kernel.org/r/CAJZ5v0impb8uscbp8LUTBMExfMoGz=cPrTWhSGh0GF_SANNKPQ@mail.gmail.com
    Fixes: 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of pci_dev->driver")
    Reported-by: Robert Święcki <robert@swiecki.net>
    Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 1d98c974381c..41cdf510214f 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -309,16 +309,6 @@ static long local_pci_probe(void *_ddi)
 	struct device *dev = &pci_dev->dev;
 	int rc;
 
-	/*
-	 * Unbound PCI devices are always put in D0, regardless of
-	 * runtime PM status.  During probe, the device is set to
-	 * active and the usage count is incremented.  If the driver
-	 * supports runtime PM, it should call pm_runtime_put_noidle(),
-	 * or any other runtime PM helper function decrementing the usage
-	 * count, in its probe routine and pm_runtime_get_noresume() in
-	 * its remove routine.
-	 */
-	pm_runtime_get_sync(dev);
 	rc = pci_drv->probe(pci_dev, ddi->id);
 	if (!rc)
 		return rc;
@@ -464,9 +454,6 @@ static void pci_device_remove(struct device *dev)
 	pcibios_free_irq(pci_dev);
 	pci_iov_remove(pci_dev);
 
-	/* Undo the runtime PM settings in local_pci_probe() */
-	pm_runtime_put_sync(dev);
-
 	/*
 	 * If the device is still on, set the power state as "unknown",
 	 * since it might change by the next time we load the driver.
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b88db815ee01..e9c38b994c73 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3097,7 +3097,15 @@ void pci_pm_init(struct pci_dev *dev)
 	u16 pmc;
 
 	pm_runtime_forbid(&dev->dev);
+
+	/*
+	 * Unbound PCI devices are always put in D0.  If the driver supports
+	 * runtime PM, it should call pm_runtime_put_noidle(), or any other
+	 * runtime PM helper function decrementing the usage count, in its
+	 * probe routine and pm_runtime_get_noresume() in its remove routine.
+	 */
 	pm_runtime_set_active(&dev->dev);
+	pm_runtime_get_noresume(&dev->dev);
 	pm_runtime_enable(&dev->dev);
 	device_enable_async_suspend(&dev->dev);
 	dev->wakeup_prepared = false;

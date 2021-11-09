Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8CEB44B284
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 19:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241893AbhKISPN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 13:15:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:54066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239343AbhKISPM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Nov 2021 13:15:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4ACE66103B;
        Tue,  9 Nov 2021 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636481546;
        bh=qY25I7fjZMOYZn2NSK8mq84doxGOsT1XF+bdhnAcJF0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=BVAhKhtNsLij8UqnA9iWAzdKcQSpglPD7JYYjxjXuYOfdKQDNFR5IRtPTB3Ae9pNC
         vroMCTsaqB9yNdkq4hM5x1ElTVtNNt+AuwYuqA6oToOu514R1oSvHjO1aXvuMvXVtq
         cGDkEcahX759oZMCXhyraOW+m5IEyaYsa7E1KhWfEFrPre6jd/GtsY0UuCgxn8UJKx
         y20ci8ba2qyfPXjArPG/OT99QWchgxACoQnRa0w/fYeS/VGqmUrFUUiZCtlPS98YH+
         r29nCpn7X8Mb4aXTsNeaRONJIVEo4Eb/zrj7yhVGAjWFjprh9H1rZdzFv5S2KnnTL9
         gWzsVj9vL9osA==
Date:   Tue, 9 Nov 2021 12:12:24 -0600
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
Message-ID: <20211109181224.GA1162053@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hEKO-RFBzkBU+orcM68shODd-qjiuxaYGxhvh2b=NDXA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 09, 2021 at 06:18:18PM +0100, Rafael J. Wysocki wrote:
> On Tue, Nov 9, 2021 at 7:59 AM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Mon, Nov 08, 2021 at 08:56:19PM -0600, Bjorn Helgaas wrote:
> > > [+cc Greg: new device_is_bound() use]
> >
> > ack, that's what I would have suggested now, too.
> >
> > > On Mon, Nov 08, 2021 at 10:22:26PM +0100, Uwe Kleine-König wrote:
> > > > pci_pm_runtime_resume() exits early when the device to resume isn't
> > > > bound yet:
> > > >
> > > >     if (!to_pci_driver(dev->driver))
> > > >             return 0;
> > > >
> > > > This however isn't true when the device currently probes and
> > > > local_pci_probe() calls pm_runtime_get_sync() because then the driver
> > > > core already setup dev->driver. As a result the driver's resume callback
> > > > is called before the driver's probe function is called and so more often
> > > > than not required driver data isn't setup yet.
> > > >
> > > > So replace the check for the device being unbound by a check that only
> > > > becomes true after .probe() succeeded.
> > >
> > > I like the fact that this patch is short and simple.
> > >
> > > But there are 30+ users of to_pci_driver().  This patch asserts that
> > > *one* of them, pci_pm_runtime_resume(), is special and needs to test
> > > device_is_bound() instead of using to_pci_driver().
> >
> > Maybe for the other locations using device_is_bound(&pdev->dev) instead
> > of to_pci_driver(pdev) != NULL would be nice, too?
> >
> > I have another doubt: device_is_bound() should (according to its
> > kernel-doc) be called with the device lock held. For the call stack that
> > is (maybe) fixed here, the lock is held (by __device_attach). We
> > probably should check if the lock is also held for the other calls of
> > pci_pm_runtime_resume().
> >
> > Hmm, the device lock is a mutex, the pm functions might be called in
> > atomic context, right?
> >
> > > It's special because the current PM implementation calls it via
> > > pm_runtime_get_sync() before the driver's .probe() method.  That
> > > connection is a little bit obscure and fragile.  What if the PM
> > > implementation changes?
> >
> > Maybe a saver bet would be to not use pm_runtime_get_sync() in
> > local_pci_probe()?
> 
> Yes, in principle it might be replaced with pm_runtime_get_noresume().
> 
> In theory, that may be problematic if a device is put into a low-power
> state on remove and then the driver is bound again to it.
> 
> > I wonder if the same problem exists on remove, i.e. pci_device_remove()
> > calls pm_runtime_put_sync() after the driver's .remove() callback was
> > called.
> 
> If it is called after ->remove() and before clearing the device's
> driver pointer, then yes.

Yes, that is the case:

  pci_device_remove
    if (drv->remove) {
      pm_runtime_get_sync
      drv->remove()                # <-- driver ->remove() method
      pm_runtime_put_noidle
    }
    ...
    pm_runtime_put_sync            # <-- after ->remove()

So pm_runtime_put_sync() is called after drv->remove(), and it may
call drv->pm->runtime_idle().  I think the driver may not expect this.

> If this is turned into pm_runtime_put_noidle(), all should work.

pci_device_remove() already calls pm_runtime_put_noidle() immediately
after calling the driver ->remove() method.

Are you saying we should do this, which means pci_device_remove()
would call pm_runtime_put_noidle() twice?

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 1d98c974381c..79c1a920fdc8 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -318,7 +318,7 @@ static long local_pci_probe(void *_ddi)
 	 * count, in its probe routine and pm_runtime_get_noresume() in
 	 * its remove routine.
 	 */
-	pm_runtime_get_sync(dev);
+	pm_runtime_get_noresume(dev);
 	rc = pci_drv->probe(pci_dev, ddi->id);
 	if (!rc)
 		return rc;
@@ -465,7 +465,7 @@ static void pci_device_remove(struct device *dev)
 	pci_iov_remove(pci_dev);
 
 	/* Undo the runtime PM settings in local_pci_probe() */
-	pm_runtime_put_sync(dev);
+	pm_runtime_put_noidle(dev);
 
 	/*
 	 * If the device is still on, set the power state as "unknown",

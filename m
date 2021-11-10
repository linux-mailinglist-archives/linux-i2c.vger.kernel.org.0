Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8399844C2CC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 15:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhKJOR3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 09:17:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:36682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231607AbhKJOR3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Nov 2021 09:17:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 536C8610CF;
        Wed, 10 Nov 2021 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636553681;
        bh=ULssGWa9GKLPoBBHvT9SZdMTkwJdbGAWdXOkGpY4kkc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=knfAa4ESl4Ws/Ll++SyVhZfck9pYKkVkJUlFPDpi0DzFMPBbj7hxEsIwpXxsjXj55
         kgpxs1ATu1nRh4EYPI4v0MFtJRAp6Kj1sjvAXXj6tipQifxyBxJKri56MsnzIc8SWE
         P0fnTWXqgTO0JCVqLlxyEZejU5tNF1mIsQm4+4sGW8Ab0h5M0IKUlWBaz2EljopmxK
         ha9rBeOeteZt1DC8wDEhHoFaMitgM0c7BirhK3NiKY2ttbXcuCTHQiIfAFvXqX1tbg
         0RQTcZ5iVZK2bUAYuAbCUghnVmk9zjuqTYVSfeVQGh2Tbaq9lSXCZCCglKxsKPOcdG
         hY0rrWvi5u6pg==
Date:   Wed, 10 Nov 2021 08:14:39 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
Message-ID: <20211110141439.GA1240945@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211109200518.GA1176309@bhelgaas>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 09, 2021 at 02:05:18PM -0600, Bjorn Helgaas wrote:
> On Tue, Nov 09, 2021 at 07:58:47PM +0100, Rafael J. Wysocki wrote:
> > On Tue, Nov 9, 2021 at 7:52 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > ...

> > > So instead, we can drop the pm_runtime_get_sync() and
> > > pm_runtime_put_sync() from local_pci_probe() and pci_device_remove(),
> > > respectively, and add pm_runtine_get_noresume() to pci_pm_init(),
> > > which will prevent PM-runtime from touching the device until it has a
> > > driver that supports PM-runtime.
> > >
> > > We'll lose the theoretical ability to put unbound devices into D3 this
> > > way, but we learned some time ago that this isn't safe in all cases
> > > anyway.
> > 
> > IOW, something like this (untested and most likely white-space-damaged).
> 
> Thanks!  I applied this manually to for-linus in hopes of making the
> the next linux-next build.
> 
> Please send any testing reports and corrections to the patch and
> commit log!

Robert, I hate to ask even more of you, but if you have a chance, it
would be very helpful if you could test the patch below.  I'm pretty
sure it should fix the problem you saw, and I hope to ask Linus to
merge it today.

> commit dd414877b58b ("PCI/PM: Prevent runtime PM until claimed by a driver that supports it")
> Author: Bjorn Helgaas <bhelgaas@google.com>
> Date:   Tue Nov 9 13:36:09 2021 -0600
> 
>     PCI/PM: Prevent runtime PM until claimed by a driver that supports it
>     
>     Previously we had a path that could call a driver's ->runtime_resume()
>     method before calling the driver's ->probe() method, which is a problem
>     because ->runtime_resume() often relies on initialization done in
>     ->probe():
>     
>       local_pci_probe
>         pm_runtime_get_sync
>           ...
>             pci_pm_runtime_resume
>               if (!pci_dev->driver)
>                 return 0;                          <-- early exit
>               dev->driver->pm->runtime_resume();   <-- driver ->runtime_resume()
>         pci_dev->driver = pci_drv;
>         pci_drv->probe()                           <-- driver ->probe()
>     
>     Prior to 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of
>     pci_dev->driver"), we took the early exit, which avoided the problem.  But
>     2a4d9408c9e8 removed pci_dev->driver (since it's redundant with
>     device->driver), so we no longer take the early exit, which leads to havoc
>     in ->runtime_resume().
>     
>     Similarly, we could call the driver's ->runtime_idle() method after its
>     ->remove() method.
>     
>     Avoid the problem by dropping the pm_runtime_get_sync() and
>     pm_runtime_put_sync() from local_pci_probe() and pci_device_remove(),
>     respectively.
>     
>     Add pm_runtime_get_noresume(), which uses no driver PM callbacks, to the
>     pci_pm_init() enumeration path.  This will prevent PM-runtime from touching
>     the device until it has a driver that supports PM-runtime.
>     
>     Link: https://lore.kernel.org/r/CAJZ5v0impb8uscbp8LUTBMExfMoGz=cPrTWhSGh0GF_SANNKPQ@mail.gmail.com
>     Fixes: 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of pci_dev->driver")
>     Reported-by: Robert Święcki <robert@swiecki.net>
>     Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 1d98c974381c..41cdf510214f 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -309,16 +309,6 @@ static long local_pci_probe(void *_ddi)
>  	struct device *dev = &pci_dev->dev;
>  	int rc;
>  
> -	/*
> -	 * Unbound PCI devices are always put in D0, regardless of
> -	 * runtime PM status.  During probe, the device is set to
> -	 * active and the usage count is incremented.  If the driver
> -	 * supports runtime PM, it should call pm_runtime_put_noidle(),
> -	 * or any other runtime PM helper function decrementing the usage
> -	 * count, in its probe routine and pm_runtime_get_noresume() in
> -	 * its remove routine.
> -	 */
> -	pm_runtime_get_sync(dev);
>  	rc = pci_drv->probe(pci_dev, ddi->id);
>  	if (!rc)
>  		return rc;
> @@ -464,9 +454,6 @@ static void pci_device_remove(struct device *dev)
>  	pcibios_free_irq(pci_dev);
>  	pci_iov_remove(pci_dev);
>  
> -	/* Undo the runtime PM settings in local_pci_probe() */
> -	pm_runtime_put_sync(dev);
> -
>  	/*
>  	 * If the device is still on, set the power state as "unknown",
>  	 * since it might change by the next time we load the driver.
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index b88db815ee01..e9c38b994c73 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3097,7 +3097,15 @@ void pci_pm_init(struct pci_dev *dev)
>  	u16 pmc;
>  
>  	pm_runtime_forbid(&dev->dev);
> +
> +	/*
> +	 * Unbound PCI devices are always put in D0.  If the driver supports
> +	 * runtime PM, it should call pm_runtime_put_noidle(), or any other
> +	 * runtime PM helper function decrementing the usage count, in its
> +	 * probe routine and pm_runtime_get_noresume() in its remove routine.
> +	 */
>  	pm_runtime_set_active(&dev->dev);
> +	pm_runtime_get_noresume(&dev->dev);
>  	pm_runtime_enable(&dev->dev);
>  	device_enable_async_suspend(&dev->dev);
>  	dev->wakeup_prepared = false;

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332DB44A6FA
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 07:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238378AbhKIGpF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 01:45:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:32808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229591AbhKIGpE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Nov 2021 01:45:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E672660234;
        Tue,  9 Nov 2021 06:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1636440139;
        bh=B1IguEi2bwhHxjOBHleDUZl379REYQJYKiP/fzsjmag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p5J9N3GqT9v/BHqm+jT0fWwRW4bhsapm+tDX5PeGixFPln6G6/dPAP2jgByTNU2N8
         K3ebZ/mnEy0PE/Yd2DAlh5GZIKHGqjIY6fJ+oq+2RtsxVaalciqNiJXVlEtYLMkQzH
         XXRbG/57WQZ3Hh/G1a3gZDhHPbpsMkYcrE14Bl58=
Date:   Tue, 9 Nov 2021 07:42:09 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>,
        linux-i2c@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
Message-ID: <YYoYQbf6SVyNyW4r@kroah.com>
References: <20211108212226.253mwl4wp7xjckqz@pengutronix.de>
 <20211109025619.GA1131403@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211109025619.GA1131403@bhelgaas>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 08, 2021 at 08:56:19PM -0600, Bjorn Helgaas wrote:
> [+cc Greg: new device_is_bound() use]
> 
> On Mon, Nov 08, 2021 at 10:22:26PM +0100, Uwe Kleine-König wrote:
> > pci_pm_runtime_resume() exits early when the device to resume isn't
> > bound yet:
> > 
> > 	if (!to_pci_driver(dev->driver))
> > 		return 0;
> > 
> > This however isn't true when the device currently probes and
> > local_pci_probe() calls pm_runtime_get_sync() because then the driver
> > core already setup dev->driver. As a result the driver's resume callback
> > is called before the driver's probe function is called and so more often
> > than not required driver data isn't setup yet.
> > 
> > So replace the check for the device being unbound by a check that only
> > becomes true after .probe() succeeded.
> 
> I like the fact that this patch is short and simple.
> 
> But there are 30+ users of to_pci_driver().  This patch asserts that
> *one* of them, pci_pm_runtime_resume(), is special and needs to test
> device_is_bound() instead of using to_pci_driver().
> 
> It's special because the current PM implementation calls it via
> pm_runtime_get_sync() before the driver's .probe() method.  That
> connection is a little bit obscure and fragile.  What if the PM
> implementation changes?
> 
> Maybe we just need a comment there about why it looks different than
> the other PM interfaces?
> 
> I also notice that the only other uses of device_is_bound()
> outside the driver core are in iommu_group_store_type() and
> regulator_resolve_supply().  This patch seems like a reasonable use,
> but I always look twice when we do something unique.

I agree that this looks really odd.  No one should care outside of the
driver core to call device_is_bound(), as if a driver is being called,
implicitly you know that the device is bound to that driver.

Why does the PCI core care if a device is bound to a pci driver at this
point in time?

But, this does feel like an odd use of to_pci_driver() here, what needs
to be known here, if a pci driver is in control of a device here or not?

thanks,

greg k-h

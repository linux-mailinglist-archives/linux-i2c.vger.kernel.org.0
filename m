Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB36644B1D8
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 18:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240041AbhKIRVQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 9 Nov 2021 12:21:16 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:37831 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238356AbhKIRVP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 12:21:15 -0500
Received: by mail-oi1-f182.google.com with SMTP id o83so34937095oif.4;
        Tue, 09 Nov 2021 09:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g9XioftQsCKqEN/WNIzKk9RPvl8jzkbkoGIE6GFwjbw=;
        b=NAHK7EPKDknt5TWzMVEEmWAx9UlsU4mA3vSpzR6IX/yiXfpkSDjolnO3VZ17chuhQh
         fMxVFBnC/4eslL0MSWnfR/Oc5xCfSDQSvJaxS6vG0Kj1RgIvk+peAkoSUwUTcWNe4M3r
         SLsyYOxeH+QM2TjbDkj8ojxejCsB1imM3VLp1uIlKqpvDTgPF9a72bsZ6THkLtKiBoH6
         tphTZB5+VkBG9OwJOeQyJGWFDYPIUWwdUmEFDu5x8xnnjr8QiAJDT4N3ADI2WwarT7Ak
         GysH8N0SC42HyMx8EeOtEfbeHkmVj8kIOdzu18jndrzBBJJueL8KZUD797OPQsh3EkOS
         9PEA==
X-Gm-Message-State: AOAM532dCOrc2Dk9EC0SBEOFwutOkgpuCKX4XzI3iZT0Hur6AdIyr+Hs
        hIjlc5wBhmr98vj6v+x9QfD/5gpzMpYhcpg1Syg=
X-Google-Smtp-Source: ABdhPJymUylwak0rXETxr+g8epAkkuTeoCt7Hgm7pZblQn9wOLdt/rowTfArgWm4UjKv4MjV6oS7RJxAsSuiBh+BZQs=
X-Received: by 2002:aca:5c5:: with SMTP id 188mr7225611oif.154.1636478309105;
 Tue, 09 Nov 2021 09:18:29 -0800 (PST)
MIME-Version: 1.0
References: <20211108212226.253mwl4wp7xjckqz@pengutronix.de>
 <20211109025619.GA1131403@bhelgaas> <20211109065927.26v6xn7d5yyuxw4h@pengutronix.de>
In-Reply-To: <20211109065927.26v6xn7d5yyuxw4h@pengutronix.de>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 9 Nov 2021 18:18:18 +0100
Message-ID: <CAJZ5v0hEKO-RFBzkBU+orcM68shODd-qjiuxaYGxhvh2b=NDXA@mail.gmail.com>
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        =?UTF-8?B?Um9iZXJ0IMWad2nEmWNraQ==?= <robert@swiecki.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 9, 2021 at 7:59 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> On Mon, Nov 08, 2021 at 08:56:19PM -0600, Bjorn Helgaas wrote:
> > [+cc Greg: new device_is_bound() use]
>
> ack, that's what I would have suggested now, too.
>
> > On Mon, Nov 08, 2021 at 10:22:26PM +0100, Uwe Kleine-König wrote:
> > > pci_pm_runtime_resume() exits early when the device to resume isn't
> > > bound yet:
> > >
> > >     if (!to_pci_driver(dev->driver))
> > >             return 0;
> > >
> > > This however isn't true when the device currently probes and
> > > local_pci_probe() calls pm_runtime_get_sync() because then the driver
> > > core already setup dev->driver. As a result the driver's resume callback
> > > is called before the driver's probe function is called and so more often
> > > than not required driver data isn't setup yet.
> > >
> > > So replace the check for the device being unbound by a check that only
> > > becomes true after .probe() succeeded.
> >
> > I like the fact that this patch is short and simple.
> >
> > But there are 30+ users of to_pci_driver().  This patch asserts that
> > *one* of them, pci_pm_runtime_resume(), is special and needs to test
> > device_is_bound() instead of using to_pci_driver().
>
> Maybe for the other locations using device_is_bound(&pdev->dev) instead
> of to_pci_driver(pdev) != NULL would be nice, too?
>
> I have another doubt: device_is_bound() should (according to its
> kernel-doc) be called with the device lock held. For the call stack that
> is (maybe) fixed here, the lock is held (by __device_attach). We
> probably should check if the lock is also held for the other calls of
> pci_pm_runtime_resume().
>
> Hmm, the device lock is a mutex, the pm functions might be called in
> atomic context, right?
>
> > It's special because the current PM implementation calls it via
> > pm_runtime_get_sync() before the driver's .probe() method.  That
> > connection is a little bit obscure and fragile.  What if the PM
> > implementation changes?
>
> Maybe a saver bet would be to not use pm_runtime_get_sync() in
> local_pci_probe()?

Yes, in principle it might be replaced with pm_runtime_get_noresume().

In theory, that may be problematic if a device is put into a low-power
state on remove and then the driver is bound again to it.

> I wonder if the same problem exists on remove, i.e. pci_device_remove()
> calls pm_runtime_put_sync() after the driver's .remove() callback was
> called.

If it is called after ->remove() and before clearing the device's
driver pointer, then yes.

If this is turned into pm_runtime_put_noidle(), all should work.

> > Maybe we just need a comment there about why it looks different than
> > the other PM interfaces?
>
> A comment is a good idea for sure.

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22E244C68E
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 18:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbhKJSCU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 13:02:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:36822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230311AbhKJSCT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Nov 2021 13:02:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7FAA61159;
        Wed, 10 Nov 2021 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636567172;
        bh=Ofe7eOWNhRiC50gEQfKlr9CMMuFmkI3ju3xfiZYyFrY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=rEP32YbBqIePn8GoT80SgIFr3elQJFDM3gSWJVE1+is3HvHlpnQUw41LBLfsI4h1w
         YCNfyWeIQLvNjmHqJIpAAudhngNYYdxS+Ij2I39rOcjkUujSJtokc0krejrfk8vVTH
         +7XYf0bCe76SRrSjh8BY9EkoZ3CReYy0FnrnidFD4uFpXUt3hD3UwLDNQh1h/92g6x
         /cj84RDYWSoaOrUHhmVqyctQ1UkolBiSKrHfi3P49JFTkAxadb+ncQMeoNN1vrjuSl
         /ei/em8Bm1b8hgAeqHKnn/z3ShASG2w0bIZi8uVQulI4LEPHI0Y9FV0XT36JA28W4K
         G9iOBlWvuI4+Q==
Date:   Wed, 10 Nov 2021 11:59:29 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
Message-ID: <20211110175929.GA1245597@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gGZEpj7bJZx9teNJsDfuVA0YW8PGt+q_aEDdGJPDh=bg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 10, 2021 at 05:48:52PM +0100, Rafael J. Wysocki wrote:
> On Wed, Nov 10, 2021 at 5:33 PM Robert Święcki <robert@swiecki.net> wrote:
> > śr., 10 lis 2021 o 15:14 Bjorn Helgaas <helgaas@kernel.org> napisał(a):
> > > On Tue, Nov 09, 2021 at 02:05:18PM -0600, Bjorn Helgaas wrote:
> > > > On Tue, Nov 09, 2021 at 07:58:47PM +0100, Rafael J. Wysocki wrote:
> > > > > On Tue, Nov 9, 2021 at 7:52 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > > > > ...
> > >
> > > > > > So instead, we can drop the pm_runtime_get_sync() and
> > > > > > pm_runtime_put_sync() from local_pci_probe() and pci_device_remove(),
> > > > > > respectively, and add pm_runtine_get_noresume() to pci_pm_init(),
> > > > > > which will prevent PM-runtime from touching the device until it has a
> > > > > > driver that supports PM-runtime.
> > > > > >
> > > > > > We'll lose the theoretical ability to put unbound devices into D3 this
> > > > > > way, but we learned some time ago that this isn't safe in all cases
> > > > > > anyway.
> > > > >
> > > > > IOW, something like this (untested and most likely white-space-damaged).
> > > >
> > > > Thanks!  I applied this manually to for-linus in hopes of making the
> > > > the next linux-next build.
> > > >
> > > > Please send any testing reports and corrections to the patch and
> > > > commit log!
> > >
> > > Robert, I hate to ask even more of you, but if you have a chance, it
> > > would be very helpful if you could test the patch below.  I'm pretty
> > > sure it should fix the problem you saw, and I hope to ask Linus to
> > > merge it today.
> >
> > I think the most recent patch creates some timeouts and other problems
> > in pci-related code? Things I haven't seen before.
> 
> So I honestly think that commit 2a4d9408c9e8 needs to be reverted,
> because it clearly does more than it is supposed to and we need to go
> back to the drawing board and do this again, but correctly.

Yep, I agree, I'll work on that today.

Bjorn

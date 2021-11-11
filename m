Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7192744DAE9
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 18:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233598AbhKKRET (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 12:04:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:36408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233392AbhKKRES (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Nov 2021 12:04:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08DA0611AD;
        Thu, 11 Nov 2021 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636650089;
        bh=7xML4rDgA2TLL7fn3zKQoUH6jqOK2AsU521S4z+lE9k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=Ljwzy+wdnP2MJ6TPaBMpYhvgvEhAGIgohBT8vSKH9BL8jy9do6gFFaZ5tDhChp8eR
         WsaGttsYcDcxAahpBqCHikdKVozZJGEAaLdVe/gVYt5algdCDoz20I/62i1nqU+m5v
         cjFocY/3mTmyRsHQqy68hn0sRta56dW00klr1/6zjTzrs73eXqjBnY38lAmrbPwxHY
         jDJegt95x/7ibfemWF0/KbXCEvfkiNTBeF+levgqdP6xfbejCeej9cZCnl5JjMRDDm
         S6881LFVEGsqsH2HSrDblL6YvY0r/KVtrVKCJz+v8koJI7xBHY+x+BeoWN3k2TFhXm
         MDuTpL3HVGEAA==
Date:   Thu, 11 Nov 2021 11:01:27 -0600
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
Message-ID: <20211111170127.GA1336355@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211110211905.GA1261732@bhelgaas>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 10, 2021 at 03:19:05PM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 10, 2021 at 05:33:11PM +0100, Robert Święcki wrote:
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
> > in pci-related code? Things I haven't seen before. But, granted, my
> > kernel testing approach is not with focus on details, so maybe I did
> > sth wrong.
> 
> Thank you very much for testing this.  The patch changed the way we
> use runtime PM, and the dmesg snippets below look like they could be
> related to runtime PM issues.
> 
> I think the conclusion is that we need to revert these commits:
> 
>   b5f9c644eb1b ("PCI: Remove struct pci_dev->driver")
>   2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of pci_dev->driver")
> 
> from Linus' tree.  I queued up those reverts on
> https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=for-linus

These reverts appeared in the Nov 11 linux-next tree.  Any chance you
could verify that they solve the i2c_dw_pci_resume() issue?  If it's
easier, you can apply them from:
https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=for-linus
instead.

Bjorn

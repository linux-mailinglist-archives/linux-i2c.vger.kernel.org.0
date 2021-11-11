Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FE044DB71
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 19:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhKKSMJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 13:12:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:56786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229872AbhKKSMI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Nov 2021 13:12:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C4E56113B;
        Thu, 11 Nov 2021 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636654159;
        bh=HV/u1EfXH9Uhf+fDpjArZqgSvFI+Y8px6GrgulFcDSk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=WwEytMjEEFd3Zc2PhVDxY7eaS0LlnfLsGqM8y8flPEehVZjpoDBYQXmvgccggHppn
         bJh0j9vesg0L9fOOHO+dJqDP0yTCw1H3J4SmVOswmdZ/1EUe1N4XEtvJt90mLJs5E3
         6i3uwzcHbYpOm1rLcrB6Rw6Cysl5dcVpwrvBzc/3ImqJB8JymMHuaXOVX/p9KJdpdV
         cKCYwC0tWcsZZXlGH2FyMAitM22U/T0RYPLnmUl27VO4GVL1gHVUGJhLbi7DNRWq/3
         W8t08dM6LR/z+4lJP6p2VSlSrvKHyfpln9wiAndqWxHHuDLRffKhb/7Q4tJs+/NAkz
         h2usl4uZRZI3A==
Date:   Thu, 11 Nov 2021 12:09:17 -0600
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
Message-ID: <20211111180917.GA1340883@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP145piKqyVepa7wnuqwntycdq6tU3ZeoUV10+nweqaXNyvs=Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 11, 2021 at 06:32:28PM +0100, Robert Święcki wrote:
> Hi,
> 
> > > Thank you very much for testing this.  The patch changed the way we
> > > use runtime PM, and the dmesg snippets below look like they could be
> > > related to runtime PM issues.
> > >
> > > I think the conclusion is that we need to revert these commits:
> > >
> > >   b5f9c644eb1b ("PCI: Remove struct pci_dev->driver")
> > >   2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of pci_dev->driver")
> > >
> > > from Linus' tree.  I queued up those reverts on
> > > https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=for-linus
> >
> > These reverts appeared in the Nov 11 linux-next tree.  Any chance you
> > could verify that they solve the i2c_dw_pci_resume() issue?  If it's
> > easier, you can apply them from:
> > https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=for-linus
> > instead.
> 
> Looks good with the most recent 3 commits from for-linus applied on
> the top of the current linus' tree.
> 
> No problematic dmesg entries, my Win11/vfio/kvm/qemu boots fine.

Thank you so much for testing this!  I'll ask Linus to pull the two
reverts related to the i2c_dw_pci_resume() issue.  Marc and Christian
are still hoping for a fix instead of the third revert.

Bjorn

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE5E490C2D
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 17:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237362AbiAQQKm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 11:10:42 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:61607 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237318AbiAQQKl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jan 2022 11:10:41 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Jcxhb4DNTz63;
        Mon, 17 Jan 2022 17:10:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1642435839; bh=7gVZSyvOycxlSlM1HmMfh3271Vdc6leDU5o6KP2vhwo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ISiCeo59FRMSkswQRfm3Dg3+YPAEaSmqw8++c2n6NG06HqyTAIXje2RfYjRU8dsCg
         d33vrgpiAKoIj9HaFDXqIXvEuVQNx/7cyZdhJbK4R2cyFE8anJeSPqvOuv6kXp4Sl1
         mvwZXuJ/hbfoTTHiv5ah9IZIiksb9hoGJqNQxpRY0zsxDq/U9tdeLLImi6zAqd3E47
         OxTKDUWDpo54rMo8AFGtMOEYVihYIrcWoI6kILTrUOFM8P3m1a+vhzrS94vu6SFJbA
         JpvqXWjnaRlC0dvTDxle0u0OsiXQEAHaZFomwRxmulECiMH4ZkRT4FR8eGQ6aejmJu
         r0JTxIgEiq2TQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date:   Mon, 17 Jan 2022 17:10:38 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: tegra: allow compiling out support for Tegra's
 special constrollers
Message-ID: <YeWU/tuh12Co0Cdj@qmqm.qmqm.pl>
References: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
 <ea9ab0b7-022b-93e2-ed7d-dccfa95bd900@gmail.com>
 <YeRd90gLqtsz2zVV@qmqm.qmqm.pl>
 <e7a9a48b-e924-9e14-a4ff-b13853c5033e@gmail.com>
 <YeSQj/f94IH4SAQ/@qmqm.qmqm.pl>
 <9ca5caed-a68f-f131-dfb6-d187614ff9ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ca5caed-a68f-f131-dfb6-d187614ff9ee@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 17, 2022 at 06:37:12PM +0300, Dmitry Osipenko wrote:
> 17.01.2022 00:39, Michał Mirosław пишет:
> > On Sun, Jan 16, 2022 at 09:34:42PM +0300, Dmitry Osipenko wrote:
> >> 16.01.2022 21:03, Michał Mirosław пишет:
> >>> On Sun, Jan 16, 2022 at 08:54:08PM +0300, Dmitry Osipenko wrote:
> >>>> 16.01.2022 19:02, Michał Mirosław пишет:
> >>>>> To patches that, combined, reduce I2C driver's code by ~2kB and a bit
> >>>>> from runtime overhead for non-Tegra20 or non-Tegra210 builds.
> >>>>>
> >>>>> Michał Mirosław (2):
> >>>>>   i2c: tegra: allow DVC support to be compiled out
> >>>>>   i2c: tegra: allow VI support to be compiled out
> >>>>>
> >>>>>  drivers/i2c/busses/Kconfig     | 16 ++++++++++++++++
> >>>>>  drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++++-------------
> >>>>>  2 files changed, 38 insertions(+), 13 deletions(-)
> >>>>>
> >>>>
> >>>> 2KB is a too small difference to justify the ifdefs and Kconfig entries,
> >>>> IMO.
> >>>
> >>> Maybe I should have mentioned that it's ~20%? With my "embedded" hat on:
> >>> I think it might be small, but sometimes it is the difference between
> >>> bootable kernel or one too big.
> >>
> >> 10KB is a small size too. I'm very doubtful that such changes make any
> >> real difference in practice.
> >>
> >> Much more practical should be to modularize more kernel code. You should
> >> be able to squeeze zImage down to 3MB without any code changes by
> >> toggling more kernel config options to =m. Try to use grate_defconfig
> >> [1] for the base, that is what postmarketOS kernel build uses.
> > 
> > For normal system this solution is workable. But for recovery, where you
> > have to fit kernel+initrd in whatever small partition is provided (like
> > eg. in Transformers 8MiB), it becomes a problem from time to time.
> > (In this case, modules make it worse due to additional overhead in
> > kernel and userspace).
> 
> My point is that 2KB very likely won't change anything for you. I'd
> suggest to take a look at a more "fat" drivers, like DRM/host1x for
> example. I suppose it should be possible to save at least couple
> hundreds KB by trimming those fat drivers.

No doubt we can find more code to trim. :-) This one was cheap and easy,
though. BTW, I worked around host1x size by using simpledrmfb instead,
so I'm not sure there will be much benefit to digging there.

Best Regards
Michał Mirosław

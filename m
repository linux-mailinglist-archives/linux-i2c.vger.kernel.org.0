Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26BB48FF34
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jan 2022 22:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236213AbiAPVje (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Jan 2022 16:39:34 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:60523 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233393AbiAPVje (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 16 Jan 2022 16:39:34 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4JcT2X3ZKWz31;
        Sun, 16 Jan 2022 22:39:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1642369172; bh=u+UfWKb8KYuJdL+sC8wfN61AcZxiVf25ra0DbCQHGEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kp74/vbQCq7OxDsx336Up7mhZNmT4LazgovEmbiUqrzOpblmG/1hcnbfVRnE/jo0E
         iw6ggIfhSRemUdA5cgjaYXndEiOjEamZ4r5iYrFUztfiWl1d5RE/niT7Tgxf7KMRq6
         bLuaq4l+zSkBxD+vA/17G057XUFaDWPptT6L2qgLjHs0kNGf84iGp6rcrKSrC3Ivjb
         Jb/g2Zq//79uDEHZTqaQS9xZv3ks6/pIhZtk3yL2o3CB2W0umh6fpc7tFW99ax6fBx
         crj1aFmycL9kScNOZA+920gHK+rZ2Z5GaJ8rTNGHqMvxstpQIFwGsaazlcFSR+LBr4
         OCPRtnKELtryg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date:   Sun, 16 Jan 2022 22:39:27 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: tegra: allow compiling out support for Tegra's
 special constrollers
Message-ID: <YeSQj/f94IH4SAQ/@qmqm.qmqm.pl>
References: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
 <ea9ab0b7-022b-93e2-ed7d-dccfa95bd900@gmail.com>
 <YeRd90gLqtsz2zVV@qmqm.qmqm.pl>
 <e7a9a48b-e924-9e14-a4ff-b13853c5033e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7a9a48b-e924-9e14-a4ff-b13853c5033e@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jan 16, 2022 at 09:34:42PM +0300, Dmitry Osipenko wrote:
> 16.01.2022 21:03, Michał Mirosław пишет:
> > On Sun, Jan 16, 2022 at 08:54:08PM +0300, Dmitry Osipenko wrote:
> >> 16.01.2022 19:02, Michał Mirosław пишет:
> >>> To patches that, combined, reduce I2C driver's code by ~2kB and a bit
> >>> from runtime overhead for non-Tegra20 or non-Tegra210 builds.
> >>>
> >>> Michał Mirosław (2):
> >>>   i2c: tegra: allow DVC support to be compiled out
> >>>   i2c: tegra: allow VI support to be compiled out
> >>>
> >>>  drivers/i2c/busses/Kconfig     | 16 ++++++++++++++++
> >>>  drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++++-------------
> >>>  2 files changed, 38 insertions(+), 13 deletions(-)
> >>>
> >>
> >> 2KB is a too small difference to justify the ifdefs and Kconfig entries,
> >> IMO.
> > 
> > Maybe I should have mentioned that it's ~20%? With my "embedded" hat on:
> > I think it might be small, but sometimes it is the difference between
> > bootable kernel or one too big.
> 
> 10KB is a small size too. I'm very doubtful that such changes make any
> real difference in practice.
> 
> Much more practical should be to modularize more kernel code. You should
> be able to squeeze zImage down to 3MB without any code changes by
> toggling more kernel config options to =m. Try to use grate_defconfig
> [1] for the base, that is what postmarketOS kernel build uses.

For normal system this solution is workable. But for recovery, where you
have to fit kernel+initrd in whatever small partition is provided (like
eg. in Transformers 8MiB), it becomes a problem from time to time.
(In this case, modules make it worse due to additional overhead in
kernel and userspace).

Best Regards
Michał Mirosław

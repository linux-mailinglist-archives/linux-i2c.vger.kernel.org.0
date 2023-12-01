Return-Path: <linux-i2c+bounces-569-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A14800051
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 01:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F8FB2816F3
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 00:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4B57EC;
	Fri,  1 Dec 2023 00:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6dZ9Dfz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EBA1CA8F;
	Fri,  1 Dec 2023 00:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DC8C433C7;
	Fri,  1 Dec 2023 00:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701391037;
	bh=3241zdR3+Dq+vpqy1XrTSIcnTh1DqM4Y/a0CcpB4O7I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=a6dZ9Dfz+by8OROznMtmJtSp5jS1osjFddWbBDwy0u54Kh1tEeHb0FDwH4Eke/zII
	 T1kuUFUhKbg2QJ2ifsjCDsbxytrGnduw5awCkiP89U+oFg+qKGsMudW41zhRKn3/4a
	 JfkvK/rp62DcPlhzxRqkUPfHj+4Q79JKdWq6UbI8V2rkI+zeGYAGz0YFm3ViDU7jCD
	 rwysHlYYX62yR4GOVne3YSwZPo9kTRFwUg9Nzym/iKNHaWeU0FmVfzXzucMLowFUrK
	 IyItBCq6u/jvn37Lc75A0XgkA+Due+PktoPva9CR6N3eSWdG9JADxxnXCG3NyXgjYp
	 5g6JJu1uzoSCQ==
Date: Thu, 30 Nov 2023 18:37:14 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Keith Busch <kbusch@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Message-ID: <20231201003714.GA501991@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130093601.GA11031@wunner.de>

On Thu, Nov 30, 2023 at 10:36:01AM +0100, Lukas Wunner wrote:
> On Thu, Nov 30, 2023 at 07:30:56AM +0000, Shinichiro Kawasaki wrote:
> ...

> > Lukas, thank you for the idea. If I understand the comment by Andy
> > correctly, P2SB should not be unhidden between arch_initcall and
> > fs_initcall. Hmm.
> > 
> > This made me think: how about to unhide and hide P2SB just during
> > fs_initcall to cache the P2SB resources? To try it, I added a function
> > below on top of the previous trial patch. The added function calls
> > p2sb_bar() for devfn=0 at fs_initcall so that the resource is cached
> > before probe of i2c-i801. This worked
> > good on my system. It avoided the deadlock as well as the lockdep WARN :)
> 
> This may work if i2c-i801 is compiled as a module, but may not work
> if it's builtin:  It would try to access the cached P2SB BAR when
> it's not yet been cached.  So you'd have to return -EPROBE_DEFER
> from p2sb_bar() if it hasn't been cached yet.  And you'd have to
> make sure that all the callers can cope with that return value.
> 
> Another approach would be to cache the BARs very early at boot in
> arch/x86/kernel/early-quirks.c.  That would obviate the need to
> defer probing if the BAR hasn't been cached yet.

I hinted at something like this too:

  https://lore.kernel.org/all/20220107010305.GA334966@bhelgaas/

I think these hidden devices are an architectural nightmare.  I doubt
firmware folks have signed up to support the OS unhiding and using
them.  I think we're going out on a limb by assuming they're fair game
for the OS to use.  So I'm ... a bit hesitant to complicate the PCI
core locking, enumeration, and BAR reading code to accommodate them.

> Looking through past discussions archived in lore, I've found an
> important issue raised by Bjorn:
> 
>    "Apparently this normally hidden device is consuming
>     PCI address space.  The PCI core needs to know about this.  If it
>     doesn't, the PCI core may assign this space to another device."
>     
>    https://lore.kernel.org/all/20210308185212.GA1790506@bjorn-Precision-5520/

I think that was covered because the address space is not included in
the PNP0A03 _CRS, as mentioned in the v2 commit log, right?

  https://lore.kernel.org/all/20211221173945.53674-3-andriy.shevchenko@linux.intel.com/

Bjorn


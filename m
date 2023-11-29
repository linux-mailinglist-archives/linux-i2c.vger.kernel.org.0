Return-Path: <linux-i2c+bounces-535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179C7FD5B5
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 12:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 157E6B2194A
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 11:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FF81D522;
	Wed, 29 Nov 2023 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
X-Greylist: delayed 761 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Nov 2023 03:30:23 PST
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9927DA;
	Wed, 29 Nov 2023 03:30:23 -0800 (PST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 4AE99100D9438;
	Wed, 29 Nov 2023 12:30:22 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 24486372DE; Wed, 29 Nov 2023 12:30:22 +0100 (CET)
Date: Wed, 29 Nov 2023 12:30:22 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Keith Busch <kbusch@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Message-ID: <20231129113022.GB14152@wunner.de>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
 <ZVNJCxh5vgj22SfQ@shikoro>
 <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
 <ZVNiUuyHaez8rwL-@smile.fi.intel.com>
 <20231114155701.GA27547@wunner.de>
 <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
 <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
 <c85f2d02-d862-4431-a210-79c13efd163c@gmail.com>
 <l34l5gd6ann3wajjs7nruwlthjugyg4fawtw3cwellfilevrc2@xjxzr3zejfit>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l34l5gd6ann3wajjs7nruwlthjugyg4fawtw3cwellfilevrc2@xjxzr3zejfit>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Nov 28, 2023 at 10:16:28AM +0000, Shinichiro Kawasaki wrote:
> Here are my three observations:
> 
> A) pci drivers should be able to call p2sb_bar() in probe() without failure.
> B) when /sys/bus/pci/rescan is written, pci_rescan_remove_lock is locked then
>    probe() is called.
> C) p2sb_bar() locks pci_rescan_remove_lock.
> 
> These results in the deadlock. To avoid the deadlock, one of the three needs
> to change. A) is not to change. I guess changing B) will be too much. So, I
> would like to question if we can change C).

It is possible to allow recursive acquisition of a mutex by doing two
things:

* You need to store a pointer to the task_struct which is holding
  the lock.  This allows you to identify upon a recursive acquisition
  that you're already holding the lock.  The acquire operation becomes
  a no-op in this case.

* You need a counter of how many times you've acquired the lock
  recursively.  This allows you to determine upon lock release
  whether the release operation should be a no-op (due to previous
  recursive acquisition) or whether it should result in actual
  lock release (no previous recursive locking, or recursive locking
  has ended).

Actually struct mutex already stores the owner of the lock,
but that's only available internally.

While it would be possible to allow recursive acquisition of
pci_rescan_remove_lock in this way, doing so merely because of
a vendor-specific platform quirk will likely be considered dodgy
by the upstream community.  So Andy's proposal to stash the
struct resource on affected platforms seems more viable from
an upstream acceptability point of view.

Thanks,

Lukas


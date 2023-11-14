Return-Path: <linux-i2c+bounces-155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2C7EB445
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 16:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AACDB20B72
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 15:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC5F41A8F;
	Tue, 14 Nov 2023 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825A641A82
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 15:57:07 +0000 (UTC)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57599130
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 07:57:06 -0800 (PST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 1B97B3000628F;
	Tue, 14 Nov 2023 16:57:01 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 0CE792AE38; Tue, 14 Nov 2023 16:57:01 +0100 (CET)
Date: Tue, 14 Nov 2023 16:57:01 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Keith Busch <kbusch@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Jean Delvare <jdelvare@suse.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Message-ID: <20231114155701.GA27547@wunner.de>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
 <ZVNJCxh5vgj22SfQ@shikoro>
 <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
 <ZVNiUuyHaez8rwL-@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVNiUuyHaez8rwL-@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Nov 14, 2023 at 02:04:34PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 14, 2023 at 11:47:15AM +0100, Heiner Kallweit wrote:
> > On 14.11.2023 11:16, Wolfram Sang wrote:
> > > On Tue, Nov 14, 2023 at 06:54:29AM +0000, Shinichiro Kawasaki wrote:
> > > > The lockdep splat indicates possible deadlock between
> > > > pci_rescan_remove_lock and work_completion lock have deadlock
> > > > possibility.
> > > > In the call stack, I found that the workqueue thread for
> > > > i801_probe() calls p2sb_bar(), which locks pci_rescan_remove_lock.
> > 
> > i801 just uses p2sb_bar(), I don't see any issue in i801. Root cause
> > seems to be in the PCI subsystem. Calling p2sb_bar() from a PCI driver
> > probe callback seems to be problematic, nevertheless it's a valid API
> > usage.
> 
> So, currently I'm lack of (good) ideas and would like to hear other (more
> experienced) PCI developers on how is to address this...

Can you add a p2sb_bar_locked() library call which is used by the
i801 probe path?

Basically rename p2sb_bar() to __p2sb_bar() and add a third parameter
of type boolean which signifies whether it's invoked in locked context
or not, then call that from p2sb_bar() and p2sb_bar_locked() wrappers.

Thanks,

Lukas


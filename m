Return-Path: <linux-i2c+bounces-563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 146F07FEBEF
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 10:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA2DB1F20F68
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 09:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6EC3985E;
	Thu, 30 Nov 2023 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5D8D50
	for <linux-i2c@vger.kernel.org>; Thu, 30 Nov 2023 01:36:09 -0800 (PST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id D58F82800BC35;
	Thu, 30 Nov 2023 10:36:01 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id BF32F54AE6; Thu, 30 Nov 2023 10:36:01 +0100 (CET)
Date: Thu, 30 Nov 2023 10:36:01 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Keith Busch <kbusch@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Message-ID: <20231130093601.GA11031@wunner.de>
References: <20231114155701.GA27547@wunner.de>
 <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
 <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
 <ZWC_0eG2UBMKAD3C@smile.fi.intel.com>
 <2vzf5sj76j3p747dfbhnusu5daxzog25io4s7d5uvzvtghvo24@567tghzifylu>
 <20231129111739.GA14152@wunner.de>
 <ZWdBnMTOq9wIt9L-@smile.fi.intel.com>
 <ZWdCdMtLjZS2mDTQ@smile.fi.intel.com>
 <rsrhixediftppmm2n7rzciirdpjnymzsn76lffnd4kzovxaf42@5hddblagaytt>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rsrhixediftppmm2n7rzciirdpjnymzsn76lffnd4kzovxaf42@5hddblagaytt>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Nov 30, 2023 at 07:30:56AM +0000, Shinichiro Kawasaki wrote:
> On Nov 29, 2023 / 15:53, Andy Shevchenko wrote:
> > On Wed, Nov 29, 2023 at 03:50:21PM +0200, Andy Shevchenko wrote:
> > > On Wed, Nov 29, 2023 at 12:17:39PM +0100, Lukas Wunner wrote:
> > > > Your patch uses a list to store a multitude of struct resource.
> > > > Is that actually necessary?  I thought there can only be a single
> > > > P2SB device in the system?
> 
> Yes, the list might be too much. I was not sure what is the expected
> number of P2SB resources to be cached. I found drivers/mfd/lpc_ich.c
> calls p2sb_bar() at two places for devfn=0 and devfn=(13,2), so at
> least two resources look required. Not sure about the future.
> If two static resources are sufficient, the code will be simpler.

About that p2sb_bar() call in lpc_ich.c for PCI_DEVFN(13, 2):

It's in a switch-case statement for INTEL_SPI_BXT.  BXT means Broxton,
which is an Atom Goldmont based architecture.

If you look at p2sb_cpu_ids[], you'll notice the P2SB is located at
PCI_DEVFN(13, 0) on Goldmont.

PCI functions with function number > 0 are not enumerable unless there is
a PCI function with function number 0.

So p2sb_bar() first unhides the P2SB at PCI_DEVFN(13, 0), then the
SPI function at PCI_DEVFN(13, 2) becomes enumerable and p2sb_bar()
retrieves the BAR address of that function.

Unfortunately this is a little byzantine.

For the caching approach I guess it means you can assume there is only
a single P2SB device in the system but you need to cache not just the
P2SB BAR, but also the BARs of functions 1 .. 7 of the P2SB device
if the P2SB's function number is 0.  I don't know if each of those
upper functions only ever has a single BAR, but probably that's the case.


> Lukas, thank you for the idea. If I understand the comment by Andy
> correctly, P2SB should not be unhidden between arch_initcall and
> fs_initcall. Hmm.
> 
> This made me think: how about to unhide and hide P2SB just during
> fs_initcall to cache the P2SB resources? To try it, I added a function
> below on top of the previous trial patch. The added function calls
> p2sb_bar() for devfn=0 at fs_initcall so that the resource is cached
> before probe of i2c-i801. This worked
> good on my system. It avoided the deadlock as well as the lockdep WARN :)

This may work if i2c-i801 is compiled as a module, but may not work
if it's builtin:  It would try to access the cached P2SB BAR when
it's not yet been cached.  So you'd have to return -EPROBE_DEFER
from p2sb_bar() if it hasn't been cached yet.  And you'd have to
make sure that all the callers can cope with that return value.

Another approach would be to cache the BARs very early at boot in
arch/x86/kernel/early-quirks.c.  That would obviate the need to
defer probing if the BAR hasn't been cached yet.

Looking through past discussions archived in lore, I've found an
important issue raised by Bjorn:

   "Apparently this normally hidden device is consuming
    PCI address space.  The PCI core needs to know about this.  If it
    doesn't, the PCI core may assign this space to another device."
    
   https://lore.kernel.org/all/20210308185212.GA1790506@bjorn-Precision-5520/

arch/x86/kernel/early-quirks.c already reserves "stolen" memory used
by Intel GPUs with unified-memory architecture.  It adjusts the e820
map to achieve that.  I guess the same method could be used to reserve
the memory used by P2SB (as well as "upper" functions if P2SB has
function number 0).

An early version of p2sb_bar() (which wasn't mainlined) duplicated
__pci_read_base().  I suggested to instead unhide and temporarily
enumerate the device, retrieve the BAR, then destroy the pci_dev
and hide the P2SB again:

https://lore.kernel.org/all/20220505145503.GA25423@wunner.de/

That resulted in a significant reduction in LoC.  But if the BAR
caching happens in arch/x86/kernel/early-quirks.c, it may be
necessary to duplicate at least portions of __pci_read_base() again.
Or maybe the code can be simplified for this specific use case,
I don't know.

Thanks,

Lukas


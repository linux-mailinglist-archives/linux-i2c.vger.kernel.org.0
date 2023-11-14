Return-Path: <linux-i2c+bounces-158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAF97EB5FB
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 18:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 337C41C20A8C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 17:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05632C1B0;
	Tue, 14 Nov 2023 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7WKoep4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D743B2C1AF
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 17:58:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F4C10F;
	Tue, 14 Nov 2023 09:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699984698; x=1731520698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z3Fyn127jjAlpYKhsnD4n33xhw25l7W/N9ueAQRBmng=;
  b=N7WKoep4eg23DAJKK28bKjBKBwxkAP8MdOj83ZzWYDxwkjcHWVHXWQqx
   kft2APw5jFEFpmQ5vAVUEIUgjOsxYG+xx3a21OtJx4Rrjr5MVjUuARV9W
   WIj1WxnSsnd/fK5Xy9fvTDFI5+tT2el3+lBiYqtiGryhYIMyqas7EWCHy
   PxlprsJ1hsN6awUopn1CaK6HMbLCsMhHe1IN/OaDp6WxUw2yR0HV3QeUb
   j7N/OYB8LreO/oxC75KMBCBlaHqY4dtPEuawG84ztp8nvBmYgs2A/vUrg
   nzhRYLS3LuPQgEvFUbnZ6vX+YzjHsQwW6zjVpjlqeJSLCsTZnn6jDuha+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381107009"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="381107009"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 09:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096176298"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="1096176298"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 09:58:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2xfw-0000000DttA-1JSP;
	Tue, 14 Nov 2023 19:58:12 +0200
Date: Tue, 14 Nov 2023 19:58:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Keith Busch <kbusch@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Jean Delvare <jdelvare@suse.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Message-ID: <ZVO1M2289uvElgOi@smile.fi.intel.com>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
 <ZVNJCxh5vgj22SfQ@shikoro>
 <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
 <ZVNiUuyHaez8rwL-@smile.fi.intel.com>
 <20231114155701.GA27547@wunner.de>
 <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 14, 2023 at 06:11:40PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 14, 2023 at 04:57:01PM +0100, Lukas Wunner wrote:
> > On Tue, Nov 14, 2023 at 02:04:34PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 14, 2023 at 11:47:15AM +0100, Heiner Kallweit wrote:
> > > > On 14.11.2023 11:16, Wolfram Sang wrote:
> > > > > On Tue, Nov 14, 2023 at 06:54:29AM +0000, Shinichiro Kawasaki wrote:

...

> > > > > > The lockdep splat indicates possible deadlock between
> > > > > > pci_rescan_remove_lock and work_completion lock have deadlock
> > > > > > possibility.
> > > > > > In the call stack, I found that the workqueue thread for
> > > > > > i801_probe() calls p2sb_bar(), which locks pci_rescan_remove_lock.
> > > > 
> > > > i801 just uses p2sb_bar(), I don't see any issue in i801. Root cause
> > > > seems to be in the PCI subsystem. Calling p2sb_bar() from a PCI driver
> > > > probe callback seems to be problematic, nevertheless it's a valid API
> > > > usage.
> > > 
> > > So, currently I'm lack of (good) ideas and would like to hear other (more
> > > experienced) PCI developers on how is to address this...
> > 
> > Can you add a p2sb_bar_locked() library call which is used by the
> > i801 probe path?
> > 
> > Basically rename p2sb_bar() to __p2sb_bar() and add a third parameter
> > of type boolean which signifies whether it's invoked in locked context
> > or not, then call that from p2sb_bar() and p2sb_bar_locked() wrappers.
> 
> It may work, I assume. Let me cook the patch.

Hmm... But this will open a window when probing phase happens, e.g. during
boot time, no? If somebody somehow calls for full rescan, we may end up in
the situation when P2SB is gone before accessing it in p2sb_bar().

Now I'm wondering why simple pci_dev_get() can't be sufficient in the
p2sb_bar().

-- 
With Best Regards,
Andy Shevchenko




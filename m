Return-Path: <linux-i2c+bounces-156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 430027EB48F
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 17:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D626B1F251C2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 16:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A8B41741;
	Tue, 14 Nov 2023 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bw9V1pEI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CCA3FB29
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 16:14:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC64F0;
	Tue, 14 Nov 2023 08:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699978476; x=1731514476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wc07SPqifO1Yo5WuJfy3+mSW37tKDfcWpIXG7WZf9HE=;
  b=bw9V1pEIvoaJud/ttc1HZbN2v3H+YiEKqShFbm1AnciMEvThXGT02Qbg
   61iA8ebCogk/OCk+N32j+N1jnDMaUw4+9uKylAKdYx33wWmmlDCmsiNlc
   8dEi4+/SjMUAcekLhDzTA29nBccuNy+9It4nNEqp4Z4JtwuT1UUSPR2tt
   IXkfk5zNRGMS1NOLonw/ZZ0T0DHFVSMJOsNgvKXpaZ1wcAEvcyRpUGqnE
   THlOGzN6Zgw2ACtj0T7C8t9pN7IIPxkM5irdqit4tnR6tXECMZxaOyund
   5JNiIgrDhoDv/O0OufqSyrN9+/ZEJCjatwKWZ8DdU4fjoqulm2im3eHGK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="476900054"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="476900054"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 08:11:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="882099916"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="882099916"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 08:11:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2w0r-0000000Ds3R-0O82;
	Tue, 14 Nov 2023 18:11:41 +0200
Date: Tue, 14 Nov 2023 18:11:40 +0200
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
Message-ID: <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
 <ZVNJCxh5vgj22SfQ@shikoro>
 <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
 <ZVNiUuyHaez8rwL-@smile.fi.intel.com>
 <20231114155701.GA27547@wunner.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114155701.GA27547@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 14, 2023 at 04:57:01PM +0100, Lukas Wunner wrote:
> On Tue, Nov 14, 2023 at 02:04:34PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 14, 2023 at 11:47:15AM +0100, Heiner Kallweit wrote:
> > > On 14.11.2023 11:16, Wolfram Sang wrote:
> > > > On Tue, Nov 14, 2023 at 06:54:29AM +0000, Shinichiro Kawasaki wrote:

...

> > > > > The lockdep splat indicates possible deadlock between
> > > > > pci_rescan_remove_lock and work_completion lock have deadlock
> > > > > possibility.
> > > > > In the call stack, I found that the workqueue thread for
> > > > > i801_probe() calls p2sb_bar(), which locks pci_rescan_remove_lock.
> > > 
> > > i801 just uses p2sb_bar(), I don't see any issue in i801. Root cause
> > > seems to be in the PCI subsystem. Calling p2sb_bar() from a PCI driver
> > > probe callback seems to be problematic, nevertheless it's a valid API
> > > usage.
> > 
> > So, currently I'm lack of (good) ideas and would like to hear other (more
> > experienced) PCI developers on how is to address this...
> 
> Can you add a p2sb_bar_locked() library call which is used by the
> i801 probe path?
> 
> Basically rename p2sb_bar() to __p2sb_bar() and add a third parameter
> of type boolean which signifies whether it's invoked in locked context
> or not, then call that from p2sb_bar() and p2sb_bar_locked() wrappers.

It may work, I assume. Let me cook the patch.

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-i2c+bounces-835-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46976814CB0
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 17:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 791681C23BC2
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 16:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8993A8F9;
	Fri, 15 Dec 2023 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILbHAfIc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9A73DB83;
	Fri, 15 Dec 2023 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702656836; x=1734192836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jRZ4fvmYc+HtjzVULVdhC6nDL1Y7tBYw7lvsXJ+ZQW8=;
  b=ILbHAfIcFC5KYDIDdymkNPxSiVHKnthbg5oofxMsFNdun+JciMpalu1X
   SSk6EESDVVrE6XzZIs3CEwX86IV6pIiIlks+VIevspqIHA99Unw9YRIT0
   bTtXk6PrTQdAX2kMY8SNUyPsF/Y8pSYMJr0Zd8kvEmOo2nq0kArcXmkHx
   aFcwK5UrBY6T2Jsu1rSP+5awUscDYb7zGKYuQ9WckMs7uIZYxOFXoq/8t
   0pSP21HYq5QotW2Z0WhjkA3+bMpgsbQCOepbj0ON7RK47PJxsfmKIr0s8
   j1YpYk94GC3kua0pKq+/Jd2xOVz1iEapJju84Pt5ClN1i84+0VjBK/tmS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="16846439"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="16846439"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 08:13:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724500074"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="724500074"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 08:13:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rEAow-00000006AK8-1aGr;
	Fri, 15 Dec 2023 18:13:50 +0200
Date: Fri, 15 Dec 2023 18:13:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Message-ID: <ZXx7PpJbfsYxDQzJ@smile.fi.intel.com>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
 <ZXsvkWeJvdkvrf5e@smile.fi.intel.com>
 <20231215075210.GA15884@wunner.de>
 <ZXxynbIS8kd3KQuy@smile.fi.intel.com>
 <20231215154507.GB20902@wunner.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215154507.GB20902@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 15, 2023 at 04:45:07PM +0100, Lukas Wunner wrote:
> On Fri, Dec 15, 2023 at 05:37:01PM +0200, Andy Shevchenko wrote:
> > On Fri, Dec 15, 2023 at 08:52:10AM +0100, Lukas Wunner wrote:
> > > On Thu, Dec 14, 2023 at 06:38:41PM +0200, Andy Shevchenko wrote:
> > > > On Tue, Dec 12, 2023 at 08:47:46PM +0900, Shin'ichiro Kawasaki wrote:
> > > > > +/* Cache BAR0 of P2SB device from function 0 ot 7 */
> > > > > +#define NR_P2SB_RES_CACHE 8
> > > > 
> > > > This is fifth or so definition for the same, isn't it a good time to create
> > > > a treewide definition in pci.h?
> > > 
> > > This isn't something defined in the PCI spec but rather an x86-specific
> > > constant, so should preferrably live somewhere in arch/x86/include/asm/.
> > 
> > I'm not sure I am following both paragraphs.
> > 
> > > If you have a "maximum number of PCI functions per device" constant in mind
> > > then include/uapi/linux/pci.h might be a good fit.
> > 
> > This is indeed what I have had in mind, but why is this x86 specific?
> > I didn't get...
> 
> If you look at it from the angle that you want to cache the
> BAR of function 0 of the P2SB and of up to 7 additional functions,
> it's an x86 thing.
> 
> If you look at it from the angle "how many functions can a PCIe
> device have (absent ARI)", it's a PCIe thing.
> 
> It depends on the way you look at it. ;)

I look here from the PCI specification / similar thing perspective.

My angle here is "cache the BAR of function 0 of P2SB and of up to
as many as PCI specification dictates the device may have".

-- 
With Best Regards,
Andy Shevchenko




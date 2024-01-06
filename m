Return-Path: <linux-i2c+bounces-1179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F03FB826044
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A44DC1F22936
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 15:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2781848A;
	Sat,  6 Jan 2024 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+A+bCSH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4E8474;
	Sat,  6 Jan 2024 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704556646; x=1736092646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hOBe3c0HmqeXt2j5zXD/zxPaDoDUX5jSUVLlIGhnTWU=;
  b=Q+A+bCSHrIW9/BjfN3qPVJUVR+f6JPSvO7XfFBH9SHHaBe0Rj+Hl+lOY
   IBLifbVaXHgk2WThBLWj/3ImpcrpC4qVizMq0tQUwgB2OKPiDgpSyJASU
   qUSega7z66jOR1+I1cTiu9Cxy7zCHesiIhVcs3DtHaJ2ilZkBT0y1xERT
   oPLM+rwtBXkp1KeEffoDQCoKBSPmhZF5zeW4IvK/MTCEszlJZ8+veX9TC
   3gYA+gjl8kQugHP0ywIz4OTDevcYrPltC/yQ/4Hv/jjj2qO9115mBhlhW
   Gm1bDVSNSnaZZ9g5MJHNpMlT/zMTCjPyLefeLq6jg+vga2deRr/BM9hCm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="382633024"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="382633024"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 07:57:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="809819035"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="809819035"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 07:57:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rM931-0000000BwiW-42I6;
	Sat, 06 Jan 2024 17:57:19 +0200
Date: Sat, 6 Jan 2024 17:57:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 00/24] i2c: designware: code consolidation & cleanups
Message-ID: <ZZl4X0743xNXgetz@smile.fi.intel.com>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
 <ZYBgB3J51hfGQSVX@smile.fi.intel.com>
 <ZYFvEn0/xxIhGnlT@shikoro>
 <10f00229-4cc0-4511-a39e-14e2c58ba98a@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10f00229-4cc0-4511-a39e-14e2c58ba98a@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 05, 2024 at 11:54:52AM +0200, Jarkko Nikula wrote:
> On 12/19/23 12:23, Wolfram Sang wrote:
> > 
> > > Wolfram, is there any chance to get this into this (v6.8) cycle?
> > 
> > Sure, due to lots of travels and other issues I am in general very late
> > with preparing the merge window.
> > 
> > Applied to for-next, thanks!
> > 
> Can we put this on hold from not being queued into v6.8 or better drop the
> whole patchset?
> 
> Andy is right now out of office and there is a serious i2c-designware
> regression in linux-next on AMD machine and I'm not able to figure out
> quickly reason for it:
> 
> https://lore.kernel.org/linux-i2c/20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.local/

We have time to nail down it after rc1 is out, don't we?

-- 
With Best Regards,
Andy Shevchenko




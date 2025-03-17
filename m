Return-Path: <linux-i2c+bounces-9850-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A949DA6448A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 09:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5150018873D0
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 08:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A4021B8E1;
	Mon, 17 Mar 2025 08:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoNuZaB6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428F21B9C5;
	Mon, 17 Mar 2025 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742198413; cv=none; b=BPIwmYXla+mx1C5bpKlrrqg8vAJBObMS1hrHbsE68A66PUM6fgYmhwG0wZG+WIAGXbHl3xp204BX2fY9ndhtxwBHA+8NfVG8HHZezrs8bEIZWVNEThpH4KtaKZiEB5/dHnWgM+rfYwYLyLsSkXb12Zwcnf6ip8bloC9UrL0HrP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742198413; c=relaxed/simple;
	bh=WcJorY7PCd1uLYcrL2Xac0peBqgqcHLr4/yCJRQ9DGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9xtJCAvBysoyn7akm61Su9Nlhen1n+btkSTJ/GEaaf5OM4dtrMer7X3+LVeR7bz8pR/N2EHXJh5yJUbxyioc7fPSz+NoNdb0jwC1kBWKxl/JrVA6jvxQ6XXPGqUEuEaFujtHV8/6gP/WDrrLSKRHHD2q+J5tPFwJmnHVwz7YGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoNuZaB6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742198412; x=1773734412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WcJorY7PCd1uLYcrL2Xac0peBqgqcHLr4/yCJRQ9DGw=;
  b=UoNuZaB6iW8IYBgwdpzCHwtS+Bqj0wEwx+v6xUzdNIKONSixxAMniOsT
   xJsYwQ5CLf3bFH85zQacBdtAsUnk/upjELg5loOkGe9U8DX5ljDTuS1jb
   iLSI9q5ImoDOvt43Bzx+Z/LSREEsDMSP4531u17CouP8xxGey4grHA4ID
   omVYfj0ers0xRQ9FI35Lzcx/GHIPC2zvGnvF0Tg3pCMny5jjfwiy27Iem
   MksYvvc7SPn9GT86pi0qR0ncU31GNRN0CTD2w3u8OWhSAzkMiXuHbZWYD
   CrQnuhkfma2LuFG5tqW4/UxMzzT2xpn7BTjeebJBljU8RB2RIhvf4T9sC
   g==;
X-CSE-ConnectionGUID: 3/tAbM+tSWqTYQNfqni4VA==
X-CSE-MsgGUID: YBQ8tqM1Rtu1eQFdU/FgiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43383613"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43383613"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 01:00:12 -0700
X-CSE-ConnectionGUID: aE6cL5gsQ3avEEOtd25fgg==
X-CSE-MsgGUID: U1U/tNhnTbWmIps9Wc5uMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121674712"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 01:00:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tu5OG-00000003FIn-2NTM;
	Mon, 17 Mar 2025 10:00:04 +0200
Date: Mon, 17 Mar 2025 10:00:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <Z9fWhGDrUbAmGRl0@smile.fi.intel.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
 <202502280902.U0gLDhve-lkp@intel.com>
 <Z8GuOT5bJL7CdXX6@smile.fi.intel.com>
 <fec0a1c8-251b-491e-893d-11a8186a2128@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fec0a1c8-251b-491e-893d-11a8186a2128@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 08:48:03AM +0100, Krzysztof Kozlowski wrote:
> On 28/02/2025 13:38, Andy Shevchenko wrote:
> > On Fri, Feb 28, 2025 at 09:28:59AM +0800, kernel test robot wrote:
> >> Hi Ryan,
> >>
> >> kernel test robot noticed the following build warnings:
> >>
> >> [auto build test WARNING on andi-shyti/i2c/i2c-host]
> >> [also build test WARNING on linus/master v6.14-rc4 next-20250227]
> >> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >> And when submitting patch, we suggest to use '--base' as documented in
> >> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20250224-140221
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> >> patch link:    https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtech.com
> >> patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
> >> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/config)
> >> compiler: mips-linux-gcc (GCC) 14.2.0
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> > 
> > My gosh, this is valid report. But it looks like a preexisted issue.
> > Can somebody fix this, please?
> 
> 
> That was three weeks ago and still no responses from Aspeed or
> contributors from here.
> 
> I think this tells a lot about aspeedtech.com patchsets on the list.

Yeah...

-- 
With Best Regards,
Andy Shevchenko




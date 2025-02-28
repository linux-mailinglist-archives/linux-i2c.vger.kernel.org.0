Return-Path: <linux-i2c+bounces-9644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8206A49987
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 13:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 190D7188B9C1
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 12:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DFA26D5B1;
	Fri, 28 Feb 2025 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bjn6T8aD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A371026BDA4;
	Fri, 28 Feb 2025 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746307; cv=none; b=tw8WKOpfxhoKuB6Zvngx5iei3rIbD1sWWpc5jUeitid8Uhdjo9eECMG2O0hQ0AMmgcqc52eTgelFJnFtkV/O1ufEhWdvVMNKrHko3hkvIc4YSsauGtHyz6Gp9DACtUDdcNvI+0UYOjZNfKrN08LJduZ/Tn2XOYPwaMFxR1vcq58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746307; c=relaxed/simple;
	bh=VYX7RMZyCDlc3/89q5oGVMuk0VSFqLZ9SexG0yL3SwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJauyvDNEB8MLGg07ZkodvnNR+fXqkus9D6oya34Rcv1x3ll2vO8Z+LBqDWugK9qLP8XFctNHV8eHm3bhrl61TICH8ieg4CSmBNoRlLWSCglz2P/YSMcMtYP2rgKpThoclxzurtpV3KtYg4EowBro3+NwjnWmQYcV87aSwIFCBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bjn6T8aD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740746306; x=1772282306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYX7RMZyCDlc3/89q5oGVMuk0VSFqLZ9SexG0yL3SwM=;
  b=Bjn6T8aDR2iHyMZTvUyP3xhyyTfa9eLfgBcxQp1iqITfH7+MSEh3nTtK
   +sDdMQhR//Djg2cgnpk0gwhY59gsibf8bchK/jtMB6vKoX1w+BHYbgbip
   yqotmbenBRxSo6hKPy8nDCO+tQnzVVa+ShRAQ8ABiZORnfpDVwPsGKV2P
   tZY5PeLU8JCQmgVW7qz6qEEStaLWbTcMx1mkwk75WmE2WRhHqorZExR0a
   F6XiRmHAApf/TvwSjK0SbjPDnA6MQul3omqRI76Ahjxwk5tu4PvBtNOrk
   MFzySRuZFWznq/fh1XRg5PCvxN8uPcTDQobMgBy5Gz/bllIyTLMOTPdPF
   A==;
X-CSE-ConnectionGUID: J6Qr1JJuTf+CaBO5pJd84Q==
X-CSE-MsgGUID: FxGLw0INRliWRHV3vsI/nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="44487565"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="44487565"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:38:25 -0800
X-CSE-ConnectionGUID: XFK1U7eRRnWQ4oGOGKwDHg==
X-CSE-MsgGUID: 9fz0KIp6TWq3kGY8ZRIIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117312902"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:38:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnzdB-0000000Fwgv-3Dnc;
	Fri, 28 Feb 2025 14:38:17 +0200
Date: Fri, 28 Feb 2025 14:38:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org,
	joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <Z8GuOT5bJL7CdXX6@smile.fi.intel.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
 <202502280902.U0gLDhve-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502280902.U0gLDhve-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 28, 2025 at 09:28:59AM +0800, kernel test robot wrote:
> Hi Ryan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on andi-shyti/i2c/i2c-host]
> [also build test WARNING on linus/master v6.14-rc4 next-20250227]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20250224-140221
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> patch link:    https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtech.com
> patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

My gosh, this is valid report. But it looks like a preexisted issue.
Can somebody fix this, please?

-- 
With Best Regards,
Andy Shevchenko




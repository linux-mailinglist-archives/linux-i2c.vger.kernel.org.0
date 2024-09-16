Return-Path: <linux-i2c+bounces-6776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DD8979DDC
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 11:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28334B20C56
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 09:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF0614831F;
	Mon, 16 Sep 2024 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Er+xHMC9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0B8146589;
	Mon, 16 Sep 2024 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477656; cv=none; b=vAB4ZN3X7wMVmD+LmAqMrwBt/npTOQkntPlnqobWKPXRYp6TSIOdjqPtaxN5pSr7PP4VQEPeKkL9jpr5lhzvnf71ezyrCchZf1Vcx6WhKUjHJdlGOSCscC6c5DexviLkPLiwadRtFPCjFo3VZGB0piBemDh+aaT9fUPkFgSMpaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477656; c=relaxed/simple;
	bh=L50wy+tAu4DOyf+okYw3YZmUGRAaAhSs/1v8IlfCwG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOuQiAaijVio1ciKMKkU4/31747BU24ObLwtomQY7LzkjMEvm1kcBUGVjiSRsf2ZnsgCa3jhOdcQvzAVoyIWJTS6y07W5Cr7F3XdZzmHm7VhcgLV9vNL4ogd6Bfc3k+ylwERzAWfbC+9VF7skU11TPCIEChhLHzvcDfO7n4b0Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Er+xHMC9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726477654; x=1758013654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L50wy+tAu4DOyf+okYw3YZmUGRAaAhSs/1v8IlfCwG0=;
  b=Er+xHMC99yxp1VTEjEfw5ZvXR5E83mXDmNh9mTMxV2hMsuWkXv3JrYPb
   zXR4J1OXYPjc8kvavJfB/fdQ188PCXhtt4TOt5aagdWU7AixazqufcgO9
   r7YJr5sKmvGSEHsU7r+kXeycyp0kLNMqL7JCa60BcRgr2lJWiSDQ4oEP7
   OHwnXri5e7J13Is8GZZUnAG/GvAB6ddT8qF5hdr7xdFiBKY5Zfn+s06aW
   Lv1jy0w22SJkApCjw+Hhqc9D0eI+qwy2hv/cjlmkDUeIXVjnddHll01DN
   oK6QFcTsdeRyK68LTq08U5tuiHR7Kzd2Gn6Wz0LO+kE7Q1UPNabYRYCOF
   g==;
X-CSE-ConnectionGUID: EszyffxVSlOmCPO87b0r+Q==
X-CSE-MsgGUID: onR0mg7KR6GAO7DTs/Q+BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25230141"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="25230141"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 02:07:34 -0700
X-CSE-ConnectionGUID: nNK2Ty/iQv6cTp5fnrL/tQ==
X-CSE-MsgGUID: 1DzcSEIoSuu30S7TbdAJRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73581715"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 02:07:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sq7hh-00000009Oqd-0keg;
	Mon, 16 Sep 2024 12:07:29 +0300
Date: Mon, 16 Sep 2024 12:07:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
Message-ID: <Zuf1UJ6K_8hL5x5U@smile.fi.intel.com>
References: <20240911154820.2846187-5-andriy.shevchenko@linux.intel.com>
 <202409141436.QFCDQrRF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202409141436.QFCDQrRF-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Sep 14, 2024 at 02:56:19PM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on andi-shyti/i2c/i2c-host]
> [also build test WARNING on linus/master v6.11-rc7]
> [cannot apply to next-20240913]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-isch-Add-missed-else/20240912-002224
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> patch link:    https://lore.kernel.org/r/20240911154820.2846187-5-andriy.shevchenko%40linux.intel.com
> patch subject: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409141436.QFCDQrRF-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141436.QFCDQrRF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409141436.QFCDQrRF-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/i2c/busses/i2c-isch.c: In function 'smbus_sch_probe':
> >> drivers/i2c/busses/i2c-isch.c:296:42: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
>      296 |                 "SMBus SCH adapter at %04x", res->start);
>          |                                       ~~~^   ~~~~~~~~~~
>          |                                          |      |
>          |                                          |      resource_size_t {aka long long unsigned int}
>          |                                          unsigned int
>          |                                       %04llx

Yeah, this should be something like %pa, but the problem with that that it
always uses the same, fixed-width format with a prefix. We don't want this. But
to make sure we have proper specifier we need to introduce a temporary variable
and assign the resource start address to it and then use that variable in here.
I'll update this in v2 and send it after we have v6.12-rc1 is out.

-- 
With Best Regards,
Andy Shevchenko




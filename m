Return-Path: <linux-i2c+bounces-6743-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE0978C0A
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 02:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 943621F23613
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 00:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44127621;
	Sat, 14 Sep 2024 00:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEZ9Jvna"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8600802;
	Sat, 14 Sep 2024 00:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726272645; cv=none; b=XU5OkNeB7J7+3noykLHT8f946QX7jjDAWb7lbt3//XqHU+RVgYfcH3FOxD5GRvKxSgbRs8P57lHwLMwaYktZEquGItoJT1C9gp2kaPHaUI/Bf4ybxoxzPqCEqje+aZq5xhf+Qe9ig7+xUQ/22zUmwr5hjlUPgDllOX7RnlTJyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726272645; c=relaxed/simple;
	bh=pBlXE22qTfUfu7R4b/GcgpMEmYdx7gX5i4yw66loTlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uemOLbKniYB1fmxpgCsBbsE77Xy8exr0LRwSYkRepaKMcmaZ0p7+FzdksBZvHcPUenNyB6rONzeZBsPclcqKoq/0DExxke3h0vgUBEbQW4XIe5kNCwCDfHPp7U24zmitzUNu1C1ArDKptRp7jm0/5Hv+AL+AFA1KRj68yHUKqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEZ9Jvna; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726272643; x=1757808643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pBlXE22qTfUfu7R4b/GcgpMEmYdx7gX5i4yw66loTlg=;
  b=JEZ9JvnaQG5i2f+tlh5T8WbtJQLGDMgtdKWb6DEV/zU0I84r6HkcudfQ
   LB2JQqIeXkirKzoe7A58J6B6uK+5dQ5qyOf/aW/deJ3EIkRGdliyKFyY/
   hZvj+EFHovLsekuRhNlDqN2hPy+kLe/ane/1Bnq3Bdryz1XW/eLtZYp7y
   vWJtx8SpSY7Uf0aAYqvtlVVTXLCSvC4esIs3KF+KOaP69mII6HX3SEMwX
   segn/gzNWvKQRc2I7ix6ALw9EV81XPfRzQdc16+randWBlrVYArkYvQwk
   IdOKx1JgCuNQ3xK+rxVMDNGALZ1wx4m9TI5dq9LqOhu7Lyj5sxjxF/SPC
   g==;
X-CSE-ConnectionGUID: sd54NgDMSt2mnzEq7rVqrg==
X-CSE-MsgGUID: /6kXExrMS6OeSPlVznqj1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25061966"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25061966"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 17:10:36 -0700
X-CSE-ConnectionGUID: ZQDgBaKzScWKseKdZctE8Q==
X-CSE-MsgGUID: BUzx7VxoTSuGCSExL6LSKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="72616669"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2024 17:10:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spGMw-0007AY-0j;
	Sat, 14 Sep 2024 00:10:30 +0000
Date: Sat, 14 Sep 2024 08:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
Message-ID: <202409140743.kKVc8T3C-lkp@intel.com>
References: <20240911154820.2846187-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911154820.2846187-5-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.11-rc7]
[cannot apply to next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-isch-Add-missed-else/20240912-002224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240911154820.2846187-5-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
config: i386-buildonly-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140743.kKVc8T3C-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140743.kKVc8T3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140743.kKVc8T3C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-isch.c:296:32: warning: format specifies type 'unsigned int' but the argument has type 'resource_size_t' (aka 'unsigned long long') [-Wformat]
     296 |                 "SMBus SCH adapter at %04x", res->start);
         |                                       ~~~~   ^~~~~~~~~~
         |                                       %04llx
   1 warning generated.


vim +296 drivers/i2c/busses/i2c-isch.c

   276	
   277	static int smbus_sch_probe(struct platform_device *dev)
   278	{
   279		struct resource *res;
   280		int retval;
   281	
   282		res = platform_get_resource(dev, IORESOURCE_IO, 0);
   283		if (!res)
   284			return -EBUSY;
   285	
   286		sch_smba = devm_ioport_map(&dev->dev, res->start, resource_size(res));
   287		if (!sch_smba) {
   288			dev_err(&dev->dev, "SMBus region %pR already in use!\n", res);
   289			return -EBUSY;
   290		}
   291	
   292		/* set up the sysfs linkage to our parent device */
   293		sch_adapter.dev.parent = &dev->dev;
   294	
   295		snprintf(sch_adapter.name, sizeof(sch_adapter.name),
 > 296			"SMBus SCH adapter at %04x", res->start);
   297	
   298		retval = i2c_add_adapter(&sch_adapter);
   299		if (retval)
   300			sch_smba = NULL;
   301	
   302		return retval;
   303	}
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


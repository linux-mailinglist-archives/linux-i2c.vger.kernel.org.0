Return-Path: <linux-i2c+bounces-6745-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 430EB978E88
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 08:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7C9B1F23B1A
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 06:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A291CDA0A;
	Sat, 14 Sep 2024 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jREhJhCT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A3A15098A;
	Sat, 14 Sep 2024 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726297011; cv=none; b=pDXUlC559ni/cwzd1HYprC7rbae0007ZxcMZMROjH31/IuWZX4AwfOCA/NwKgZwPl7JlVXPvGLBnh9Q+IGYClw48eof++PvZnD0qJAZRluEMZ8H/zSTUSoKnKpa5rIdWIkMT2bqnw2FstS4K3Wu5iBaqMVzkUJD6lNmbHaVdSEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726297011; c=relaxed/simple;
	bh=26MJ6rf1hoM3Hz2MXFTOd76LXRC4To46ehhLIYWNco4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqmSVwe5Ca4PphEMUqMT7/RMMxWUnb/yjK+hm8qcBw6YKUT7Q8qCd9d0UhG0m0a8rgHkhtgWphboFB07sTAKLFyXfVd2W3VEPnh6iPC3sU+9if7MmG09hPlUHfwKiWfU8UITK+j2SNPqNcm9UmcqBXm0P7ZzmB8drReE/RheXC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jREhJhCT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726297009; x=1757833009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=26MJ6rf1hoM3Hz2MXFTOd76LXRC4To46ehhLIYWNco4=;
  b=jREhJhCTtk2L6HkxJV39nFxxxuhrzrq2AG/YphtKULXLJmR+d1DaFCt9
   g9Wyu2kB6E9/77/jIK3rwPrICdD1znd4heVGAhX29WOELcZtJ+a9yemDD
   oKN2D4pSIEp7IwBnWHdSKPMobLtYf8o/UHJV6HhqZs2t+3JpwUJALkvYF
   4fBcZ00XoqOKQegn2k6gsUqAy2ucCvCb/VdzoQNe07znxLWbnSec/UaJo
   5C4ZW0OZBoxKOcUYx41fin4W+Te5pkpXKjv6lJ//gONciHsIVEMoJ005Q
   aAfJXdFV0XLr0oE7XkDub86G4YVpGjERDcR1s157vDTNMVGJfIUENvuls
   g==;
X-CSE-ConnectionGUID: GA3Qw8nETj2IkJnJ11eZ1w==
X-CSE-MsgGUID: kxmRDTFpTJWKEb1dsLArZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35878466"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="35878466"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 23:56:49 -0700
X-CSE-ConnectionGUID: dExEuJhmQ6axh4ZmFn6/wg==
X-CSE-MsgGUID: pk+LwcvuQCKp7foBMr829w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68320764"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Sep 2024 23:56:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spMi5-0007Ta-10;
	Sat, 14 Sep 2024 06:56:45 +0000
Date: Sat, 14 Sep 2024 14:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
Message-ID: <202409141436.QFCDQrRF-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409141436.QFCDQrRF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141436.QFCDQrRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141436.QFCDQrRF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-isch.c: In function 'smbus_sch_probe':
>> drivers/i2c/busses/i2c-isch.c:296:42: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
     296 |                 "SMBus SCH adapter at %04x", res->start);
         |                                       ~~~^   ~~~~~~~~~~
         |                                          |      |
         |                                          |      resource_size_t {aka long long unsigned int}
         |                                          unsigned int
         |                                       %04llx


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


Return-Path: <linux-i2c+bounces-3578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B86A8C8F01
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2024 03:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A465C1C21788
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2024 01:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E13323BF;
	Sat, 18 May 2024 01:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIUkOrBF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C063D;
	Sat, 18 May 2024 01:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715994296; cv=none; b=AtmkFRiA0k0EYarNBNMdn7eAnUKfefvdsB0O7KNdmZvtnXTgW8FDbhPbl+TCLGSXXZnnG0tXmqAnJEMk5te56VNIB9qnk9p4Pz/0lRiIOIfKUao9YYW18G3HpLcAt+AKcw8nG4yVxk5YLoiMl91xI2A27IP/gtUIwhJPJBQKUeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715994296; c=relaxed/simple;
	bh=bHRgCULzYi8tSfZSqZ6z5UO8unETsb/ASwHz4ppE7k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrhwUwivaTo9ZQu6D+DA0G+eojCuV8HHIKaCqTMk2LBvcn0lgNdJ5fy3hUUUYgAQGTy5wO0VwH9W+g4hWy2olkOBhKiIjU6f0nUwaoO3lIz9u6Zd0/bzXcG91DUPv4Znu/XAxD5SKrC/5xP7NReblRUrjQy6cjdzZNjXiDbKIlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIUkOrBF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715994294; x=1747530294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bHRgCULzYi8tSfZSqZ6z5UO8unETsb/ASwHz4ppE7k8=;
  b=GIUkOrBFvMJbrq1FTjpuvMCuQEBbo/mgWLvEsXslBr4Kk81fA8XOKHg5
   JsuaweSk93kHh0dKVKkG8GhMzteCGCZdg+YsJ3dSXXvHjYrZFGtoBmZWf
   KpBxfoHQLOqqPtB91UWTdndnVl6vWPzc0qfnvJbftbFndQDxnyIgekT/U
   UEtVzRYPpTl08IN7yE3h2ml8n5/+hJFmPYGbf+gPysNIV35MJmNXbIhuz
   L/cN0Bgn+PpR3ceq4pL8fBi/Q1F/q1vGdD47KLEi7xrLs/wmynFHPzyMd
   payFsHHdoqdvglGuk0DCxJQL4BofqbSMk8mMmmIF+GVlUSKCxz6C0JgXq
   g==;
X-CSE-ConnectionGUID: htaml7Y8RbSmLeduBNDDgw==
X-CSE-MsgGUID: fbff3wy3QtGZx6Wc/9yszw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12306128"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="12306128"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 18:04:53 -0700
X-CSE-ConnectionGUID: cTE87pGATkufBRA0am2S+g==
X-CSE-MsgGUID: P9mlfLqDTjOPj4RIAFx1qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="32375877"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 May 2024 18:04:50 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s88Uq-0001Si-0v;
	Sat, 18 May 2024 01:04:31 +0000
Date: Sat, 18 May 2024 09:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
	alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, eajames@linux.ibm.com
Subject: Re: [PATCH v3 37/40] fsi: core: Add different types of CFAM
Message-ID: <202405180824.hYqwNWNv-lkp@intel.com>
References: <20240516181907.3468796-38-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516181907.3468796-38-eajames@linux.ibm.com>

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on robh/for-next broonie-spi/for-next linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/fsi-hub-Set-master-index-to-link-number-plus-one/20240517-023205
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240516181907.3468796-38-eajames%40linux.ibm.com
patch subject: [PATCH v3 37/40] fsi: core: Add different types of CFAM
config: nios2-randconfig-r071-20240517 (https://download.01.org/0day-ci/archive/20240518/202405180824.hYqwNWNv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405180824.hYqwNWNv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405180824.hYqwNWNv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fsi/fsi-core.c:1113:27: warning: no previous prototype for 'fsi_get_cfam_type' [-Wmissing-prototypes]
    1113 | const struct device_type *fsi_get_cfam_type(u32 id)
         |                           ^~~~~~~~~~~~~~~~~


vim +/fsi_get_cfam_type +1113 drivers/fsi/fsi-core.c

  1112	
> 1113	const struct device_type *fsi_get_cfam_type(u32 id)
  1114	{
  1115		u32 major = (id & 0xf00) >> 8;
  1116		u32 minor = (id & 0xf0) >> 4;
  1117	
  1118		switch (major) {
  1119		case 0x9:
  1120			return &cfam_s_type;
  1121		case 0xc:
  1122			if (minor == 0)
  1123				return &cfam_ody_type;
  1124			fallthrough;
  1125		case 0xd:
  1126		default:
  1127			return &cfam_type;
  1128		}
  1129	}
  1130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


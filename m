Return-Path: <linux-i2c+bounces-1285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE2782CB1A
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 10:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2253E1F2283F
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 09:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4A910958;
	Sat, 13 Jan 2024 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRMTKx9c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5342AEC5;
	Sat, 13 Jan 2024 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705139745; x=1736675745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y9uzOOBDiu2ejSJ5RQ7XWCiYQyNxSybpJ3b1M3MhwOA=;
  b=RRMTKx9cLwGNKVS/dwOkbVzeocu/HIKfQT8eTEKNTF30n/E56aDKTzMa
   S184miJFBLIcQ7BDwB9FC04dAti/p3WC37882UT2wzBOudaJDS0FAxfWA
   BCkWPtIb6uvpt23QrxgCPCohAw71akN9c4KYqS5yrMfnTzaXkOxmrTKx1
   ddMnpnUo8KA68rSxLSRomNQZAEeq47bt0S2Pch8Abo9wR91SbWpXXAYzN
   BQsShB5iC17J3MBTt2hbWY0mnA3cheIhM/CjHwQWprYiIczDAn/rp+CUY
   LftzmnKEeC1v6khvowgo3ArPqBeh1L5dfpgLVMjmgHEuysp/dacmUm1eo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="396505808"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="396505808"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 01:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="776253515"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="776253515"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Jan 2024 01:55:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOajp-000AKA-1a;
	Sat, 13 Jan 2024 09:55:37 +0000
Date: Sat, 13 Jan 2024 17:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 4/6] platform/x86: dell-smo8800: Allow using the IIO
 st_accel driver
Message-ID: <202401131735.15ClIkvC-lkp@intel.com>
References: <20240106160935.45487-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240106160935.45487-5-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7]
[cannot apply to wsa/i2c/for-next next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/platform-x86-dell-smo8800-Change-probe-ordering-a-bit/20240107-001715
base:   linus/master
patch link:    https://lore.kernel.org/r/20240106160935.45487-5-hdegoede%40redhat.com
patch subject: [PATCH v2 4/6] platform/x86: dell-smo8800: Allow using the IIO st_accel driver
config: i386-randconfig-061-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131735.15ClIkvC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131735.15ClIkvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131735.15ClIkvC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/dell/dell-smo8800.c:162:28: sparse: sparse: symbol 'smo8800_accel_node' was not declared. Should it be static?

vim +/smo8800_accel_node +162 drivers/platform/x86/dell/dell-smo8800.c

   161	
 > 162	const struct software_node smo8800_accel_node = {
   163		.properties = smo8800_accel_props,
   164	};
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


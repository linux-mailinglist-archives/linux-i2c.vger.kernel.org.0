Return-Path: <linux-i2c+bounces-14611-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEB3CC52B5
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 22:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 523083015EEC
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 21:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE752FF164;
	Tue, 16 Dec 2025 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/f3NFlb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C92E1730;
	Tue, 16 Dec 2025 21:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765919106; cv=none; b=Z1O8ClnO7AroLAacIp1JBb/vnZH2lVjqY+cNWUySzE01hV49AyyvEZ/j5A1vFUvb6K8eTYfszWMP2Phyfrzi6OWTPG11p8ufpW7W7NxYkbaWaYYuL0nOEwipxxUX/Com9KuXMom+BZHGeSLvq34UBgyc9OIQmSnVvt+5XTaa4CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765919106; c=relaxed/simple;
	bh=m50UoVC8/9fEAe/1Qu+odA8aoUz1wiOqahaoXpJBqnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDEk3QlDxC8ESZa1luP33I7wskHjcAlH3wyCggKWPNg/FzJ1CfgbuvBZ8V7jRFT4/fr8W1TrMiHrHK+JHRhSn4lnO/onAwEGyAPAvDwJS6T/q0TcteyyDG35xP6Ov4kTdH0rfjQAv7HZzNGStHacz7qT1HrWUNlRUbd7dedTuOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/f3NFlb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765919103; x=1797455103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m50UoVC8/9fEAe/1Qu+odA8aoUz1wiOqahaoXpJBqnM=;
  b=H/f3NFlbyNinyGJ/uoNgfIuNVRM9fCprFhnIoqy691fyyClaZxjSRUWF
   ORhSM7I+POwE9tAfqb07DLIlb+zoLTIROPPe7cKTMSg3eKGct8tUc9Jld
   x3D2dIq6cHdLZtEO8PiunUNLYjIiVKyknXty9K2/LfPxk4PIpPD72TPwV
   ZYaoM1IzT0gqlQhfhZrfouM+yHMysC2Cc8cv0gGTzWLkvd+psuN2BvW50
   rHs2Elr1JmgRupnV05LD+CJCujAvnUPqPQAqZfx+YwaowTS70bF7SieAN
   5vBIKgABAXrCilx66kBHzQ6uWjvsGbR/yNZ4eky7uYe+t82nGdX2u6lWe
   A==;
X-CSE-ConnectionGUID: haq9KnCTRbyFCfLc0pQPaA==
X-CSE-MsgGUID: N5cG6PhrShW46zScT+ngsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85438741"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="85438741"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 13:05:03 -0800
X-CSE-ConnectionGUID: n9rpxK+7Q7OtdcvYNcshRw==
X-CSE-MsgGUID: VdcPtECHTj6qcd0QPMrIDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="198605094"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Dec 2025 13:05:00 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVcE6-000000003pI-0yvL;
	Tue, 16 Dec 2025 21:04:58 +0000
Date: Wed, 17 Dec 2025 05:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] i2c: designware: Combine the init functions
Message-ID: <202512170400.UH367tpF-lkp@intel.com>
References: <20251216131442.8464-5-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216131442.8464-5-heikki.krogerus@linux.intel.com>

Hi Heikki,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on next-20251216]
[cannot apply to linus/master v6.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heikki-Krogerus/i2c-designware-Remove-useless-driver-specific-option-for-I2C-target/20251216-213313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20251216131442.8464-5-heikki.krogerus%40linux.intel.com
patch subject: [PATCH v1 4/6] i2c: designware: Combine the init functions
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251217/202512170400.UH367tpF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170400.UH367tpF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170400.UH367tpF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-designware-amdisp.c:166:13: error: no member named 'init' in 'struct dw_i2c_dev'
     166 |         if (i_dev->init)
         |             ~~~~~  ^
   drivers/i2c/busses/i2c-designware-amdisp.c:167:10: error: no member named 'init' in 'struct dw_i2c_dev'
     167 |                 i_dev->init(i_dev);
         |                 ~~~~~  ^
   2 errors generated.


vim +166 drivers/i2c/busses/i2c-designware-amdisp.c

d6263c468a761c Pratap Nirujogi 2025-04-24  156  
d6263c468a761c Pratap Nirujogi 2025-04-24  157  static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
d6263c468a761c Pratap Nirujogi 2025-04-24  158  {
d6263c468a761c Pratap Nirujogi 2025-04-24  159  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
d6263c468a761c Pratap Nirujogi 2025-04-24  160  
d6263c468a761c Pratap Nirujogi 2025-04-24  161  	if (!i_dev)
d6263c468a761c Pratap Nirujogi 2025-04-24  162  		return -ENODEV;
d6263c468a761c Pratap Nirujogi 2025-04-24  163  
d6263c468a761c Pratap Nirujogi 2025-04-24  164  	if (!i_dev->shared_with_punit)
d6263c468a761c Pratap Nirujogi 2025-04-24  165  		i2c_dw_prepare_clk(i_dev, true);
d6263c468a761c Pratap Nirujogi 2025-04-24 @166  	if (i_dev->init)
d6263c468a761c Pratap Nirujogi 2025-04-24  167  		i_dev->init(i_dev);
d6263c468a761c Pratap Nirujogi 2025-04-24  168  
d6263c468a761c Pratap Nirujogi 2025-04-24  169  	return 0;
d6263c468a761c Pratap Nirujogi 2025-04-24  170  }
d6263c468a761c Pratap Nirujogi 2025-04-24  171  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


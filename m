Return-Path: <linux-i2c+bounces-1284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8310882CA87
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 09:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D84F285F26
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 08:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B8F7E6;
	Sat, 13 Jan 2024 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRkECRad"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0842E36F
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705135181; x=1736671181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2i0ZOuJjDp0FbI6r4xYwZP/tHctFN4Mjp2yL9vtwcUQ=;
  b=lRkECRadyjtDNeH6Ep08U9UtIdnzfVI7Sh6XzPnW4P815eFmSBoRqfZL
   R6xVSZk0FgoP+L3jqrWmYYP0U+BO+Z40BfFTdZ4U/PKvAI0cY1Jit4iKx
   2jT+imMJD/LTtd1m0sCYkPoVmg5GROx1sCcln5I3lOmRgxTTbEnguKn4Q
   NVGR8iWqrppSEcnw94oqIC5HOTDpZOekCaX87LGh6IGfnqq9mSy/YzFAz
   gMWOBPSxQ5te5rLCQ1TnMhBsI2wEpHBXy7DND8zIRxNddiIrg92QHmiq2
   7rln4MlX589GJnzrdwvC1lUDSd7z2WjqCW13CLmJSxEYBpVFAQKrnpUbH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="17966592"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="17966592"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 00:39:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="783280908"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="783280908"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Jan 2024 00:39:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOZYF-000AH6-2U;
	Sat, 13 Jan 2024 08:39:35 +0000
Date: Sat, 13 Jan 2024 16:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Peter Korsgaard <peter.korsgaard@barco.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/4] i2c: mux: add basic support for calling
 i2c_register_spd on muxed bus segments
Message-ID: <202401131601.Qe16pupf-lkp@intel.com>
References: <53e5c71a-d954-4211-91a1-de067451d532@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53e5c71a-d954-4211-91a1-de067451d532@gmail.com>

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on next-20240112]
[cannot apply to linus/master v6.7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/i2c-smbus-Prepare-i2c_register_spd-for-usage-on-muxed-segments/20240111-042152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/53e5c71a-d954-4211-91a1-de067451d532%40gmail.com
patch subject: [PATCH 2/4] i2c: mux: add basic support for calling i2c_register_spd on muxed bus segments
config: loongarch-randconfig-001-20240111 (https://download.01.org/0day-ci/archive/20240113/202401131601.Qe16pupf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131601.Qe16pupf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131601.Qe16pupf-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/i2c/i2c-mux.o: in function `.L155':
>> i2c-mux.c:(.text+0xc84): undefined reference to `i2c_register_spd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


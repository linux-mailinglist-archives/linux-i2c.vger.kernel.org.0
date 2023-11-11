Return-Path: <linux-i2c+bounces-70-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7387E891F
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 05:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 565332811DE
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 04:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD13C63C6;
	Sat, 11 Nov 2023 04:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtTJ7lWh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8111663BF
	for <linux-i2c@vger.kernel.org>; Sat, 11 Nov 2023 04:21:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D924B3868;
	Fri, 10 Nov 2023 20:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699676506; x=1731212506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h9G/SoSxJM0c36e1IBLxMCgcVwi5gqimQGFIgL0cVIc=;
  b=UtTJ7lWhftXExntR+bomgzha94thq+bJg3/XHU90FFSPrXY4LKw30a/6
   AFOE1CVJianCd8GjBzmZwQoJ2eRuqAyzWRkVwk2wd95FO+BL3i2tTrjzo
   6vF48VH2xKkVLgvoOr503Gcqkjdmiq8dswPR3cTUSMIDyEP5eV6tfXBAa
   lQ75XEN+V5RCt5uGtTJQeOjTBnqhaYiK5cJDZH3aibwi5C4PW+mgmPZuX
   KxWkVUk/STMEj+V7iWL+nozXxpkxhz9kJ4q6Kasz/owKEfmMYqkFDLM2w
   HI1GVQiujHKJNMEjzt+/evpc559pNdg8kRTeJ9VS/oEMurKMnykWj+SCE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375288943"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="375288943"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 20:21:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="854537651"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="854537651"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2023 20:21:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1fV7-000ACc-0I;
	Sat, 11 Nov 2023 04:21:41 +0000
Date: Sat, 11 Nov 2023 12:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 11/12] i2c: designware: Remove ->disable() callback
Message-ID: <202311111250.CfK3aPG4-lkp@intel.com>
References: <20231109182823.3531846-12-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109182823.3531846-12-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-designware-Replace-MODULE_ALIAS-with-MODULE_DEVICE_TABLE/20231110-040556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20231109182823.3531846-12-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 11/12] i2c: designware: Remove ->disable() callback
config: powerpc64-allmodconfig (https://download.01.org/0day-ci/archive/20231111/202311111250.CfK3aPG4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111250.CfK3aPG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111250.CfK3aPG4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-designware-slave.c:95:7: error: no member named 'disable' in 'struct dw_i2c_dev'
      95 |         dev->disable(dev);
         |         ~~~  ^
   1 error generated.


vim +95 drivers/i2c/busses/i2c-designware-slave.c

9f3e065c54b05b Luis Oliveira 2017-06-22   89  
9f3e065c54b05b Luis Oliveira 2017-06-22   90  static int i2c_dw_unreg_slave(struct i2c_client *slave)
9f3e065c54b05b Luis Oliveira 2017-06-22   91  {
9f3e065c54b05b Luis Oliveira 2017-06-22   92  	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
9f3e065c54b05b Luis Oliveira 2017-06-22   93  
fee61247b7f67a Jarkko Nikula 2022-11-07   94  	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
9f3e065c54b05b Luis Oliveira 2017-06-22  @95  	dev->disable(dev);
c486dcd2f1bbdd Jarkko Nikula 2019-08-15   96  	synchronize_irq(dev->irq);
9f3e065c54b05b Luis Oliveira 2017-06-22   97  	dev->slave = NULL;
2a86cdd2e7d3c7 Jarkko Nikula 2017-08-15   98  	pm_runtime_put(dev->dev);
9f3e065c54b05b Luis Oliveira 2017-06-22   99  
9f3e065c54b05b Luis Oliveira 2017-06-22  100  	return 0;
9f3e065c54b05b Luis Oliveira 2017-06-22  101  }
9f3e065c54b05b Luis Oliveira 2017-06-22  102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


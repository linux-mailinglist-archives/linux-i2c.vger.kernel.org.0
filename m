Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 069DC7E746F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 23:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbjKIWit (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 17:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345311AbjKIWis (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 17:38:48 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F034211;
        Thu,  9 Nov 2023 14:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699569526; x=1731105526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xUc3cOfVR8OgRqywfzWs66ac3FySUq37Xd+hFx2TDKA=;
  b=hwCtCXuy2KHM68jGblTnuV3htVfJTmr1UxKqKi43qY6TRlxjKiOs9hI1
   ImtqELf1CHVnvV43mtoiwrxYlhs1EoQ8aJzQFH1JZT/sS+ItEyFZN1ZyR
   PztjNvXSPQhczRIyxa8OEWEBsgJMW8QUlQsHCT6NwdZSLs+CMRRuVrWM/
   ZIIy0IJPXUEx6MJCVa5QrpSfprdDKFuD5WmVLk9db4PVBTZW0Riix4x3e
   QoF+LwtCK+zvSkRBgbmcFc5xSfbRDV2qh1KNOxlXqEB+qK0niLNunSjsu
   SBSmTCaqsb/JLMmaMaO4VTowSx4FNnIylHOhFMgUNYWVRBoBmyXkatkXs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3068535"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="3068535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:38:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="4678255"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Nov 2023 14:38:42 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r1Dfc-0009DW-0V;
        Thu, 09 Nov 2023 22:38:40 +0000
Date:   Fri, 10 Nov 2023 06:38:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 11/12] i2c: designware: Remove ->disable() callback
Message-ID: <202311100640.B5B7MhDJ-lkp@intel.com>
References: <20231109182823.3531846-12-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109182823.3531846-12-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.6 next-20231109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-designware-Replace-MODULE_ALIAS-with-MODULE_DEVICE_TABLE/20231110-040556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20231109182823.3531846-12-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 11/12] i2c: designware: Remove ->disable() callback
config: arc-randconfig-002-20231110 (https://download.01.org/0day-ci/archive/20231110/202311100640.B5B7MhDJ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100640.B5B7MhDJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100640.B5B7MhDJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-designware-slave.c: In function 'i2c_dw_unreg_slave':
>> drivers/i2c/busses/i2c-designware-slave.c:95:12: error: 'struct dw_i2c_dev' has no member named 'disable'
      95 |         dev->disable(dev);
         |            ^~


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

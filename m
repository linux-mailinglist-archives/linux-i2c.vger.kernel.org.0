Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECC275DD15
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 17:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjGVPJX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 11:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjGVPJW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 11:09:22 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402BC1FF9;
        Sat, 22 Jul 2023 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690038560; x=1721574560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tP0c6UT1JUEzDEMg01H9+yYjfoMtWTAGuC2DlrbRxOU=;
  b=AtFcxLwS/heBgoOeGwccjwN3iKY2e3vZVP2YtLEqTEBXWnSO8rCuLYxR
   HteToGY6BcwxtgYiwYfOWijFHNnH+HE+yUxwiHiF64APBYfSDSYqeExQ/
   HlkS6djSjWtslTVekLsqlfpOELyiB15JR/FKUeqqxtBUISJ01TMC+NqC6
   c04+rH3G2Afu/J/a2Q3wvZzIFmf5pl6v09CUEK9rX2mo29777Jyrpw+wO
   41Lhyz0xFfMY6Xe6WVpaC2Tme47I5L3uzPq5Vgnehvhupdd7e4auroPir
   aK+8kUlKSdAw/HHn3Aodd1L06R12fDAJ4rQk5VAqBSxEMEZ0+i57Ya28U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="357195982"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="357195982"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 08:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="795301223"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="795301223"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2023 08:09:18 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qNEE8-0008Om-33;
        Sat, 22 Jul 2023 15:09:13 +0000
Date:   Sat, 22 Jul 2023 23:07:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Conghui Chen <conghui.chen@intel.com>,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 21/22] i2c: virtio: Remove #ifdef guards for PM
 related functions
Message-ID: <202307222246.K1GYOGCB-lkp@intel.com>
References: <20230722115310.27681-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722115310.27681-5-paul@crapouillou.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on brgl/gpio/for-next krzk/for-next linus/master v6.5-rc2 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/i2c-au1550-Remove-ifdef-guards-for-PM-related-functions/20230722-200209
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230722115310.27681-5-paul%40crapouillou.net
patch subject: [PATCH v2 21/22] i2c: virtio: Remove #ifdef guards for PM related functions
config: i386-randconfig-r015-20230722 (https://download.01.org/0day-ci/archive/20230722/202307222246.K1GYOGCB-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307222246.K1GYOGCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307222246.K1GYOGCB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-virtio.c:270:3: error: field designator 'freeze' does not refer to any field in type 'struct virtio_driver'
           .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
            ^
>> drivers/i2c/busses/i2c-virtio.c:271:3: error: field designator 'restore' does not refer to any field in type 'struct virtio_driver'
           .restore                = pm_sleep_ptr(virtio_i2c_restore),
            ^
   2 errors generated.


vim +270 drivers/i2c/busses/i2c-virtio.c

   260	
   261	static struct virtio_driver virtio_i2c_driver = {
   262		.feature_table		= features,
   263		.feature_table_size	= ARRAY_SIZE(features),
   264		.id_table		= id_table,
   265		.probe			= virtio_i2c_probe,
   266		.remove			= virtio_i2c_remove,
   267		.driver			= {
   268			.name	= "i2c_virtio",
   269		},
 > 270		.freeze			= pm_sleep_ptr(virtio_i2c_freeze),
 > 271		.restore		= pm_sleep_ptr(virtio_i2c_restore),
   272	};
   273	module_virtio_driver(virtio_i2c_driver);
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

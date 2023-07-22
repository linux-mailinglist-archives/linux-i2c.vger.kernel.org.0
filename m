Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66AB175DCCA
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 15:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjGVN4l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 09:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGVN4k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 09:56:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488012123;
        Sat, 22 Jul 2023 06:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690034198; x=1721570198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nHyhMPJKOgXTUO1lo0p0WSvzeDMvcnV3MG6JVLZqsV4=;
  b=YIj6do05k1lGJxGcRISN6cJMXAID9g7grmd6tQzzcyuVx5eUXzTsYEoQ
   uplqas5C5Rf6HCIiBOFPMSmzwR9aaVXw/fOEtLHSClhNyNWrSh7KIZYH6
   /alktfE8HYnJDCKzTQRGx51f+0G4WfkleIJnXEOBsIoWr2vKfHULRxJYH
   45TfwjouhEo/CkX/EF0FsMhA9GwkS/JM/MYWPIt/I1zgyXnIohH9GN/R0
   lhbJy8x6f1RGSqE3tHI+z+0HH/CPgp7/LoLGRY39ef8XZe9wxW/0nY7bF
   RCQrcc1Mq+Qld6ucWyRKoCKcR9r22BMptWKYQSJ9Jaenrpo1AEDSoBa/d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="367223264"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="367223264"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 06:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="702357356"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="702357356"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 22 Jul 2023 06:56:34 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qND4d-0008Lp-2z;
        Sat, 22 Jul 2023 13:56:03 +0000
Date:   Sat, 22 Jul 2023 21:55:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Conghui Chen <conghui.chen@intel.com>,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 21/22] i2c: virtio: Remove #ifdef guards for PM
 related functions
Message-ID: <202307222129.Q7WjPurG-lkp@intel.com>
References: <20230722115310.27681-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722115310.27681-5-paul@crapouillou.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
config: nios2-randconfig-r005-20230722 (https://download.01.org/0day-ci/archive/20230722/202307222129.Q7WjPurG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307222129.Q7WjPurG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307222129.Q7WjPurG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-virtio.c:270:10: error: 'struct virtio_driver' has no member named 'freeze'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |          ^~~~~~
   In file included from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/i2c/busses/i2c-virtio.c:11:
>> include/linux/kernel.h:58:33: error: initialization of 'const struct virtio_device_id *' from incompatible pointer type 'int (*)(struct virtio_device *)' [-Werror=incompatible-pointer-types]
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:270:35: note: in expansion of macro 'pm_sleep_ptr'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: note: (near initialization for 'virtio_i2c_driver.id_table')
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:270:35: note: in expansion of macro 'pm_sleep_ptr'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: warning: initialized field overwritten [-Woverride-init]
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:270:35: note: in expansion of macro 'pm_sleep_ptr'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: note: (near initialization for 'virtio_i2c_driver.id_table')
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:270:35: note: in expansion of macro 'pm_sleep_ptr'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |                                   ^~~~~~~~~~~~
>> drivers/i2c/busses/i2c-virtio.c:271:10: error: 'struct virtio_driver' has no member named 'restore'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |          ^~~~~~~
>> include/linux/kernel.h:58:33: error: initialization of 'const unsigned int *' from incompatible pointer type 'int (*)(struct virtio_device *)' [-Werror=incompatible-pointer-types]
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:271:35: note: in expansion of macro 'pm_sleep_ptr'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: note: (near initialization for 'virtio_i2c_driver.feature_table')
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:271:35: note: in expansion of macro 'pm_sleep_ptr'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: warning: initialized field overwritten [-Woverride-init]
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:271:35: note: in expansion of macro 'pm_sleep_ptr'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: note: (near initialization for 'virtio_i2c_driver.feature_table')
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:271:35: note: in expansion of macro 'pm_sleep_ptr'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |                                   ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


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

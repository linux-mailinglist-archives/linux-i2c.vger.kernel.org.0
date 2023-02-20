Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D2469C3DB
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Feb 2023 02:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjBTBB7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Feb 2023 20:01:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjBTBB6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Feb 2023 20:01:58 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE06AD52C;
        Sun, 19 Feb 2023 17:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676854917; x=1708390917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZzntQ3V7u7adDDspP52ftt0OsOPYSqFBr5Qb62NUZuE=;
  b=ExNTsluAk+QWn0XkIbDp4JqGUYLRGbVryu7Zyh148tE66e9xEBBSDef0
   KYM239QKcQGwVDWjTCyk60Q/N9pOFwQZhUAlucvV4Ylb6wng+hYniMqmx
   J0UJMraZxqlMNaSMbdXramWuxls1DdOn2TFF+CtB85NXCM7izeFNjYWQI
   9bux+cJ8a2JNrqXwFk6tdU9F52ORrEDOpPhJ9TlU0iR0aV19oISLIaFXt
   N1FCDpi7JtK7hfbamBDta6LlHZnaamWY1dhysyUqSy+jQUdulYjGE4OiZ
   wK2s4nEks1jbOEJbCxve0jqPpMX38L1ov4+qm+M/Nu8uXrwKfvdHeGYh8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="359763573"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="359763573"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 17:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="795012209"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="795012209"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Feb 2023 17:01:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pTuYx-000DWR-1Y;
        Mon, 20 Feb 2023 01:01:51 +0000
Date:   Mon, 20 Feb 2023 09:00:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ye Xiang <xiang.ye@intel.com>, Lee Jones <lee@kernel.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: Re: [PATCH 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Message-ID: <202302200820.aUaMtEFR-lkp@intel.com>
References: <20230219183059.1029525-3-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219183059.1029525-3-xiang.ye@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes wsa/i2c/for-next broonie-spi/for-next linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Xiang/mfd-Add-support-for-Intel-LJCA-device/20230220-023253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230219183059.1029525-3-xiang.ye%40intel.com
patch subject: [PATCH 2/5] gpio: Add support for Intel LJCA USB GPIO driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230220/202302200820.aUaMtEFR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/ddd4f4ee32eff2fd7cb9933efdc8966d58894160
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ye-Xiang/mfd-Add-support-for-Intel-LJCA-device/20230220-023253
        git checkout ddd4f4ee32eff2fd7cb9933efdc8966d58894160
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200820.aUaMtEFR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-ljca.c:436:40: warning: 'ljca_gpio_id' defined but not used [-Wunused-const-variable=]
     436 | static const struct platform_device_id ljca_gpio_id[] = {
         |                                        ^~~~~~~~~~~~


vim +/ljca_gpio_id +436 drivers/gpio/gpio-ljca.c

   434	
   435	#define LJCA_GPIO_DRV_NAME "ljca-gpio"
 > 436	static const struct platform_device_id ljca_gpio_id[] = {
   437		{ LJCA_GPIO_DRV_NAME, 0 },
   438		{ /* sentinel */ }
   439	};
   440	MODULE_DEVICE_TABLE(platform, ljca_gpio_id);
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

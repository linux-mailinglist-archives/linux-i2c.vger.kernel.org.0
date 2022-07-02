Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26682564129
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 17:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbiGBPmH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Jul 2022 11:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiGBPmE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Jul 2022 11:42:04 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AC9DF73;
        Sat,  2 Jul 2022 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656776524; x=1688312524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RJFVLls1EjQPmPr7lVOwXw4XeaewzMH8z3gqTFR/nI4=;
  b=I6R0MrrGBH+aqiJZdi2wVeGIZhFF0QE7M1bvbotTz2vJMeO2LP96EDF+
   WoU1E9AFwkIc5QW+72ktt0hwp8MaVu3oV6eiUfRPa0+y4GwLo51vJ/GgF
   gpwnjsG6vP2ovpgkq1+5GXPf7nLQn2ZeuPSxvWmETmhIPdtPjqA9s/yHm
   ph8sPJlEJd36CuJU4413O1/Ll4a1YfXvsjAF2bz6omvOpm611Tr0xGSJy
   FsMOkgxDE++09fc4cBW3hK66auh+djBY+RSva0maTMEk9u4ddA/WmWbsv
   7TxKvYL4Wzc7P9qApPvVYddlnSAgT7xZ4EaXkA3Kr0WZRkVGop3m9LMMf
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282875420"
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="282875420"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 08:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="624590982"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Jul 2022 08:41:59 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o7fFu-000FN5-H6;
        Sat, 02 Jul 2022 15:41:58 +0000
Date:   Sat, 2 Jul 2022 23:41:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Till Harbaum <till@harbaum.org>
Subject: Re: [PATCH v1 2/2] i2c: Introduce i2c_str_read_write() and make use
 of it
Message-ID: <202207022332.6xTWZbw8-lkp@intel.com>
References: <20220702135925.73406-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702135925.73406-2-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v5.19-rc4 next-20220701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/lib-string_helpers-Add-str_read_write-helper/20220702-215944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: mips-buildonly-randconfig-r002-20220702 (https://download.01.org/0day-ci/archive/20220702/202207022332.6xTWZbw8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bcd153485ebf07fe79e2b843ed5f1cb74997df1b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c9ef15ef6b2b2b51d33d68a8b92beb05771cc8c2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/lib-string_helpers-Add-str_read_write-helper/20220702-215944
        git checkout c9ef15ef6b2b2b51d33d68a8b92beb05771cc8c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-exynos5.c:747:4: error: unterminated function-like macro invocation
                           dev_warn(i2c->dev, "%s timeout\n", i2c_str_read_write(msgs);
                           ^
   include/linux/dev_printk.h:145:9: note: macro 'dev_warn' defined here
   #define dev_warn(dev, fmt, ...) \
           ^
>> drivers/i2c/busses/i2c-exynos5.c:960:26: error: expected expression
   MODULE_LICENSE("GPL v2");
                            ^
>> drivers/i2c/busses/i2c-exynos5.c:960:26: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
   drivers/i2c/busses/i2c-exynos5.c:746:3: note: previous statement is here
                   if (ret == -ETIMEDOUT)
                   ^
>> drivers/i2c/busses/i2c-exynos5.c:960:26: error: expected '}'
   MODULE_LICENSE("GPL v2");
                            ^
   drivers/i2c/busses/i2c-exynos5.c:744:15: note: to match this '{'
           if (ret < 0) {
                        ^
>> drivers/i2c/busses/i2c-exynos5.c:960:26: error: expected '}'
   MODULE_LICENSE("GPL v2");
                            ^
   drivers/i2c/busses/i2c-exynos5.c:718:1: note: to match this '{'
   {
   ^
   1 warning and 4 errors generated.


vim +747 drivers/i2c/busses/i2c-exynos5.c

   715	
   716	static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
   717				      struct i2c_msg *msgs, int stop)
   718	{
   719		unsigned long timeout;
   720		int ret;
   721	
   722		i2c->msg = msgs;
   723		i2c->msg_ptr = 0;
   724		i2c->trans_done = 0;
   725	
   726		reinit_completion(&i2c->msg_complete);
   727	
   728		exynos5_i2c_message_start(i2c, stop);
   729	
   730		timeout = wait_for_completion_timeout(&i2c->msg_complete,
   731						      EXYNOS5_I2C_TIMEOUT);
   732		if (timeout == 0)
   733			ret = -ETIMEDOUT;
   734		else
   735			ret = i2c->state;
   736	
   737		/*
   738		 * If this is the last message to be transfered (stop == 1)
   739		 * Then check if the bus can be brought back to idle.
   740		 */
   741		if (ret == 0 && stop)
   742			ret = exynos5_i2c_wait_bus_idle(i2c);
   743	
   744		if (ret < 0) {
   745			exynos5_i2c_reset(i2c);
   746			if (ret == -ETIMEDOUT)
 > 747				dev_warn(i2c->dev, "%s timeout\n", i2c_str_read_write(msgs);
   748		}
   749	
   750		/* Return the state as in interrupt routine */
   751		return ret;
   752	}
   753	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

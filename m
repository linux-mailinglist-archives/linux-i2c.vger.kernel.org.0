Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90524564153
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 18:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbiGBQNG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Jul 2022 12:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbiGBQNG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Jul 2022 12:13:06 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C04EE0A;
        Sat,  2 Jul 2022 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656778385; x=1688314385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oLFv5d9cpgU3oUv0ZYDAaDF+gUv+7iXr9g5H3SS0Y7o=;
  b=TWFdxaFPL0CrywNFO7fnngdl8LzxMkffxlGC6zr3ynZBK9Meb8uQV+lK
   h5yyFBv2ljcdtq+EAGcg7H3jwCxoOPyws/DefDvgrsGUVAAfbHZWZQsBi
   ++FmxRI5HepUr9IH4ed75vPV5iKE+QHBPRiOLaHKkxqBUOGGJpRqSd876
   jGYni1E55W92F/FtH/yER+cfOjjtbirbO/7c0plWW2Gd/0EnwV3F5mv0f
   5fPMAG28v/PaMmV+FiGuZis5lSuhPnMZJC2j269AZSZhB6FevtFD5+DbF
   soHst6Hl6VDIUWsuh2GBgTux7cNFMBSTJh8PAQySvY6LmKGNXfifPpBNG
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="344530083"
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="344530083"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 09:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="624596293"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Jul 2022 09:13:00 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o7fjv-000FOZ-Qi;
        Sat, 02 Jul 2022 16:12:59 +0000
Date:   Sun, 3 Jul 2022 00:12:43 +0800
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
Cc:     kbuild-all@lists.01.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Till Harbaum <till@harbaum.org>
Subject: Re: [PATCH v1 2/2] i2c: Introduce i2c_str_read_write() and make use
 of it
Message-ID: <202207030039.I3q472GJ-lkp@intel.com>
References: <20220702135925.73406-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702135925.73406-2-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
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
config: arc-randconfig-r043-20220702 (https://download.01.org/0day-ci/archive/20220703/202207030039.I3q472GJ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c9ef15ef6b2b2b51d33d68a8b92beb05771cc8c2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/lib-string_helpers-Add-str_read_write-helper/20220702-215944
        git checkout c9ef15ef6b2b2b51d33d68a8b92beb05771cc8c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-exynos5.c: In function 'exynos5_i2c_xfer_msg':
>> drivers/i2c/busses/i2c-exynos5.c:960:26: error: unterminated argument list invoking macro "dev_warn"
     960 | MODULE_LICENSE("GPL v2");
         |                          ^
>> drivers/i2c/busses/i2c-exynos5.c:747:25: error: 'dev_warn' undeclared (first use in this function); did you mean '_dev_warn'?
     747 |                         dev_warn(i2c->dev, "%s timeout\n", i2c_str_read_write(msgs);
         |                         ^~~~~~~~
         |                         _dev_warn
   drivers/i2c/busses/i2c-exynos5.c:747:25: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/i2c/busses/i2c-exynos5.c:747:33: error: expected ';' at end of input
     747 |                         dev_warn(i2c->dev, "%s timeout\n", i2c_str_read_write(msgs);
         |                                 ^
         |                                 ;
   ......
   drivers/i2c/busses/i2c-exynos5.c:746:17: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     746 |                 if (ret == -ETIMEDOUT)
         |                 ^~
   drivers/i2c/busses/i2c-exynos5.c:746:17: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> drivers/i2c/busses/i2c-exynos5.c:747:25: error: expected declaration or statement at end of input
     747 |                         dev_warn(i2c->dev, "%s timeout\n", i2c_str_read_write(msgs);
         |                         ^~~~~~~~
>> drivers/i2c/busses/i2c-exynos5.c:747:25: error: expected declaration or statement at end of input
   drivers/i2c/busses/i2c-exynos5.c:747:25: error: no return statement in function returning non-void [-Werror=return-type]
   At top level:
   drivers/i2c/busses/i2c-exynos5.c:716:12: warning: 'exynos5_i2c_xfer_msg' defined but not used [-Wunused-function]
     716 | static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-exynos5.c:445:20: warning: 'exynos5_i2c_irq' defined but not used [-Wunused-function]
     445 | static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
         |                    ^~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-exynos5.c:240:34: warning: 'exynos5_i2c_match' defined but not used [-Wunused-const-variable=]
     240 | static const struct of_device_id exynos5_i2c_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dev_warn +960 drivers/i2c/busses/i2c-exynos5.c

8a73cd4cfa1599 Naveen Krishna Ch 2013-10-16  956  
8a73cd4cfa1599 Naveen Krishna Ch 2013-10-16  957  MODULE_DESCRIPTION("Exynos5 HS-I2C Bus driver");
d790eeb3db6aef Jean Delvare      2020-06-11  958  MODULE_AUTHOR("Naveen Krishna Chatradhi <ch.naveen@samsung.com>");
d790eeb3db6aef Jean Delvare      2020-06-11  959  MODULE_AUTHOR("Taekgyun Ko <taeggyun.ko@samsung.com>");
8a73cd4cfa1599 Naveen Krishna Ch 2013-10-16 @960  MODULE_LICENSE("GPL v2");

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 331E86B3FA0
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 13:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjCJMsZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 07:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjCJMsY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 07:48:24 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DB075A61;
        Fri, 10 Mar 2023 04:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678452503; x=1709988503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U81uRxesHe8eFauiEOy3i19Qhk4z3KVhUPplxSsaCUQ=;
  b=MlUrGOSS/a+KtTjXq3mVmboMx/Ko1dznMhbA1s5mF0J+nZTeNoHEi9u1
   l3QzYrEX91eiUpHSYaPHlwD3gVlilZi7PAoxMvsubwCY3xb+m/MPpgUSz
   TSJ9ftNfsRdEKP4Sb7cc1h8ewog+nFdyTmV0ToFSqIQLP0ZFyNv0UlM2p
   7Is++wIe/ynd05egDo91VZiyFtGBEs2oioZocWhxq+nGAPa7aEoGAwKo8
   7eCM07r9Ge9V3UckBPkTHpDaSJzl/y8ZwifQ9xa2ypViVyRVQFPgPcGjl
   DgW4iU3uDNo96HAnhQSRVq5kXy7s3ipSf2d8oQmI6R9PKMm9TOYtCFjAP
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="334195762"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="334195762"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 04:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746700777"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="746700777"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Mar 2023 04:48:19 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pacAU-0003rj-2h;
        Fri, 10 Mar 2023 12:48:18 +0000
Date:   Fri, 10 Mar 2023 20:47:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: lpi2c: cache peripheral clock rate
Message-ID: <202303102026.xZsE7TNu-lkp@intel.com>
References: <20230310112605.476922-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310112605.476922-1-alexander.sverdlin@siemens.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sverdlin,

I love your patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/A-Sverdlin/i2c-lpi2c-cache-peripheral-clock-rate/20230310-192720
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230310112605.476922-1-alexander.sverdlin%40siemens.com
patch subject: [PATCH v2] i2c: lpi2c: cache peripheral clock rate
config: arm64-buildonly-randconfig-r002-20230310 (https://download.01.org/0day-ci/archive/20230310/202303102026.xZsE7TNu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/aa3870869fbb164ebdc12f412c07c66f1d7cdf2d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review A-Sverdlin/i2c-lpi2c-cache-peripheral-clock-rate/20230310-192720
        git checkout aa3870869fbb164ebdc12f412c07c66f1d7cdf2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102026.xZsE7TNu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-imx-lpi2c.c:209:10: error: no member named 'clk_per' in 'struct lpi2c_imx_struct'
                                                             clk_per);
                                                             ^~~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
           static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:74: note: expanded from macro '__same_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                            ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
>> drivers/i2c/busses/i2c-imx-lpi2c.c:207:39: error: no member named 'clk_per' in 'lpi2c_imx_struct'
           struct lpi2c_imx_struct *lpi2c_imx = container_of(&ndata->clk,
                                                ^
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
           ((type *)(__mptr - offsetof(type, member))); })
                              ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
>> drivers/i2c/busses/i2c-imx-lpi2c.c:207:27: error: initializing 'struct lpi2c_imx_struct *' with an expression of incompatible type 'void'
           struct lpi2c_imx_struct *lpi2c_imx = container_of(&ndata->clk,
                                    ^           ~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +209 drivers/i2c/busses/i2c-imx-lpi2c.c

   202	
   203	static int lpi2c_imx_clk_change_cb(struct notifier_block *nb,
   204					   unsigned long action, void *data)
   205	{
   206		struct clk_notifier_data *ndata = data;
 > 207		struct lpi2c_imx_struct *lpi2c_imx = container_of(&ndata->clk,
   208								  struct lpi2c_imx_struct,
 > 209								  clk_per);
   210	
   211		if (action & POST_RATE_CHANGE)
   212			lpi2c_imx->rate_per = ndata->new_rate;
   213	
   214		return NOTIFY_OK;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

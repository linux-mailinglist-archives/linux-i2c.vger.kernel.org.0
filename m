Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613E06B3F7F
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 13:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCJMi4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 07:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbjCJMim (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 07:38:42 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD089CFE5;
        Fri, 10 Mar 2023 04:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678451920; x=1709987920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YFjZ4xuw3jTBbMn8svNVgNQAxvan7uGVBJa480UAULU=;
  b=Iw4C6EiLYdxYAXxVR3XYq6pFfSnuEnZyANQGLaQYO7dRUyuFPvGnfEND
   oDtqRKMmKstuduGWLH1jIK379UKQgv9a+A+HWcvqqyV7apxL97Sxve4/3
   T73/O0DZ42GbpgGqoBnKqWOAXov77VdF2Jla28yWoVA/fPuNBKhGLtz0H
   wb4QPAbwIuKfQh+wFEmF0qTbVEg+vdYTWqzn4Ye2r2e5bVUPj5p6mj/ru
   bKs+ymMOs7lxTFF31s0QtGR1d/kHspLyiJm5zSUu95k7/Pvfo8ZlH63r3
   7P6ZKVvg4LmGtwa0gitYf/0ZIr9kk2CF8flHNSZaeAuEIodPjUbXIm/6T
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422985399"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="422985399"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 04:38:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="851901075"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="851901075"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 04:38:19 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pac0o-0003rD-1e;
        Fri, 10 Mar 2023 12:38:18 +0000
Date:   Fri, 10 Mar 2023 20:37:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: lpi2c: cache peripheral clock rate
Message-ID: <202303102010.pAv56wKs-lkp@intel.com>
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
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230310/202303102010.pAv56wKs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aa3870869fbb164ebdc12f412c07c66f1d7cdf2d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review A-Sverdlin/i2c-lpi2c-cache-peripheral-clock-rate/20230310-192720
        git checkout aa3870869fbb164ebdc12f412c07c66f1d7cdf2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102010.pAv56wKs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from include/linux/clk.h:13,
                    from drivers/i2c/busses/i2c-imx-lpi2c.c:8:
   drivers/i2c/busses/i2c-imx-lpi2c.c: In function 'lpi2c_imx_clk_change_cb':
>> include/linux/container_of.h:20:54: error: 'struct lpi2c_imx_struct' has no member named 'clk_per'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/i2c/busses/i2c-imx-lpi2c.c:207:46: note: in expansion of macro 'container_of'
     207 |         struct lpi2c_imx_struct *lpi2c_imx = container_of(&ndata->clk,
         |                                              ^~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/i2c/busses/i2c-imx-lpi2c.c:207:46: note: in expansion of macro 'container_of'
     207 |         struct lpi2c_imx_struct *lpi2c_imx = container_of(&ndata->clk,
         |                                              ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/riscv/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/err.h:5,
                    from include/linux/clk.h:12:
>> include/linux/stddef.h:16:33: error: 'struct lpi2c_imx_struct' has no member named 'clk_per'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/i2c/busses/i2c-imx-lpi2c.c:207:46: note: in expansion of macro 'container_of'
     207 |         struct lpi2c_imx_struct *lpi2c_imx = container_of(&ndata->clk,
         |                                              ^~~~~~~~~~~~


vim +20 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
7376e561fd2e01 Sakari Ailus     2022-10-24  16   * WARNING: any const qualifier of @ptr is lost.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  17   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  18  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  19  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08 @20  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  21  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  22  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  24  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

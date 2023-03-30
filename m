Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1FF6D0CFF
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 19:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbjC3RkI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 13:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjC3RkH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 13:40:07 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78F1E068;
        Thu, 30 Mar 2023 10:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680198007; x=1711734007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sqgOwOsqqyepaLfZuCrGHGV3YpOJJxs0Oj6uM3Ok6mI=;
  b=IdQ7+uNDhgwZNpmMpPopIOggggVhjXXciSJaXG6GR9Sx8HWD/Q8p5Fiz
   UWreJ7kTPfPCy68peKpXBepBaO4CMDYFIrEfVr6Sf50E6eU5nMRVKtKEZ
   o6ZKu7X7d4uo2eOnXQjI00xaR96UAFWvDJdxnerGgLPFsd1aAhFW9SWPh
   KtgMGgkJDOPGnsZRv/zpwbNSMQHiZStHrCUxuCCJreaKnKNzgyWn2yALq
   V3nnk0CCAnkP4qnLPj4I18jlHYTudTZqMrXEsSvfJV/2nndzY9dLyqwRf
   vGIBbyD4SrYEGNG6/Cc3e0MUClxW0EGJMmglis7sJAQwA6hScLOXSD3F8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343736487"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="343736487"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 10:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="808739829"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="808739829"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Mar 2023 10:40:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1phwFn-000L3Y-0c;
        Thu, 30 Mar 2023 17:40:03 +0000
Date:   Fri, 31 Mar 2023 01:39:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Piyush Malgujar <pmalgujar@marvell.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org, rric@kernel.org
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        jannadurai@marvell.com, cchavva@marvell.com,
        Suneel Garapati <sgarapati@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: Re: [PATCH 2/3] i2c: thunderx: Add support for High speed mode
Message-ID: <202303310153.yx2xXH8s-lkp@intel.com>
References: <20230330133953.21074-3-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330133953.21074-3-pmalgujar@marvell.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Piyush,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Piyush-Malgujar/i2c-thunderx-Clock-divisor-logic-changes/20230330-214626
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230330133953.21074-3-pmalgujar%40marvell.com
patch subject: [PATCH 2/3] i2c: thunderx: Add support for High speed mode
config: riscv-randconfig-r042-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310153.yx2xXH8s-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c7866465c9142bf77cc1bc651704bfbfc9b0b411
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Piyush-Malgujar/i2c-thunderx-Clock-divisor-logic-changes/20230330-214626
        git checkout c7866465c9142bf77cc1bc651704bfbfc9b0b411
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310153.yx2xXH8s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-octeon-core.c:74:5: error: call to undeclared function '__udelay'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                   __udelay(1);
                                   ^
   drivers/i2c/busses/i2c-octeon-core.c:74:5: note: did you mean '__delay'?
   arch/riscv/include/asm/delay.h:18:13: note: '__delay' declared here
   extern void __delay(unsigned long cycles);
               ^
   1 error generated.


vim +/__udelay +74 drivers/i2c/busses/i2c-octeon-core.c

    39	
    40	/**
    41	 * octeon_i2c_wait - wait for the IFLG to be set
    42	 * @i2c: The struct octeon_i2c
    43	 *
    44	 * Returns 0 on success, otherwise a negative errno.
    45	 */
    46	static int octeon_i2c_wait(struct octeon_i2c *i2c)
    47	{
    48		long time_left;
    49	
    50		/*
    51		 * Some chip revisions don't assert the irq in the interrupt
    52		 * controller. So we must poll for the IFLG change.
    53		 */
    54		if (i2c->broken_irq_mode) {
    55			u64 end = get_jiffies_64() + i2c->adap.timeout;
    56	
    57			while (!octeon_i2c_test_iflg(i2c) &&
    58			       time_before64(get_jiffies_64(), end))
    59				usleep_range(I2C_OCTEON_EVENT_WAIT / 2, I2C_OCTEON_EVENT_WAIT);
    60	
    61			return octeon_i2c_test_iflg(i2c) ? 0 : -ETIMEDOUT;
    62		}
    63	
    64		if (IS_LS_FREQ(i2c->twsi_freq)) {
    65			i2c->int_enable(i2c);
    66			time_left = wait_event_timeout(i2c->queue,
    67						       octeon_i2c_test_iflg(i2c),
    68						       i2c->adap.timeout);
    69			i2c->int_disable(i2c);
    70		} else {
    71			time_left = 1000; /* 1ms */
    72			do {
    73				if (time_left--)
  > 74					__udelay(1);
    75			} while (!octeon_i2c_test_iflg(i2c) && time_left);
    76		}
    77	
    78		if (i2c->broken_irq_check && !time_left &&
    79		    octeon_i2c_test_iflg(i2c)) {
    80			dev_err(i2c->dev, "broken irq connection detected, switching to polling mode.\n");
    81			i2c->broken_irq_mode = true;
    82			return 0;
    83		}
    84	
    85		if (!time_left)
    86			return -ETIMEDOUT;
    87	
    88		return 0;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

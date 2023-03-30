Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65E696D0A4F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 17:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233357AbjC3Prv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 11:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjC3Prs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 11:47:48 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E7172A2;
        Thu, 30 Mar 2023 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680191242; x=1711727242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q8GGSSC9IgvYkYidGzOlvszoR7bmj25UccgsVJ2KLcI=;
  b=VGwGkPxL+gGNowWR3Tw4MLzr9vcEMvh2Ep+91cI/2Zf8TD/EwIgRQLiv
   0D0Y+3ipZ/67DDJNZDP+K8/ywOLWYbgRHpYexhFl7/LH8XNSjiYygTwG6
   hTJzOUALEGsmL1xnkmYwrPwbqB/loNiUVAVFDBnRDD/2/33FobDy9NTF2
   YurX1DSrTzSu+F1QcllXO8Vi3yN78CJHRnfSago8P5BkqVdPKJizAj6Au
   pIGTV6WgP3dKYsHgFuCHqRm4Nvf8q0RLsp6YpnCbQf4b0aGeRC+g5u3Hq
   +VT0VEiEBNC0wqHTCmVRc6wM+KFWcZLy9vJ9T/mp6vcCJSxnScHORDrNx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406199207"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="406199207"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 08:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662070385"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="662070385"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Mar 2023 08:46:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1phuUN-000Ky0-0i;
        Thu, 30 Mar 2023 15:46:59 +0000
Date:   Thu, 30 Mar 2023 23:46:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Piyush Malgujar <pmalgujar@marvell.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org, rric@kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, jannadurai@marvell.com,
        cchavva@marvell.com, Suneel Garapati <sgarapati@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: Re: [PATCH 2/3] i2c: thunderx: Add support for High speed mode
Message-ID: <202303302309.SSHrlrqN-lkp@intel.com>
References: <20230330133953.21074-3-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330133953.21074-3-pmalgujar@marvell.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
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
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230330/202303302309.SSHrlrqN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c7866465c9142bf77cc1bc651704bfbfc9b0b411
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Piyush-Malgujar/i2c-thunderx-Clock-divisor-logic-changes/20230330-214626
        git checkout c7866465c9142bf77cc1bc651704bfbfc9b0b411
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303302309.SSHrlrqN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-octeon-core.c: In function 'octeon_i2c_wait':
>> drivers/i2c/busses/i2c-octeon-core.c:74:33: error: implicit declaration of function '__udelay'; did you mean '__delay'? [-Werror=implicit-function-declaration]
      74 |                                 __udelay(1);
         |                                 ^~~~~~~~
         |                                 __delay
   cc1: some warnings being treated as errors


vim +74 drivers/i2c/busses/i2c-octeon-core.c

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

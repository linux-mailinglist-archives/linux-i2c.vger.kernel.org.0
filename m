Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0306B7927EB
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjIEQUF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353754AbjIEHxG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 03:53:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3024CC;
        Tue,  5 Sep 2023 00:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693900383; x=1725436383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AnzlJ/ONUPwEn3gpEL9v0QBU/P1wozxQo+07ttxfhWs=;
  b=jXaHKSheANoC8zPU0270NONqmymc9jG0o0J53S9ehMVt9bkF56zbh8Gl
   m6JlDW353k/9oHOzN5FLQyPIv+SOOQyfqc9nlZ8j9Vh3UK2PISVtcp2i+
   O9XSe/saWGyChhkVs1wAgB0hvbf173MkGE1rfodBYKuVHeVBp2Bmzl3cX
   l14u3424+YbhsFAgY4vtr4gRowsnEKHCIh/7n3oBj6ghtOUyY3cCQzb8A
   tPUlZ4OQQXNedX0TzdjOExjnSTb8CAQ9ZAHmY/U7ETEi5srIpsbCUDAjY
   g5is02aLcSPa/CMhtlh/8aEaExvJLMvbDad5iwZMxXdHC1/7KIBVbzbdX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356224965"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="356224965"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 00:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="690841279"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="690841279"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Sep 2023 00:52:53 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qdQri-0001Oz-32;
        Tue, 05 Sep 2023 07:52:50 +0000
Date:   Tue, 5 Sep 2023 15:52:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
        andi.shyti@kernel.org
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        aryan.srivastava@alliedtelesis.co.nz, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c:octeon:Add block-mode r/w
Message-ID: <202309051505.K5sogLFe-lkp@intel.com>
References: <20230904231439.485925-1-aryan.srivastava@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904231439.485925-1-aryan.srivastava@alliedtelesis.co.nz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Aryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.5 next-20230905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aryan-Srivastava/i2c-octeon-Add-block-mode-r-w/20230905-071739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230904231439.485925-1-aryan.srivastava%40alliedtelesis.co.nz
patch subject: [PATCH] i2c:octeon:Add block-mode r/w
config: riscv-randconfig-001-20230905 (https://download.01.org/0day-ci/archive/20230905/202309051505.K5sogLFe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051505.K5sogLFe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051505.K5sogLFe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-octeon-core.c:725:8: error: use of undeclared label 'ret'
     725 |                 goto ret;
         |                      ^
   1 error generated.


vim +/ret +725 drivers/i2c/busses/i2c-octeon-core.c

   674	
   675	/* high-level-controller composite block write+write, m[0]len<=2, m[1]len<=1024 */
   676	static int octeon_i2c_hlc_block_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msgs)
   677	{
   678		bool set_ext = false;
   679		int i, j, len, ret = 0;
   680		u64 cmd, buf = 0, ext = 0;
   681	
   682		octeon_i2c_hlc_enable(i2c);
   683		octeon_i2c_block_enable(i2c);
   684	
   685		/* Write (size - 1) into block control register */
   686		len = msgs[1].len - 1;
   687		octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + TWSI_BLOCK_CTL(i2c));
   688	
   689		/* Prepare core command */
   690		cmd = SW_TWSI_V | SW_TWSI_SOVR;
   691		cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
   692	
   693		if (msgs[0].flags & I2C_M_TEN)
   694			cmd |= SW_TWSI_OP_10_IA;
   695		else
   696			cmd |= SW_TWSI_OP_7_IA;
   697	
   698		if (msgs[0].len == 2) {
   699			cmd |= SW_TWSI_EIA;
   700			ext |= (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
   701			set_ext = true;
   702			cmd |= (u64)msgs[0].buf[1] << SW_TWSI_IA_SHIFT;
   703		} else {
   704			cmd |= (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
   705		}
   706	
   707		/* Write msg into FIFO buffer */
   708		octeon_i2c_writeq_flush(TWSI_BLOCK_STS_RESET_PTR, i2c->twsi_base + TWSI_BLOCK_STS(i2c));
   709		for (i = 0; i < len; i += 8) {
   710			buf = 0;
   711			for (j = 7; j >= 0; j--)
   712				buf |= (msgs[1].buf[i + (7 - j)] << (8 * j));
   713			octeon_i2c_writeq_flush(buf, i2c->twsi_base + TWSI_BLOCK_FIFO(i2c));
   714		}
   715		if (set_ext)
   716			octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
   717	
   718		/* Send command to core (send data in FIFO) */
   719		octeon_i2c_hlc_int_clear(i2c);
   720		octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
   721	
   722		/* Wait for transaction to complete */
   723		ret = octeon_i2c_hlc_wait(i2c);
   724		if (ret)
 > 725			goto ret;
   726	
   727		cmd = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
   728		if ((cmd & SW_TWSI_R) == 0)
   729			return octeon_i2c_check_status(i2c, false);
   730	
   731		octeon_i2c_block_disable(i2c);
   732		return ret;
   733	}
   734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

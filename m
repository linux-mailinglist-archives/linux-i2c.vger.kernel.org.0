Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4797926FE
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjIEQTZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353516AbjIEG2O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 02:28:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE517CC4;
        Mon,  4 Sep 2023 23:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693895287; x=1725431287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zcu4Y/TSeClvgGKpcsFH4BqAVZ4/YXsS4cM2ndhYS/I=;
  b=XIRiU3fK7kzubSgimM29yYmPsEl/Z70xKkDc5Jm05Qt2nOqEV09yiYfD
   mBx57EoMHYrTdrUIZZYCawkjzfAudjrwWfMljWD/UTFrJUEVkvGn3Q2wh
   xzOVDLhkAhG9WOsfCpSKRE47Od4UEFJLy7s0PcZcT7DjN1ppPOaL9w81G
   QW19t6xPI/v+1sN36mrb1XvlYDgdC4UjFdOyhQeH0CVG+SBlNEluUV354
   I+yRSiRaC067HSuexBO2jcucJq0CADw7/ECehRMYMVc1tJuhMWJu2tL/v
   TRHoJh9DTGg7rocxyueK/BfhMM7t8cjpHBPD1ZTimwTbtj7kZ6skqOufM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="440697261"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="440697261"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 23:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="987715115"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="987715115"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Sep 2023 23:28:05 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qdPXe-0001Kp-2G;
        Tue, 05 Sep 2023 06:28:02 +0000
Date:   Tue, 5 Sep 2023 14:27:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
        andi.shyti@kernel.org
Cc:     oe-kbuild-all@lists.linux.dev,
        aryan.srivastava@alliedtelesis.co.nz, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c:octeon:Add block-mode r/w
Message-ID: <202309051413.SkL3myiV-lkp@intel.com>
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
[also build test ERROR on linus/master v6.5 next-20230831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aryan-Srivastava/i2c-octeon-Add-block-mode-r-w/20230905-071739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230904231439.485925-1-aryan.srivastava%40alliedtelesis.co.nz
patch subject: [PATCH] i2c:octeon:Add block-mode r/w
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230905/202309051413.SkL3myiV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051413.SkL3myiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051413.SkL3myiV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-octeon-core.c: In function 'octeon_i2c_hlc_block_comp_write':
>> drivers/i2c/busses/i2c-octeon-core.c:725:17: error: label 'ret' used but not defined
     725 |                 goto ret;
         |                 ^~~~


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

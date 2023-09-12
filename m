Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541F279C444
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Sep 2023 05:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236899AbjILDjU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Sep 2023 23:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236821AbjILDjU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Sep 2023 23:39:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A654DB;
        Mon, 11 Sep 2023 20:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694489956; x=1726025956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=asEFt1CVdBW9xqV/fumhs3gNiT+YkcjnqaRb6Cad6Is=;
  b=f6Tq7U98cVNg5ZXt2Jd0PTwB124qWy4krtcdD1HbAEslll+eRx4Xcsp7
   Osufodk9AofyzgyqDli/3EPNiv8pG6b7SrROS4nVIlqmvqFAaU09Q5Q1s
   5cY+4aCkacr3sty1JLSsjtYjZEkG1LhRXoBd7m789c5dsrT3Z/OKJb9uK
   Nw3MyQntQUyfhTfpKr42j+yI6PluV7CExo7LZwCWoMekcEgGfmasSerYg
   F72TTPWomuPDUydsuq/SDd38bTYIBylLtIfEKSSK4Q+jDhoKP3eKvzMMz
   JAXhyN7hP+RqvDx5mbR1vBe8U4ypSRDVJGeUCdrPCj7g6jciq1SUthuPH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377182550"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="377182550"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 20:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833743280"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="833743280"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Sep 2023 20:39:14 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qfuF6-0007Fa-1t;
        Tue, 12 Sep 2023 03:39:12 +0000
Date:   Tue, 12 Sep 2023 11:38:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
        andi.shyti@kernel.org
Cc:     oe-kbuild-all@lists.linux.dev,
        aryan.srivastava@alliedtelesis.co.nz, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] THUNDERX_I2C_BLOCK_MODE
Message-ID: <202309121146.BqM4z7k7-lkp@intel.com>
References: <20230912002706.2393450-1-aryan.srivastava@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912002706.2393450-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Aryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linus/master v6.6-rc1 next-20230911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aryan-Srivastava/THUNDERX_I2C_BLOCK_MODE/20230912-084721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230912002706.2393450-1-aryan.srivastava%40alliedtelesis.co.nz
patch subject: [PATCH] THUNDERX_I2C_BLOCK_MODE
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309121146.BqM4z7k7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121146.BqM4z7k7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121146.BqM4z7k7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-octeon-core.c:632: warning: Function parameter or member 'i2c' not described in 'octeon_i2c_hlc_block_comp_read'
>> drivers/i2c/busses/i2c-octeon-core.c:632: warning: Function parameter or member 'msgs' not described in 'octeon_i2c_hlc_block_comp_read'
>> drivers/i2c/busses/i2c-octeon-core.c:632: warning: expecting prototype for high(). Prototype was for octeon_i2c_hlc_block_comp_read() instead
>> drivers/i2c/busses/i2c-octeon-core.c:673: warning: Function parameter or member 'i2c' not described in 'octeon_i2c_hlc_block_comp_write'
>> drivers/i2c/busses/i2c-octeon-core.c:673: warning: Function parameter or member 'msgs' not described in 'octeon_i2c_hlc_block_comp_write'
>> drivers/i2c/busses/i2c-octeon-core.c:673: warning: expecting prototype for high(). Prototype was for octeon_i2c_hlc_block_comp_write() instead


vim +632 drivers/i2c/busses/i2c-octeon-core.c

   626	
   627	/**
   628	 * high-level-controller composite block write+read, msg0=addr, msg1=data
   629	 * Used in the case where the i2c xfer is for greater than 8 bytes of read data.
   630	 */
   631	static int octeon_i2c_hlc_block_comp_read(struct octeon_i2c *i2c, struct i2c_msg *msgs)
 > 632	{
   633		int len, ret = 0;
   634		u64 cmd = 0;
   635	
   636		octeon_i2c_hlc_enable(i2c);
   637		octeon_i2c_block_enable(i2c);
   638	
   639		/* Write (size - 1) into block control register */
   640		len = msgs[1].len - 1;
   641		octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + TWSI_BLOCK_CTL(i2c));
   642	
   643		/* Prepare core command */
   644		cmd = SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR;
   645		cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
   646	
   647		/* Send core command */
   648		ret = octeon_i2c_hlc_cmd(i2c, msgs[0], cmd);
   649		if (ret)
   650			return ret;
   651	
   652		cmd = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
   653		if ((cmd & SW_TWSI_R) == 0)
   654			return octeon_i2c_check_status(i2c, false);
   655	
   656		/* read data in FIFO */
   657		octeon_i2c_writeq_flush(TWSI_BLOCK_STS_RESET_PTR, i2c->twsi_base + TWSI_BLOCK_STS(i2c));
   658		for (int i = 0; i < len; i += 8) {
   659			u64 rd = __raw_readq(i2c->twsi_base + TWSI_BLOCK_FIFO(i2c));
   660			for (int j = 7; j >= 0; j--)
   661				msgs[1].buf[i + (7 - j)] = (rd >> (8 * j)) & 0xff;
   662		}
   663	
   664		octeon_i2c_block_disable(i2c);
   665		return ret;
   666	}
   667	
   668	/**
   669	 * high-level-controller composite block write+write, m[0]len<=2, m[1]len<=1024
   670	 * Used in the case where the i2c xfer is for greater than 8 bytes of write data.
   671	 */
   672	static int octeon_i2c_hlc_block_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msgs)
 > 673	{
   674		bool set_ext = false;
   675		int i, j, len, ret = 0;
   676		u64 cmd, ext = 0;
   677	
   678		octeon_i2c_hlc_enable(i2c);
   679		octeon_i2c_block_enable(i2c);
   680	
   681		/* Write (size - 1) into block control register */
   682		len = msgs[1].len - 1;
   683		octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + TWSI_BLOCK_CTL(i2c));
   684	
   685		/* Prepare core command */
   686		cmd = SW_TWSI_V | SW_TWSI_SOVR;
   687		cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
   688	
   689		if (msgs[0].flags & I2C_M_TEN)
   690			cmd |= SW_TWSI_OP_10_IA;
   691		else
   692			cmd |= SW_TWSI_OP_7_IA;
   693	
   694		if (msgs[0].len == 2) {
   695			cmd |= SW_TWSI_EIA;
   696			ext |= (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
   697			set_ext = true;
   698			cmd |= (u64)msgs[0].buf[1] << SW_TWSI_IA_SHIFT;
   699		} else {
   700			cmd |= (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
   701		}
   702	
   703		/* Write msg into FIFO buffer */
   704		octeon_i2c_writeq_flush(TWSI_BLOCK_STS_RESET_PTR, i2c->twsi_base + TWSI_BLOCK_STS(i2c));
   705		for (i = 0; i < len; i += 8) {
   706			u64 buf = 0;
   707			for (j = 7; j >= 0; j--)
   708				buf |= (msgs[1].buf[i + (7 - j)] << (8 * j));
   709			octeon_i2c_writeq_flush(buf, i2c->twsi_base + TWSI_BLOCK_FIFO(i2c));
   710		}
   711		if (set_ext)
   712			octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
   713	
   714		/* Send command to core (send data in FIFO) */
   715		ret = octeon_i2c_hlc_cmd_send(i2c, cmd);
   716		if (ret)
   717			return ret;
   718	
   719		cmd = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
   720		if ((cmd & SW_TWSI_R) == 0)
   721			return octeon_i2c_check_status(i2c, false);
   722	
   723		octeon_i2c_block_disable(i2c);
   724		return ret;
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

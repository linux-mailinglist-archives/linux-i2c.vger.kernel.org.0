Return-Path: <linux-i2c+bounces-681-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5087B809AEA
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 05:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03BEF281B3F
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 04:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C615946BF;
	Fri,  8 Dec 2023 04:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UW/QgOZT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743421718;
	Thu,  7 Dec 2023 20:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702008977; x=1733544977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SxevhwPvl1dlX54v2YDQvnciLdpmAuA4/R+k34yhueQ=;
  b=UW/QgOZTwTX4Bu5Rp8NgE/VBmc1fS7HYj0POBM/RFFFK85zrW1B5WNrW
   RZB5nOczK9//6r8wOznLz0BkFuWrx6ylIDUxziljSS8NqiE+VcFarXJ2n
   7eOseytMsQ1xDJ5+56LYMbiYkk70ofvOrtq4wG/ypw5a+ReWrCAZL+28J
   8+vFBGQyE3QztTy6s1rBJm8ccCWgujyDqufYamIjRWf/wTN0rr+aXV3SW
   24C1rbqlaMlet6axpRXAh55bXwtun+LpGbx5t0WVLegiUeWVsWBskUvRf
   ME0C/oD63obijaOG5xMzeyF+5rduBC7LC/d6wGDsHYm2Uh80KZ+CoeIGA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="374519751"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="374519751"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 20:16:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="19953059"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Dec 2023 20:16:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBSHc-000DEh-0s;
	Fri, 08 Dec 2023 04:16:12 +0000
Date: Fri, 8 Dec 2023 12:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Elad Nachman <enachman@marvell.com>, gregory.clement@bootlin.com,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	enachman@marvell.com, cyuval@marvell.com
Subject: Re: [PATCH v2 1/1] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
Message-ID: <202312081143.38GWJJ2J-lkp@intel.com>
References: <20231207165027.2628302-2-enachman@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207165027.2628302-2-enachman@marvell.com>

Hi Elad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elad-Nachman/i2c-busses-i2c-mv64xxx-fix-arb-loss-i2c-lock/20231208-005406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20231207165027.2628302-2-enachman%40marvell.com
patch subject: [PATCH v2 1/1] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
config: i386-buildonly-randconfig-004-20231208 (https://download.01.org/0day-ci/archive/20231208/202312081143.38GWJJ2J-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312081143.38GWJJ2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312081143.38GWJJ2J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-mv64xxx.c:440:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                           if (!ret) {
                                ^~~
   drivers/i2c/busses/i2c-mv64xxx.c:372:12: note: initialize the variable 'ret' to silence this warning
           int i, ret;
                     ^
                      = 0
   1 warning generated.


vim +/ret +440 drivers/i2c/busses/i2c-mv64xxx.c

   367	
   368	static void
   369	mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
   370	{
   371		struct pinctrl *pc;
   372		int i, ret;
   373	
   374		switch(drv_data->action) {
   375		case MV64XXX_I2C_ACTION_SEND_RESTART:
   376			/* We should only get here if we have further messages */
   377			BUG_ON(drv_data->num_msgs == 0);
   378	
   379			drv_data->msgs++;
   380			drv_data->num_msgs--;
   381			mv64xxx_i2c_send_start(drv_data);
   382	
   383			if (drv_data->errata_delay)
   384				udelay(5);
   385	
   386			/*
   387			 * We're never at the start of the message here, and by this
   388			 * time it's already too late to do any protocol mangling.
   389			 * Thankfully, do not advertise support for that feature.
   390			 */
   391			drv_data->send_stop = drv_data->num_msgs == 1;
   392			break;
   393	
   394		case MV64XXX_I2C_ACTION_CONTINUE:
   395			writel(drv_data->cntl_bits,
   396				drv_data->reg_base + drv_data->reg_offsets.control);
   397			break;
   398	
   399		case MV64XXX_I2C_ACTION_SEND_ADDR_1:
   400			writel(drv_data->addr1,
   401				drv_data->reg_base + drv_data->reg_offsets.data);
   402			writel(drv_data->cntl_bits,
   403				drv_data->reg_base + drv_data->reg_offsets.control);
   404			break;
   405	
   406		case MV64XXX_I2C_ACTION_SEND_ADDR_2:
   407			writel(drv_data->addr2,
   408				drv_data->reg_base + drv_data->reg_offsets.data);
   409			writel(drv_data->cntl_bits,
   410				drv_data->reg_base + drv_data->reg_offsets.control);
   411			break;
   412	
   413		case MV64XXX_I2C_ACTION_SEND_DATA:
   414			writel(drv_data->msg->buf[drv_data->byte_posn++],
   415				drv_data->reg_base + drv_data->reg_offsets.data);
   416			writel(drv_data->cntl_bits,
   417				drv_data->reg_base + drv_data->reg_offsets.control);
   418			break;
   419	
   420		case MV64XXX_I2C_ACTION_RCV_DATA:
   421			drv_data->msg->buf[drv_data->byte_posn++] =
   422				readl(drv_data->reg_base + drv_data->reg_offsets.data);
   423			writel(drv_data->cntl_bits,
   424				drv_data->reg_base + drv_data->reg_offsets.control);
   425			break;
   426	
   427		case MV64XXX_I2C_ACTION_UNLOCK_BUS:
   428			if (!drv_data->soft_reset)
   429				break;
   430	
   431			pc = devm_pinctrl_get(drv_data->adapter.dev.parent);
   432			if (IS_ERR(pc)) {
   433				dev_err(&drv_data->adapter.dev,
   434					"failed to get pinctrl for bus unlock!\n");
   435				break;
   436			}
   437	
   438			/* Change i2c MPPs state to act as GPIOs: */
   439			if (pinctrl_select_state(pc, drv_data->i2c_gpio_state) >= 0) {
 > 440				if (!ret) {
   441					/*
   442					 * Toggle i2c scl (serial clock) 10 times.
   443					 * 10 clocks are enough to transfer a full
   444					 * byte plus extra as seen from tests with
   445					 * Ubiquity SFP module causing the issue.
   446					 * This allows the slave that occupies
   447					 * the bus to transmit its remaining data,
   448					 * so it can release the i2c bus:
   449					 */
   450					for (i = 0; i < 10; i++) {
   451						gpio_set_value(drv_data->scl_gpio, 1);
   452						udelay(100);
   453						gpio_set_value(drv_data->scl_gpio, 0);
   454					};
   455				}
   456	
   457				/* restore i2c pin state to MPPs: */
   458				pinctrl_select_state(pc, drv_data->i2c_mpp_state);
   459			}
   460	
   461			/*
   462			 * Trigger controller soft reset
   463			 * This register is write only, with none of the bits defined.
   464			 * So any value will do.
   465			 * 0x1 just seems more intuitive than 0x0 ...
   466			 */
   467			writel(0x1, drv_data->reg_base + drv_data->reg_offsets.soft_reset);
   468			/* wait for i2c controller to complete reset: */
   469			udelay(100);
   470			/*
   471			 * need to proceed to the data stop condition generation clause.
   472			 * This is needed after clock toggling to put the i2c slave
   473			 * in the correct state.
   474			 */
   475			fallthrough;
   476	
   477		case MV64XXX_I2C_ACTION_RCV_DATA_STOP:
   478			drv_data->msg->buf[drv_data->byte_posn++] =
   479				readl(drv_data->reg_base + drv_data->reg_offsets.data);
   480			if (!drv_data->atomic)
   481				drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
   482			writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
   483				drv_data->reg_base + drv_data->reg_offsets.control);
   484			drv_data->block = 0;
   485			if (drv_data->errata_delay)
   486				udelay(5);
   487	
   488			wake_up(&drv_data->waitq);
   489			break;
   490	
   491		case MV64XXX_I2C_ACTION_INVALID:
   492		default:
   493			dev_err(&drv_data->adapter.dev,
   494				"mv64xxx_i2c_do_action: Invalid action: %d\n",
   495				drv_data->action);
   496			drv_data->rc = -EIO;
   497			fallthrough;
   498		case MV64XXX_I2C_ACTION_SEND_STOP:
   499			if (!drv_data->atomic)
   500				drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
   501			writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
   502				drv_data->reg_base + drv_data->reg_offsets.control);
   503			drv_data->block = 0;
   504			wake_up(&drv_data->waitq);
   505			break;
   506		}
   507	}
   508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


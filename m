Return-Path: <linux-i2c+bounces-9636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A64BCA48DFE
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 02:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA15016CE01
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 01:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77603596A;
	Fri, 28 Feb 2025 01:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7jtZsQR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A3A276D12;
	Fri, 28 Feb 2025 01:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740706183; cv=none; b=MTPy/wZpWRFAHH6VT6no+UhmpI6AaXqoKa+ugBCppJggG0XO9wJSYWybNvAZ3s7pW7YuI++8HRrw+7oL9iAoympMkgr30tWecQpATTNHK0aXPjwi7OG6eCF4x0mCpGvisrTVl7UNbow2x8pOUNlloHNEFUkoJPXf+MqylVjpes0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740706183; c=relaxed/simple;
	bh=0Kaw4aySzXzJh8b//ALxlZ2RwWuBVvZuS4cYdwjBK+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtD+tLE00Nwc+VsAjWromQZr+23Nqn2ddunWIEkPDUtLkgNgoVMlh7z+87fglxVgzHUSbLalTNs67x11ekaFyT8ATKVMqibNEGr7lSUrZIoGTC94hnhKEgBLJlZ3g9ShZfBvP0Ucx5VhyieerEv9HLg9isp8Mpb982Tgni2JZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7jtZsQR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740706182; x=1772242182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Kaw4aySzXzJh8b//ALxlZ2RwWuBVvZuS4cYdwjBK+4=;
  b=H7jtZsQRDc99zPpjzw46j/obgI/Y6ruW0fF+IkqF9N4+v2rmFd+sNlY2
   wy3SpOaQgNVpotQimsFenFlPKS3YNtliyXidma5ifn6dtI9HvzsmumArw
   Ts5U9ANfZMiy//+pcRb588xRd/3Cq5lBOu5qL2pvufOGU3WHyGXNg80Sf
   /uQ0oVifB9HkovvHU6ED0oUQuFdXenHTp7JARpKra+8lQoHaWtNuJlxI4
   G5FRJ2cOsXNZpK1lraqTX08lqXpU6M49/LeuDIMLWTNW1iDiYgZ8FIept
   gwKE2rcI7mjSG9dsslMLVWHXRJhKKvf4MU6ifg9n/V0OMQ1SeCasAVUBO
   w==;
X-CSE-ConnectionGUID: b9oBVvA8Q8WlHE56sbytfA==
X-CSE-MsgGUID: J6VU82vITnSzNycvM0+0MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45275641"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="45275641"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 17:29:41 -0800
X-CSE-ConnectionGUID: tQ2gpyfRQ9adco+P481y1g==
X-CSE-MsgGUID: EFDf9J9jSi+DvFy8QwsOMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="148014413"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2025 17:29:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnpBh-000EH4-0H;
	Fri, 28 Feb 2025 01:29:25 +0000
Date: Fri, 28 Feb 2025 09:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org,
	joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <202502280902.U0gLDhve-lkp@intel.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20250224-140221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtech.com
patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_recover_bus':
>> drivers/i2c/busses/i2c-ast2600.c:345:32: warning: unsigned conversion from 'int' to 'u8' {aka 'unsigned char'} changes value from '-145' to '111' [-Woverflow]
     345 |                         return -ETIMEDOUT;
         |                                ^


vim +345 drivers/i2c/busses/i2c-ast2600.c

   315	
   316	static u8 ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
   317	{
   318		u32 state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   319		int ret = 0;
   320		u32 ctrl;
   321		int r;
   322	
   323		dev_dbg(i2c_bus->dev, "%d-bus recovery bus [%x]\n", i2c_bus->adap.nr, state);
   324	
   325		ctrl = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   326	
   327		/* Disable controller */
   328		writel(ctrl & ~(AST2600_I2CC_MASTER_EN | AST2600_I2CC_SLAVE_EN),
   329		       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   330	
   331		writel(readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) | AST2600_I2CC_MASTER_EN,
   332		       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   333	
   334		reinit_completion(&i2c_bus->cmd_complete);
   335		i2c_bus->cmd_err = 0;
   336	
   337		/* Check 0x14's SDA and SCL status */
   338		state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   339		if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE_STS)) {
   340			writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
   341			r = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
   342			if (r == 0) {
   343				dev_dbg(i2c_bus->dev, "recovery timed out\n");
   344				writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
 > 345				return -ETIMEDOUT;
   346			} else if (i2c_bus->cmd_err) {
   347				dev_dbg(i2c_bus->dev, "recovery error\n");
   348				ret = -EPROTO;
   349			}
   350		}
   351	
   352		/* Recovery done */
   353		state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   354		if (state & AST2600_I2CC_BUS_BUSY_STS) {
   355			dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
   356			ret = -EPROTO;
   357		}
   358	
   359		/* restore original controller setting */
   360		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   361		return ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


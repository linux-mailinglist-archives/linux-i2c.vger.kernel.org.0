Return-Path: <linux-i2c+bounces-7316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D240B997A49
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 03:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD01B1C21F3F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 01:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BAD2B9D2;
	Thu, 10 Oct 2024 01:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5a4jOf3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774922094;
	Thu, 10 Oct 2024 01:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728525163; cv=none; b=NIRfxeNcVlrBBi86O2EMj80ZhOQjQM8TuJ289IEOGYUMZzHL9yDuCM/vTq2Y9RBdqbcR/UfNmHMVL321m/S2fAi89XeWHU1DNkKJWfpp7J1HqkrEtCa1UV8RR/mI9mqMvAGFLSQ6YsLMRAJjePw9M4enWP7dw9J1taSbClKXtOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728525163; c=relaxed/simple;
	bh=TxwA0eE9KGa5lvsSq3UjTZHMUp9hR+VTBKfALSwxPz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRheWWa8DZCsW+gIR0YkHTG7kT2UiR6Y/dN7DV60vHSOkV6C18BK20WzawMnLLrIhBLKJqFeGgPKe4JMCc1RpqInxJoedSNyyQ7NlYLsdIMaJp4H/OV/Y2qWAdgAm6nbR4JBK0dtxJfbD9t2xzK/3rqRS2q4qlnYEyvRKUdTSBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5a4jOf3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728525162; x=1760061162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TxwA0eE9KGa5lvsSq3UjTZHMUp9hR+VTBKfALSwxPz0=;
  b=G5a4jOf3WxFsGpU1u1/xMLZgGGctYfYCOyktPpiJaBVQBPg9Bdmd2+Z/
   G0zv0xtCWRnQUj+Bbk0mEO81r/SrAhzseRupkzp4TAZt3+Kky9GQhdiOg
   zdha95rl5G4vCJRpsV3+rkgfY571l9fGkx8bYheoYeMsRa2no5Kk4Phup
   p0XY1tpJYnV+uic8HLPcYHvKT6dA1wPgYI41RvcbSv4ZRPatNkVzyHzOW
   /QZK/hQTLgV34pW7CneAjePL2y+UPtej57ZahimAGAHDVbShV3q63abHE
   8XQvg6/WA4fsNucgr5N8OI0gvG5L8zr4zmUL+t5n6LjrssrF1ddSqCGn/
   w==;
X-CSE-ConnectionGUID: pcetyHw+SQOgme3oUSTcIA==
X-CSE-MsgGUID: P5HDlLcaS3C9zqL79AbkWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27738739"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="27738739"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 18:52:41 -0700
X-CSE-ConnectionGUID: 0YyTf1CNTlu4ZftiYsLTOg==
X-CSE-MsgGUID: QFQbsZe1T02kmrWs9KM8Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="76906214"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Oct 2024 18:52:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syiM0-000A2u-2O;
	Thu, 10 Oct 2024 01:52:36 +0000
Date: Thu, 10 Oct 2024 09:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, aryan.srivastava@alliedtelesis.co.nz,
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v9 1/2] i2c: octeon: refactor common i2c operations
Message-ID: <202410100921.WVORo97f-lkp@intel.com>
References: <20241007023900.3924763-2-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007023900.3924763-2-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.12-rc2 next-20241009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aryan-Srivastava/i2c-octeon-refactor-common-i2c-operations/20241007-104113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241007023900.3924763-2-aryan.srivastava%40alliedtelesis.co.nz
patch subject: [PATCH v9 1/2] i2c: octeon: refactor common i2c operations
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20241010/202410100921.WVORo97f-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100921.WVORo97f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100921.WVORo97f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-octeon-core.c:517:3: warning: variable 'cmd' is uninitialized when used here [-Wuninitialized]
     517 |                 cmd |= SW_TWSI_OP_10_IA;
         |                 ^~~
   drivers/i2c/busses/i2c-octeon-core.c:514:9: note: initialize the variable 'cmd' to silence this warning
     514 |         u64 cmd;
         |                ^
         |                 = 0
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/cmd +517 drivers/i2c/busses/i2c-octeon-core.c

ad83665b4687f5 Jan Glauber      2016-08-24  509  
dcdb10ccc89293 Aryan Srivastava 2024-10-07  510  /* Generic consideration for extended internal addresses in i2c hlc r/w ops */
dcdb10ccc89293 Aryan Srivastava 2024-10-07  511  static bool octeon_i2c_hlc_ext(struct octeon_i2c *i2c, struct i2c_msg msg, u64 *cmd_in, u64 *ext)
dcdb10ccc89293 Aryan Srivastava 2024-10-07  512  {
dcdb10ccc89293 Aryan Srivastava 2024-10-07  513  	bool set_ext = false;
dcdb10ccc89293 Aryan Srivastava 2024-10-07  514  	u64 cmd;
ad83665b4687f5 Jan Glauber      2016-08-24  515  
dcdb10ccc89293 Aryan Srivastava 2024-10-07  516  	if (msg.flags & I2C_M_TEN)
ad83665b4687f5 Jan Glauber      2016-08-24 @517  		cmd |= SW_TWSI_OP_10_IA;
ad83665b4687f5 Jan Glauber      2016-08-24  518  	else
ad83665b4687f5 Jan Glauber      2016-08-24  519  		cmd |= SW_TWSI_OP_7_IA;
ad83665b4687f5 Jan Glauber      2016-08-24  520  
dcdb10ccc89293 Aryan Srivastava 2024-10-07  521  	if (msg.len == 2) {
dcdb10ccc89293 Aryan Srivastava 2024-10-07  522  		cmd |= SW_TWSI_EIA;
dcdb10ccc89293 Aryan Srivastava 2024-10-07  523  		*ext = (u64)msg.buf[0] << SW_TWSI_IA_SHIFT;
dcdb10ccc89293 Aryan Srivastava 2024-10-07  524  		cmd |= (u64)msg.buf[1] << SW_TWSI_IA_SHIFT;
dcdb10ccc89293 Aryan Srivastava 2024-10-07  525  		set_ext = true;
dcdb10ccc89293 Aryan Srivastava 2024-10-07  526  	} else {
dcdb10ccc89293 Aryan Srivastava 2024-10-07  527  		cmd |= (u64)msg.buf[0] << SW_TWSI_IA_SHIFT;
dcdb10ccc89293 Aryan Srivastava 2024-10-07  528  	}
dcdb10ccc89293 Aryan Srivastava 2024-10-07  529  
dcdb10ccc89293 Aryan Srivastava 2024-10-07  530  	*cmd_in |= cmd;
dcdb10ccc89293 Aryan Srivastava 2024-10-07  531  	return set_ext;
dcdb10ccc89293 Aryan Srivastava 2024-10-07  532  }
dcdb10ccc89293 Aryan Srivastava 2024-10-07  533  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-i2c+bounces-15081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF7ED153D2
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 21:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D50F830463B3
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 20:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601FF310763;
	Mon, 12 Jan 2026 20:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uq2i1OAU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8385C31AF07;
	Mon, 12 Jan 2026 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250038; cv=none; b=FbyjHJyjEGJ0y/44uynuLsPDQCdpgVfPuI2i9b6Yqmz3wTCkZWTXTYZirkxBrBA/uWrjSFwsxDxNNrF/IK1F00BWp4fAs5EktivSOSvj3d1PW5//evcg8OPJEu4LtroLe8IxKhia4phWpBmDuhZH7wCClb7yZW80VZ8M6xxcL2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250038; c=relaxed/simple;
	bh=T9ckJangESB9K1Z0yCWBCJwIyaDWgCZWLnmLdwNbkqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKT490NNrnXOVqa51tuNbdPQdDxb3Lz9/he8bv+xSpChx1UuPaB4ZCtvGV7Fuxs71QF2vhyqC2xybw2Qd/kHJmb2dJm2ZKV6Yd9aMyTxskuMNsmiZVo9TnBIeA2R3Uy+7qNSvC5IleqekkNpu1fFsfCEg+NyxUUDxdfzqRKJTTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uq2i1OAU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768250035; x=1799786035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T9ckJangESB9K1Z0yCWBCJwIyaDWgCZWLnmLdwNbkqc=;
  b=Uq2i1OAUR1nssVqfEMNbKfzoiYI83xe98pFFCZd8qxq6GH8u2A7qGm0P
   LTXIBH9XqTlRRU0fSLdFUTZP9VD/7gae6650/cR470sqXqcdxLDxjtxF9
   Whym1R5wUUu470uGWaZxiKSHp+jklxkxUKoypxUvtBeWIE6VSZrLpnlG+
   9fCU0BdT8uDRa0z5B5H4OlGTZBTwUTaRgrtCq9bG5TzCgd88zBRO/NAW2
   YbfX5LSpvTp5hdN+FgfhyJsaLMPkWLTwb/Wulmtg0x1TMX414L1CbkxI6
   P+a5FQnhBrSoFkTJasqf0f6r+OyxPbO1yKNd7cNv9HFSSiEBCMGzTxQ8I
   w==;
X-CSE-ConnectionGUID: 5d+N7FH0T+iRGLxNKWnAYA==
X-CSE-MsgGUID: c5UlYLFOTIe51LBa5lQNTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80173530"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80173530"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:33:54 -0800
X-CSE-ConnectionGUID: NLs7PlCyRDK73k019IQyvQ==
X-CSE-MsgGUID: v+bGvwmDQNytenZ6mZU71Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jan 2026 12:33:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfObm-00000000Dqm-1Vmc;
	Mon, 12 Jan 2026 20:33:50 +0000
Date: Tue, 13 Jan 2026 04:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 2/2] i2c: mlxbf: Use HZ_PER_KHZ in the driver
Message-ID: <202601130414.VJyCNWzI-lkp@intel.com>
References: <20260112135603.4150952-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112135603.4150952-3-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-mlxbf-Remove-unused-bus-speed-definitions/20260112-220605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20260112135603.4150952-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 2/2] i2c: mlxbf: Use HZ_PER_KHZ in the driver
config: i386-buildonly-randconfig-001-20260112 (https://download.01.org/0day-ci/archive/20260113/202601130414.VJyCNWzI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130414.VJyCNWzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130414.VJyCNWzI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-mlxbf.c: In function 'mlxbf_i2c_probe':
>> drivers/i2c/busses/i2c-mlxbf.c:68:44: error: 'HZ_PER_MHZ' undeclared (first use in this function)
      68 | #define MLXBF_I2C_TYU_PLL_OUT_FREQ  (400 * HZ_PER_MHZ)
         |                                            ^~~~~~~~~~
   drivers/i2c/busses/i2c-mlxbf.c:173:41: note: in expansion of macro 'MLXBF_I2C_TYU_PLL_OUT_FREQ'
     173 | #define MLXBF_I2C_COREPLL_FREQ          MLXBF_I2C_TYU_PLL_OUT_FREQ
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mlxbf.c:2325:35: note: in expansion of macro 'MLXBF_I2C_COREPLL_FREQ'
    2325 |                 priv->frequency = MLXBF_I2C_COREPLL_FREQ;
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mlxbf.c:68:44: note: each undeclared identifier is reported only once for each function it appears in
      68 | #define MLXBF_I2C_TYU_PLL_OUT_FREQ  (400 * HZ_PER_MHZ)
         |                                            ^~~~~~~~~~
   drivers/i2c/busses/i2c-mlxbf.c:173:41: note: in expansion of macro 'MLXBF_I2C_TYU_PLL_OUT_FREQ'
     173 | #define MLXBF_I2C_COREPLL_FREQ          MLXBF_I2C_TYU_PLL_OUT_FREQ
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mlxbf.c:2325:35: note: in expansion of macro 'MLXBF_I2C_COREPLL_FREQ'
    2325 |                 priv->frequency = MLXBF_I2C_COREPLL_FREQ;
         |                                   ^~~~~~~~~~~~~~~~~~~~~~


vim +/HZ_PER_MHZ +68 drivers/i2c/busses/i2c-mlxbf.c

    55	
    56	/*
    57	 * Note that the following SMBus, CAUSE, GPIO and PLL register addresses
    58	 * refer to their respective offsets relative to the corresponding
    59	 * memory-mapped region whose addresses are specified in either the DT or
    60	 * the ACPI tables or above.
    61	 */
    62	
    63	/*
    64	 * SMBus Master core clock frequency. Timing configurations are
    65	 * strongly dependent on the core clock frequency of the SMBus
    66	 * Master. Default value is set to 400MHz.
    67	 */
  > 68	#define MLXBF_I2C_TYU_PLL_OUT_FREQ  (400 * HZ_PER_MHZ)
    69	/* Reference clock for Bluefield - 156 MHz. */
    70	#define MLXBF_I2C_PLL_IN_FREQ       156250000ULL
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


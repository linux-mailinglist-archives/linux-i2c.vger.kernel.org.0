Return-Path: <linux-i2c+bounces-5975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C7967488
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 06:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB7121F21C29
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 04:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B9629CEA;
	Sun,  1 Sep 2024 04:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiWQnDq2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040BC26AC9
	for <linux-i2c@vger.kernel.org>; Sun,  1 Sep 2024 04:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725163299; cv=none; b=qKcop9sWDtVPYaOi1VgwkbLyoTpu9i8p9vBGKEY3nk0Glf2ODD7l0lyiOi+4bfQKHzRMHAUiSndQ09YRn8Dy0y5l9H7wlGAi1tor12sStB/vhCsZ65jY9TpH1ZelbfnkB1z2TtIyltI7+Xi19cwHoUrsnyMwlVeXBqSFfKK8YiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725163299; c=relaxed/simple;
	bh=I10tpmOnhF/n+20WV8pj+exldQ7WDeO+H+u54+QpQIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGUBQp0hwC/pbzSTYjj5HMGXCwj955ePu/Iti/mug6bEpQq93csfgVT76xa9XxqKbgvxfM2j7DIm0rQHXUaD2g2pmv5CY8bb/2mTYNMsvHKjEnEZQTzJSE6M65FocrTDH6B/SVL5UcEPrY5JGgoSL0hzI8uKgs/EBUad4JzUx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiWQnDq2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725163298; x=1756699298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I10tpmOnhF/n+20WV8pj+exldQ7WDeO+H+u54+QpQIg=;
  b=ZiWQnDq2J6KAvC8bNAJKEOKwnPktniotR1eyl2wk6Lftkqb+GZP0cSlD
   u/uvHMJ+7Kvm9YhuUY4sZGLz8PdBvzFS5jE0hxsrBCBwD31ghJqbzAXGV
   DhlQZjGFV5E0HB3IJrmuJe0ZOE3MhjsKV5hy4qlmEFli8Igg9CVP6Rfrh
   LNJu1kjCaKlaZIH7PU/MnjwCziPGMIXxEhop7yBGYif3jfSDBfHE3I4ia
   W5lR3dSycHC600m7CNIJwmto2H3wkR7d8bKSnwpOqBJzD0C3wK8l/vRv0
   s6No4g2dao6oqTbyQzFjkBvdEIDAu/MnXVPicb6LQZSSsN00F10SC9s5w
   A==;
X-CSE-ConnectionGUID: 2frMXDRQQC+V7xeAj9ZdFQ==
X-CSE-MsgGUID: MFvak99KRIy6En35CZy9OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="13314850"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="13314850"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 21:01:37 -0700
X-CSE-ConnectionGUID: mMdSXkfUR3Ka3AH6Zy7A4g==
X-CSE-MsgGUID: S7rTGM7XTNyBsU8ChyfLhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="64446613"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Aug 2024 21:01:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skbmJ-0003Ny-1Z;
	Sun, 01 Sep 2024 04:01:27 +0000
Date: Sun, 1 Sep 2024 12:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Group all DesignWare drivers under a
 single option
Message-ID: <202409011153.4n9plSc8-lkp@intel.com>
References: <20240830111222.2131172-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830111222.2131172-1-heikki.krogerus@linux.intel.com>

Hi Heikki,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heikki-Krogerus/i2c-designware-Group-all-DesignWare-drivers-under-a-single-option/20240830-191656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240830111222.2131172-1-heikki.krogerus%40linux.intel.com
patch subject: [PATCH] i2c: designware: Group all DesignWare drivers under a single option
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240901/202409011153.4n9plSc8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011153.4n9plSc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011153.4n9plSc8-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_runtime_resume':
>> i2c-designware-platdrv.c:(.text+0x48): undefined reference to `i2c_dw_prepare_clk'
   loongarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_runtime_suspend':
>> i2c-designware-platdrv.c:(.text+0x8c): undefined reference to `i2c_dw_disable'
>> loongarch64-linux-ld: i2c-designware-platdrv.c:(.text+0x98): undefined reference to `i2c_dw_prepare_clk'
   loongarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_remove':
   i2c-designware-platdrv.c:(.text+0x210): undefined reference to `i2c_dw_disable'
   loongarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_suspend':
   i2c-designware-platdrv.c:(.text+0x30c): undefined reference to `i2c_dw_disable'
   loongarch64-linux-ld: i2c-designware-platdrv.c:(.text+0x318): undefined reference to `i2c_dw_prepare_clk'
   loongarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_resume':
   i2c-designware-platdrv.c:(.text+0x3c8): undefined reference to `i2c_dw_prepare_clk'
   loongarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_probe':
>> i2c-designware-platdrv.c:(.text+0x49c): undefined reference to `i2c_dw_fw_parse_and_configure'
>> loongarch64-linux-ld: i2c-designware-platdrv.c:(.text+0x56c): undefined reference to `i2c_dw_configure_master'
   loongarch64-linux-ld: i2c-designware-platdrv.c:(.text+0x5a4): undefined reference to `i2c_dw_prepare_clk'
>> loongarch64-linux-ld: i2c-designware-platdrv.c:(.text+0x6f0): undefined reference to `i2c_dw_probe_master'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_DESIGNWARE_PLATFORM
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && I2C_DESIGNWARE_CORE [=n] && (ACPI [=y] && COMMON_CLK [=y] || !ACPI [=y])
   Selected by [y]:
   - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


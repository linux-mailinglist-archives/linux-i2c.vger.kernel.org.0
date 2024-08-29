Return-Path: <linux-i2c+bounces-5877-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B039639CE
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F3B9B2157C
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 05:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828CA148838;
	Thu, 29 Aug 2024 05:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYiyhjEZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D4CA92D;
	Thu, 29 Aug 2024 05:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908677; cv=none; b=LVuZcuzfY9PuTmS0XSVJbZhCM6grwoEhg7cyXlhrSZPDmRzX9Zhh2LwnhQuy94B+HEFm7Tzm0d/KT3wlbJuIZoMM2g/g9DJ02QmYIckSRLFhK4ItNVBHmxkhszClDKYmT5Hxxal4kuw4c/oiyhKC9tDn9V3hVyea74w0jGhuHYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908677; c=relaxed/simple;
	bh=kDttwq8dqeiyTIX1Gg/nGsXKecceLjaIy+6pIxl0GO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1ujVkj2OLnbK6tpKrKImAo18ZUND3Z/ucBzZzvHMipT2XXzxvvtnqvwuU9BPovGkIzfid+CeGAFCc1FjMBAYOWxuaUUhRU11DAKMK5c0hE+mfg+o4KqRFEwW1AKCAOaW/fGkw/Oxl6XwzGH55VpzaVB6wgRyqzr0cKD3rF1D0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYiyhjEZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724908676; x=1756444676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kDttwq8dqeiyTIX1Gg/nGsXKecceLjaIy+6pIxl0GO4=;
  b=ZYiyhjEZ8lirUC2yUW7ovYP/865k4Pk3WVG9J4/mNeNAcuNKvatPfT37
   RaHxR8Fln0/rTLj+X86tghTzzjDWRQIo2qDUKt3hx1vrMtUHGyEPOhNRd
   Le5MCSCQ6qJYE6H5v7BIBePasEH/d+5oqk2k40JYjRenqZqdmqtXiAOgv
   THci3z+nDgMC5j2VfiQaCsGNomVjYtNWZ5zPmFbH1RvqqkWsBjcLmL3un
   gYi7FApP0xVuOTWUfAHbDQOjMg5ZVknIjSlHnL+9YbEFwi81HWsvI5Oz/
   O4fO8X7eTYevi9EnnSHgbJToWvOkHiVXvPLka379AY3oxHStx4sjKGfl6
   A==;
X-CSE-ConnectionGUID: CQGcIJWfQpKgs459v+Qrhw==
X-CSE-MsgGUID: GVLfR23BRbipRiikyE4S0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23339895"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23339895"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 22:17:55 -0700
X-CSE-ConnectionGUID: 0+iFhbw8SguoyVaT1VftQQ==
X-CSE-MsgGUID: TGnmRX1OStStVC80bmGK8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="94262397"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Aug 2024 22:17:46 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjXXT-000Lj0-1z;
	Thu, 29 Aug 2024 05:17:43 +0000
Date: Thu, 29 Aug 2024 13:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>, andi.shyti@kernel.org,
	jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
	piotr.raczynski@intel.com, andrew@lunn.ch,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	mengyuanlou@net-swift.com, duanqiangwen@net-swift.com,
	Jiawen Wu <jiawenwu@trustnetic.com>, stable@vger.kernel.org
Subject: Re: [PATCH net 2/3] i2c: designware: add device private data passing
 to lock functions
Message-ID: <202408291212.L5DejDpz-lkp@intel.com>
References: <20240823030242.3083528-3-jiawenwu@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823030242.3083528-3-jiawenwu@trustnetic.com>

Hi Jiawen,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiawen-Wu/net-txgbe-add-IO-address-in-I2C-platform-device-data/20240826-122232
base:   net/main
patch link:    https://lore.kernel.org/r/20240823030242.3083528-3-jiawenwu%40trustnetic.com
patch subject: [PATCH net 2/3] i2c: designware: add device private data passing to lock functions
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240829/202408291212.L5DejDpz-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291212.L5DejDpz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291212.L5DejDpz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-designware-amdpsp.c:246:22: error: too few arguments to function call, single argument 'dev' was not specified
     246 |         psp_acquire_i2c_bus();
         |         ~~~~~~~~~~~~~~~~~~~ ^
   drivers/i2c/busses/i2c-designware-amdpsp.c:170:12: note: 'psp_acquire_i2c_bus' declared here
     170 | static int psp_acquire_i2c_bus(struct dw_i2c_dev *dev)
         |            ^                   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-designware-amdpsp.c:259:22: error: too few arguments to function call, single argument 'dev' was not specified
     259 |         psp_acquire_i2c_bus();
         |         ~~~~~~~~~~~~~~~~~~~ ^
   drivers/i2c/busses/i2c-designware-amdpsp.c:170:12: note: 'psp_acquire_i2c_bus' declared here
     170 | static int psp_acquire_i2c_bus(struct dw_i2c_dev *dev)
         |            ^                   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-designware-amdpsp.c:267:22: error: too few arguments to function call, single argument 'dev' was not specified
     267 |         psp_release_i2c_bus();
         |         ~~~~~~~~~~~~~~~~~~~ ^
   drivers/i2c/busses/i2c-designware-amdpsp.c:209:13: note: 'psp_release_i2c_bus' declared here
     209 | static void psp_release_i2c_bus(struct dw_i2c_dev *dev)
         |             ^                   ~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/dev +246 drivers/i2c/busses/i2c-designware-amdpsp.c

78d5e9e299e31bc Jan Dabros 2022-02-08  235  
78d5e9e299e31bc Jan Dabros 2022-02-08  236  /*
78d5e9e299e31bc Jan Dabros 2022-02-08  237   * Locking methods are based on the default implementation from
78d5e9e299e31bc Jan Dabros 2022-02-08  238   * drivers/i2c/i2c-core-base.c, but with psp acquire and release operations
78d5e9e299e31bc Jan Dabros 2022-02-08  239   * added. With this in place we can ensure that i2c clients on the bus shared
78d5e9e299e31bc Jan Dabros 2022-02-08  240   * with psp are able to lock HW access to the bus for arbitrary number of
78d5e9e299e31bc Jan Dabros 2022-02-08  241   * operations - that is e.g. write-wait-read.
78d5e9e299e31bc Jan Dabros 2022-02-08  242   */
78d5e9e299e31bc Jan Dabros 2022-02-08  243  static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
78d5e9e299e31bc Jan Dabros 2022-02-08  244  					unsigned int flags)
78d5e9e299e31bc Jan Dabros 2022-02-08  245  {
78d5e9e299e31bc Jan Dabros 2022-02-08 @246  	psp_acquire_i2c_bus();
78d5e9e299e31bc Jan Dabros 2022-02-08  247  	rt_mutex_lock_nested(&adapter->bus_lock, i2c_adapter_depth(adapter));
78d5e9e299e31bc Jan Dabros 2022-02-08  248  }
78d5e9e299e31bc Jan Dabros 2022-02-08  249  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


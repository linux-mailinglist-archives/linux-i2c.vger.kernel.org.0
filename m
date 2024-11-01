Return-Path: <linux-i2c+bounces-7740-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B049B9B2E
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Nov 2024 00:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6E9F2826F9
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 23:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6AD18453C;
	Fri,  1 Nov 2024 23:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwH3P0Sk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC8F137745;
	Fri,  1 Nov 2024 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730503869; cv=none; b=Ad8mk88gzlSTc7sCzlpLgqSklvX4DEunB/m5mAiVbtujJzormI2m2GgPY0SaKd+osqygav3hXI/T08qTWemgCg9Gir/AbKw/qnjejYmbIc+5u1mRrp+FkyFniK9Ta1jjBxkkQJXTqMaafbNirFE67cyQLDMZvDRxNMLqtxTzxgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730503869; c=relaxed/simple;
	bh=l/tdhdtTnTBRkObfxhCm6XD+bqowq88ldevKsMKagcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAArBuyjherFAEqAy1CpuPIKPKsOf3RZXUP2OmcXOWVxa6vmpY+FivHoF5D3obUI0QvyjD9wty10OwG9u1XlaDI4vfnwNWQB7Qe2NyEF2xgApJdJEUFpdrpXqXBGV9T80xh1WfmzB8rHA6R1dsBMeQ5CB6Jc/Aqo5vWEJe1eHrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwH3P0Sk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730503867; x=1762039867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l/tdhdtTnTBRkObfxhCm6XD+bqowq88ldevKsMKagcc=;
  b=dwH3P0Sk3jTj5KdqyFGcbUAtDy2p6Fa2pmlXLfcc0CzZ0jAk+3BpFnoc
   CJYDVkhK/4cCwqEkbqgljuPRnbH512k8JzRKXqXsi5vyfPFGM27Gcxio5
   NlE26kA8LEef2MOfS33NvfNs7epB24K33s+u2ciYucj8sWObgjEgxMmel
   Iukno0GOA153PRMm0/Qmrn3WLZvXmii+lB2Nb2HDZ21Q4WCQoMWiwB/Ke
   ZgRCaAsszcZlIU5HflnTD+VucHxAlAP5muc064+Jun+L21EFNR/mcF/Sx
   hbr35bA3bZ3hlrID/WPeXLMdWQuKjfF+FzMXHR4nEtf6O4Z6culdGHhps
   A==;
X-CSE-ConnectionGUID: GzozRgWeRxS9fSmYPS2ABQ==
X-CSE-MsgGUID: 3bLUwwloRl6i+Ua+trtHKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="34208630"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="34208630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 16:31:06 -0700
X-CSE-ConnectionGUID: n+C75ALoRwmDJHypci1Avg==
X-CSE-MsgGUID: WJANiBL1TpCJEEJJ/FRM0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="87041935"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2024 16:31:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t716c-000iAP-1E;
	Fri, 01 Nov 2024 23:31:02 +0000
Date: Sat, 2 Nov 2024 07:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
Message-ID: <202411020714.mhatOhhd-lkp@intel.com>
References: <20241101131103.3679560-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101131103.3679560-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-busses-Use-y-instead-of-objs-in-Makefile/20241101-211148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241101131103.3679560-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
config: arm-randconfig-001-20241102 (https://download.01.org/0day-ci/archive/20241102/202411020714.mhatOhhd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020714.mhatOhhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020714.mhatOhhd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-at91-slave.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i2c/busses/i2c-at91-slave.c:28:25: error: no member named 'slave' in 'struct at91_twi_dev'
      28 |                         i2c_slave_event(dev->slave,
         |                                         ~~~  ^
   drivers/i2c/busses/i2c-at91-slave.c:34:25: error: no member named 'slave' in 'struct at91_twi_dev'
      34 |                         i2c_slave_event(dev->slave,
         |                                         ~~~  ^
   drivers/i2c/busses/i2c-at91-slave.c:44:24: error: no member named 'slave' in 'struct at91_twi_dev'
      44 |                 i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED, &value);
         |                                 ~~~  ^
   drivers/i2c/busses/i2c-at91-slave.c:51:24: error: no member named 'slave' in 'struct at91_twi_dev'
      51 |                 i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
         |                                 ~~~  ^
   drivers/i2c/busses/i2c-at91-slave.c:59:24: error: no member named 'slave' in 'struct at91_twi_dev'
      59 |                 i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &value);
         |                                 ~~~  ^
   drivers/i2c/busses/i2c-at91-slave.c:69:11: error: no member named 'slave' in 'struct at91_twi_dev'
      69 |         if (dev->slave)
         |             ~~~  ^
   drivers/i2c/busses/i2c-at91-slave.c:78:7: error: no member named 'slave' in 'struct at91_twi_dev'
      78 |         dev->slave = slave;
         |         ~~~  ^
>> drivers/i2c/busses/i2c-at91-slave.c:79:7: error: no member named 'smr' in 'struct at91_twi_dev'; did you mean 'imr'?
      79 |         dev->smr = AT91_TWI_SMR_SADR(slave->addr);
         |              ^~~
         |              imr
   drivers/i2c/busses/i2c-at91.h:146:11: note: 'imr' declared here
     146 |         unsigned imr;
         |                  ^
   drivers/i2c/busses/i2c-at91-slave.c:93:16: error: no member named 'slave' in 'struct at91_twi_dev'
      93 |         WARN_ON(!dev->slave);
         |                  ~~~  ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/i2c/busses/i2c-at91-slave.c:97:7: error: no member named 'slave' in 'struct at91_twi_dev'
      97 |         dev->slave = NULL;
         |         ~~~  ^
   drivers/i2c/busses/i2c-at91-slave.c:98:7: error: no member named 'smr' in 'struct at91_twi_dev'; did you mean 'imr'?
      98 |         dev->smr = 0;
         |              ^~~
         |              imr
   drivers/i2c/busses/i2c-at91.h:146:11: note: 'imr' declared here
     146 |         unsigned imr;
         |                  ^
   drivers/i2c/busses/i2c-at91-slave.c:118:5: error: redefinition of 'at91_twi_probe_slave'
     118 | int at91_twi_probe_slave(struct platform_device *pdev,
         |     ^
   drivers/i2c/busses/i2c-at91.h:185:19: note: previous definition is here
     185 | static inline int at91_twi_probe_slave(struct platform_device *pdev,
         |                   ^
   drivers/i2c/busses/i2c-at91-slave.c:135:6: error: redefinition of 'at91_init_twi_bus_slave'
     135 | void at91_init_twi_bus_slave(struct at91_twi_dev *dev)
         |      ^
   drivers/i2c/busses/i2c-at91.h:184:20: note: previous definition is here
     184 | static inline void at91_init_twi_bus_slave(struct at91_twi_dev *dev) {}
         |                    ^
   drivers/i2c/busses/i2c-at91-slave.c:138:34: error: no member named 'smr' in 'struct at91_twi_dev'; did you mean 'imr'?
     138 |         if (dev->slave_detected && dev->smr) {
         |                                         ^~~
         |                                         imr
   drivers/i2c/busses/i2c-at91.h:146:11: note: 'imr' declared here
     146 |         unsigned imr;
         |                  ^
   drivers/i2c/busses/i2c-at91-slave.c:139:42: error: no member named 'smr' in 'struct at91_twi_dev'; did you mean 'imr'?
     139 |                 at91_twi_write(dev, AT91_TWI_SMR, dev->smr);
         |                                                        ^~~
         |                                                        imr
   drivers/i2c/busses/i2c-at91.h:146:11: note: 'imr' declared here
     146 |         unsigned imr;
         |                  ^
   1 warning and 15 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m]


vim +28 drivers/i2c/busses/i2c-at91-slave.c

9d3ca54b550ca0 Juergen Fitschen 2019-02-22  14  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  15  static irqreturn_t atmel_twi_interrupt_slave(int irq, void *dev_id)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  16  {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  17  	struct at91_twi_dev *dev = dev_id;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  18  	const unsigned status = at91_twi_read(dev, AT91_TWI_SR);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  19  	const unsigned irqstatus = status & at91_twi_read(dev, AT91_TWI_IMR);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  20  	u8 value;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  21  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  22  	if (!irqstatus)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  23  		return IRQ_NONE;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  24  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  25  	/* slave address has been detected on I2C bus */
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  26  	if (irqstatus & AT91_TWI_SVACC) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  27  		if (status & AT91_TWI_SVREAD) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22 @28  			i2c_slave_event(dev->slave,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  29  					I2C_SLAVE_READ_REQUESTED, &value);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  30  			writeb_relaxed(value, dev->base + AT91_TWI_THR);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  31  			at91_twi_write(dev, AT91_TWI_IER,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  32  				       AT91_TWI_TXRDY | AT91_TWI_EOSACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  33  		} else {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  34  			i2c_slave_event(dev->slave,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  35  					I2C_SLAVE_WRITE_REQUESTED, &value);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  36  			at91_twi_write(dev, AT91_TWI_IER,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  37  				       AT91_TWI_RXRDY | AT91_TWI_EOSACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  38  		}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  39  		at91_twi_write(dev, AT91_TWI_IDR, AT91_TWI_SVACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  40  	}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  41  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  42  	/* byte transmitted to remote master */
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  43  	if (irqstatus & AT91_TWI_TXRDY) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  44  		i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED, &value);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  45  		writeb_relaxed(value, dev->base + AT91_TWI_THR);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  46  	}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  47  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  48  	/* byte received from remote master */
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  49  	if (irqstatus & AT91_TWI_RXRDY) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  50  		value = readb_relaxed(dev->base + AT91_TWI_RHR);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  51  		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  52  	}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  53  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  54  	/* master sent stop */
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  55  	if (irqstatus & AT91_TWI_EOSACC) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  56  		at91_twi_write(dev, AT91_TWI_IDR,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  57  			       AT91_TWI_TXRDY | AT91_TWI_RXRDY | AT91_TWI_EOSACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  58  		at91_twi_write(dev, AT91_TWI_IER, AT91_TWI_SVACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22 @59  		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &value);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  60  	}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  61  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  62  	return IRQ_HANDLED;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  63  }
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  64  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  65  static int at91_reg_slave(struct i2c_client *slave)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  66  {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  67  	struct at91_twi_dev *dev = i2c_get_adapdata(slave->adapter);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  68  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  69  	if (dev->slave)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  70  		return -EBUSY;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  71  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  72  	if (slave->flags & I2C_CLIENT_TEN)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  73  		return -EAFNOSUPPORT;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  74  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  75  	/* Make sure twi_clk doesn't get turned off! */
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  76  	pm_runtime_get_sync(dev->dev);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  77  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  78  	dev->slave = slave;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22 @79  	dev->smr = AT91_TWI_SMR_SADR(slave->addr);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  80  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  81  	at91_init_twi_bus(dev);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  82  	at91_twi_write(dev, AT91_TWI_IER, AT91_TWI_SVACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  83  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  84  	dev_info(dev->dev, "entered slave mode (ADR=%d)\n", slave->addr);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  85  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  86  	return 0;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  87  }
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  88  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


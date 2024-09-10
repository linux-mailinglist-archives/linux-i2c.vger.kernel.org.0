Return-Path: <linux-i2c+bounces-6474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEFA9733F0
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 12:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F1061F25B09
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 10:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4241C192B78;
	Tue, 10 Sep 2024 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ts3Yzfq+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C770B18595E;
	Tue, 10 Sep 2024 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725964389; cv=none; b=B+T8L02rx3Kgy6/pntf5hdKWMuQuIwJq634l7uOM0LdadgCckNSdoOQVkTCJ6BkoPX+7V08AEswlrtbU9xsUBfGCiDeDb8uKBnt6jdaIp+zet8jHW8gfLxI7stNPBmSjbBpE2H5332rqhxKd+5Ovs+oVEpu9Xt4V+KuRAm3lLvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725964389; c=relaxed/simple;
	bh=m4rLZiBxy1v0tyc+rkItksP01I5QS7BSDV6XBZRddM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnhwS3NVClXnI9uHTF/H5CljJcq0spBLrDXBe60yBi53jsp5LPOOoPnnbyrf+ZaI21sgsLi0qqy0+bDZLuI0bNRd1fEuuyPOfsWxOHJJPakxaHmO5yU+ai8CcTrqBAFSz5RTrMMKcjdEdBAhEBw1uHCwWZac8Ri7prjQrfMfhPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ts3Yzfq+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725964387; x=1757500387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m4rLZiBxy1v0tyc+rkItksP01I5QS7BSDV6XBZRddM4=;
  b=Ts3Yzfq+6ql54ALFS7aziWBdVLQzJC9mPhVV1l3bX+45ov+hcNOfp/3N
   YzQp2jce0bmx+u93bp+eXNoTbrD1IITXVMBHy5kTVbRpysJ+Bd+tKkntg
   pTZyNW0BDRbW+hDqGr/cau/6Le7rBflh2vtCV5fMEY5VW6125yJi18O3S
   ykX9xg+gSA8N0yIeHPKwky0CWqMojCMdgvjCgmvSfwZKWJub3NPDFkCIo
   PL1+6bKxsVQEpAdUGnS+cPW1HIatkRjvC8lSkdDxZJQcAPP1HfWL0y1FG
   JHXDaqvORNv0iTnmzasCti/AQrGmM8kPQL0BNdTVRXOoFhGOV7uG1rg9d
   Q==;
X-CSE-ConnectionGUID: la59HlZ5TRGXFsMgISfezA==
X-CSE-MsgGUID: Z1LtTAr7TkqQUSHrM6G2eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24846318"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24846318"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:32:57 -0700
X-CSE-ConnectionGUID: gkCTnSf3SbK9cWkk6ZBOTw==
X-CSE-MsgGUID: YoVJC/vlQDeMAQbmagT15g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="97683495"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2024 03:32:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snyB1-0001WW-0R;
	Tue, 10 Sep 2024 10:32:51 +0000
Date: Tue, 10 Sep 2024 18:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus/tps25990): add initial support
Message-ID: <202409101807.GjHADcvQ-lkp@intel.com>
References: <20240909-tps25990-v1-3-39b37e43e795@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909-tps25990-v1-3-39b37e43e795@baylibre.com>

Hi Jerome,

kernel test robot noticed the following build errors:

[auto build test ERROR on d22bd451d5606411895ef55cb105277e4f4f6e54]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/dt-bindings-hwmon-pmbus-add-ti-tps25990-documentation/20240909-234152
base:   d22bd451d5606411895ef55cb105277e4f4f6e54
patch link:    https://lore.kernel.org/r/20240909-tps25990-v1-3-39b37e43e795%40baylibre.com
patch subject: [PATCH 3/3] hwmon: (pmbus/tps25990): add initial support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240910/202409101807.GjHADcvQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101807.GjHADcvQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101807.GjHADcvQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/tps25990.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/hwmon/pmbus/tps25990.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hwmon/pmbus/tps25990.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/hwmon/pmbus/tps25990.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/pmbus/tps25990.c:267:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     267 |                 ret = FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
         |                       ^
>> drivers/hwmon/pmbus/tps25990.c:337:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     337 |                                              FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
         |                                              ^
   7 warnings and 2 errors generated.


vim +/FIELD_GET +267 drivers/hwmon/pmbus/tps25990.c

   254	
   255	static int tps25990_read_word(struct i2c_client *client,
   256				      int page, int phase, int reg)
   257	{
   258		int ret, addr;
   259	
   260		addr = tps25990_get_addr(reg);
   261		if (addr < 0)
   262			return addr;
   263	
   264		switch (reg) {
   265		case PMBUS_VIRT_SAMPLES:
   266			ret = pmbus_read_byte_data(client, page, addr);
 > 267			ret = FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
   268			break;
   269	
   270		case PMBUS_IIN_OC_FAULT_LIMIT:
   271			ret = pmbus_read_byte_data(client, page, addr);
   272			break;
   273	
   274		default:
   275			ret = pmbus_read_word_data(client, page, -1, addr);
   276			break;
   277		}
   278	
   279		if (ret >= 0)
   280			ret = tps25990_read_adapt_value(reg, ret);
   281	
   282		return ret;
   283	}
   284	
   285	static int tps25990_write_adapt_value(int reg, int val)
   286	{
   287		switch (reg) {
   288		case PMBUS_VIN_UV_WARN_LIMIT:
   289		case PMBUS_VIN_UV_FAULT_LIMIT:
   290		case PMBUS_VIN_OV_WARN_LIMIT:
   291		case PMBUS_VOUT_UV_WARN_LIMIT:
   292		case PMBUS_IIN_OC_WARN_LIMIT:
   293		case PMBUS_OT_WARN_LIMIT:
   294		case PMBUS_OT_FAULT_LIMIT:
   295		case PMBUS_PIN_OP_WARN_LIMIT:
   296		case PMBUS_POWER_GOOD_OFF:
   297			val >>= TPS25990_8B_SHIFT;
   298			val = clamp(val, 0, 0xff);
   299			break;
   300	
   301		case PMBUS_VIN_OV_FAULT_LIMIT:
   302			val -= TPS25990_VIN_OVF_OFF;
   303			val = DIV_ROUND_CLOSEST(val * TPS25990_VIN_OVF_DIV, TPS25990_VIN_OVF_NUM);
   304			val = clamp_val(val, 0, 0xf);
   305			break;
   306	
   307		case PMBUS_IIN_OC_FAULT_LIMIT:
   308			val -= TPS25990_IIN_OCF_OFF;
   309			val = DIV_ROUND_CLOSEST(val * TPS25990_IIN_OCF_DIV, TPS25990_IIN_OCF_NUM);
   310			val = clamp_val(val, 0, 0x3f);
   311			break;
   312	
   313		case PMBUS_VIRT_SAMPLES:
   314			val = clamp_val(val, 1, 1 << PK_MIN_AVG_AVG_CNT);
   315			val = ilog2(val);
   316			break;
   317		}
   318	
   319		return val;
   320	}
   321	
   322	static int tps25990_write_word(struct i2c_client *client,
   323				       int page, int reg, u16 value)
   324	{
   325		int addr, ret;
   326	
   327		addr = tps25990_get_addr(reg);
   328		if (addr < 0)
   329			return addr;
   330	
   331		value = tps25990_write_adapt_value(reg, value);
   332	
   333		switch (reg) {
   334		case PMBUS_VIRT_SAMPLES:
   335			ret = pmbus_update_byte_data(client, page, addr,
   336						     PK_MIN_AVG_AVG_CNT,
 > 337						     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
   338			break;
   339	
   340		case PMBUS_IIN_OC_FAULT_LIMIT:
   341			ret = pmbus_write_byte_data(client, page, addr,
   342						    value);
   343			break;
   344	
   345		default:
   346			ret = pmbus_write_word_data(client, page, addr, value);
   347			break;
   348		}
   349	
   350		return ret;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


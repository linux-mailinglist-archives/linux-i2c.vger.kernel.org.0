Return-Path: <linux-i2c+bounces-2398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F2587F486
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 01:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEE1D1F21999
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 00:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DBE3207;
	Tue, 19 Mar 2024 00:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTE80Hf8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0E2257D;
	Tue, 19 Mar 2024 00:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710807984; cv=none; b=iPXruCqYKbnuSNCPm7+A262xu3FjOAgz5tkGeCGR0ObGS0HqDB25n2QBYrGFLcQRHCd0MQDmXBEP7ko1wtzMJyPZWnFemHCPY3RUWDaiXEMqHVCJrFU6mP8NoIzssg0GuLbH8UwrBaIwit3Kzd/de1/3LB5A/2w9MAvH7w6NYMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710807984; c=relaxed/simple;
	bh=LLIv+pugsr/ev0LduqYltbP1hJ6nxTnyLZiG33er3Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6vlyMIYble78iwseS6P2noI2oBDtBOZHCpFMaZfOIfY3aIe3jgUOW3bXp9kbwbvC3TY84UwdYQ5FDy+bNP9uXDBCdfOkk1wROTn5BGjEZcwW2TIyUfXp+D+YeAqRudJmPLcL79N6Ve6u3wjIwMMk83i6QMkIhu2/eHayNvZRcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTE80Hf8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710807982; x=1742343982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LLIv+pugsr/ev0LduqYltbP1hJ6nxTnyLZiG33er3Xk=;
  b=GTE80Hf80IMKcoGUcDpOlP43rSENJgXJiyq70XWz3YSzyZfWzl3g3j3A
   EV2bwxmBYt+2ox/aV8aExdJCXPofuuihIOjxpI0trynWBZCHkPoXsUox2
   YF+Nz/Sc2CaBbQM4wqWBtIw8GZBDicCrTk25nRjUSTIzZHyY7i9rFPeR/
   RyADVIJZPJR3nS45yisT+UpzWP3ZoigZjUdHS67wqK3PYjQzEhqKYx1SE
   vCoJf8FS5zHi4ULwzLjCO5BmkzR23scKHFs45T835cSJLwmb7zxG3aoik
   i045ODMMjWdeyTmU51uOZ/xpIzp5h2WodC5zgdASMlJqoR9a0BOpoXktt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5530491"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5530491"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 17:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="18104690"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2024 17:26:17 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmNJ1-000HKt-0X;
	Tue, 19 Mar 2024 00:26:15 +0000
Date: Tue, 19 Mar 2024 08:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Radu Sabau <radu.sabau@analog.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] hwmon: pmbus: adp1050 : Add driver support
Message-ID: <202403190800.h8cSGROp-lkp@intel.com>
References: <20240318112140.385244-3-radu.sabau@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318112140.385244-3-radu.sabau@analog.com>

Hi Radu,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on robh/for-next linus/master v6.8 next-20240318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Radu-Sabau/dt-bindings-hwmon-pmbus-adp1050-add-bindings/20240318-202619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240318112140.385244-3-radu.sabau%40analog.com
patch subject: [PATCH 2/2] hwmon: pmbus: adp1050 : Add driver support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240319/202403190800.h8cSGROp-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190800.h8cSGROp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190800.h8cSGROp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/adp1050.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/hwmon/pmbus/adp1050.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hwmon/pmbus/adp1050.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/hwmon/pmbus/adp1050.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/pmbus/adp1050.c:47:60: error: too few arguments to function call, expected at least 3, have 2
      47 |                 dev_err_probe(&client->dev, "Device can't be unlocked.\n");
         |                 ~~~~~~~~~~~~~                                            ^
   include/linux/dev_printk.h:277:20: note: 'dev_err_probe' declared here
     277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                    ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/adp1050.c:53:63: error: too few arguments to function call, expected at least 3, have 2
      53 |                 dev_err_probe(&client->dev, "Device couldn't be unlocked.\n");
         |                 ~~~~~~~~~~~~~                                               ^
   include/linux/dev_printk.h:277:20: note: 'dev_err_probe' declared here
     277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                    ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 2 errors generated.


vim +47 drivers/hwmon/pmbus/adp1050.c

    32	
    33	static int adp1050_probe(struct i2c_client *client)
    34	{
    35		u32 vin_scale_monitor, iin_scale_monitor;
    36		int ret;
    37	
    38		if (!i2c_check_functionality(client->adapter,
    39					     I2C_FUNC_SMBUS_WRITE_WORD_DATA))
    40			return -ENODEV;
    41	
    42		/* Unlock CHIP's password in order to be able to read/write to it's
    43		 * VIN_SCALE and IIN_SCALE registers.
    44		*/
    45		ret = i2c_smbus_write_word_data(client, ADP1050_CHIP_PASSWORD, 0xFFFF);
    46		if (ret < 0) {
  > 47			dev_err_probe(&client->dev, "Device can't be unlocked.\n");
    48			return ret;
    49		}
    50	
    51		ret = i2c_smbus_write_word_data(client, ADP1050_CHIP_PASSWORD, 0xFFFF);
    52		if (ret < 0) {
    53			dev_err_probe(&client->dev, "Device couldn't be unlocked.\n");
    54			return ret;
    55		}
    56	
    57		/* If adi,vin-scale-monitor isn't set or is set to 0 means that the
    58		 * VIN monitor isn't used, therefore 0 is used as scale in order
    59		 * for the readings to return 0.
    60		*/
    61		if (device_property_read_u32(&client->dev, "adi,vin-scale-monitor",
    62					     &vin_scale_monitor))
    63			vin_scale_monitor = 0;
    64	
    65		/* If adi,iin-scale-monitor isn't set or is set to 0 means that the
    66		 * IIN monitor isn't used, therefore 0 is used as scale in order
    67		 * for the readings to return 0.
    68		*/
    69		if (device_property_read_u32(&client->dev, "adi,iin-scale-monitor",
    70					     &iin_scale_monitor))
    71			iin_scale_monitor = 0;
    72	
    73		ret = i2c_smbus_write_word_data(client, ADP1050_VIN_SCALE_MONITOR,
    74						vin_scale_monitor);
    75		if (ret < 0)
    76			return ret;
    77	
    78		ret = i2c_smbus_write_word_data(client, ADP1050_IIN_SCALE_MONITOR,
    79						iin_scale_monitor);
    80		if (ret < 0)
    81			return ret;
    82	
    83		return pmbus_do_probe(client, &adp1050_info);
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


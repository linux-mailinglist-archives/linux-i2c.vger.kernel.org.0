Return-Path: <linux-i2c+bounces-2397-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC587F221
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 22:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 856241F21582
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 21:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D378A58ACA;
	Mon, 18 Mar 2024 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apKMhkWh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1FF58239;
	Mon, 18 Mar 2024 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710797360; cv=none; b=oK3kJmx/ghIS81fsk+5LtD2g9ahADoMyYag+3SUKcRi5XziYQWYRfG3yZSb8IyUHitP1dtVyVWa9symXIuYv8us8RNenuE5ZapL3AyD50qbEVS5bmDWaGTHLnQsek17UczlscwK6HxqKawAqXRJ4DIPs14YIZFirI2bSZLA8Bwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710797360; c=relaxed/simple;
	bh=gcIdQLeaNhnFtWxkw1Wh/QfYZrOV3Xkp/tjnkxtLVnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9mp7eDy1lbIzXngqo+oxuQh4BRJFCuKj7wdjokIdI8P5mpm+S1GrcptUoHtmcyuX/vnvDlu2/eEDApjSBIVLIXnD97GiZJPOH1L1ETJSwtSwyEf6X4yNq1fkZ6ggyLqnfuKX5IdRCAj+LUSyTp9qC72RBajkr2RIkQF97QK+UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apKMhkWh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710797358; x=1742333358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gcIdQLeaNhnFtWxkw1Wh/QfYZrOV3Xkp/tjnkxtLVnQ=;
  b=apKMhkWhm5KPfgL0aEBaT1IJ0pzksQ2B85QimnwIeyfDpvyIvYQPAk3T
   ROHS/d6mDGdKtewaKiq4uDs/HVaoSTHgT67ITcnvaQZrTm+/vyLZtKgia
   tangrg6RxXKhw5zEr4w4HnLhnWxq/1Em4EJ+FNXm0ni6FbjEP0RkIo5m3
   dZlLPYzE7weMhwlBe2deVSh8a2qHB0WWcZUa6JAU72boj0Hj2Y59FzuTz
   RToU+y8x39czkJOF7U9POMYtqnDx6u/U9yZvQD+XgWiux5k7QJjejNZp+
   aG28bODWz+KzLTWdA9fmrk3568jQQta9RmE5FM1fPzNhbp0fUx/WmRF5Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="9463214"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="9463214"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 14:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13623636"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Mar 2024 14:29:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmKXg-000HFj-0V;
	Mon, 18 Mar 2024 21:29:12 +0000
Date: Tue, 19 Mar 2024 05:28:37 +0800
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
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] hwmon: pmbus: adp1050 : Add driver support
Message-ID: <202403190552.U4RHYvqc-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240319/202403190552.U4RHYvqc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190552.U4RHYvqc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190552.U4RHYvqc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/adp1050.c: In function 'adp1050_probe':
>> drivers/hwmon/pmbus/adp1050.c:47:45: warning: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
      47 |                 dev_err_probe(&client->dev, "Device can't be unlocked.\n");
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             char *
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/hwmon/pmbus/adp1050.c:9:
   include/linux/dev_printk.h:277:64: note: expected 'int' but argument is of type 'char *'
     277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                            ~~~~^~~
>> drivers/hwmon/pmbus/adp1050.c:47:17: error: too few arguments to function 'dev_err_probe'
      47 |                 dev_err_probe(&client->dev, "Device can't be unlocked.\n");
         |                 ^~~~~~~~~~~~~
   include/linux/dev_printk.h:277:20: note: declared here
     277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                    ^~~~~~~~~~~~~
   drivers/hwmon/pmbus/adp1050.c:53:45: warning: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
      53 |                 dev_err_probe(&client->dev, "Device couldn't be unlocked.\n");
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             char *
   include/linux/dev_printk.h:277:64: note: expected 'int' but argument is of type 'char *'
     277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                            ~~~~^~~
   drivers/hwmon/pmbus/adp1050.c:53:17: error: too few arguments to function 'dev_err_probe'
      53 |                 dev_err_probe(&client->dev, "Device couldn't be unlocked.\n");
         |                 ^~~~~~~~~~~~~
   include/linux/dev_printk.h:277:20: note: declared here
     277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                    ^~~~~~~~~~~~~


vim +/dev_err_probe +47 drivers/hwmon/pmbus/adp1050.c

   > 9	#include <linux/i2c.h>
    10	#include <linux/init.h>
    11	#include <linux/kernel.h>
    12	#include <linux/module.h>
    13	#include <linux/of.h>
    14	#include "pmbus.h"
    15	
    16	#define ADP1050_CHIP_PASSWORD		0xD7
    17	
    18	#define ADP1050_VIN_SCALE_MONITOR	0xD8
    19	#define ADP1050_IIN_SCALE_MONITOR	0xD9
    20	
    21	static struct pmbus_driver_info adp1050_info = {
    22		.pages = 1,
    23		.format[PSC_VOLTAGE_IN] = linear,
    24		.format[PSC_VOLTAGE_OUT] = linear,
    25		.format[PSC_CURRENT_IN] = linear,
    26		.format[PSC_TEMPERATURE] = linear,
    27		.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
    28			| PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
    29			| PMBUS_HAVE_IIN | PMBUS_HAVE_TEMP
    30			| PMBUS_HAVE_STATUS_TEMP,
    31	};
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


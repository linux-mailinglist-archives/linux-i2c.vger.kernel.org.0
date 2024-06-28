Return-Path: <linux-i2c+bounces-4436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C7E91B834
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 09:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0F24283680
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 07:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CD614262C;
	Fri, 28 Jun 2024 07:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nxu+xklR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094513E058;
	Fri, 28 Jun 2024 07:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719559344; cv=none; b=IS5Q9CWw+Do+o3KIyWBrLKajyInyOvoewyQqtnTkbPw1HWf2NzI9st+/2Hq+pDo31t6TsH88+swSQBv0mbunpnhQuxkw0NXoTnNUWcslOFHIbrsxaf85/O9W/7AFoWcsb8JZedrWkf8uT3nDNn6uk5BJB+Mxdzw8BzfusQJyoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719559344; c=relaxed/simple;
	bh=kk0jS6Zn/eajs/D76BtMMEDKGhKMcCaj28YrpERS6qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp6YA1zWCZd24i78WGnC+r4D7fKAgtY/2r1xQbSvj6UBxnCnRgJ1Em7xxu2hP26LVj82abNhgrmDRni+Bphcp+FR1pEWpHXLuk8CBW8TVyggokF4rjtKTPQsIipoySjW8RMxRZFBs0JhSFZE6+1SXTWdFqOKEMc9szrPRQCnODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nxu+xklR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719559341; x=1751095341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kk0jS6Zn/eajs/D76BtMMEDKGhKMcCaj28YrpERS6qw=;
  b=Nxu+xklRrCKBuy4TN8nVFGR5fUyyEcjxeNiUc1ouICMzL1piC3u1xQUR
   pKcudj6F6+Bcxn35IJcbbOJhgxPhtpo3IVlt8zVAfSx+i9VqyqMb3qG6P
   wVEBNpL9Igtp5I4MOjWgkDRJl5pKOVaIwSM7hzzMiK9on2etzkdR7nvqF
   YERuROWgzYceIqJ8W0qaCNxKmjEzqax85mUGj949raG8RPyPUItztk02B
   H2G3KLYqJRf7KYUD85yAPaxb8aJ0GuYE1K+ZIZwkhZZTx6ajzU6WWRPTg
   a+6LtaEj+u/7rbtSwZzuYk8u0z77Vyzz9xopZ9wXBylUSwaPNOBswfpSR
   w==;
X-CSE-ConnectionGUID: oVioolhhSpGwNY3UavbQmQ==
X-CSE-MsgGUID: T69KE4ovQAOqd9nUukrP3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16468202"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="16468202"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 00:22:20 -0700
X-CSE-ConnectionGUID: CBI4nw8NSwuGvrqeMakrxQ==
X-CSE-MsgGUID: VaE3baFuSwybmyPTgbBtPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="49567540"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Jun 2024 00:22:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN5vx-000Gti-2j;
	Fri, 28 Jun 2024 07:22:13 +0000
Date: Fri, 28 Jun 2024 15:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Vdovydchenko <keromvp@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org, Alex Vdovydchenko <xzeol@yahoo.com>
Subject: Re: [PATCH v2 2/2] hwmon: add MP5920 driver
Message-ID: <202406281512.NAdadCZX-lkp@intel.com>
References: <20240627090113.391730-3-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627090113.391730-3-xzeol@yahoo.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on next-20240627]
[cannot apply to robh/for-next krzk-dt/for-next linus/master v6.10-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Vdovydchenko/dt-bindings-hwmon-Add-MPS-mp5920/20240628-021125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240627090113.391730-3-xzeol%40yahoo.com
patch subject: [PATCH v2 2/2] hwmon: add MP5920 driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240628/202406281512.NAdadCZX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281512.NAdadCZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281512.NAdadCZX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/mp5920.c:18:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/pmbus/mp5920.c:26:2: error: use of undeclared identifier 'pages'
      26 |         pages = 1,
         |         ^
>> drivers/hwmon/pmbus/mp5920.c:27:2: error: use of undeclared identifier 'format'
      27 |         format[PSC_VOLTAGE_IN] = direct,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:28:2: error: use of undeclared identifier 'format'
      28 |         format[PSC_VOLTAGE_OUT] = direct,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:29:2: error: use of undeclared identifier 'format'
      29 |         format[PSC_CURRENT_OUT] = direct,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:30:2: error: use of undeclared identifier 'format'
      30 |         format[PSC_POWER] = direct,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:31:2: error: use of undeclared identifier 'format'
      31 |         format[PSC_TEMPERATURE] = direct,
         |         ^
>> drivers/hwmon/pmbus/mp5920.c:32:2: error: use of undeclared identifier 'm'
      32 |         m[PSC_VOLTAGE_IN] = 2266,
         |         ^
>> drivers/hwmon/pmbus/mp5920.c:33:2: error: use of undeclared identifier 'b'
      33 |         b[PSC_VOLTAGE_IN] = 0,
         |         ^
>> drivers/hwmon/pmbus/mp5920.c:34:2: error: use of undeclared identifier 'R'
      34 |         R[PSC_VOLTAGE_IN] = -1,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:35:2: error: use of undeclared identifier 'm'
      35 |         m[PSC_VOLTAGE_OUT] = 2266,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:36:2: error: use of undeclared identifier 'b'
      36 |         b[PSC_VOLTAGE_OUT] = 0,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:37:2: error: use of undeclared identifier 'R'
      37 |         R[PSC_VOLTAGE_OUT] = -1,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:38:2: error: use of undeclared identifier 'm'
      38 |         m[PSC_CURRENT_OUT] = 546,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:39:2: error: use of undeclared identifier 'b'
      39 |         b[PSC_CURRENT_OUT] = 0,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:40:2: error: use of undeclared identifier 'R'
      40 |         R[PSC_CURRENT_OUT] = -2,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:41:2: error: use of undeclared identifier 'm'
      41 |         m[PSC_POWER] = 5840,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:42:2: error: use of undeclared identifier 'b'
      42 |         b[PSC_POWER] = 0,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:43:2: error: use of undeclared identifier 'R'
      43 |         R[PSC_POWER] = -3,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:44:2: error: use of undeclared identifier 'm'
      44 |         m[PSC_TEMPERATURE] = 1067,
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   5 warnings and 20 errors generated.


vim +/pages +26 drivers/hwmon/pmbus/mp5920.c

    24	
    25	static struct pmbus_driver_info mp5920_info = {
  > 26		pages = 1,
  > 27		format[PSC_VOLTAGE_IN] = direct,
    28		format[PSC_VOLTAGE_OUT] = direct,
    29		format[PSC_CURRENT_OUT] = direct,
    30		format[PSC_POWER] = direct,
    31		format[PSC_TEMPERATURE] = direct,
  > 32		m[PSC_VOLTAGE_IN] = 2266,
  > 33		b[PSC_VOLTAGE_IN] = 0,
  > 34		R[PSC_VOLTAGE_IN] = -1,
    35		m[PSC_VOLTAGE_OUT] = 2266,
    36		b[PSC_VOLTAGE_OUT] = 0,
    37		R[PSC_VOLTAGE_OUT] = -1,
    38		m[PSC_CURRENT_OUT] = 546,
    39		b[PSC_CURRENT_OUT] = 0,
    40		R[PSC_CURRENT_OUT] = -2,
    41		m[PSC_POWER] = 5840,
    42		b[PSC_POWER] = 0,
    43		R[PSC_POWER] = -3,
    44		m[PSC_TEMPERATURE] = 1067,
    45		b[PSC_TEMPERATURE] = 20500,
    46		R[PSC_TEMPERATURE] = -2,
    47		func[0] = PMBUS_HAVE_VIN  | PMBUS_HAVE_VOUT |
    48			PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
    49			PMBUS_HAVE_TEMP,
    50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-i2c+bounces-8153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A09D5FEA
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 14:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769B728318D
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 13:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D00762EF;
	Fri, 22 Nov 2024 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFG5ZbX0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF05223741;
	Fri, 22 Nov 2024 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732283257; cv=none; b=tFtEi1JW4fUr4b8jtQl+5sVF4CcjJjERPAcxmanWrNwbLLngXkkOXTVhiISdW8gI5EpfD23QdYO2wgDqm/Mqg/nYWtV0EqzEkazGV+fI0Vp7MpErSN7Zm2mSPJMI8tVmOX0HEF2Q+TiRXsVESe3Fh8HNJme2qE3N5WFqanXsi7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732283257; c=relaxed/simple;
	bh=EVVq2Cqaf1z5IkK+BzTRksvS9eOhQkxJl5rsZKtwTe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbrrUiO6EuBRT95x83O2wMkroUWBkSwfcRhZ4llLgpCnSSBDTpCnny3AvkLjIsuyger8uTaSn9rC34xwnwCxWnxtpCIe+qBWlL2WIGNfYeIYloaTpYfBW67IIlkvFEr2hEGm5cmCLaBJ0ZFB+kIwbX7YaxU9OhEiGMOYro0G8Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFG5ZbX0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732283256; x=1763819256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EVVq2Cqaf1z5IkK+BzTRksvS9eOhQkxJl5rsZKtwTe0=;
  b=VFG5ZbX0W+eyb5ml1cAwtBwYYuPnmL7jTUlQWFMk8cMlPslmj08EquTu
   UUQVH1d1oPxh87XcLG5phXvbyvJJaR+37kLwV4Dv2EhSE6WKV9irRSjzn
   mhKNcP9CDwoBQpMyfc/INDvaJlIN8q2j29ZAwPRl55rXFGH+DEJnanG2G
   lYFco28kjvSItxaKirjITwJRAyn5N/CHPBJLnnFz+rgUykQnyViNkmww/
   44TeLCExSqVJLGPhzHq/JooIvMA7DO59Hyt1YyM6D78tmjD4lmlzkI0BO
   cSbAjlw2kCQRvFLucnX0nAohmEjOG3m7OmxGQdYW+5CItUUUMNpTAF4+y
   g==;
X-CSE-ConnectionGUID: fkbdgRaMR1KAeUpPk89NDw==
X-CSE-MsgGUID: A9U5P6ACSk+wx/gLXAPTlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="35297349"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="35297349"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 05:47:35 -0800
X-CSE-ConnectionGUID: gwJu5Cn3S7648obOxWUOhw==
X-CSE-MsgGUID: V/Vy3jg+TcSJXsIE9BfUCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90994961"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2024 05:47:30 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEU0O-0003x1-1Y;
	Fri, 22 Nov 2024 13:47:28 +0000
Date: Fri, 22 Nov 2024 21:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radu Sabau <radu.sabau@analog.com>,
	Uwe =?unknown-8bit?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
Message-ID: <202411222109.6PmpUvSa-lkp@intel.com>
References: <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>

Hi Cedric,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.12 next-20241122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Encarnacion/dt-bindings-hwmon-pmbus-adp1050-Add-bindings-for-adp1051-adp1055-and-ltp8800/20241121-144856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20241120035826.3920-3-cedricjustine.encarnacion%40analog.com
patch subject: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051, adp1055 and ltp8800
config: i386-buildonly-randconfig-003-20241122 (https://download.01.org/0day-ci/archive/20241122/202411222109.6PmpUvSa-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411222109.6PmpUvSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411222109.6PmpUvSa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/adp1050.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/pmbus/adp1050.c:88:32: error: passing 'const struct pmbus_driver_info *' to parameter of type 'struct pmbus_driver_info *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      88 |         return pmbus_do_probe(client, info);
         |                                       ^~~~
   drivers/hwmon/pmbus/pmbus.h:541:73: note: passing argument to parameter 'info' here
     541 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
         |                                                                         ^
   1 warning and 1 error generated.


vim +88 drivers/hwmon/pmbus/adp1050.c

    79	
    80	static int adp1050_probe(struct i2c_client *client)
    81	{
    82		const struct pmbus_driver_info *info;
    83	
    84		info = device_get_match_data(&client->dev);
    85		if (!info)
    86			return -ENODEV;
    87	
  > 88		return pmbus_do_probe(client, info);
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


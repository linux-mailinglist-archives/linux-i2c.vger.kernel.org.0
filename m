Return-Path: <linux-i2c+bounces-9954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5555A6AACF
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 17:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A8C47A441B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 16:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439101E9B29;
	Thu, 20 Mar 2025 16:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WirxAWXH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A70974BED;
	Thu, 20 Mar 2025 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742487237; cv=none; b=E8QYZf5zg4GCbwuEdR0lxukFVOVozDu30DH9tJUAfHMjjFwmaKupLYQcXqcylposOa9xzCsaPscozRIqKaBcCe5XeWPnl4lglvsMp3uDVeBsrnhcfIeuV55akPYGyEVKpABoLKdiww5d9KWJyfxzTXjA2+yu9332PHaKv1shDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742487237; c=relaxed/simple;
	bh=A03YcV29Mgcr2rKaPyzWSsbf12vj49Zgz++G2QQuW64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dm2dWGyUGJ4BqcHoI6nJ0lYzCY0sUj+hjgHggzymqbC+UmV9JsymVXyk0qp0Sh4liJ15DjXsfhsxmSZk5GU/tT51ul6MD73sfdyIzowuknvtirIqObvC8TmzsTkM2BRPy8x8tm0giForM+hvSf1DacW9LzxazxmvEonIuAOwAxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WirxAWXH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742487235; x=1774023235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A03YcV29Mgcr2rKaPyzWSsbf12vj49Zgz++G2QQuW64=;
  b=WirxAWXHmaRzm//l9h6LcpMFRzr0OBveb9CdkVYiEeWf1LXc0WvM8qtM
   sL9OKZg3ElGB6np96k0MBYV+ZB5wyWWLxDxCUIClNe1kD0rRWb1/tvlPP
   KGcbG2aKJ+cspnA7bASGzhFzxrJWU0dlpt9fY3H4z6ZUaurGNfYmSvaHJ
   IcUn3K0NAxyzo/VqAA1kvI68TG4n/urZi9kWsNQJs2PW9BkFpH+6LERhi
   ne/cy62mTdNDZloppFPbHB2nAXaRTJ/0+yq1ws2wtCa10YtIisQ9nlcCq
   NC2Pi9cefle25C3/47m7m3fHy2wthZyFJPicyP5H0UBEePMaNYkbrfHIN
   g==;
X-CSE-ConnectionGUID: hV6j0USwSSSkQdnTvb9bBQ==
X-CSE-MsgGUID: oRURXpzAT22E7ooUeuqPCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43899522"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43899522"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 09:13:55 -0700
X-CSE-ConnectionGUID: 9IoHnd4OQY+7JNpuWNeaCg==
X-CSE-MsgGUID: ToR0l3G2R/iGOBy74YyI3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="123155500"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Mar 2025 09:13:51 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvIWj-0000aV-2C;
	Thu, 20 Mar 2025 16:13:49 +0000
Date: Fri, 21 Mar 2025 00:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max3440): add support adpm12160
Message-ID: <202503202311.5PZH0XKm-lkp@intel.com>
References: <20250320-dev_adpm12160-v1-2-8f7b975eac75@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320-dev_adpm12160-v1-2-8f7b975eac75@analog.com>

Hi Alexis,

kernel test robot noticed the following build errors:

[auto build test ERROR on c812cc42f92d3d0b17c01b5db9a1dee5793a1491]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexis-Czezar-Torreno/hwmon-pmbus-max34440-Fix-support-for-max34451/20250320-115905
base:   c812cc42f92d3d0b17c01b5db9a1dee5793a1491
patch link:    https://lore.kernel.org/r/20250320-dev_adpm12160-v1-2-8f7b975eac75%40analog.com
patch subject: [PATCH 2/2] hwmon: (pmbus/max3440): add support adpm12160
config: i386-buildonly-randconfig-005-20250320 (https://download.01.org/0day-ci/archive/20250320/202503202311.5PZH0XKm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503202311.5PZH0XKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503202311.5PZH0XKm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/max34440.c: In function 'max34440_read_word_data':
>> drivers/hwmon/pmbus/max34440.c:97:71: error: expected statement before ')' token
      97 |                     data->id != max34451_na6 && data->id != adpm12160))
         |                                                                       ^
   drivers/hwmon/pmbus/max34440.c: At top level:
   drivers/hwmon/pmbus/max34440.c:483:37: error: expected expression before ',' token
     483 |                 MAX34451_COMMON_INFO,
         |                                     ^
   drivers/hwmon/pmbus/max34440.c:486:37: error: expected expression before ',' token
     486 |                 MAX34451_COMMON_INFO,
         |                                     ^
   In file included from include/linux/module.h:22,
                    from drivers/hwmon/pmbus/max34440.c:11:
   drivers/hwmon/pmbus/max34440.c:603:18: error: expected ',' or ';' before 'PMBUS'
     603 | MODULE_IMPORT_NS(PMBUS);
         |                  ^~~~~
   include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
      26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
         |                                                             ^~~~
   include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
     299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
         |                                 ^~~~~~~~~~~
   drivers/hwmon/pmbus/max34440.c:603:1: note: in expansion of macro 'MODULE_IMPORT_NS'
     603 | MODULE_IMPORT_NS(PMBUS);
         | ^~~~~~~~~~~~~~~~


vim +97 drivers/hwmon/pmbus/max34440.c

    62	
    63	static int max34440_read_word_data(struct i2c_client *client, int page,
    64					   int phase, int reg)
    65	{
    66		int ret;
    67		const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
    68		const struct max34440_data *data = to_max34440_data(info);
    69	
    70		switch (reg) {
    71		case PMBUS_IOUT_OC_FAULT_LIMIT:
    72			if (data->id == max34451_na6 || data->id == adpm12160)
    73				ret = pmbus_read_word_data(client, page, phase,
    74							   PMBUS_IOUT_OC_FAULT_LIMIT);
    75			else
    76				ret = pmbus_read_word_data(client, page, phase,
    77							   MAX34440_IOUT_OC_FAULT_LIMIT);
    78			break;
    79		case PMBUS_IOUT_OC_WARN_LIMIT:
    80			if (data->id == max34451_na6 || data->id == adpm12160)
    81				ret = pmbus_read_word_data(client, page, phase,
    82							   PMBUS_IOUT_OC_WARN_LIMIT);
    83			else
    84				ret = pmbus_read_word_data(client, page, phase,
    85							   MAX34440_IOUT_OC_WARN_LIMIT);
    86			break;
    87		case PMBUS_VIRT_READ_VOUT_MIN:
    88			ret = pmbus_read_word_data(client, page, phase,
    89						   MAX34440_MFR_VOUT_MIN);
    90			break;
    91		case PMBUS_VIRT_READ_VOUT_MAX:
    92			ret = pmbus_read_word_data(client, page, phase,
    93						   MAX34440_MFR_VOUT_PEAK);
    94			break;
    95		case PMBUS_VIRT_READ_IOUT_AVG:
    96			if (data->id != max34446 && data->id != max34451 &&
  > 97			    data->id != max34451_na6 && data->id != adpm12160))
    98				return -ENXIO;
    99			ret = pmbus_read_word_data(client, page, phase,
   100						   MAX34446_MFR_IOUT_AVG);
   101			break;
   102		case PMBUS_VIRT_READ_IOUT_MAX:
   103			ret = pmbus_read_word_data(client, page, phase,
   104						   MAX34440_MFR_IOUT_PEAK);
   105			break;
   106		case PMBUS_VIRT_READ_POUT_AVG:
   107			if (data->id != max34446)
   108				return -ENXIO;
   109			ret = pmbus_read_word_data(client, page, phase,
   110						   MAX34446_MFR_POUT_AVG);
   111			break;
   112		case PMBUS_VIRT_READ_POUT_MAX:
   113			if (data->id != max34446)
   114				return -ENXIO;
   115			ret = pmbus_read_word_data(client, page, phase,
   116						   MAX34446_MFR_POUT_PEAK);
   117			break;
   118		case PMBUS_VIRT_READ_TEMP_AVG:
   119			if (data->id != max34446 && data->id != max34460 &&
   120			    data->id != max34461)
   121				return -ENXIO;
   122			ret = pmbus_read_word_data(client, page, phase,
   123						   MAX34446_MFR_TEMPERATURE_AVG);
   124			break;
   125		case PMBUS_VIRT_READ_TEMP_MAX:
   126			ret = pmbus_read_word_data(client, page, phase,
   127						   MAX34440_MFR_TEMPERATURE_PEAK);
   128			break;
   129		case PMBUS_VIRT_RESET_POUT_HISTORY:
   130			if (data->id != max34446)
   131				return -ENXIO;
   132			ret = 0;
   133			break;
   134		case PMBUS_VIRT_RESET_VOUT_HISTORY:
   135		case PMBUS_VIRT_RESET_IOUT_HISTORY:
   136		case PMBUS_VIRT_RESET_TEMP_HISTORY:
   137			ret = 0;
   138			break;
   139		default:
   140			ret = -ENODATA;
   141			break;
   142		}
   143		return ret;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


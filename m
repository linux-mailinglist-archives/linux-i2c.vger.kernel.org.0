Return-Path: <linux-i2c+bounces-9197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E6A1C586
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2025 23:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFEE63A6373
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2025 22:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013252080C6;
	Sat, 25 Jan 2025 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHCqjFya"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D10136326;
	Sat, 25 Jan 2025 22:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737845102; cv=none; b=SEdP4me6R+ih2Hin/iZgooYNe8Lg9NJr/LD6EYE9UOr2DqqciIF6v8Q8SPoz4XG63GuSicG5nNPDwtPtU/HmsAzwKXYBjWhI+whofkFhkNv7UQWChdOT3+CK91t0K+iK+yEAkJSJ1ECtxvT3/dws0QUm8TzYaazIfAmGxf9x5b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737845102; c=relaxed/simple;
	bh=DeQLUVmZC2Rc3T0+MevSflhr0WmfIZJsddHgeFzZfDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+njPxo/CNoqf+SM2MvTgjha8knkvS/sR7MyReycop0c8oW8Efn5SAGJUv9ZATShjLIJqyEndhHrI6Lstg9ifJrSeAPHFgk2VV3XuRZEJJRAI6PzZqJ4x1+xnaihADWF4Ph6m9jgvZc5dUJE9Ygustgagqpr9RDuj5M3Ck9S9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHCqjFya; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737845100; x=1769381100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DeQLUVmZC2Rc3T0+MevSflhr0WmfIZJsddHgeFzZfDg=;
  b=GHCqjFyaTxUwOX7t3w5D0J6Vk+ML6dIdauUOdeGRUE6jZT6pt2ACOMHU
   pvNgFPrgjqufdhU/KO0Voa5OwPVejyzGpnrH36toQtWX06rfoXMihjVaU
   tAa3Sx6afj2LPaf0yixdY00FiK4pvCE48VWPOcbM1I3JNiieCUO2Q5Uay
   y37BV5uvpi/7swDq6rfwV7vjXL2fh+txyxOnc9Fn4/kJN/+RY6+eHesqa
   7Q2aj8ybM69zrdRGr/qCN3ER97h3GtrDnH3etfL5/oa27Nll3j1+q9zFb
   qZYH+VcBQRv4jzHPNDjfng/lQ0LX+EaDF1TOh80j8yJSCI68hVmNFtPi5
   w==;
X-CSE-ConnectionGUID: uRUScuo9SyukJrfZbOBPUg==
X-CSE-MsgGUID: 49yjf3LySBiSEB9gV7U4iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="42010911"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="42010911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 14:44:59 -0800
X-CSE-ConnectionGUID: fLHmbytyS/ySgrxbDisPsw==
X-CSE-MsgGUID: 15lFYMFmS4ydpvrZwrdT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131380871"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2025 14:44:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbotZ-000eJT-2s;
	Sat, 25 Jan 2025 22:44:53 +0000
Date: Sun, 26 Jan 2025 06:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/lt3074): add support for lt3074
Message-ID: <202501260605.Ad7sJxQM-lkp@intel.com>
References: <20250124-upstream-lt3074-v1-2-7603f346433e@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-upstream-lt3074-v1-2-7603f346433e@analog.com>

Hi Cedric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a76539b293677c5c163b9285b0cd8dd420d33989]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Encarnacion/dt-bindings-trivial-devices-add-lt3074/20250124-234209
base:   a76539b293677c5c163b9285b0cd8dd420d33989
patch link:    https://lore.kernel.org/r/20250124-upstream-lt3074-v1-2-7603f346433e%40analog.com
patch subject: [PATCH 2/2] hwmon: (pmbus/lt3074): add support for lt3074
config: hexagon-randconfig-r073-20250126 (https://download.01.org/0day-ci/archive/20250126/202501260605.Ad7sJxQM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260605.Ad7sJxQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260605.Ad7sJxQM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/lt3074.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/pmbus/lt3074.c:103:34: warning: unused variable 'lt3074_of_match' [-Wunused-const-variable]
     103 | static const struct of_device_id lt3074_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +/lt3074_of_match +103 drivers/hwmon/pmbus/lt3074.c

   102	
 > 103	static const struct of_device_id lt3074_of_match[] = {
   104		{ .compatible = "adi,lt3074" },
   105		{}
   106	};
   107	MODULE_DEVICE_TABLE(of, lt3074_of_match);
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


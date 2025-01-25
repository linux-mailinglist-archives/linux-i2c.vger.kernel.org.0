Return-Path: <linux-i2c+bounces-9196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA7EA1C34B
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2025 13:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E0CE168F2B
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2025 12:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5912080F0;
	Sat, 25 Jan 2025 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxK0sMKU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78EC207E18;
	Sat, 25 Jan 2025 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809043; cv=none; b=O9B0fo1e1f+uDRu1dAfxVqzPlzWw3zIowTsB6pDGEkJguoI3VT6C2/6/cqSEwFlmlM6bUoaQr7su2RreoLW5mVYnP1OG5PfgLJZGhxwVAjswcqkh9O+lMnAEe1t9V00yLV2mjb7Dcezu191o3/CCkDZrUniHco8aZu8DwJguanY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809043; c=relaxed/simple;
	bh=NlaAKhY+IZwJhCTyPYWy+HGapQ1kdZ3i1g6TA8GP9Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhqwsyZKRBbSG3oN3HMZiHUk6Hhd7mnzfoa9uH+vEtiM/5Yr0WkCc/hRi0RdqgcYqIY+PtASV1WulK7MiISTwkN3DEfj7IMbgeN7jhKhtudLsMEkIx0ruXMguzK8KcGurbdYLoYiCkP01uHfK0ESG06wrv+X1h6cJYfedpJCDFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxK0sMKU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737809042; x=1769345042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NlaAKhY+IZwJhCTyPYWy+HGapQ1kdZ3i1g6TA8GP9Qc=;
  b=PxK0sMKUkHnBZSgN0X58EW67Cr0Msygtba7zGeO4SBuOderSJP6dcCCF
   QMGIJb2qzaMK8eVPUU0yk2tkb64zcWciIINmt1UWsY6ISOPCjE2/O6CGp
   6h1dM/toBTqoWMGmaNWnu9kB7RShnU5MIx7p0Oyk0os4fDCD1KAEnc5xA
   86T8DZ+fHPurTL+YKPXigmMTvH+fLHfkRot/qqgHvTfPevwxFsE+9Zgtk
   qdVX7nXkv7dSj9bVXHjwychtlEHa31zw9Lll5YNvqm7HCptWPwOoaQTrn
   EuZY0JhP23vXPmU+WTqGPjtnGa8cNzcbImWVTTdra1HFu9LZ9Pv2odUTi
   g==;
X-CSE-ConnectionGUID: K74TjVHtT7ezNlG1E0aBMg==
X-CSE-MsgGUID: 16e0MM14RoWe+ZqzvxW8LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="37590023"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="37590023"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 04:44:01 -0800
X-CSE-ConnectionGUID: aZKkiA7rSxWOWJZF61T1sw==
X-CSE-MsgGUID: Qskw6ZrORVSq3BsHg4s8JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131311353"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2025 04:43:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbfVz-000doF-1O;
	Sat, 25 Jan 2025 12:43:55 +0000
Date: Sat, 25 Jan 2025 20:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radu Sabau <radu.sabau@analog.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/3] hwmon: (pmbus/adp1050): Add support for adp1051,
 adp1055 and ltp8800
Message-ID: <202501252028.3VEwAFiG-lkp@intel.com>
References: <20250124151746.1130-3-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124151746.1130-3-cedricjustine.encarnacion@analog.com>

Hi Cedric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a76539b293677c5c163b9285b0cd8dd420d33989]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Encarnacion/dt-bindings-hwmon-pmbus-adp1050-Add-adp1051-adp1055-and-ltp8800/20250124-233047
base:   a76539b293677c5c163b9285b0cd8dd420d33989
patch link:    https://lore.kernel.org/r/20250124151746.1130-3-cedricjustine.encarnacion%40analog.com
patch subject: [PATCH v4 2/3] hwmon: (pmbus/adp1050): Add support for adp1051, adp1055 and ltp8800
config: arm-randconfig-r133-20250125 (https://download.01.org/0day-ci/archive/20250125/202501252028.3VEwAFiG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250125/202501252028.3VEwAFiG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501252028.3VEwAFiG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/adp1050.c:74:14: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct pmbus_driver_info *info @@     got void const * @@
   drivers/hwmon/pmbus/adp1050.c:74:14: sparse:     expected struct pmbus_driver_info *info
   drivers/hwmon/pmbus/adp1050.c:74:14: sparse:     got void const *

vim +74 drivers/hwmon/pmbus/adp1050.c

    69	
    70	static int adp1050_probe(struct i2c_client *client)
    71	{
    72		struct pmbus_driver_info *info;
    73	
  > 74		info = i2c_get_match_data(client);
    75		if (!info)
    76			return -ENODEV;
    77	
    78		return pmbus_do_probe(client, info);
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


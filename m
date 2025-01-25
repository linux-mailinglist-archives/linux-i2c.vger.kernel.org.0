Return-Path: <linux-i2c+bounces-9195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC3A1C11F
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2025 06:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5555A3A40BD
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2025 05:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3A420766F;
	Sat, 25 Jan 2025 05:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIcXHEOo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED871ADC6D;
	Sat, 25 Jan 2025 05:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737784587; cv=none; b=qPBe7UdeG1z3Nz4x0YUlnnrOAXkkfcoqBXM75D5r+OLgLIKVqoXgTrtG52UAEvlews7SutUqLZXmT6icvMMG8599YlNMvquY1okec9Dm3gJLx1iQeurgnYfYfIgzIvgZfNRkVPiPtTWgAeBLHKpuHo+pdJ9T53JWHVpY1B3eCfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737784587; c=relaxed/simple;
	bh=lEJ50kyvw+UPAGSNydeBfg2PeLtKnNJ9iu5la5ixBTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjU8sVnCwkddsbtXvNVMcNK1WFa8PEZN7WynWA7eyvzj7kkO6BF5RIwZaM7RQngxbeVGz5goaJ/lk1Aj0Z7jPiMKUCqI6M+bUEIH9QjJO5ZQwnIdBk72LBntyf768LRjcItJwp8GWKtUpYFtViasKzcleyKOP/C0gHDlfS2wG6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIcXHEOo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737784586; x=1769320586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lEJ50kyvw+UPAGSNydeBfg2PeLtKnNJ9iu5la5ixBTI=;
  b=cIcXHEOo9GnjaZCYmhRWcOgQkRtAQqBxAF35M82+uJ+83hCIDCheK464
   rqblIyuXHScdsP+JrGyL7L7moEZOLgb/ri1VyfA+CU8KT1xPRKouqLq5M
   pxIpa88ypesWI2IuspGWsp8rS4UgiArNrIX+PrUM+wzhrElHYs3L3uhpZ
   ALpi6MV36L2Rim9S9A/UbuEvsKS0SB7gJFufP+Z2WysHyDJqjj6jggpzc
   7zW/65RMcnxl5Ht8Hqr64qhKAxtj2g6itIHuoiIdWZOpuV/5ObSxy24M5
   TBV6pPea8X/7pKpgze5e6YKw359UXoBw7EXu8RwuU+YlkO5GHkw35p1TL
   A==;
X-CSE-ConnectionGUID: mDnwl3QFSeeGmCYcqBwl1A==
X-CSE-MsgGUID: DTO7QxJCQ/KYS8N3Am7RCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="41162111"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="41162111"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 21:56:25 -0800
X-CSE-ConnectionGUID: dSsiPcqBT4yd2Tgy4Mrrtw==
X-CSE-MsgGUID: FDLKkIFdQkC9C5x0z9G4bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="107845866"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jan 2025 21:56:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbZ9W-000dY7-2p;
	Sat, 25 Jan 2025 05:56:18 +0000
Date: Sat, 25 Jan 2025 13:56:17 +0800
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
Message-ID: <202501251333.fnJxNGFC-lkp@intel.com>
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
config: arm-randconfig-001-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251333.fnJxNGFC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251333.fnJxNGFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251333.fnJxNGFC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/adp1050.c: In function 'adp1050_probe':
>> drivers/hwmon/pmbus/adp1050.c:74:14: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      74 |         info = i2c_get_match_data(client);
         |              ^


vim +/const +74 drivers/hwmon/pmbus/adp1050.c

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


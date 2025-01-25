Return-Path: <linux-i2c+bounces-9194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A6A1C0F5
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2025 05:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E894F18874CA
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2025 04:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0600120767D;
	Sat, 25 Jan 2025 04:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nq4xBhkX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ACE4AEE2;
	Sat, 25 Jan 2025 04:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737780260; cv=none; b=IXebyZmLe5xSZRia9ir0+WojtsHNyjLMi4JNTKVaTP6idEr5qfcKRoZes41DnJE65BhVvqyOXfpbHRLofTzJs1UW8QIEgAKX1BLSydcHUr9Tn0LXqlbcRM195w3fLV+XMPCy0VFUk5AwOprKnszfopMO2W6+mY26Eys1kSr7joU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737780260; c=relaxed/simple;
	bh=GeK+ivtm9xNDqBOzHa6NJe8s56YeRpslIZPxkq3MgSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8zljueorGtOqfhj3mV+uPrK5bXWJ+/eyPb7CKudd8YT4Ed/9OR6AKlduXmYkIJp5EZgyU9dfhaikJzrksDBzb/jd6izprlE9bHOfxLjHs1FMSrQu6nEKjpT5sCCQXhsUQiXlwGsfTz9NQoVguKaxKQNEs4M8GC8pv2GnlO0HGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nq4xBhkX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737780259; x=1769316259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GeK+ivtm9xNDqBOzHa6NJe8s56YeRpslIZPxkq3MgSI=;
  b=Nq4xBhkX18MNWtTqnOCSVb1p0ploAf3CzYfY2IPNW3ovQim5Jj1kUXIF
   yDrONRC8k9iiiwwYxRtxYrn/N1fz6SMfFQO1be2368nJBPdREMctciOqK
   yMyGkdCvyhVDjM31Tm2JVuOS5WwOmFPrDjt0ZMzQF86jUavB4wI76AIJQ
   mUMjfguS2HUJtlfn28+rIWTAOkZmaKc30BnjSJbr8U1zL3GLVbb4pSGUI
   T8QdVvK0kjiUz6k7fbAJ2Ro9sYDLjW43fB7XNjjz88DsQQAbW3dwIL4V0
   O5LPLGBwcCFZjWjzg4f9bZMJplIPuqAhliVQkgeRbyl+Y7095fAt8WmDc
   A==;
X-CSE-ConnectionGUID: RtTMRDLLTK20usP7kBYj5g==
X-CSE-MsgGUID: 4/5qHRI1R4ywpHMk8IJXRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="42082556"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="42082556"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 20:44:19 -0800
X-CSE-ConnectionGUID: 8Xh/AhveRQ+v/LGju9F9HQ==
X-CSE-MsgGUID: mxQRwmRITJSKxgS1h5tsZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="108483131"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2025 20:44:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbY1j-000dTz-2j;
	Sat, 25 Jan 2025 04:44:11 +0000
Date: Sat, 25 Jan 2025 12:44:09 +0800
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
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/3] hwmon: (pmbus/adp1050): Add support for adp1051,
 adp1055 and ltp8800
Message-ID: <202501251226.f8RpjAfp-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on a76539b293677c5c163b9285b0cd8dd420d33989]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Encarnacion/dt-bindings-hwmon-pmbus-adp1050-Add-adp1051-adp1055-and-ltp8800/20250124-233047
base:   a76539b293677c5c163b9285b0cd8dd420d33989
patch link:    https://lore.kernel.org/r/20250124151746.1130-3-cedricjustine.encarnacion%40analog.com
patch subject: [PATCH v4 2/3] hwmon: (pmbus/adp1050): Add support for adp1051, adp1055 and ltp8800
config: arm-randconfig-003-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251226.f8RpjAfp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251226.f8RpjAfp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251226.f8RpjAfp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/adp1050.c:74:7: error: assigning to 'struct pmbus_driver_info *' from 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      74 |         info = i2c_get_match_data(client);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


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


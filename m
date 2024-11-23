Return-Path: <linux-i2c+bounces-8161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B66769D6761
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Nov 2024 04:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50E9BB21088
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Nov 2024 03:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705FD80604;
	Sat, 23 Nov 2024 03:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tt25ql+B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD62AE90;
	Sat, 23 Nov 2024 03:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732331523; cv=none; b=k676LCLp+YzHcZ3jrY0iMqHpbn7CQx09qiF9Fj9bNLjUoPM6zv6dCCY6W5Cxq7epm3XG0/+mM2V7bFw47/6+3FGM1J/PAoj9EiTBgOj6T0ZOANHk6hJP9hKybysuxIGgvh0x/1elA8mt4w+r9gNey9xGH+KDf130R7gkwie6u7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732331523; c=relaxed/simple;
	bh=my0sdPbCbL8tbsUq7oPzvstqctD2sVWOdIYw0qX9VXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcLTWo0WKv9W72YoUsXtq9fF2z2mYuvBk5gsndDYQrajdhHwwqPUIYaZJFwoHBwueVmIUwOrKMP4rTkj2seuD8q//o/763TsX+qLkj4GKEM7641AYDiaIT8Ovwk7hp8sVSRE8qH00gS1sbLt9kmuu67CvTOWX2qYPUwRzLVh+Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tt25ql+B; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732331522; x=1763867522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=my0sdPbCbL8tbsUq7oPzvstqctD2sVWOdIYw0qX9VXU=;
  b=Tt25ql+BhzWDl7qTYott/MMd+OFjQEThIkT0gddFu8kjnqybNJsqBsho
   H5M7sG97b1Com2fXOk0ILip2JgofiI3PCM4mQny009oAcNutjBahCSi29
   aBdVFIjB1t+ub7FB27lbrr7dB6hy1ZZLKp9JPxPuO3cRdAs0jqadxXQ2e
   2P7Mg2vI0TXw1ofZQIlK7zkBxxTKIMbhaU3vcan0hoCzf1MNFgOceIi8c
   UwA8AVkNr5d6AhQzFQHjDzA5eWH7x5RKnx7j6d1k0bLY31oXVLETSyCXd
   NOFJTNiliaMbG+nf/mUDKgxZ/qM6hja1bJ3ZThjPi8XIB9yHINagpdXrw
   w==;
X-CSE-ConnectionGUID: xLNfb9EdTASG4GCo6hlfXg==
X-CSE-MsgGUID: 9py0CTYlQp2axVX8xqCnWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="50015387"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="50015387"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 19:12:01 -0800
X-CSE-ConnectionGUID: x0paM7rRQPiyVYKCEYUY0w==
X-CSE-MsgGUID: WgtPotOpRRyTBS+VLlxiJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95804544"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2024 19:11:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEgYs-0004NL-28;
	Sat, 23 Nov 2024 03:11:54 +0000
Date: Sat, 23 Nov 2024 11:11:38 +0800
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
	Uwe =?unknown-8bit?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
Message-ID: <202411231030.hhgCtzrl-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.12 next-20241122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Encarnacion/dt-bindings-hwmon-pmbus-adp1050-Add-bindings-for-adp1051-adp1055-and-ltp8800/20241121-144856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20241120035826.3920-3-cedricjustine.encarnacion%40analog.com
patch subject: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051, adp1055 and ltp8800
config: loongarch-randconfig-r111-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231030.hhgCtzrl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241123/202411231030.hhgCtzrl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231030.hhgCtzrl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/adp1050.c:88:39: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct pmbus_driver_info *info @@     got struct pmbus_driver_info const *[assigned] info @@
   drivers/hwmon/pmbus/adp1050.c:88:39: sparse:     expected struct pmbus_driver_info *info
   drivers/hwmon/pmbus/adp1050.c:88:39: sparse:     got struct pmbus_driver_info const *[assigned] info

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


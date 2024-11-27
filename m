Return-Path: <linux-i2c+bounces-8230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 729CF9DA026
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 01:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3823A282F81
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 00:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D4E8BFF;
	Wed, 27 Nov 2024 00:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpMmrRsn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3564C7464;
	Wed, 27 Nov 2024 00:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732669009; cv=none; b=XJbpRGxX4wkDDP8Bh2T43VLbqi/CCuDa29g6MaG105KKG0hT7NY33DU+q9cCZAQK8PdMyyTi0fWJVly4J/Bn6i1Hm0q9rb4wCdlEHpgXYfCTWgsAz3WldSOu7b5kTJ1fOJBpqu1GFv9SLijZNkevFCty9wI/h1X5RqNH8I6KfS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732669009; c=relaxed/simple;
	bh=SU7sjnuvXx89piKsXBDVHVCBxQmJmobOXJg9m0XREXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RN2bcPxo5F69pIkn4IXCeGm2qZJEZnJF4FFRYCBIghQVzLfuzFiu7CELgOpnLXiZoiUr8VDiaoQAduaW7vGnbDuQ3xtarL10Mja5Nnh/sGl/lAAXAKUxQH1OvFpxdqhNZdHzuiR6M3UsV1lrZlFtUyjM6Ei35Uqth8yG4y1A2fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpMmrRsn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732669006; x=1764205006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SU7sjnuvXx89piKsXBDVHVCBxQmJmobOXJg9m0XREXo=;
  b=IpMmrRsn+mzgR864jTGitPlax3Z0h2wGsa35L+ON3WtBKFg/Wy4rZ3Qs
   EhbIyWiNaBbak7b6iF2mttuK80Sba2hR/CpEiWoI+wt66986zrR4UKro5
   XP4K2cED9GcYrJbf7Cbg/U2uD9xkpydMdF9pxz0NVZYexDro9IGaMcba5
   Tr4pMJHvKjPOKhX2cqlIsSQAN3M4YZCrnnyxPSSN3RQrwi+6NZKLDHdqE
   tC4WNga4G07yLRfbTOLxyf6Pwfji+ZMjjoMojHZhy+mOru9M5TWnWoHbc
   m2ip4e//EaG3OHwXH/fX19Ho1CfrGk1zpAFSOJugBCzHuQjuwnednS9tA
   Q==;
X-CSE-ConnectionGUID: qBiTgFgLR66u8ylN1l0WBg==
X-CSE-MsgGUID: 80rHt7kRSdWLbmrVTc3B6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50383949"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="50383949"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 16:56:44 -0800
X-CSE-ConnectionGUID: S/NdkWs9QH+kObQfEiNOkg==
X-CSE-MsgGUID: uxUYF5O7SsGkXuI6gQ9V/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="115055182"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 16:56:41 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG6MA-0007dH-2Y;
	Wed, 27 Nov 2024 00:56:38 +0000
Date: Wed, 27 Nov 2024 08:56:16 +0800
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
Message-ID: <202411270817.VqF8OwAB-lkp@intel.com>
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
[also build test WARNING on linus/master v6.12 next-20241126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Encarnacion/dt-bindings-hwmon-pmbus-adp1050-Add-bindings-for-adp1051-adp1055-and-ltp8800/20241121-144856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20241120035826.3920-3-cedricjustine.encarnacion%40analog.com
patch subject: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051, adp1055 and ltp8800
config: loongarch-randconfig-r111-20241122 (https://download.01.org/0day-ci/archive/20241127/202411270817.VqF8OwAB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241127/202411270817.VqF8OwAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270817.VqF8OwAB-lkp@intel.com/

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


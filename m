Return-Path: <linux-i2c+bounces-8127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D289D5512
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 22:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21B821F22644
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 21:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD871D9324;
	Thu, 21 Nov 2024 21:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGlu0Iby"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE583CDA;
	Thu, 21 Nov 2024 21:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732226163; cv=none; b=tqUQMmC7Uojpohy860LMyzHwcES4zjh+AKbT+ZmFK5yYHYAETIOVc1sI0uH8KNhFfEi4PGpajqsg6Sgr9S4761J1u2+yvFWphYi4WtUUNHTBQadMsHL53NznW9JVmOCnckfZakcMO3PeNekMpr4ExRTelStDEdV3TyFtAtDfWds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732226163; c=relaxed/simple;
	bh=ATxtgNT34FvQqkHxvnc3dDn3NIUe4BGii5/L3CVbL5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsGf6wS1WUtofrNlq63n9PTwBjGNQN9NS0yuKlU4mJ97gOtIc1PCy1CPkB5np5u96NzADHrrwruseJNRoH6ff6r0HBNSlOHh2XglFUX6hIpL6LFkLeafj8H7XY7BoQcwAwUkY7BrrS6pe7juY5BxXuMO9g33ZmoEuSm9NAGOZAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGlu0Iby; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732226162; x=1763762162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ATxtgNT34FvQqkHxvnc3dDn3NIUe4BGii5/L3CVbL5Q=;
  b=QGlu0IbyLJU2/RNwn29EG7ENIsVehgsxdkFe1gzeyvRDAEB60Ryvrn2S
   7C1zP8+Predzx48hxwd1j/M6XLnbAenf5IFmb/h3X07nS/16yAdErJaRX
   4+Oltzzv5wvp5G5T52tY/xJ8lZM4P3IXLGEMG94vFVanIsNef8Iv6VNbi
   rX/QBuG+DNGjixn8xk8pWuQsvFmhRUwVamdH2MG2a0lF2GnsoICXeGD73
   RppeZXGVoIFY4iAdOH/8XKFN/92XA7w9lAgCuohG/yy0epJIhOx+2qt68
   9xHknFnDHJfYzpGzhg2TxEtxnnuvvqszC76gK1E+vCr8YPCFJWdDZ8uoQ
   A==;
X-CSE-ConnectionGUID: W6XjVuczQ9m2rp/ObaKBoQ==
X-CSE-MsgGUID: YjH2JAfhT9S4ewyGNSl/Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36146985"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="36146985"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 13:56:01 -0800
X-CSE-ConnectionGUID: umi9aa9ESiO+m450r70/Og==
X-CSE-MsgGUID: ssMEiMNuSPSKEiEAD/cNgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="90183953"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2024 13:55:56 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEF9W-0003Od-17;
	Thu, 21 Nov 2024 21:55:54 +0000
Date: Fri, 22 Nov 2024 05:54:56 +0800
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
Message-ID: <202411220500.414mHL27-lkp@intel.com>
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
[also build test WARNING on linus/master v6.12 next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Encarnacion/dt-bindings-hwmon-pmbus-adp1050-Add-bindings-for-adp1051-adp1055-and-ltp8800/20241121-144856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20241120035826.3920-3-cedricjustine.encarnacion%40analog.com
patch subject: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051, adp1055 and ltp8800
config: loongarch-randconfig-r064-20241122 (https://download.01.org/0day-ci/archive/20241122/202411220500.414mHL27-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220500.414mHL27-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220500.414mHL27-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/adp1050.c: In function 'adp1050_probe':
>> drivers/hwmon/pmbus/adp1050.c:88:39: warning: passing argument 2 of 'pmbus_do_probe' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      88 |         return pmbus_do_probe(client, info);
         |                                       ^~~~
   In file included from drivers/hwmon/pmbus/adp1050.c:12:
   drivers/hwmon/pmbus/pmbus.h:541:73: note: expected 'struct pmbus_driver_info *' but argument is of type 'const struct pmbus_driver_info *'
     541 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~


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


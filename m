Return-Path: <linux-i2c+bounces-6459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE5A972BB6
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 10:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADFFD1C2155C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 08:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2817018FC74;
	Tue, 10 Sep 2024 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqX6uCHF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE68183CC7;
	Tue, 10 Sep 2024 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725955747; cv=none; b=DnmsaXXr8e5unhmN2JnqGmRz4JYO5C/jZaBxfxWukYA3GeKnlLKsK4JWLh7Nr1/GASipXWet/C3lr3ubcC4TCq/YaVtt8BwvjTdB0njD4K3fLSYv0cHaTsRFzfE+xR2lPRcCmi5kT0Sg43UBaeKK/CYL9b5UkqwRL4vJm/+pzak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725955747; c=relaxed/simple;
	bh=CbhqKnSgFyeafE5ynffMFbxesySdvJj911eauV3Hiag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdADuoiIQYVeiejRRQesPztx+y7KSZ2tUpjVkB/nteXOtGqB6x5vfTU0lgaigO5m28U8IasELLs5mAQ0ly3A5e9tfL6g4faLLmNoigJKmJvZvjOUnZ4AShX4uOpQNjb6kwqFvoGseGNZUekxWpnt5eAJrOdAAq9BOhgRkd2VHK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqX6uCHF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725955746; x=1757491746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CbhqKnSgFyeafE5ynffMFbxesySdvJj911eauV3Hiag=;
  b=cqX6uCHFwjbOXDIQMHxmp7bSfpW7ZlHGLPkccFiufDYcUslYlgW1SM9T
   OkePCfXpAmKivPY7aQE7dGVr3f/fRdYU32z0GWPPBEZBZJWxJE1CbNPKG
   Wy9g4MxEIEC13J/P30osgOM7cf4M3zZT8CmEVULAWInXqDvkGZxPMjsQR
   my4ceIIjNCYthdiOE3PjZDpRZoqodBmVGcMDjCrBjqKnpmC1YOrJ5VnSE
   r60HMFe5oPijHw0AYtwDDToxEkibG4S34fdbd0PEwfjE3OPVHUnfFWlWS
   bJJ3x163kWvmSuJeaVLwbll6khcxm615DjUlZXVcHCiLEu+IpjZ3i1DV8
   A==;
X-CSE-ConnectionGUID: aQPbH1+HQki0C2kAMMzmbA==
X-CSE-MsgGUID: 7XNj/sBTQvuWcJqcOxb8ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28466396"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="28466396"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 01:09:02 -0700
X-CSE-ConnectionGUID: MM1uZ7wBTqatJjnpG6ldaA==
X-CSE-MsgGUID: XnXP7mZjTj6X9ne0+UzxVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71069793"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2024 01:08:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snvvk-0000GQ-2r;
	Tue, 10 Sep 2024 08:08:56 +0000
Date: Tue, 10 Sep 2024 16:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus/tps25990): add initial support
Message-ID: <202409101522.ZoP360wM-lkp@intel.com>
References: <20240909-tps25990-v1-3-39b37e43e795@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909-tps25990-v1-3-39b37e43e795@baylibre.com>

Hi Jerome,

kernel test robot noticed the following build errors:

[auto build test ERROR on d22bd451d5606411895ef55cb105277e4f4f6e54]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/dt-bindings-hwmon-pmbus-add-ti-tps25990-documentation/20240909-234152
base:   d22bd451d5606411895ef55cb105277e4f4f6e54
patch link:    https://lore.kernel.org/r/20240909-tps25990-v1-3-39b37e43e795%40baylibre.com
patch subject: [PATCH 3/3] hwmon: (pmbus/tps25990): add initial support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240910/202409101522.ZoP360wM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101522.ZoP360wM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101522.ZoP360wM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/tps25990.c: In function 'tps25990_read_word':
>> drivers/hwmon/pmbus/tps25990.c:267:23: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     267 |                 ret = FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
         |                       ^~~~~~~~~
   drivers/hwmon/pmbus/tps25990.c: In function 'tps25990_write_word':
>> drivers/hwmon/pmbus/tps25990.c:337:46: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     337 |                                              FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
         |                                              ^~~~~~~~~~


vim +/FIELD_GET +267 drivers/hwmon/pmbus/tps25990.c

   254	
   255	static int tps25990_read_word(struct i2c_client *client,
   256				      int page, int phase, int reg)
   257	{
   258		int ret, addr;
   259	
   260		addr = tps25990_get_addr(reg);
   261		if (addr < 0)
   262			return addr;
   263	
   264		switch (reg) {
   265		case PMBUS_VIRT_SAMPLES:
   266			ret = pmbus_read_byte_data(client, page, addr);
 > 267			ret = FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
   268			break;
   269	
   270		case PMBUS_IIN_OC_FAULT_LIMIT:
   271			ret = pmbus_read_byte_data(client, page, addr);
   272			break;
   273	
   274		default:
   275			ret = pmbus_read_word_data(client, page, -1, addr);
   276			break;
   277		}
   278	
   279		if (ret >= 0)
   280			ret = tps25990_read_adapt_value(reg, ret);
   281	
   282		return ret;
   283	}
   284	
   285	static int tps25990_write_adapt_value(int reg, int val)
   286	{
   287		switch (reg) {
   288		case PMBUS_VIN_UV_WARN_LIMIT:
   289		case PMBUS_VIN_UV_FAULT_LIMIT:
   290		case PMBUS_VIN_OV_WARN_LIMIT:
   291		case PMBUS_VOUT_UV_WARN_LIMIT:
   292		case PMBUS_IIN_OC_WARN_LIMIT:
   293		case PMBUS_OT_WARN_LIMIT:
   294		case PMBUS_OT_FAULT_LIMIT:
   295		case PMBUS_PIN_OP_WARN_LIMIT:
   296		case PMBUS_POWER_GOOD_OFF:
   297			val >>= TPS25990_8B_SHIFT;
   298			val = clamp(val, 0, 0xff);
   299			break;
   300	
   301		case PMBUS_VIN_OV_FAULT_LIMIT:
   302			val -= TPS25990_VIN_OVF_OFF;
   303			val = DIV_ROUND_CLOSEST(val * TPS25990_VIN_OVF_DIV, TPS25990_VIN_OVF_NUM);
   304			val = clamp_val(val, 0, 0xf);
   305			break;
   306	
   307		case PMBUS_IIN_OC_FAULT_LIMIT:
   308			val -= TPS25990_IIN_OCF_OFF;
   309			val = DIV_ROUND_CLOSEST(val * TPS25990_IIN_OCF_DIV, TPS25990_IIN_OCF_NUM);
   310			val = clamp_val(val, 0, 0x3f);
   311			break;
   312	
   313		case PMBUS_VIRT_SAMPLES:
   314			val = clamp_val(val, 1, 1 << PK_MIN_AVG_AVG_CNT);
   315			val = ilog2(val);
   316			break;
   317		}
   318	
   319		return val;
   320	}
   321	
   322	static int tps25990_write_word(struct i2c_client *client,
   323				       int page, int reg, u16 value)
   324	{
   325		int addr, ret;
   326	
   327		addr = tps25990_get_addr(reg);
   328		if (addr < 0)
   329			return addr;
   330	
   331		value = tps25990_write_adapt_value(reg, value);
   332	
   333		switch (reg) {
   334		case PMBUS_VIRT_SAMPLES:
   335			ret = pmbus_update_byte_data(client, page, addr,
   336						     PK_MIN_AVG_AVG_CNT,
 > 337						     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
   338			break;
   339	
   340		case PMBUS_IIN_OC_FAULT_LIMIT:
   341			ret = pmbus_write_byte_data(client, page, addr,
   342						    value);
   343			break;
   344	
   345		default:
   346			ret = pmbus_write_word_data(client, page, addr, value);
   347			break;
   348		}
   349	
   350		return ret;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


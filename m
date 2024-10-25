Return-Path: <linux-i2c+bounces-7584-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818599B04FF
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 16:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6E34B22832
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 14:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A6914884C;
	Fri, 25 Oct 2024 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vq3ZG9LP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97670820;
	Fri, 25 Oct 2024 14:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729865116; cv=none; b=RECBBVIzQfCM0+8VV0CcsdhBS4cx1EhTHPXpYArFlzMlSrVAR4iM+Q+K/nWxodg40vHK7/dHMJzusJjtpAoiEBFuMhROuaP/juFOMqLwK8yeU6CtSYBsRUypqdijEUgAOm21/G3rrCili8+CpRnafJHvLNxF/wgZ2dtl7hEjyDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729865116; c=relaxed/simple;
	bh=GawgxtbvGI7SYUVxeirf1cDfVMXixlC3Z+RP/triwAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDnvcDcnpGUu3ZkNNiU8eToQY+RLw1y5qBm+tPR5Vf43M0uHnzCEmuurBPVcGTaMZQXnoRoVuIDDI/KJoMRisi86PH47/btPe8DMP8Ksc6P3OqtJBpwSw0YcmtQfBJdH820o3MP3Ict9lIBKbs2M2sqDcxgPO2CeVZ6aA2q8m9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vq3ZG9LP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729865114; x=1761401114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GawgxtbvGI7SYUVxeirf1cDfVMXixlC3Z+RP/triwAI=;
  b=Vq3ZG9LPO4eTuYlnpPeL4fqMGHgzrDOIDo4wRhmHwh8NZGRWrO1iCGOv
   +9FNyQ7snFDY3aXVTVnD5m0M9y88zGd/jF52ACkoMmywl24pjDZdlCV8/
   8p6SPueo5aytfEXZbJY4bmQjBmHK7l3EweLDdcKMPP1DlId0l6Xvvyyhm
   rxAmCSySVPVBBb52nTBGx6O/kYpxb9TMSVwmBT7D6+CdjFaIDSceyjeAI
   f8hry4woCPiu9bXcAeMTH+YzIrWnIJ1aJKhhw7EL/3wn3MPfdj6RvENY3
   gL0U15As4cMnedo1SM43pnTmsa5YUMYZpz4dNegcQpFBtLkiFEcUza7DL
   A==;
X-CSE-ConnectionGUID: d8NX55DhT3+PNh/iSeuiJg==
X-CSE-MsgGUID: gS2j/dQkTBeCjJh7PFNm+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46998585"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46998585"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:05:14 -0700
X-CSE-ConnectionGUID: LeEsCIqSTim0B3IIZc6TtQ==
X-CSE-MsgGUID: qBDnZ+SMQd2GWJdpJqfSsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="81759791"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2024 07:05:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Kw5-000YKb-09;
	Fri, 25 Oct 2024 14:05:05 +0000
Date: Fri, 25 Oct 2024 22:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v3 6/6] hwmon: (pmbus/tps25990): add initial support
Message-ID: <202410252141.XSGtEsDP-lkp@intel.com>
References: <20241024-tps25990-v3-6-b6a6e9d4b506@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-tps25990-v3-6-b6a6e9d4b506@baylibre.com>

Hi Jerome,

kernel test robot noticed the following build errors:

[auto build test ERROR on 516ddbfef736c843866a0b2db559ce89b40ce378]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/hwmon-pmbus-core-allow-drivers-to-override-WRITE_PROTECT/20241025-021525
base:   516ddbfef736c843866a0b2db559ce89b40ce378
patch link:    https://lore.kernel.org/r/20241024-tps25990-v3-6-b6a6e9d4b506%40baylibre.com
patch subject: [PATCH v3 6/6] hwmon: (pmbus/tps25990): add initial support
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20241025/202410252141.XSGtEsDP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252141.XSGtEsDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252141.XSGtEsDP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/tps25990.c: In function 'tps25990_read_word_data':
>> drivers/hwmon/pmbus/tps25990.c:201:28: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     201 |                 ret = 1 << FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
         |                            ^~~~~~~~~
   drivers/hwmon/pmbus/tps25990.c: In function 'tps25990_write_word_data':
>> drivers/hwmon/pmbus/tps25990.c:260:46: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     260 |                                              FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
         |                                              ^~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/FIELD_GET +201 drivers/hwmon/pmbus/tps25990.c

    85	
    86	static int tps25990_read_word_data(struct i2c_client *client,
    87					   int page, int phase, int reg)
    88	{
    89		int ret;
    90	
    91		switch (reg) {
    92		case PMBUS_VIRT_READ_VIN_MAX:
    93			ret = pmbus_read_word_data(client, page, phase,
    94						   TPS25990_READ_VIN_PEAK);
    95			break;
    96	
    97		case PMBUS_VIRT_READ_VIN_MIN:
    98			ret = pmbus_read_word_data(client, page, phase,
    99						   TPS25990_READ_VIN_MIN);
   100			break;
   101	
   102		case PMBUS_VIRT_READ_VIN_AVG:
   103			ret = pmbus_read_word_data(client, page, phase,
   104						   TPS25990_READ_VIN_AVG);
   105			break;
   106	
   107		case PMBUS_VIRT_READ_VOUT_MIN:
   108			ret = pmbus_read_word_data(client, page, phase,
   109						   TPS25990_READ_VOUT_MIN);
   110			break;
   111	
   112		case PMBUS_VIRT_READ_VOUT_AVG:
   113			ret = pmbus_read_word_data(client, page, phase,
   114						   TPS25990_READ_VOUT_AVG);
   115			break;
   116	
   117		case PMBUS_VIRT_READ_IIN_AVG:
   118			ret = pmbus_read_word_data(client, page, phase,
   119						   TPS25990_READ_IIN_AVG);
   120			break;
   121	
   122		case PMBUS_VIRT_READ_IIN_MAX:
   123			return TPS25990_READ_IIN_PEAK;
   124			ret = pmbus_read_word_data(client, page, phase,
   125						   TPS25990_READ_IIN_PEAK);
   126			break;
   127	
   128		case PMBUS_VIRT_READ_TEMP_AVG:
   129			ret = pmbus_read_word_data(client, page, phase,
   130						   TPS25990_READ_TEMP_AVG);
   131			break;
   132	
   133		case PMBUS_VIRT_READ_TEMP_MAX:
   134			ret = pmbus_read_word_data(client, page, phase,
   135						   TPS25990_READ_TEMP_PEAK);
   136			break;
   137	
   138		case PMBUS_VIRT_READ_PIN_AVG:
   139			ret = pmbus_read_word_data(client, page, phase,
   140						   TPS25990_READ_PIN_AVG);
   141			break;
   142	
   143		case PMBUS_VIRT_READ_PIN_MAX:
   144			ret = pmbus_read_word_data(client, page, phase,
   145						   TPS25990_READ_PIN_PEAK);
   146			break;
   147	
   148		case PMBUS_VIRT_READ_VMON:
   149			ret = pmbus_read_word_data(client, page, phase,
   150						   TPS25990_READ_VAUX);
   151			break;
   152	
   153		case PMBUS_VIN_UV_WARN_LIMIT:
   154		case PMBUS_VIN_UV_FAULT_LIMIT:
   155		case PMBUS_VIN_OV_WARN_LIMIT:
   156		case PMBUS_VOUT_UV_WARN_LIMIT:
   157		case PMBUS_IIN_OC_WARN_LIMIT:
   158		case PMBUS_OT_WARN_LIMIT:
   159		case PMBUS_OT_FAULT_LIMIT:
   160		case PMBUS_PIN_OP_WARN_LIMIT:
   161			/*
   162			 * These registers provide an 8 bits value instead of a
   163			 * 10bits one. Just shifting twice the register value is
   164			 * enough to make the sensor type conversion work, even
   165			 * if the datasheet provides different m, b and R for
   166			 * those.
   167			 */
   168			ret = pmbus_read_word_data(client, page, phase, reg);
   169			if (ret < 0)
   170				break;
   171			ret <<= TPS25990_8B_SHIFT;
   172			break;
   173	
   174		case PMBUS_VIN_OV_FAULT_LIMIT:
   175			ret = pmbus_read_word_data(client, page, phase, reg);
   176			if (ret < 0)
   177				break;
   178			ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
   179						TPS25990_VIN_OVF_DIV);
   180			ret += TPS25990_VIN_OVF_OFF;
   181			break;
   182	
   183		case PMBUS_IIN_OC_FAULT_LIMIT:
   184			/*
   185			 * VIREF directly sets the over-current limit at which the eFuse
   186			 * will turn the FET off and trigger a fault. Expose it through
   187			 * this generic property instead of a manufacturer specific one.
   188			 */
   189			ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
   190			if (ret < 0)
   191				break;
   192			ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
   193						TPS25990_IIN_OCF_DIV);
   194			ret += TPS25990_IIN_OCF_OFF;
   195			break;
   196	
   197		case PMBUS_VIRT_SAMPLES:
   198			ret = pmbus_read_byte_data(client, page, TPS25990_PK_MIN_AVG);
   199			if (ret < 0)
   200				break;
 > 201			ret = 1 << FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
   202			break;
   203	
   204		case PMBUS_VIRT_RESET_TEMP_HISTORY:
   205		case PMBUS_VIRT_RESET_VIN_HISTORY:
   206		case PMBUS_VIRT_RESET_IIN_HISTORY:
   207		case PMBUS_VIRT_RESET_PIN_HISTORY:
   208		case PMBUS_VIRT_RESET_VOUT_HISTORY:
   209			ret = 0;
   210			break;
   211	
   212		default:
   213			ret = -ENODATA;
   214			break;
   215		}
   216	
   217		return ret;
   218	}
   219	
   220	static int tps25990_write_word_data(struct i2c_client *client,
   221					    int page, int reg, u16 value)
   222	{
   223		int ret;
   224	
   225		switch (reg) {
   226		case PMBUS_VIN_UV_WARN_LIMIT:
   227		case PMBUS_VIN_UV_FAULT_LIMIT:
   228		case PMBUS_VIN_OV_WARN_LIMIT:
   229		case PMBUS_VOUT_UV_WARN_LIMIT:
   230		case PMBUS_IIN_OC_WARN_LIMIT:
   231		case PMBUS_OT_WARN_LIMIT:
   232		case PMBUS_OT_FAULT_LIMIT:
   233		case PMBUS_PIN_OP_WARN_LIMIT:
   234			value >>= TPS25990_8B_SHIFT;
   235			value = clamp_val(value, 0, 0xff);
   236			ret = pmbus_write_word_data(client, page, reg, value);
   237			break;
   238	
   239		case PMBUS_VIN_OV_FAULT_LIMIT:
   240			value -= TPS25990_VIN_OVF_OFF;
   241			value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
   242						  TPS25990_VIN_OVF_NUM);
   243			value = clamp_val(value, 0, 0xf);
   244			ret = pmbus_write_word_data(client, page, reg, value);
   245			break;
   246	
   247		case PMBUS_IIN_OC_FAULT_LIMIT:
   248			value -= TPS25990_IIN_OCF_OFF;
   249			value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
   250						TPS25990_IIN_OCF_NUM);
   251			value = clamp_val(value, 0, 0x3f);
   252			ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
   253			break;
   254	
   255		case PMBUS_VIRT_SAMPLES:
   256			value = clamp_val(value, 1, 1 << PK_MIN_AVG_AVG_CNT);
   257			value = ilog2(value);
   258			ret = pmbus_update_byte_data(client, page, TPS25990_PK_MIN_AVG,
   259						     PK_MIN_AVG_AVG_CNT,
 > 260						     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
   261			break;
   262	
   263		case PMBUS_VIRT_RESET_TEMP_HISTORY:
   264		case PMBUS_VIRT_RESET_VIN_HISTORY:
   265		case PMBUS_VIRT_RESET_IIN_HISTORY:
   266		case PMBUS_VIRT_RESET_PIN_HISTORY:
   267		case PMBUS_VIRT_RESET_VOUT_HISTORY:
   268			/*
   269			 * TPS25990 has history resets based on MIN/AVG/PEAK instead of per
   270			 * sensor type. Exposing this quirk in hwmon is not desirable so
   271			 * reset MIN, AVG and PEAK together. Even is there effectively only
   272			 * one reset, which resets everything, expose the 5 entries so
   273			 * userspace is not required map a sensor type to another to trigger
   274			 * a reset
   275			 */
   276			ret = pmbus_update_byte_data(client, 0, TPS25990_PK_MIN_AVG,
   277						     PK_MIN_AVG_RST_MASK,
   278						     PK_MIN_AVG_RST_MASK);
   279			break;
   280	
   281		default:
   282			ret = -ENODATA;
   283			break;
   284		}
   285	
   286		return ret;
   287	}
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


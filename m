Return-Path: <linux-i2c+bounces-7651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5149B4B45
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 14:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C504C1F24202
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 13:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0479A206949;
	Tue, 29 Oct 2024 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACBLUqIv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0806E206056;
	Tue, 29 Oct 2024 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730209829; cv=none; b=OsHsejEiRO/ngxorlEW2n6nZxgnam2+4yVN7ArLYf9Wf9/v2GLuFkgDIFTgJoUCE0+0Dm/hzLgOgV0o+cSiteNb6D+zhDV2gA06bNb6yQkp0r4jGUg1igs7TXjlEc+hAcBs4jSbYhDbgnllJEe3FB2JE1a5LRbn1tI21xY4Ibco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730209829; c=relaxed/simple;
	bh=G5Lw+FbqM7au682KXVrc4WENE/qBbvHLKc4qq77sEfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRD+eInEM7+g2AucrrhvzG7UlM1K//mQ3xBytuXn1RPljVQFiz63loN4giZknKgl2inc3IM7x8XIeJjv9fvonloXq5AXuWgckk2T7bXau8NM0RmmN3xf/a8DmzpHgsEOEIhdYIV0f0dMLQ275CPLqG+Lmntmuq930aqMHQFglc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACBLUqIv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730209824; x=1761745824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G5Lw+FbqM7au682KXVrc4WENE/qBbvHLKc4qq77sEfw=;
  b=ACBLUqIvYk1VTq/2P1yDpnsqlSyGYQweQIjoLAw9KeLM6Tf8N7DSQp82
   C4Nz+hQsxfssgOrBDL94r1g+/Q9e/zmn1NPged2hQE8TYVabiRqF98U47
   RCXQBATjXQzmSC+Z5y37TRQUgiq/NLfRCdMELBVgdBuh/0MTZZjn8ZYMv
   BarMmHKINqe2nRVBA0MGUKZWoTJ77BAo56RUDJBuGknG2iq92Pj2BR8rn
   27aqNSsyIYVQAsKWmobHZ+9Wvpv3Od0rqpJUeuBwNBraWzNZ+S+qmeToP
   ax0E2LQiUmNpua+/KdK3p4cFl/y9G/8fK90T+bwm6wixU4/JYwctPek3s
   Q==;
X-CSE-ConnectionGUID: /vghNpB2S0qdjyCNRQN09w==
X-CSE-MsgGUID: mEjLrAzETMOUyXhmbKWYzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33773967"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="33773967"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 06:50:06 -0700
X-CSE-ConnectionGUID: 4BQIEO7JSqOUynOWn5VCLg==
X-CSE-MsgGUID: i3xMzVB2Q8W+C+U0bcf+6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82111374"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2024 06:50:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5mbf-000dim-1H;
	Tue, 29 Oct 2024 13:49:59 +0000
Date: Tue, 29 Oct 2024 21:49:48 +0800
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
Message-ID: <202410292137.CftTdTLk-lkp@intel.com>
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
config: i386-randconfig-061-20241029 (https://download.01.org/0day-ci/archive/20241029/202410292137.CftTdTLk-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410292137.CftTdTLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410292137.CftTdTLk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/tps25990.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/pmbus/tps25990.c:201:14: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     201 |                 ret = 1 << FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
         |                            ^
>> drivers/hwmon/pmbus/tps25990.c:260:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     260 |                                              FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
         |                                              ^
   1 warning and 2 errors generated.


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


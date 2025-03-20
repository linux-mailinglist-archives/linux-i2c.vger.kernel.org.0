Return-Path: <linux-i2c+bounces-9951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8DA6A831
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 15:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D22485C4F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 14:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF978223705;
	Thu, 20 Mar 2025 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCWXasvC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E3922157F;
	Thu, 20 Mar 2025 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480195; cv=none; b=q+sd1jJW5Xib8FS6Q+T0ZLpVc1NvTlyGCSNZKTi0TweYSlwe5ZbPGq0uU88BAx1PgJqu2zPmq7p6vjLaPm5uYSWBiz6xlYMPdcoMmbCIm4ABGYfFYJBlNTXf7CL+YLeIbal6fe74Kdq3vOce2jE8TFHrxeropzWGQJbE1ABuT8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480195; c=relaxed/simple;
	bh=1c23ChbDo23KyHqNToC9eHrlBDXxURNplK7NRrQ/R2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePkQ2qNWPnDHjT4FhN9kH6ODjc78zaUB3ompDNbAq4dED2GREH+lC2ML9joYgqmVjwg137AG5ngB6fjvUEXfX33SP3R6j9Rg5U3ORUc2oI2ViUmzKJleXi/3taUdjrJNlh4ZHNxkxugjvuatqvuZ9v8phTA7UjuzJShkx2xVDQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCWXasvC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742480194; x=1774016194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1c23ChbDo23KyHqNToC9eHrlBDXxURNplK7NRrQ/R2Q=;
  b=oCWXasvCLB2nvCr52SE3e9A8ka95ol+V2yZsQEuLsMUUqMW1ajuPeGn0
   hIiQyRSwASVb3ke4ZquzawCm+5rjsshd8iyw5Vp5+sQGOR/yc1v8DgXgU
   3Tlz6Y9jrsfL7igV/H0Gw255uDippmYAaAkfLhHm1sKvcOC9QfFzyX3/y
   PubiBetEd0xeTLXe65WjPi99a1Q5QuirMPT92otIsa6VQXmFtV0LNRUPT
   m0SZ9vniBDGJ3xra8o6IAXQSMwxQ4ezarIFGJD02uk62kG4HMjeRT2fIs
   seF6a1GAblj1TqZVvPiH+HFfRFyLKgnTvG6/A6g0wjTnV9R5Tv6jNNAPD
   Q==;
X-CSE-ConnectionGUID: oRELqsTSSoiFfE2Ga9Ig+Q==
X-CSE-MsgGUID: eTVYp8pGSGK5Pt5B1I8wMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="61104376"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="61104376"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 07:16:31 -0700
X-CSE-ConnectionGUID: PIJRkv2NRL2dFYSYxc+0Jw==
X-CSE-MsgGUID: gqGAOd1OQPKG4lVtrsYrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="127942830"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Mar 2025 07:16:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvGh3-0000UN-1I;
	Thu, 20 Mar 2025 14:16:22 +0000
Date: Thu, 20 Mar 2025 22:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH 1/2] hwmon: (pmbus/max34440): Fix support for max34451
Message-ID: <202503202136.NJ1U3Zos-lkp@intel.com>
References: <20250320-dev_adpm12160-v1-1-8f7b975eac75@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320-dev_adpm12160-v1-1-8f7b975eac75@analog.com>

Hi Alexis,

kernel test robot noticed the following build errors:

[auto build test ERROR on c812cc42f92d3d0b17c01b5db9a1dee5793a1491]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexis-Czezar-Torreno/hwmon-pmbus-max34440-Fix-support-for-max34451/20250320-115905
base:   c812cc42f92d3d0b17c01b5db9a1dee5793a1491
patch link:    https://lore.kernel.org/r/20250320-dev_adpm12160-v1-1-8f7b975eac75%40analog.com
patch subject: [PATCH 1/2] hwmon: (pmbus/max34440): Fix support for max34451
config: i386-buildonly-randconfig-005-20250320 (https://download.01.org/0day-ci/archive/20250320/202503202136.NJ1U3Zos-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503202136.NJ1U3Zos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503202136.NJ1U3Zos-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/max34440.c:447:37: error: expected expression before ',' token
     447 |                 MAX34451_COMMON_INFO,
         |                                     ^
   drivers/hwmon/pmbus/max34440.c:450:37: error: expected expression before ',' token
     450 |                 MAX34451_COMMON_INFO,
         |                                     ^
   In file included from include/linux/module.h:22,
                    from drivers/hwmon/pmbus/max34440.c:11:
>> drivers/hwmon/pmbus/max34440.c:566:18: error: expected ',' or ';' before 'PMBUS'
     566 | MODULE_IMPORT_NS(PMBUS);
         |                  ^~~~~
   include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
      26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
         |                                                             ^~~~
   include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
     299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
         |                                 ^~~~~~~~~~~
   drivers/hwmon/pmbus/max34440.c:566:1: note: in expansion of macro 'MODULE_IMPORT_NS'
     566 | MODULE_IMPORT_NS(PMBUS);
         | ^~~~~~~~~~~~~~~~


vim +447 drivers/hwmon/pmbus/max34440.c

   299	
   300	#define MAX34451_COMMON_INFO \
   301		.pages = 21, \
   302		.format[PSC_VOLTAGE_OUT] = direct, \
   303		.format[PSC_TEMPERATURE] = direct, \
   304		.format[PSC_CURRENT_OUT] = direct, \
   305		.m[PSC_VOLTAGE_OUT] = 1, \
   306		.b[PSC_VOLTAGE_OUT] = 0, \
   307		.R[PSC_VOLTAGE_OUT] = 3, \
   308		.m[PSC_CURRENT_OUT] = 1, \
   309		.b[PSC_CURRENT_OUT] = 0, \
   310		.R[PSC_CURRENT_OUT] = 2, \
   311		.m[PSC_TEMPERATURE] = 1, \
   312		.b[PSC_TEMPERATURE] = 0, \
   313		.R[PSC_TEMPERATURE] = 2, \
   314		/* func 0-15 is set dynamically before probing */ \
   315		.func[16] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
   316		.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
   317		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
   318		.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
   319		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
   320		.read_word_data = max34440_read_word_data, \
   321		.write_word_data = max34440_write_word_data,
   322	
   323	static struct pmbus_driver_info max34440_info[] = {
   324		[max34440] = {
   325			.pages = 14,
   326			.format[PSC_VOLTAGE_IN] = direct,
   327			.format[PSC_VOLTAGE_OUT] = direct,
   328			.format[PSC_TEMPERATURE] = direct,
   329			.format[PSC_CURRENT_OUT] = direct,
   330			.m[PSC_VOLTAGE_IN] = 1,
   331			.b[PSC_VOLTAGE_IN] = 0,
   332			.R[PSC_VOLTAGE_IN] = 3,	    /* R = 0 in datasheet reflects mV */
   333			.m[PSC_VOLTAGE_OUT] = 1,
   334			.b[PSC_VOLTAGE_OUT] = 0,
   335			.R[PSC_VOLTAGE_OUT] = 3,    /* R = 0 in datasheet reflects mV */
   336			.m[PSC_CURRENT_OUT] = 1,
   337			.b[PSC_CURRENT_OUT] = 0,
   338			.R[PSC_CURRENT_OUT] = 3,    /* R = 0 in datasheet reflects mA */
   339			.m[PSC_TEMPERATURE] = 1,
   340			.b[PSC_TEMPERATURE] = 0,
   341			.R[PSC_TEMPERATURE] = 2,
   342			.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   343			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   344			.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   345			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   346			.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   347			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   348			.func[3] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   349			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   350			.func[4] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   351			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   352			.func[5] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   353			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   354			.func[6] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   355			.func[7] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   356			.func[8] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   357			.func[9] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   358			.func[10] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   359			.func[11] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   360			.func[12] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   361			.func[13] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   362			.read_byte_data = max34440_read_byte_data,
   363			.read_word_data = max34440_read_word_data,
   364			.write_word_data = max34440_write_word_data,
   365		},
   366		[max34441] = {
   367			.pages = 12,
   368			.format[PSC_VOLTAGE_IN] = direct,
   369			.format[PSC_VOLTAGE_OUT] = direct,
   370			.format[PSC_TEMPERATURE] = direct,
   371			.format[PSC_CURRENT_OUT] = direct,
   372			.format[PSC_FAN] = direct,
   373			.m[PSC_VOLTAGE_IN] = 1,
   374			.b[PSC_VOLTAGE_IN] = 0,
   375			.R[PSC_VOLTAGE_IN] = 3,
   376			.m[PSC_VOLTAGE_OUT] = 1,
   377			.b[PSC_VOLTAGE_OUT] = 0,
   378			.R[PSC_VOLTAGE_OUT] = 3,
   379			.m[PSC_CURRENT_OUT] = 1,
   380			.b[PSC_CURRENT_OUT] = 0,
   381			.R[PSC_CURRENT_OUT] = 3,
   382			.m[PSC_TEMPERATURE] = 1,
   383			.b[PSC_TEMPERATURE] = 0,
   384			.R[PSC_TEMPERATURE] = 2,
   385			.m[PSC_FAN] = 1,
   386			.b[PSC_FAN] = 0,
   387			.R[PSC_FAN] = 0,
   388			.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   389			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   390			.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   391			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   392			.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   393			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   394			.func[3] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   395			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   396			.func[4] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   397			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   398			.func[5] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
   399			.func[6] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   400			.func[7] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   401			.func[8] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   402			.func[9] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   403			.func[10] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   404			.func[11] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   405			.read_byte_data = max34440_read_byte_data,
   406			.read_word_data = max34440_read_word_data,
   407			.write_word_data = max34440_write_word_data,
   408		},
   409		[max34446] = {
   410			.pages = 7,
   411			.format[PSC_VOLTAGE_IN] = direct,
   412			.format[PSC_VOLTAGE_OUT] = direct,
   413			.format[PSC_TEMPERATURE] = direct,
   414			.format[PSC_CURRENT_OUT] = direct,
   415			.format[PSC_POWER] = direct,
   416			.m[PSC_VOLTAGE_IN] = 1,
   417			.b[PSC_VOLTAGE_IN] = 0,
   418			.R[PSC_VOLTAGE_IN] = 3,
   419			.m[PSC_VOLTAGE_OUT] = 1,
   420			.b[PSC_VOLTAGE_OUT] = 0,
   421			.R[PSC_VOLTAGE_OUT] = 3,
   422			.m[PSC_CURRENT_OUT] = 1,
   423			.b[PSC_CURRENT_OUT] = 0,
   424			.R[PSC_CURRENT_OUT] = 3,
   425			.m[PSC_POWER] = 1,
   426			.b[PSC_POWER] = 0,
   427			.R[PSC_POWER] = 3,
   428			.m[PSC_TEMPERATURE] = 1,
   429			.b[PSC_TEMPERATURE] = 0,
   430			.R[PSC_TEMPERATURE] = 2,
   431			.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   432			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
   433			.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   434			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   435			.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   436			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
   437			.func[3] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   438			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
   439			.func[4] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   440			.func[5] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   441			.func[6] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   442			.read_byte_data = max34440_read_byte_data,
   443			.read_word_data = max34440_read_word_data,
   444			.write_word_data = max34440_write_word_data,
   445		},
   446		[max34451] = {
 > 447			MAX34451_COMMON_INFO,
   448		},
   449		[max34451_na6] = {
   450			MAX34451_COMMON_INFO,
   451		},
   452		[max34460] = {
   453			.pages = 18,
   454			.format[PSC_VOLTAGE_OUT] = direct,
   455			.format[PSC_TEMPERATURE] = direct,
   456			.m[PSC_VOLTAGE_OUT] = 1,
   457			.b[PSC_VOLTAGE_OUT] = 0,
   458			.R[PSC_VOLTAGE_OUT] = 3,
   459			.m[PSC_TEMPERATURE] = 1,
   460			.b[PSC_TEMPERATURE] = 0,
   461			.R[PSC_TEMPERATURE] = 2,
   462			.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   463			.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   464			.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   465			.func[3] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   466			.func[4] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   467			.func[5] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   468			.func[6] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   469			.func[7] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   470			.func[8] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   471			.func[9] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   472			.func[10] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   473			.func[11] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   474			.func[13] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   475			.func[14] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   476			.func[15] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   477			.func[16] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   478			.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   479			.read_word_data = max34440_read_word_data,
   480			.write_word_data = max34440_write_word_data,
   481		},
   482		[max34461] = {
   483			.pages = 23,
   484			.format[PSC_VOLTAGE_OUT] = direct,
   485			.format[PSC_TEMPERATURE] = direct,
   486			.m[PSC_VOLTAGE_OUT] = 1,
   487			.b[PSC_VOLTAGE_OUT] = 0,
   488			.R[PSC_VOLTAGE_OUT] = 3,
   489			.m[PSC_TEMPERATURE] = 1,
   490			.b[PSC_TEMPERATURE] = 0,
   491			.R[PSC_TEMPERATURE] = 2,
   492			.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   493			.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   494			.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   495			.func[3] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   496			.func[4] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   497			.func[5] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   498			.func[6] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   499			.func[7] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   500			.func[8] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   501			.func[9] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   502			.func[10] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   503			.func[11] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   504			.func[12] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   505			.func[13] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   506			.func[14] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   507			.func[15] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
   508			/* page 16 is reserved */
   509			.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   510			.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   511			.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   512			.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   513			.func[21] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
   514			.read_word_data = max34440_read_word_data,
   515			.write_word_data = max34440_write_word_data,
   516		},
   517	};
   518	
   519	static int max34440_probe(struct i2c_client *client)
   520	{
   521		struct max34440_data *data;
   522		int rv;
   523	
   524		data = devm_kzalloc(&client->dev, sizeof(struct max34440_data),
   525				    GFP_KERNEL);
   526		if (!data)
   527			return -ENOMEM;
   528		data->id = i2c_match_id(max34440_id, client)->driver_data;
   529		data->info = max34440_info[data->id];
   530	
   531		if (data->id == max34451 || data->id == max34451_na6) {
   532			rv = max34451_set_supported_funcs(client, data);
   533			if (rv)
   534				return rv;
   535		}
   536	
   537		return pmbus_do_probe(client, &data->info);
   538	}
   539	
   540	static const struct i2c_device_id max34440_id[] = {
   541		{"max34440", max34440},
   542		{"max34441", max34441},
   543		{"max34446", max34446},
   544		{"max34451", max34451},
   545		{"max34451_na6", max34451_na6},
   546		{"max34460", max34460},
   547		{"max34461", max34461},
   548		{}
   549	};
   550	MODULE_DEVICE_TABLE(i2c, max34440_id);
   551	
   552	/* This is the driver that will be inserted */
   553	static struct i2c_driver max34440_driver = {
   554		.driver = {
   555			   .name = "max34440",
   556			   },
   557		.probe = max34440_probe,
   558		.id_table = max34440_id,
   559	};
   560	
   561	module_i2c_driver(max34440_driver);
   562	
   563	MODULE_AUTHOR("Guenter Roeck");
   564	MODULE_DESCRIPTION("PMBus driver for Maxim MAX34440/MAX34441");
   565	MODULE_LICENSE("GPL");
 > 566	MODULE_IMPORT_NS(PMBUS);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


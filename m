Return-Path: <linux-i2c+bounces-394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FC47F56F8
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 04:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BC8DB21202
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 03:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947228F6D;
	Thu, 23 Nov 2023 03:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ow8/Xogw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477B91A5;
	Wed, 22 Nov 2023 19:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709437; x=1732245437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cTFDlUOA7dBQQhst5UG03MmMQeoIcoQQ9SKjzBU8kaA=;
  b=Ow8/XogwxAgNBRl7yJROolAsDUei7jNukQvBfmkgvYS45u4MIsllH7xx
   6lzRsE6KFmSeCXblOiwN56c/pLaEB1ZH5u1zStuHDUOHM1FWqygxSoKuN
   +w6wi6geMB2xHllpoJm55o7u890edFwdCq5GmEj6+iveu1kIGFZJchtx0
   xLOwrSkX2wx5kTMEd4ha3e1KP6HUY0jDrufbUswdAfkSutkvKCLKUIuII
   rx4qrBVhTGhATq0ip0FKgq8rYkbBFR2iLh5S3q5BPMUveYCi3n8WqpVHO
   XLZ2zCpMRpVxfkfDCW9BtkX+ZkbIqu9grngxY0IBRP6+P+Vs3mHRbbLVf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372348542"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="372348542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8521856"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2023 19:17:15 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r60DI-0001Am-0Y;
	Thu, 23 Nov 2023 03:17:12 +0000
Date: Thu, 23 Nov 2023 11:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] eeprom: at24: use of_match_ptr()
Message-ID: <202311231054.oSloZJkd-lkp@intel.com>
References: <20231122155916.38037-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122155916.38037-1-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/eeprom-at24-use-of_match_ptr/20231123-000103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20231122155916.38037-1-brgl%40bgdev.pl
patch subject: [PATCH] eeprom: at24: use of_match_ptr()
config: i386-buildonly-randconfig-001-20231123 (https://download.01.org/0day-ci/archive/20231123/202311231054.oSloZJkd-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311231054.oSloZJkd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311231054.oSloZJkd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/eeprom/at24.c:246:34: warning: 'at24_of_match' defined but not used [-Wunused-const-variable=]
    static const struct of_device_id at24_of_match[] = {
                                     ^~~~~~~~~~~~~


vim +/at24_of_match +246 drivers/misc/eeprom/at24.c

2b7a5056a0a7ff drivers/i2c/chips/at24.c   Wolfram Sang             2008-07-14  245  
7f2a2f0d0d66b2 drivers/misc/eeprom/at24.c Javier Martinez Canillas 2017-10-01 @246  static const struct of_device_id at24_of_match[] = {
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  247  	{ .compatible = "atmel,24c00",		.data = &at24_data_24c00 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  248  	{ .compatible = "atmel,24c01",		.data = &at24_data_24c01 },
0f30aca72c3b68 drivers/misc/eeprom/at24.c Bartosz Golaszewski      2017-12-28  249  	{ .compatible = "atmel,24cs01",		.data = &at24_data_24cs01 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  250  	{ .compatible = "atmel,24c02",		.data = &at24_data_24c02 },
0f30aca72c3b68 drivers/misc/eeprom/at24.c Bartosz Golaszewski      2017-12-28  251  	{ .compatible = "atmel,24cs02",		.data = &at24_data_24cs02 },
0f30aca72c3b68 drivers/misc/eeprom/at24.c Bartosz Golaszewski      2017-12-28  252  	{ .compatible = "atmel,24mac402",	.data = &at24_data_24mac402 },
0f30aca72c3b68 drivers/misc/eeprom/at24.c Bartosz Golaszewski      2017-12-28  253  	{ .compatible = "atmel,24mac602",	.data = &at24_data_24mac602 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  254  	{ .compatible = "atmel,spd",		.data = &at24_data_spd },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  255  	{ .compatible = "atmel,24c04",		.data = &at24_data_24c04 },
0f30aca72c3b68 drivers/misc/eeprom/at24.c Bartosz Golaszewski      2017-12-28  256  	{ .compatible = "atmel,24cs04",		.data = &at24_data_24cs04 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  257  	{ .compatible = "atmel,24c08",		.data = &at24_data_24c08 },
0f30aca72c3b68 drivers/misc/eeprom/at24.c Bartosz Golaszewski      2017-12-28  258  	{ .compatible = "atmel,24cs08",		.data = &at24_data_24cs08 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  259  	{ .compatible = "atmel,24c16",		.data = &at24_data_24c16 },
0f30aca72c3b68 drivers/misc/eeprom/at24.c Bartosz Golaszewski      2017-12-28  260  	{ .compatible = "atmel,24cs16",		.data = &at24_data_24cs16 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  261  	{ .compatible = "atmel,24c32",		.data = &at24_data_24c32 },
4791146e9055dd drivers/misc/eeprom/at24.c Marek Vasut              2023-10-10  262  	{ .compatible = "atmel,24c32d-wl",	.data = &at24_data_24c32d_wlp },
0f30aca72c3b68 drivers/misc/eeprom/at24.c Bartosz Golaszewski      2017-12-28  263  	{ .compatible = "atmel,24cs32",		.data = &at24_data_24cs32 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  264  	{ .compatible = "atmel,24c64",		.data = &at24_data_24c64 },
3774740fb22162 drivers/misc/eeprom/at24.c Alexander Stein          2023-10-13  265  	{ .compatible = "atmel,24c64d-wl",	.data = &at24_data_24c64d_wlp },
0f30aca72c3b68 drivers/misc/eeprom/at24.c Bartosz Golaszewski      2017-12-28  266  	{ .compatible = "atmel,24cs64",		.data = &at24_data_24cs64 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  267  	{ .compatible = "atmel,24c128",		.data = &at24_data_24c128 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  268  	{ .compatible = "atmel,24c256",		.data = &at24_data_24c256 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  269  	{ .compatible = "atmel,24c512",		.data = &at24_data_24c512 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  270  	{ .compatible = "atmel,24c1024",	.data = &at24_data_24c1024 },
d08aea21c89dc2 drivers/misc/eeprom/at24.c Maxim Kochetkov          2021-12-10  271  	{ .compatible = "atmel,24c1025",	.data = &at24_data_24c1025 },
37cf28d3b5bca1 drivers/misc/eeprom/at24.c Adrian Bunk              2018-11-29  272  	{ .compatible = "atmel,24c2048",	.data = &at24_data_24c2048 },
b680f4fa74496a drivers/misc/eeprom/at24.c Sven Van Asbroeck        2017-12-20  273  	{ /* END OF LIST */ },
7f2a2f0d0d66b2 drivers/misc/eeprom/at24.c Javier Martinez Canillas 2017-10-01  274  };
7f2a2f0d0d66b2 drivers/misc/eeprom/at24.c Javier Martinez Canillas 2017-10-01  275  MODULE_DEVICE_TABLE(of, at24_of_match);
7f2a2f0d0d66b2 drivers/misc/eeprom/at24.c Javier Martinez Canillas 2017-10-01  276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


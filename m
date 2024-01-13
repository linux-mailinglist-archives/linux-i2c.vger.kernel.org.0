Return-Path: <linux-i2c+bounces-1282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9982F82C95A
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 05:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F6601C2286E
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 04:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8247E572;
	Sat, 13 Jan 2024 04:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsEgEY6B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28546E545;
	Sat, 13 Jan 2024 04:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705120949; x=1736656949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JWWanh9PmSK7J8f/oWxBiK6xFOZKCwVTsBAxbRw8svU=;
  b=AsEgEY6B3JlP//MBlXw6onIj649Y4WsjkH30ykwNE9hNwDbPZyv2HWZt
   ew+Qvp6hz2CnsF0alYvKUQAqjyZdJGbu5Md9J8HC05NC2JnXZLErie/4l
   jJZf4mJ7MWXFKoPQyR1KtWdbqBhMgn9R4u34iOBT8U88o+bpGmk+27yqH
   5jape4hoxpqM+JeKHDULMjFESN8V+pIgWCsHGTXpG/PWt1W99sSbxMa0L
   eQaCoxChtItpq0suqrfbfNsU2juq9J7IUOTmECZGDNQZ60tPqXxCwaHaz
   3kZdt80f0j6q8MjafaESjkJO+bk4GiEdf2vd9MRd4GsBj3zJ3TPB5IHCR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="396489941"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="396489941"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 20:42:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="873581185"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="873581185"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2024 20:42:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOVqg-000A6a-1b;
	Sat, 13 Jan 2024 04:42:22 +0000
Date: Sat, 13 Jan 2024 12:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <202401131227.HL4y41DY-lkp@intel.com>
References: <20240106160935.45487-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240106160935.45487-3-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7]
[cannot apply to wsa/i2c/for-next next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/platform-x86-dell-smo8800-Change-probe-ordering-a-bit/20240107-001715
base:   linus/master
patch link:    https://lore.kernel.org/r/20240106160935.45487-3-hdegoede%40redhat.com
patch subject: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
config: x86_64-buildonly-randconfig-001-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131227.HL4y41DY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131227.HL4y41DY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131227.HL4y41DY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'smo8800_instantiate_i2c_client',
       inlined from 'smo8800_probe' at drivers/platform/x86/dell/dell-smo8800.c:240:2:
>> drivers/platform/x86/dell/dell-smo8800.c:188:21: warning: argument 1 null where non-null expected [-Wnonnull]
     188 |                 if (strcmp(dmi_product_name,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
     189 |                            dell_lis3lv02d_devices[i].dmi_product_name) == 0) {
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/device/bus.h:17,
                    from drivers/platform/x86/dell/dell-smo8800.c:14:
   include/linux/string.h: In function 'smo8800_probe':
   include/linux/string.h:89:12: note: in a call to function 'strcmp' declared 'nonnull'
      89 | extern int strcmp(const char *,const char *);
         |            ^~~~~~


vim +188 drivers/platform/x86/dell/dell-smo8800.c

   173	
   174	static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
   175	{
   176		struct i2c_board_info info = { };
   177		struct i2c_adapter *adap = NULL;
   178		const char *dmi_product_name;
   179		u8 addr = 0;
   180		int i;
   181	
   182		bus_for_each_dev(&i2c_bus_type, NULL, &adap, smo8800_find_i801);
   183		if (!adap)
   184			return;
   185	
   186		dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
   187		for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
 > 188			if (strcmp(dmi_product_name,
   189				   dell_lis3lv02d_devices[i].dmi_product_name) == 0) {
   190				addr = dell_lis3lv02d_devices[i].i2c_addr;
   191				break;
   192			}
   193		}
   194	
   195		if (!addr) {
   196			dev_warn(smo8800->dev,
   197				 "Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration\n");
   198			goto put_adapter;
   199		}
   200	
   201		info.addr = addr;
   202		strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
   203	
   204		smo8800->i2c_dev = i2c_new_client_device(adap, &info);
   205		if (IS_ERR(smo8800->i2c_dev)) {
   206			dev_err_probe(smo8800->dev, PTR_ERR(smo8800->i2c_dev),
   207				      "registering accel i2c_client\n");
   208			smo8800->i2c_dev = NULL;
   209		} else {
   210			dev_info(smo8800->dev, "Registered %s accelerometer on address 0x%02x\n",
   211				 info.type, info.addr);
   212		}
   213	put_adapter:
   214		i2c_put_adapter(adap);
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


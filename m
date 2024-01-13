Return-Path: <linux-i2c+bounces-1291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C76182CD09
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 15:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 546CF1C21336
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 14:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C65A21369;
	Sat, 13 Jan 2024 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyRSH3xN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F981F5F5;
	Sat, 13 Jan 2024 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705155939; x=1736691939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xapJ+ofSknnspAQxelzXXduJqOp7w43On1sapCcFlGI=;
  b=gyRSH3xN18rxtcESbmzFjmCuDkXG/GheTbVxBICndHa+F1G+zf+FCXr+
   kl/gH0LkcSvENUmWrbj8JHtDmrYX1kxWeW50wkdyb9ZITyJVqtS7eBfL+
   nuNEa9k+KD8kyVWJwvJnxVP5gQFSl5poie0a1tDvWob21pAShZe69YKbk
   qRMoSugO/QQ23P0Xk76m9PBA30WmioHc5zuVnvTswTi9Q2IQ+z+QpSGUp
   HGBUN7nSCpUfcK/fTOfLWnsEFLYMrCKxVvSdZTV9+Hqi+ljlNY7FxWwO4
   B8ICiEMaTXEmkfTdRxWNP0lutS4WdNALpUy3QwFf4S5SUeABWia6jYbIi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="396520256"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="396520256"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 06:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="906594160"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="906594160"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Jan 2024 06:25:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOex1-000AZS-2p;
	Sat, 13 Jan 2024 14:25:32 +0000
Date: Sat, 13 Jan 2024 22:24:41 +0800
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
Subject: Re: [PATCH v2 4/6] platform/x86: dell-smo8800: Allow using the IIO
 st_accel driver
Message-ID: <202401132242.9mmyvnaw-lkp@intel.com>
References: <20240106160935.45487-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240106160935.45487-5-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7]
[cannot apply to wsa/i2c/for-next next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/platform-x86-dell-smo8800-Change-probe-ordering-a-bit/20240107-001715
base:   linus/master
patch link:    https://lore.kernel.org/r/20240106160935.45487-5-hdegoede%40redhat.com
patch subject: [PATCH v2 4/6] platform/x86: dell-smo8800: Allow using the IIO st_accel driver
config: i386-buildonly-randconfig-005-20240113 (https://download.01.org/0day-ci/archive/20240113/202401132242.9mmyvnaw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401132242.9mmyvnaw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401132242.9mmyvnaw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/dell/dell-smo8800.c: In function 'smo8800_find_i801':
   drivers/platform/x86/dell/dell-smo8800.c:149:21: error: implicit declaration of function 'i2c_get_adapter'; did you mean 'i2c_get_adapdata'? [-Werror=implicit-function-declaration]
     149 |         *adap_ret = i2c_get_adapter(adap->nr);
         |                     ^~~~~~~~~~~~~~~
         |                     i2c_get_adapdata
   drivers/platform/x86/dell/dell-smo8800.c:149:19: warning: assignment to 'struct i2c_adapter *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     149 |         *adap_ret = i2c_get_adapter(adap->nr);
         |                   ^
   drivers/platform/x86/dell/dell-smo8800.c: In function 'smo8800_detect_accel':
>> drivers/platform/x86/dell/dell-smo8800.c:174:15: error: implicit declaration of function 'i2c_smbus_xfer' [-Werror=implicit-function-declaration]
     174 |         err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
         |               ^~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-smo8800.c: In function 'smo8800_instantiate_i2c_client':
   drivers/platform/x86/dell/dell-smo8800.c:280:28: error: implicit declaration of function 'i2c_new_client_device' [-Werror=implicit-function-declaration]
     280 |         smo8800->i2c_dev = i2c_new_client_device(adap, &info);
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-smo8800.c:280:26: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     280 |         smo8800->i2c_dev = i2c_new_client_device(adap, &info);
         |                          ^
   drivers/platform/x86/dell/dell-smo8800.c:290:9: error: implicit declaration of function 'i2c_put_adapter' [-Werror=implicit-function-declaration]
     290 |         i2c_put_adapter(adap);
         |         ^~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-smo8800.c: In function 'smo8800_probe':
   drivers/platform/x86/dell/dell-smo8800.c:346:9: error: implicit declaration of function 'i2c_unregister_device'; did you mean 'pci_unregister_driver'? [-Werror=implicit-function-declaration]
     346 |         i2c_unregister_device(smo8800->i2c_dev);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         pci_unregister_driver
   cc1: some warnings being treated as errors


vim +/i2c_smbus_xfer +174 drivers/platform/x86/dell/dell-smo8800.c

   134	
   135	static int smo8800_find_i801(struct device *dev, void *data)
   136	{
   137		struct i2c_adapter *adap, **adap_ret = data;
   138	
   139		adap = i2c_verify_adapter(dev);
   140		if (!adap)
   141			return 0;
   142	
   143		if (!strstarts(adap->name, "SMBus I801 adapter"))
   144			return 0;
   145	
   146		if (pci_match_id(i801_idf_ids, to_pci_dev(adap->dev.parent)))
   147			return 0; /* Only register client on main SMBus channel */
   148	
 > 149		*adap_ret = i2c_get_adapter(adap->nr);
   150		return 1;
   151	}
   152	
   153	/*
   154	 * Set label to let iio-sensor-proxy know these freefall sensors are located in
   155	 * the laptop base (not the display) and are not intended for screen rotation.
   156	 */
   157	static const struct property_entry smo8800_accel_props[] = {
   158		PROPERTY_ENTRY_STRING("label", "accel-base"),
   159		{}
   160	};
   161	
   162	const struct software_node smo8800_accel_node = {
   163		.properties = smo8800_accel_props,
   164	};
   165	
   166	static int smo8800_detect_accel(struct smo8800_device *smo8800,
   167					struct i2c_adapter *adap, u8 addr,
   168					struct i2c_board_info *info)
   169	{
   170		union i2c_smbus_data smbus_data;
   171		const char *type;
   172		int err;
   173	
 > 174		err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
   175				     I2C_SMBUS_BYTE_DATA, &smbus_data);
   176		if (err < 0) {
   177			dev_warn(smo8800->dev, "Failed to read who-am-i register: %d\n", err);
   178			return err;
   179		}
   180	
   181		/*
   182		 * These who-am-i register mappings to model strings have been
   183		 * taken from the old /dev/freefall chardev and joystick driver:
   184		 * drivers/misc/lis3lv02d/lis3lv02d.c
   185		 */
   186		switch (smbus_data.byte) {
   187		case 0x32:
   188			type = "lis331dlh";
   189			break;
   190		case 0x33:
   191			type = "lis2de12"; /* LIS3DC / HP3DC in drivers/misc/lis3lv02d/lis3lv02d.c */
   192			break;
   193		case 0x3a:
   194			type = "lis3lv02dl_accel";
   195			break;
   196		case 0x3b:
   197			type = "lis302dl";
   198			break;
   199		default:
   200			dev_warn(smo8800->dev, "Unknown who-am-i register value 0x%02x\n",
   201				 smbus_data.byte);
   202			return -ENODEV;
   203		}
   204	
   205		strscpy(info->type, type, I2C_NAME_SIZE);
   206		info->addr = addr;
   207		info->irq = smo8800->irq;
   208		info->swnode = &smo8800_accel_node;
   209		return 0;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


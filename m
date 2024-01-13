Return-Path: <linux-i2c+bounces-1283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F2682CA75
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 08:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68FCEB23AD5
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 07:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E9317727;
	Sat, 13 Jan 2024 07:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jD1b9VKx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF4714293;
	Sat, 13 Jan 2024 07:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705132063; x=1736668063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VXzp2QNjhJrC9ZmKetCC73rFii1l8jh+GtLGvWEuEzU=;
  b=jD1b9VKxQNjjLlmJ08lE3sA6CgftvvrLezLkWxTUlyIWH+YHM7ZHn6O4
   WC4fxkeakme3cLfCUgLyzJ0hT3JUDwKewCOqVYMqM3890hTT8cclVq97+
   Insm+pheRa+1Yfe+lzxTuJbGO4t0zZZK1mLtFp8BIfGl1swIyMO0pO23j
   2atvN3Uzp08cqsrqkIIi6hv8Ng6dxn2D4vxgLIGnsB8DHlIyFVHMH8XVV
   qzSI6VpmvC8/pFBF/AJgKMLGuNpuEsC30FMTqcd/1f4zIwA0yTKsmZx7C
   rVszW8In6fvdm7of2fasaF6O9sqKkK954QMKQLxKWBPQs4pN052hLzfYt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="485526224"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="485526224"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 23:47:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="817320368"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="817320368"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Jan 2024 23:47:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOYju-000AEK-1x;
	Sat, 13 Jan 2024 07:47:34 +0000
Date: Sat, 13 Jan 2024 15:46:40 +0800
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
Message-ID: <202401131552.PbjGXHjA-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7]
[cannot apply to wsa/i2c/for-next next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/platform-x86-dell-smo8800-Change-probe-ordering-a-bit/20240107-001715
base:   linus/master
patch link:    https://lore.kernel.org/r/20240106160935.45487-3-hdegoede%40redhat.com
patch subject: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
config: i386-buildonly-randconfig-005-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131552.PbjGXHjA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131552.PbjGXHjA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131552.PbjGXHjA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/platform/x86/dell/dell-smo8800.c: In function 'smo8800_find_i801':
>> drivers/platform/x86/dell/dell-smo8800.c:144:21: error: implicit declaration of function 'i2c_get_adapter'; did you mean 'i2c_get_adapdata'? [-Werror=implicit-function-declaration]
     144 |         *adap_ret = i2c_get_adapter(adap->nr);
         |                     ^~~~~~~~~~~~~~~
         |                     i2c_get_adapdata
>> drivers/platform/x86/dell/dell-smo8800.c:144:19: warning: assignment to 'struct i2c_adapter *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     144 |         *adap_ret = i2c_get_adapter(adap->nr);
         |                   ^
   drivers/platform/x86/dell/dell-smo8800.c: In function 'smo8800_instantiate_i2c_client':
>> drivers/platform/x86/dell/dell-smo8800.c:204:28: error: implicit declaration of function 'i2c_new_client_device' [-Werror=implicit-function-declaration]
     204 |         smo8800->i2c_dev = i2c_new_client_device(adap, &info);
         |                            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/dell/dell-smo8800.c:204:26: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     204 |         smo8800->i2c_dev = i2c_new_client_device(adap, &info);
         |                          ^
>> drivers/platform/x86/dell/dell-smo8800.c:214:9: error: implicit declaration of function 'i2c_put_adapter' [-Werror=implicit-function-declaration]
     214 |         i2c_put_adapter(adap);
         |         ^~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-smo8800.c: In function 'smo8800_probe':
>> drivers/platform/x86/dell/dell-smo8800.c:267:9: error: implicit declaration of function 'i2c_unregister_device'; did you mean 'pci_unregister_driver'? [-Werror=implicit-function-declaration]
     267 |         i2c_unregister_device(smo8800->i2c_dev);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         pci_unregister_driver
   cc1: some warnings being treated as errors


vim +144 drivers/platform/x86/dell/dell-smo8800.c

   129	
   130	static int smo8800_find_i801(struct device *dev, void *data)
   131	{
   132		struct i2c_adapter *adap, **adap_ret = data;
   133	
   134		adap = i2c_verify_adapter(dev);
   135		if (!adap)
   136			return 0;
   137	
   138		if (!strstarts(adap->name, "SMBus I801 adapter"))
   139			return 0;
   140	
   141		if (pci_match_id(i801_idf_ids, to_pci_dev(adap->dev.parent)))
   142			return 0; /* Only register client on main SMBus channel */
   143	
 > 144		*adap_ret = i2c_get_adapter(adap->nr);
   145		return 1;
   146	}
   147	
   148	/*
   149	 * Accelerometer's I2C address is not specified in DMI nor ACPI,
   150	 * so it is needed to define mapping table based on DMI product names.
   151	 */
   152	static const struct {
   153		const char *dmi_product_name;
   154		unsigned short i2c_addr;
   155	} dell_lis3lv02d_devices[] = {
   156		/*
   157		 * Dell platform team told us that these Latitude devices have
   158		 * ST microelectronics accelerometer at I2C address 0x29.
   159		 */
   160		{ "Latitude E5250",     0x29 },
   161		{ "Latitude E5450",     0x29 },
   162		{ "Latitude E5550",     0x29 },
   163		{ "Latitude E6440",     0x29 },
   164		{ "Latitude E6440 ATG", 0x29 },
   165		{ "Latitude E6540",     0x29 },
   166		/*
   167		 * Additional individual entries were added after verification.
   168		 */
   169		{ "Latitude 5480",      0x29 },
   170		{ "Vostro V131",        0x1d },
   171		{ "Vostro 5568",        0x29 },
   172	};
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
   188			if (strcmp(dmi_product_name,
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
 > 204		smo8800->i2c_dev = i2c_new_client_device(adap, &info);
   205		if (IS_ERR(smo8800->i2c_dev)) {
   206			dev_err_probe(smo8800->dev, PTR_ERR(smo8800->i2c_dev),
   207				      "registering accel i2c_client\n");
   208			smo8800->i2c_dev = NULL;
   209		} else {
   210			dev_info(smo8800->dev, "Registered %s accelerometer on address 0x%02x\n",
   211				 info.type, info.addr);
   212		}
   213	put_adapter:
 > 214		i2c_put_adapter(adap);
   215	}
   216	
   217	static int smo8800_probe(struct platform_device *device)
   218	{
   219		int err;
   220		struct smo8800_device *smo8800;
   221	
   222		smo8800 = devm_kzalloc(&device->dev, sizeof(*smo8800), GFP_KERNEL);
   223		if (!smo8800) {
   224			dev_err(&device->dev, "failed to allocate device data\n");
   225			return -ENOMEM;
   226		}
   227	
   228		smo8800->dev = &device->dev;
   229		smo8800->miscdev.minor = MISC_DYNAMIC_MINOR;
   230		smo8800->miscdev.name = "freefall";
   231		smo8800->miscdev.fops = &smo8800_misc_fops;
   232	
   233		init_waitqueue_head(&smo8800->misc_wait);
   234	
   235		err = platform_get_irq(device, 0);
   236		if (err < 0)
   237			return err;
   238		smo8800->irq = err;
   239	
   240		smo8800_instantiate_i2c_client(smo8800);
   241	
   242		err = misc_register(&smo8800->miscdev);
   243		if (err) {
   244			dev_err(&device->dev, "failed to register misc dev: %d\n", err);
   245			goto error_unregister_i2c_client;
   246		}
   247	
   248		err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
   249					   smo8800_interrupt_thread,
   250					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
   251					   DRIVER_NAME, smo8800);
   252		if (err) {
   253			dev_err(&device->dev,
   254				"failed to request thread for IRQ %d: %d\n",
   255				smo8800->irq, err);
   256			goto error;
   257		}
   258	
   259		dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
   260			 smo8800->irq);
   261		platform_set_drvdata(device, smo8800);
   262		return 0;
   263	
   264	error:
   265		misc_deregister(&smo8800->miscdev);
   266	error_unregister_i2c_client:
 > 267		i2c_unregister_device(smo8800->i2c_dev);
   268		return err;
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


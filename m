Return-Path: <linux-i2c+bounces-1204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B3826AF2
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 10:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 362681C21E91
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 09:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF47913AC9;
	Mon,  8 Jan 2024 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0OEMWqm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FE614275;
	Mon,  8 Jan 2024 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704706872; x=1736242872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IoKRp5Bx5etXxcBQsq55CfSugHG0VHE95WhSZ/NVhzU=;
  b=e0OEMWqm8keJKGWJq7BXxJWLV+Z1qk3nOvnrCUoX0dAN964tOYmVV3dL
   vxEKs4PQon9poMEz0+4V4VUH9C81TDJvIHviaEzam0QWYO0ctGJAW4mdu
   JkdDRN+1yLb0Vz3Gn3+NYihMIb4YQVDDVynM5sm6M/vroFdu/jmW+9XKw
   +QTGWWeVXwEHI/7KakWePcLKNKRZ8OFyBeY1zDlkphLdB9w0fjsw05b+b
   gAFG4j+b4f2qcPlncsCfUx9eFG7b7dkSAki8S3Ttos+NlABxXUZlUoxjs
   qDq0BRQL/6YkYutiOheXQbKTwu3x4uOotrHlXKwxUD/mBpZdv4c6v851S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="462125513"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="462125513"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="757573113"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="757573113"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Jan 2024 01:41:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMm81-0004aa-3D;
	Mon, 08 Jan 2024 09:41:05 +0000
Date: Mon, 8 Jan 2024 17:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>
Cc: oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
	Marius Hoch <mail@mariushoch.de>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <202401081755.B1WHdRuF-lkp@intel.com>
References: <20231224213629.395741-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231224213629.395741-4-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7]
[cannot apply to wsa/i2c/for-next next-20240108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/platform-x86-dell-smo8800-Only-load-on-Dell-laptops/20231225-152720
base:   linus/master
patch link:    https://lore.kernel.org/r/20231224213629.395741-4-hdegoede%40redhat.com
patch subject: [PATCH 3/6] platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
config: i386-randconfig-003-20240106 (https://download.01.org/0day-ci/archive/20240108/202401081755.B1WHdRuF-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081755.B1WHdRuF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081755.B1WHdRuF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_remove':
>> drivers/platform/x86/dell/dell-smo8800.c:278: undefined reference to `i2c_unregister_device'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_instantiate_i2c_client':
>> drivers/platform/x86/dell/dell-smo8800.c:179: undefined reference to `i2c_bus_type'
>> ld: drivers/platform/x86/dell/dell-smo8800.c:211: undefined reference to `i2c_put_adapter'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_probe':
   drivers/platform/x86/dell/dell-smo8800.c:267: undefined reference to `i2c_unregister_device'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_instantiate_i2c_client':
   drivers/platform/x86/dell/dell-smo8800.c:201: undefined reference to `i2c_new_client_device'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_find_i801':
>> drivers/platform/x86/dell/dell-smo8800.c:126: undefined reference to `i2c_verify_adapter'
>> ld: drivers/platform/x86/dell/dell-smo8800.c:140: undefined reference to `i2c_get_adapter'


vim +278 drivers/platform/x86/dell/dell-smo8800.c

   111	
   112	static int smo8800_find_i801(struct device *dev, void *data)
   113	{
   114		static const u16 i801_idf_pci_device_ids[] = {
   115			0x1d70, /* Patsburg (PCH) */
   116			0x1d71, /* Patsburg (PCH) */
   117			0x1d72, /* Patsburg (PCH) */
   118			0x8d7d, /* Wellsburg (PCH) */
   119			0x8d7e, /* Wellsburg (PCH) */
   120			0x8d7f, /* Wellsburg (PCH) */
   121		};
   122		struct i2c_adapter *adap, **adap_ret = data;
   123		struct pci_dev *pdev;
   124		int i;
   125	
 > 126		adap = i2c_verify_adapter(dev);
   127		if (!adap)
   128			return 0;
   129	
   130		if (!strstarts(adap->name, "SMBus I801 adapter"))
   131			return 0;
   132	
   133		/* The parent of an I801 adapter is always a PCI device */
   134		pdev = to_pci_dev(adap->dev.parent);
   135		for (i = 0; i < ARRAY_SIZE(i801_idf_pci_device_ids); i++) {
   136			if (pdev->device == i801_idf_pci_device_ids[i])
   137				return 0; /* Only register client on main SMBus channel */
   138		}
   139	
 > 140		*adap_ret = i2c_get_adapter(adap->nr);
   141		return 1;
   142	}
   143	
   144	/*
   145	 * Accelerometer's I2C address is not specified in DMI nor ACPI,
   146	 * so it is needed to define mapping table based on DMI product names.
   147	 */
   148	static const struct {
   149		const char *dmi_product_name;
   150		unsigned short i2c_addr;
   151	} dell_lis3lv02d_devices[] = {
   152		/*
   153		 * Dell platform team told us that these Latitude devices have
   154		 * ST microelectronics accelerometer at I2C address 0x29.
   155		 */
   156		{ "Latitude E5250",     0x29 },
   157		{ "Latitude E5450",     0x29 },
   158		{ "Latitude E5550",     0x29 },
   159		{ "Latitude E6440",     0x29 },
   160		{ "Latitude E6440 ATG", 0x29 },
   161		{ "Latitude E6540",     0x29 },
   162		/*
   163		 * Additional individual entries were added after verification.
   164		 */
   165		{ "Latitude 5480",      0x29 },
   166		{ "Latitude E6330",     0x29 },
   167		{ "Vostro V131",        0x1d },
   168		{ "Vostro 5568",        0x29 },
   169	};
   170	
   171	static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
   172	{
   173		struct i2c_board_info info = { };
   174		struct i2c_adapter *adap = NULL;
   175		const char *dmi_product_name;
   176		u8 addr = 0;
   177		int i;
   178	
 > 179		bus_for_each_dev(&i2c_bus_type, NULL, &adap, smo8800_find_i801);
   180		if (!adap)
   181			return;
   182	
   183		dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
   184		for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
   185			if (strcmp(dmi_product_name,
   186				   dell_lis3lv02d_devices[i].dmi_product_name) == 0) {
   187				addr = dell_lis3lv02d_devices[i].i2c_addr;
   188				break;
   189			}
   190		}
   191	
   192		if (!addr) {
   193			dev_warn(smo8800->dev,
   194				 "Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration\n");
   195			goto put_adapter;
   196		}
   197	
   198		info.addr = addr;
   199		strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
   200	
   201		smo8800->i2c_dev = i2c_new_client_device(adap, &info);
   202		if (IS_ERR(smo8800->i2c_dev)) {
   203			dev_err_probe(smo8800->dev, PTR_ERR(smo8800->i2c_dev),
   204				      "registering accel i2c_client\n");
   205			smo8800->i2c_dev = NULL;
   206		} else {
   207			dev_info(smo8800->dev, "Registered %s accelerometer on address 0x%02x\n",
   208				 info.type, info.addr);
   209		}
   210	put_adapter:
 > 211		i2c_put_adapter(adap);
   212	}
   213	
   214	static int smo8800_probe(struct platform_device *device)
   215	{
   216		int err;
   217		struct smo8800_device *smo8800;
   218	
   219		if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
   220			return false;
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
   267		i2c_unregister_device(smo8800->i2c_dev);
   268		return err;
   269	}
   270	
   271	static void smo8800_remove(struct platform_device *device)
   272	{
   273		struct smo8800_device *smo8800 = platform_get_drvdata(device);
   274	
   275		free_irq(smo8800->irq, smo8800);
   276		misc_deregister(&smo8800->miscdev);
   277		dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
 > 278		i2c_unregister_device(smo8800->i2c_dev);
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


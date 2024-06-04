Return-Path: <linux-i2c+bounces-3774-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126A78FA9CF
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 07:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD6FB28E302
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 05:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C0C13DDB2;
	Tue,  4 Jun 2024 05:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARH6LJQq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7482A8D0
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 05:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478064; cv=none; b=pRqwcIn01CE7tXM7sdpOn/L0KSroHamY4/hVdSf7PYzhclBW4wpmMrvp+ikLSOxsL6hB+JR06p0KbtQ+A5exg9v1hBZrP3HNv7L8tgY/lCHd+ssnoyI17MQqdSMaYiOygBX/lHb4+P4zJXRShQGJGyXR9n02MipOyweVGF5dVk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478064; c=relaxed/simple;
	bh=BFs+Im/0w0+5yhb0ZsHQ8NsdUzGpCZq3fhm5A3fGSek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfiSzMtk9E2yYshkLZGDyIIKPTpllxezQvVjlkxEQYZEImsDVwSltbrVYeFtIt8xjftUrguEG79b9SXwFwXka332honEVzQayrYh0fYWJGs6yCfEuBFxlXF8pkAE8DakYAg2CK6tfGrZHJGcKLDd8WejmwSkaF3V+WB9wsrDbXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARH6LJQq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717478062; x=1749014062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BFs+Im/0w0+5yhb0ZsHQ8NsdUzGpCZq3fhm5A3fGSek=;
  b=ARH6LJQqX3sr1MfNRJ9yA2acBzrAvcRBtO1PuJUKEVOR5HslJpTwBzme
   5gZWxQReLd6XQxevl46IzlDgMAsRt+5ptYaZWYuIo++7AAFvaplPiiklm
   /0CDlKKg3DbYpgXTH094xoC0e/oaduHQ74MjLPQP2v9GlwMZUF+9zgOh9
   mgJJ0AcMciSRRGFzd2a1NLlFJ8Ggpn8+x5B1CdJHC5KKmpG1Fk0jsgFYO
   TNOYSKGMPYlrxmuXz9kZabs4xQ1PxRSw0itn2FGbdOLJsSM2fMZ+Ikhq2
   HyIat+9rDXisTT0/WYNWN2I4wB9fBoIr2xwYkLdi6/lEdqGMSdbSjys78
   g==;
X-CSE-ConnectionGUID: lPBFEJKFSYSvCHgwWuJ/jQ==
X-CSE-MsgGUID: 3F8yzMMSSl+I1HRVOPV/Sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="16936850"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="16936850"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 22:14:18 -0700
X-CSE-ConnectionGUID: C4aXGUYRTU6jFPVtV1xDaA==
X-CSE-MsgGUID: P3BX5KqWTvO00/CuBJmd/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37172643"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2024 22:14:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEMUw-000Mb5-01;
	Tue, 04 Jun 2024 05:14:14 +0000
Date: Tue, 4 Jun 2024 13:13:40 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <gerhard@engleder-embedded.com>,
	linux-i2c@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andi.shyti@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: Re: [PATCH 2/2] misc: keba: Add basic KEBA CP500 system FPGA support
Message-ID: <202406041218.9TKBWHf2-lkp@intel.com>
References: <20240601192846.68146-3-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601192846.68146-3-gerhard@engleder-embedded.com>

Hi Gerhard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.10-rc2 next-20240603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gerhard-Engleder/i2c-keba-Add-KEBA-I2C-controller-support/20240602-040548
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240601192846.68146-3-gerhard%40engleder-embedded.com
patch subject: [PATCH 2/2] misc: keba: Add basic KEBA CP500 system FPGA support
config: csky-randconfig-r132-20240604 (https://download.01.org/0day-ci/archive/20240604/202406041218.9TKBWHf2-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240604/202406041218.9TKBWHf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041218.9TKBWHf2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/keba/cp500.c:64:19: sparse: sparse: symbol 'cp035_devices' was not declared. Should it be static?
>> drivers/misc/keba/cp500.c:70:19: sparse: sparse: symbol 'cp505_devices' was not declared. Should it be static?
>> drivers/misc/keba/cp500.c:76:19: sparse: sparse: symbol 'cp520_devices' was not declared. Should it be static?
>> drivers/misc/keba/cp500.c:262:26: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/keba/cp500.c:324:22: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/keba/cp500.c:407:34: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/keba/cp500.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +/cp035_devices +64 drivers/misc/keba/cp500.c

    62	
    63	/* list of devices within FPGA of CP035 family (CP035, CP056, CP057) */
  > 64	struct cp500_devs cp035_devices = {
    65		.startup   = { 0x0000, SZ_4K },
    66		.i2c       = { 0x4000, SZ_4K },
    67	};
    68	
    69	/* list of devices within FPGA of CP505 family (CP503, CP505, CP507) */
  > 70	struct cp500_devs cp505_devices = {
    71		.startup   = { 0x0000, SZ_4K },
    72		.i2c       = { 0x5000, SZ_4K },
    73	};
    74	
    75	/* list of devices within FPGA of CP520 family (CP520, CP530) */
  > 76	struct cp500_devs cp520_devices = {
    77		.startup     = { 0x0000, SZ_4K },
    78		.i2c         = { 0x5000, SZ_4K },
    79	};
    80	
    81	struct cp500 {
    82		struct pci_dev *pci_dev;
    83		struct cp500_devs *devs;
    84		int msix_num;
    85		struct {
    86			int major;
    87			int minor;
    88			int build;
    89		} version;
    90	
    91		/* system FPGA BAR */
    92		resource_size_t sys_hwbase;
    93		struct platform_device *i2c;
    94	
    95		/* ECM EtherCAT BAR */
    96		resource_size_t ecm_hwbase;
    97	
    98		void __iomem *system_startup_addr;
    99	};
   100	
   101	/* I2C devices */
   102	static struct i2c_board_info cp500_i2c_info[] = {
   103		{	/* temperature sensor */
   104			I2C_BOARD_INFO("emc1403", 0x4c),
   105		},
   106		{	/* CPU EEPROM
   107			 * CP035 family: CPU board
   108			 * CP505 family: bridge board
   109			 * CP520 family: carrier board
   110			 */
   111			I2C_BOARD_INFO("24c32", 0x50),
   112			.dev_name = CP500_HW_CPU_EEPROM_NAME,
   113		},
   114		{	/* interface board EEPROM */
   115			I2C_BOARD_INFO("24c32", 0x51),
   116		},
   117		{	/* EEPROM (optional)
   118			 * CP505 family: CPU board
   119			 * CP520 family: MMI board
   120			 */
   121			I2C_BOARD_INFO("24c32", 0x52),
   122		},
   123		{	/* extension module 0 EEPROM (optional) */
   124			I2C_BOARD_INFO("24c32", 0x53),
   125		},
   126		{	/* extension module 1 EEPROM (optional) */
   127			I2C_BOARD_INFO("24c32", 0x54),
   128		},
   129		{	/* extension module 2 EEPROM (optional) */
   130			I2C_BOARD_INFO("24c32", 0x55),
   131		},
   132		{	/* extension module 3 EEPROM (optional) */
   133			I2C_BOARD_INFO("24c32", 0x56),
   134		}
   135	};
   136	
   137	static ssize_t cp500_get_fpga_version(struct cp500 *cp500, char *buf,
   138					      size_t max_len)
   139	{
   140		int n;
   141	
   142		if (CP500_IS_CP035(cp500))
   143			n = scnprintf(buf, max_len, "CP035");
   144		else if (CP500_IS_CP505(cp500))
   145			n = scnprintf(buf, max_len, "CP505");
   146		else
   147			n = scnprintf(buf, max_len, "CP500");
   148	
   149		n += scnprintf(buf + n, max_len - n, "_FPGA_%d.%02d",
   150			       cp500->version.major, cp500->version.minor);
   151	
   152		/* test versions have test bit set */
   153		if (cp500->version.build & CP500_BUILD_TEST)
   154			n += scnprintf(buf + n, max_len - n, "Test%d",
   155				       cp500->version.build & ~CP500_BUILD_TEST);
   156	
   157		n += scnprintf(buf + n, max_len - n, "\n");
   158	
   159		return n;
   160	}
   161	
   162	static ssize_t version_show(struct device *dev, struct device_attribute *attr,
   163				    char *buf)
   164	{
   165		struct cp500 *cp500 = dev_get_drvdata(dev);
   166	
   167		return cp500_get_fpga_version(cp500, buf, PAGE_SIZE);
   168	}
   169	static DEVICE_ATTR_RO(version);
   170	
   171	static ssize_t keep_cfg_show(struct device *dev, struct device_attribute *attr,
   172				     char *buf)
   173	{
   174		struct cp500 *cp500 = dev_get_drvdata(dev);
   175		unsigned long keep_cfg = 1;
   176	
   177		/* FPGA configuration stream is kept during reset when RECONFIG bit is
   178		 * zero
   179		 */
   180		if (ioread8(cp500->system_startup_addr + CP500_RECONFIG_REG) &
   181			CP500_RECFG_REQ)
   182			keep_cfg = 0;
   183	
   184		return sprintf(buf, "%lu\n", keep_cfg);
   185	}
   186	
   187	static ssize_t keep_cfg_store(struct device *dev, struct device_attribute *attr,
   188				      const char *buf, size_t count)
   189	{
   190		struct cp500 *cp500 = dev_get_drvdata(dev);
   191		unsigned long keep_cfg;
   192	
   193		if (kstrtoul(buf, 10, &keep_cfg) < 0)
   194			return -EINVAL;
   195	
   196		/* In normal operation "keep_cfg" is "1". This means that the FPGA keeps
   197		 * its configuration stream during a reset.
   198		 * In case of a firmware update of the FPGA, the configuration stream
   199		 * needs to be reloaded. This can be done without a powercycle by
   200		 * writing a "0" into the "keep_cfg" attribute. After a reset/reboot th
   201		 * new configuration stream will be loaded.
   202		 */
   203		if (keep_cfg)
   204			iowrite8(0, cp500->system_startup_addr + CP500_RECONFIG_REG);
   205		else
   206			iowrite8(CP500_RECFG_REQ,
   207				 cp500->system_startup_addr + CP500_RECONFIG_REG);
   208	
   209		return count;
   210	}
   211	static DEVICE_ATTR_RW(keep_cfg);
   212	
   213	static struct attribute *attrs[] = {
   214		&dev_attr_version.attr,
   215		&dev_attr_keep_cfg.attr,
   216		NULL
   217	};
   218	static const struct attribute_group attrs_group = { .attrs = attrs };
   219	
   220	static int cp500_register_i2c(struct cp500 *cp500)
   221	{
   222		struct i2c_keba_platform_data data;
   223		struct platform_device *pdev;
   224		struct resource res[] = {
   225			{
   226			 /* I2C register area */
   227			 .start = (resource_size_t) cp500->sys_hwbase +
   228				  cp500->devs->i2c.offset,
   229			 .end   = (resource_size_t) cp500->sys_hwbase +
   230				  cp500->devs->i2c.offset +
   231				  cp500->devs->i2c.size - 1,
   232			 .flags = IORESOURCE_MEM,
   233			 },
   234		};
   235	
   236		data.info = cp500_i2c_info;
   237		data.info_size = ARRAY_SIZE(cp500_i2c_info);
   238	
   239		pdev = platform_device_register_resndata(&cp500->pci_dev->dev,
   240							 "i2c-keba", 0, res,
   241							 ARRAY_SIZE(res), &data,
   242							 sizeof(data));
   243		if (IS_ERR(pdev))
   244			return PTR_ERR(pdev);
   245		cp500->i2c = pdev;
   246	
   247		return 0;
   248	}
   249	
   250	static void cp500_register_platform_devs(struct cp500 *cp500)
   251	{
   252		struct device *dev = &cp500->pci_dev->dev;
   253	
   254		if (cp500_register_i2c(cp500))
   255			dev_warn(dev, "Failed to register i2c-keba!\n");
   256	}
   257	
   258	static void cp500_unregister_dev(struct platform_device **ppdev)
   259	{
   260		if (*ppdev) {
   261			platform_device_unregister(*ppdev);
 > 262			*ppdev = 0;
   263		}
   264	}
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


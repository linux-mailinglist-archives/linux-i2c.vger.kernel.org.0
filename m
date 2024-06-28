Return-Path: <linux-i2c+bounces-4430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D542E91B31B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 02:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04C331C21471
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 00:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A5417C2;
	Fri, 28 Jun 2024 00:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOgFB1hg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BF617BAA;
	Fri, 28 Jun 2024 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719532974; cv=none; b=RAxYY0d8UXxpAsGL8OcLqhYpmpJaGru1sRu/Fh7AlhwsKC02ffCx3OxXnV65kFrjPqG2NR3N10NeRcTU0SZUTaq7LqXe/uAM1h4des3P/kGTTF+x6rfbYrjRcuDwqIhg7uj/HRop5e2O9BWwbXZq+h6fVTbJownw5te/95IjeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719532974; c=relaxed/simple;
	bh=E1YAMTWZQHJa0g1CplgYKEt95kLRiyCZDqokpEPY8bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mm5ZFgBmL/lg48q8ouWSBZ5XYr2YUjqzH8wtOg5mV9Y5AZW76668kcgR5NEGTylhvKDT6mzPMZQnKbvONxWjfvWby+vN50B9aSwA+cHIrE24uhYaIkpd0RIqWl978e7dBCunvwseaxLm0qrRqeN5x2tMUKNCh8y2YyVKcyjZEHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOgFB1hg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719532973; x=1751068973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E1YAMTWZQHJa0g1CplgYKEt95kLRiyCZDqokpEPY8bU=;
  b=DOgFB1hgS9kBDgEs9yC4jYT8dlLfe6aaD+BBT7M/jqXCutA0uVPbwyxN
   yzIZws+2XVFwJKT+onX+FDW14gSQZg+01TOs4t3hj8mKZ8kXry/oPS79D
   jJDQkieLww6gFigjis265ozT7Tahu503N3MM55t31B/GDmtv7P1sK8g5T
   z5vpI8apcz/s9LPxaAT+jGGb4yTOrDkJe99uDXhU6oVizoTRAwPVCLYRS
   bEgDj14MUEJ//4zX/NUzKt4aghJimggJ8mtwnrqCHGXdTopcNKuZ2dO/6
   cezXE+Ev9ohvLBN5uWKfORKj3Azxb5J4QeQreP3TvdUNDeyy/dhpMjIo9
   w==;
X-CSE-ConnectionGUID: XiidRTHkS2OUvZM+jWmiqQ==
X-CSE-MsgGUID: 51Y2CulCTMq+MDdWDTB/aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="39216938"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="39216938"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 17:02:52 -0700
X-CSE-ConnectionGUID: uXnR8qFXQaa0j4b4U4I/sw==
X-CSE-MsgGUID: KU2C2W66THiFb79QcDcghA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="49470939"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jun 2024 17:02:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMz4g-000Gdw-1E;
	Fri, 28 Jun 2024 00:02:46 +0000
Date: Fri, 28 Jun 2024 08:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 4/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Message-ID: <202406280739.e0s764jH-lkp@intel.com>
References: <20240624111519.15652-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624111519.15652-5-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on wsa/i2c/for-next linus/master v6.10-rc5 next-20240627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/i2c-core-Setup-i2c_adapter-runtime-pm-before-calling-device_add/20240626-053449
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240624111519.15652-5-hdegoede%40redhat.com
patch subject: [PATCH v4 4/6] platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
config: i386-randconfig-002-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280739.e0s764jH-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280739.e0s764jH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280739.e0s764jH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/platform/x86/dell/dell-lis3lv02d.c: In function 'find_i801':
>> drivers/platform/x86/dell/dell-lis3lv02d.c:77:21: error: implicit declaration of function 'i2c_get_adapter'; did you mean 'i2c_get_adapdata'? [-Werror=implicit-function-declaration]
      77 |         *adap_ret = i2c_get_adapter(adap->nr);
         |                     ^~~~~~~~~~~~~~~
         |                     i2c_get_adapdata
>> drivers/platform/x86/dell/dell-lis3lv02d.c:77:19: warning: assignment to 'struct i2c_adapter *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      77 |         *adap_ret = i2c_get_adapter(adap->nr);
         |                   ^
   drivers/platform/x86/dell/dell-lis3lv02d.c: In function 'instantiate_i2c_client':
>> drivers/platform/x86/dell/dell-lis3lv02d.c:96:19: error: implicit declaration of function 'i2c_new_client_device' [-Werror=implicit-function-declaration]
      96 |         i2c_dev = i2c_new_client_device(adap, &info);
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/dell/dell-lis3lv02d.c:96:17: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      96 |         i2c_dev = i2c_new_client_device(adap, &info);
         |                 ^
>> drivers/platform/x86/dell/dell-lis3lv02d.c:104:9: error: implicit declaration of function 'i2c_put_adapter' [-Werror=implicit-function-declaration]
     104 |         i2c_put_adapter(adap);
         |         ^~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-lis3lv02d.c: In function 'dell_lis3lv02d_module_exit':
>> drivers/platform/x86/dell/dell-lis3lv02d.c:193:9: error: implicit declaration of function 'i2c_unregister_device' [-Werror=implicit-function-declaration]
     193 |         i2c_unregister_device(i2c_dev);
         |         ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +77 drivers/platform/x86/dell/dell-lis3lv02d.c

    65	
    66	static int find_i801(struct device *dev, void *data)
    67	{
    68		struct i2c_adapter *adap, **adap_ret = data;
    69	
    70		adap = i2c_verify_adapter(dev);
    71		if (!adap)
    72			return 0;
    73	
    74		if (!i2c_adapter_is_main_i801(adap))
    75			return 0;
    76	
  > 77		*adap_ret = i2c_get_adapter(adap->nr);
    78		return 1;
    79	}
    80	
    81	static void instantiate_i2c_client(struct work_struct *work)
    82	{
    83		struct i2c_board_info info = { };
    84		struct i2c_adapter *adap = NULL;
    85	
    86		if (i2c_dev)
    87			return;
    88	
    89		bus_for_each_dev(&i2c_bus_type, NULL, &adap, find_i801);
    90		if (!adap)
    91			return;
    92	
    93		info.addr = (long)lis3lv02d_dmi_id->driver_data;
    94		strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
    95	
  > 96		i2c_dev = i2c_new_client_device(adap, &info);
    97		if (IS_ERR(i2c_dev)) {
    98			pr_err("error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
    99			i2c_dev = NULL;
   100		} else {
   101			pr_debug("registered lis3lv02d on address 0x%02x\n", info.addr);
   102		}
   103	
 > 104		i2c_put_adapter(adap);
   105	}
   106	static DECLARE_WORK(i2c_work, instantiate_i2c_client);
   107	
   108	static int i2c_bus_notify(struct notifier_block *nb, unsigned long action, void *data)
   109	{
   110		struct device *dev = data;
   111		struct i2c_client *client;
   112		struct i2c_adapter *adap;
   113	
   114		switch (action) {
   115		case BUS_NOTIFY_ADD_DEVICE:
   116			adap = i2c_verify_adapter(dev);
   117			if (!adap)
   118				break;
   119	
   120			if (i2c_adapter_is_main_i801(adap))
   121				queue_work(system_long_wq, &i2c_work);
   122			break;
   123		case BUS_NOTIFY_REMOVED_DEVICE:
   124			client = i2c_verify_client(dev);
   125			if (!client)
   126				break;
   127	
   128			if (i2c_dev == client) {
   129				pr_debug("lis3lv02d i2c_client removed\n");
   130				i2c_dev = NULL;
   131			}
   132			break;
   133		default:
   134			break;
   135		}
   136	
   137		return 0;
   138	}
   139	static struct notifier_block i2c_nb = { .notifier_call = i2c_bus_notify };
   140	
   141	static int match_acpi_device_ids(struct device *dev, const void *data)
   142	{
   143		const struct acpi_device_id *ids = data;
   144	
   145		return acpi_match_device(ids, dev) ? 1 : 0;
   146	}
   147	
   148	static int __init dell_lis3lv02d_init(void)
   149	{
   150		struct device *dev;
   151		int err;
   152	
   153		/*
   154		 * First check for a matching platform_device. This protects against
   155		 * SMO88xx ACPI fwnodes which actually do have an I2C resource, which
   156		 * will already have an i2c_client instantiated (not a platform_device).
   157		 */
   158		dev = bus_find_device(&platform_bus_type, NULL, smo8800_ids, match_acpi_device_ids);
   159		if (!dev) {
   160			pr_debug("No SMO88xx platform-device found\n");
   161			return 0;
   162		}
   163		put_device(dev);
   164	
   165		lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
   166		if (!lis3lv02d_dmi_id) {
   167			pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
   168			return 0;
   169		}
   170	
   171		/*
   172		 * Register i2c-bus notifier + queue initial scan for lis3lv02d
   173		 * i2c_client instantiation.
   174		 */
   175		err = bus_register_notifier(&i2c_bus_type, &i2c_nb);
   176		if (err)
   177			return err;
   178	
   179		notifier_registered = true;
   180	
   181		queue_work(system_long_wq, &i2c_work);
   182		return 0;
   183	}
   184	module_init(dell_lis3lv02d_init);
   185	
   186	static void __exit dell_lis3lv02d_module_exit(void)
   187	{
   188		if (!notifier_registered)
   189			return;
   190	
   191		bus_unregister_notifier(&i2c_bus_type, &i2c_nb);
   192		cancel_work_sync(&i2c_work);
 > 193		i2c_unregister_device(i2c_dev);
   194	}
   195	module_exit(dell_lis3lv02d_module_exit);
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


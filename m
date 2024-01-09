Return-Path: <linux-i2c+bounces-1222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A66827CAB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 03:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C9EA2855B9
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 02:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81E61844;
	Tue,  9 Jan 2024 02:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBdCO9wS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158D4186C;
	Tue,  9 Jan 2024 02:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704765693; x=1736301693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q6CmO5YpPQKLsxo/ioVXDCesZH+nFIiw1ImZ1l62W2w=;
  b=RBdCO9wSGPrXinzlqcRUnGFjfiWmbdqISZZZYBiZgUZ24J/r9iTpG9Xz
   SpK7tvUqlWM71DlAE0dyNZC+JxmOPVs1AQRP/QTRHhSYsQC6kBSmHncBm
   yfLKODPky3O/Fnh+MUSuznBhlKA0hgiulwsJWI3edoCGRIg1cHtMvaola
   V5ddHO9TgIO0nh2tI1D22h0qbbvrZynkLuwFKe0qi3YH76ei5cenWIKFL
   zSe8nUigod48/xCxA54mriGSZVkOnDdKPOTTCOKwec7KPHINr9aM3UAX5
   VUxc6eY0V6D7iQ9xWBEYQHL2q/4Nk1bAMPUDd6QM2GWdyjA/NJPCfPghz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484236951"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="484236951"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 18:01:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="774684450"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="774684450"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 08 Jan 2024 18:01:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN1Qi-0005Kc-2J;
	Tue, 09 Jan 2024 02:01:24 +0000
Date: Tue, 9 Jan 2024 10:00:43 +0800
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
Subject: Re: [PATCH 5/6] platform/x86: dell-smo8800: Instantiate an
 i2c_client for the IIO st_accel driver
Message-ID: <202401090941.FHkrtPXf-lkp@intel.com>
References: <20231224213629.395741-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231224213629.395741-6-hdegoede@redhat.com>

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
patch link:    https://lore.kernel.org/r/20231224213629.395741-6-hdegoede%40redhat.com
patch subject: [PATCH 5/6] platform/x86: dell-smo8800: Instantiate an i2c_client for the IIO st_accel driver
config: i386-randconfig-003-20240106 (https://download.01.org/0day-ci/archive/20240109/202401090941.FHkrtPXf-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401090941.FHkrtPXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401090941.FHkrtPXf-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_remove':
   drivers/platform/x86/dell/dell-smo8800.c:358: undefined reference to `i2c_unregister_device'
   ld: drivers/platform/x86/dell/dell-smo8800.c:358: undefined reference to `i2c_unregister_device'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_instantiate_i2c_client':
   drivers/platform/x86/dell/dell-smo8800.c:243: undefined reference to `i2c_bus_type'
   ld: drivers/platform/x86/dell/dell-smo8800.c:286: undefined reference to `i2c_put_adapter'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_detect_accel':
>> drivers/platform/x86/dell/dell-smo8800.c:170: undefined reference to `i2c_smbus_xfer'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_instantiate_i2c_client':
   drivers/platform/x86/dell/dell-smo8800.c:276: undefined reference to `i2c_new_client_device'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_probe':
   drivers/platform/x86/dell/dell-smo8800.c:345: undefined reference to `i2c_unregister_device'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_find_i801':
   drivers/platform/x86/dell/dell-smo8800.c:131: undefined reference to `i2c_verify_adapter'
   ld: drivers/platform/x86/dell/dell-smo8800.c:145: undefined reference to `i2c_get_adapter'


vim +170 drivers/platform/x86/dell/dell-smo8800.c

   161	
   162	static int smo8800_detect_accel(struct smo8800_device *smo8800,
   163					struct i2c_adapter *adap, u8 addr,
   164					struct i2c_board_info *info)
   165	{
   166		union i2c_smbus_data smbus_data;
   167		const char *type;
   168		int err;
   169	
 > 170		err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
   171				     I2C_SMBUS_BYTE_DATA, &smbus_data);
   172		if (err < 0) {
   173			dev_warn(smo8800->dev, "Failed to read who-am-i register: %d\n", err);
   174			return err;
   175		}
   176	
   177		/*
   178		 * These who-am-i register mappings to model strings have been
   179		 * taken from the old /dev/freefall chardev and joystick driver:
   180		 * drivers/misc/lis3lv02d/lis3lv02d.c
   181		 */
   182		switch (smbus_data.byte) {
   183		case 0x32:
   184			type = "lis331dlh";
   185			break;
   186		case 0x33:
   187			type = "lis2de12"; /* LIS3DC / HP3DC in drivers/misc/lis3lv02d/lis3lv02d.c */
   188			break;
   189		case 0x3a:
   190			type = "lis3lv02dl_accel";
   191			break;
   192		case 0x3b:
   193			type = "lis302dl";
   194			break;
   195		default:
   196			dev_warn(smo8800->dev, "Unknown who-am-i register value 0x%02x\n",
   197				 smbus_data.byte);
   198			return -ENODEV;
   199		}
   200	
   201		strscpy(info->type, type, I2C_NAME_SIZE);
   202		info->addr = addr;
   203		info->irq = smo8800->irq;
   204		info->swnode = &smo8800_accel_node;
   205		return 0;
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


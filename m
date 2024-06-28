Return-Path: <linux-i2c+bounces-4432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC591B4B5
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 03:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45F551F22FBC
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 01:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7C317C91;
	Fri, 28 Jun 2024 01:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfOSTgRJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D3917C6D;
	Fri, 28 Jun 2024 01:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719538982; cv=none; b=tjBv7ohJAC7Mm2XPnkulcH/h52mbXS+zr0NU1t6s6EqSKFrb2kxeHSvEdCweb0LP6DeVkP5MGKAV/Au8YIRaXBXumiROr2pcIBI6ZZWG9i8RMm/n7bJk/YU9uxOL7IFjchyxVcwFJgfvMMopf5j4vauL9U+ZQWu6zJ+fqaD/ntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719538982; c=relaxed/simple;
	bh=bp2PdThNVVMPh/csioX4DjTBq0GQ+svFI4F+j1dbcv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEJxV9k6gx+v4U8JNWxNj1CajR/opJ19XKxJUDJIGvbz7+6sgQynzXsC86UcGNcVS04vcw3SzC/ihpu09wpCohAdo0NB72dmpHZRf7EJGb3DK4ABqWgiYeAPFIyk/fuSFklwCOkD0QVxHf8a0+JAo4Xh5YbkLzv6tHSoWWQHjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfOSTgRJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719538981; x=1751074981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bp2PdThNVVMPh/csioX4DjTBq0GQ+svFI4F+j1dbcv8=;
  b=TfOSTgRJl20WuaZTyRzf6YYamBwcq2QZo7vIukztN20naUhBeO4CnXSV
   Da3Aup3Lbs6rTaipe3FiAw2ZjlZ3bd7z1Qs8sRPgoDY0g8i+OyuxMlKWe
   ddXp6aRrWHo9pvOw7PZzHfWrazKP7j+s4hZd32jDRJAhgNbQaBYYa5YYh
   r8lsw5h21sij40hj2Mf/hbCdl671r8Lw3cKZ6TwoK3xf0+RK2M9SiUKU6
   1qxBWExxUynXK063AkxtLjwS5pZPYW6f0X0frqz+qoZ7yPSzIfN9+G+di
   8fbxfj7y5b4sr4tlHuLSjFMEIYVADvPpTvU2/WNmLoCT+vs2hQ0C/2gIZ
   g==;
X-CSE-ConnectionGUID: Rx0Rj7WhTyS3M3frMMHgxA==
X-CSE-MsgGUID: zSfErXWAQI+6GbPSHnTfTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16836695"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="16836695"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 18:43:00 -0700
X-CSE-ConnectionGUID: REq/Bj2+R/eajqS5tr45Uw==
X-CSE-MsgGUID: GZAr+djJTSqs/gQhv9SEZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="49173037"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jun 2024 18:42:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN0da-000GhL-0I;
	Fri, 28 Jun 2024 01:42:54 +0000
Date: Fri, 28 Jun 2024 09:42:17 +0800
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
Subject: Re: [PATCH v4 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
Message-ID: <202406280954.PwlEGWfP-lkp@intel.com>
References: <20240624111519.15652-7-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624111519.15652-7-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on wsa/i2c/for-next linus/master v6.10-rc5 next-20240627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/i2c-core-Setup-i2c_adapter-runtime-pm-before-calling-device_add/20240626-053449
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240624111519.15652-7-hdegoede%40redhat.com
patch subject: [PATCH v4 6/6] platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address
config: i386-randconfig-002-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280954.PwlEGWfP-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280954.PwlEGWfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280954.PwlEGWfP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/dell/dell-lis3lv02d.c: In function 'i2c_safety_check':
>> drivers/platform/x86/dell/dell-lis3lv02d.c:88:15: error: implicit declaration of function 'i2c_smbus_xfer' [-Werror=implicit-function-declaration]
      88 |         err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
         |               ^~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-lis3lv02d.c: In function 'find_i801':
   drivers/platform/x86/dell/dell-lis3lv02d.c:197:21: error: implicit declaration of function 'i2c_get_adapter'; did you mean 'i2c_get_adapdata'? [-Werror=implicit-function-declaration]
     197 |         *adap_ret = i2c_get_adapter(adap->nr);
         |                     ^~~~~~~~~~~~~~~
         |                     i2c_get_adapdata
   drivers/platform/x86/dell/dell-lis3lv02d.c:197:19: warning: assignment to 'struct i2c_adapter *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     197 |         *adap_ret = i2c_get_adapter(adap->nr);
         |                   ^
   drivers/platform/x86/dell/dell-lis3lv02d.c: In function 'instantiate_i2c_client':
   drivers/platform/x86/dell/dell-lis3lv02d.c:226:19: error: implicit declaration of function 'i2c_new_client_device' [-Werror=implicit-function-declaration]
     226 |         i2c_dev = i2c_new_client_device(adap, &info);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-lis3lv02d.c:226:17: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     226 |         i2c_dev = i2c_new_client_device(adap, &info);
         |                 ^
   drivers/platform/x86/dell/dell-lis3lv02d.c:235:9: error: implicit declaration of function 'i2c_put_adapter' [-Werror=implicit-function-declaration]
     235 |         i2c_put_adapter(adap);
         |         ^~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-lis3lv02d.c: In function 'dell_lis3lv02d_module_exit':
   drivers/platform/x86/dell/dell-lis3lv02d.c:325:9: error: implicit declaration of function 'i2c_unregister_device' [-Werror=implicit-function-declaration]
     325 |         i2c_unregister_device(i2c_dev);
         |         ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/i2c_smbus_xfer +88 drivers/platform/x86/dell/dell-lis3lv02d.c

    65	
    66	/*
    67	 * This is the kernel version of the single register device sanity checks from
    68	 * the i2c_safety_check function from lm_sensors sensor-detect script:
    69	 * This is meant to prevent access to 1-register-only devices,
    70	 * which are designed to be accessed with SMBus receive byte and SMBus send
    71	 * byte transactions (i.e. short reads and short writes) and treat SMBus
    72	 * read byte as a real write followed by a read. The device detection
    73	 * routines would write random values to the chip with possibly very nasty
    74	 * results for the hardware. Note that this function won't catch all such
    75	 * chips, as it assumes that reads and writes relate to the same register,
    76	 * but that's the best we can do.
    77	 */
    78	static int i2c_safety_check(struct i2c_adapter *adap, u8 addr)
    79	{
    80		union i2c_smbus_data smbus_data;
    81		int err;
    82		u8 data;
    83	
    84		/*
    85		 * First receive a byte from the chip, and remember it. This
    86		 * also checks if there is a device at the address at all.
    87		 */
  > 88		err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
    89				     I2C_SMBUS_BYTE, &smbus_data);
    90		if (err < 0)
    91			return err;
    92	
    93		data = smbus_data.byte;
    94	
    95		/*
    96		 * Receive a byte again; very likely to be the same for
    97		 * 1-register-only devices.
    98		 */
    99		err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
   100				     I2C_SMBUS_BYTE, &smbus_data);
   101		if (err < 0)
   102			return err;
   103	
   104		if (smbus_data.byte != data)
   105			return 0; /* Not a 1-register-only device. */
   106	
   107		/*
   108		 * Then try a standard byte read, with a register offset equal to
   109		 * the read byte; for 1-register-only device this should read
   110		 * the same byte value in return.
   111		 */
   112		err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, data,
   113				     I2C_SMBUS_BYTE_DATA, &smbus_data);
   114		if (err < 0)
   115			return err;
   116	
   117		if (smbus_data.byte != data)
   118			return 0; /* Not a 1-register-only device. */
   119	
   120		/*
   121		 * Then try a standard byte read, with a slightly different register
   122		 * offset; this should again read the register offset in return.
   123		 */
   124		err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, data ^ 0x01,
   125				     I2C_SMBUS_BYTE_DATA, &smbus_data);
   126		if (err < 0)
   127			return err;
   128	
   129		if (smbus_data.byte != (data ^ 0x01))
   130			return 0; /* Not a 1-register-only device. */
   131	
   132		/*
   133		 * Apparently this is a 1-register-only device, restore the original
   134		 * register value and leave it alone.
   135		 */
   136		i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_WRITE, data,
   137			       I2C_SMBUS_BYTE, NULL);
   138		pr_warn("I2C safety check for address 0x%02x failed, skipping\n", addr);
   139		return -ENODEV;
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


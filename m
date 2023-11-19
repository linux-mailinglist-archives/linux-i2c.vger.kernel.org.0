Return-Path: <linux-i2c+bounces-252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 728887F045A
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 05:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E2641F22373
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 04:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E192185A;
	Sun, 19 Nov 2023 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDfEcYn3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3895192;
	Sat, 18 Nov 2023 20:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700369207; x=1731905207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yjy1hnZoy8EpUYxdS9+3c1qFSR3s+PuC8hjfRrt0Szg=;
  b=mDfEcYn3BX1g8QyE+2uUcUa0Pk7MMY2TBDQFYTmUay1tLDHvPFfmpezl
   MRSXevyvSBcyp8EZw+TLJPVHkfWB16Mr9wWjEd2BsR9q6+a9XprM6fPGR
   FUUxgPFw4+0lYepHYnmPQVpdXMJNIFIoP+wGDt24z0a0tUBbudqCv3pD4
   mGattaTDTdLNMLOFiCdPbuXGIm8a5p54re7Lr7T6Nv3brTd5m0B2BhGHL
   bjC5pgkON8j8nRv3T1pHw34fbtR1WmRaKZ1iI52/cLuCXlpXeJW28S53l
   1pBsFEwAeDBvN4QEB2K8JS91y2ADQyLYfmaF339FRSYBbTfvPbJjRT9V5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="390331100"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="390331100"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 20:46:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="889610134"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="889610134"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Nov 2023 20:46:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Zhi-0004eV-0z;
	Sun, 19 Nov 2023 04:46:42 +0000
Date: Sun, 19 Nov 2023 12:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/20] drivers/video/fbdev: remove I2C_CLASS_DDC
 support
Message-ID: <202311191235.fdwRQUG6-lkp@intel.com>
References: <20231118174221.851-6-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118174221.851-6-hkallweit1@gmail.com>

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes sunxi/sunxi/for-next wsa/i2c/for-next drm-tip/drm-tip linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/drivers-gpu-drm-rockchip-remove-I2C_CLASS_DDC-support/20231119-014549
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231118174221.851-6-hkallweit1%40gmail.com
patch subject: [PATCH v2 05/20] drivers/video/fbdev: remove I2C_CLASS_DDC support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231119/202311191235.fdwRQUG6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191235.fdwRQUG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191235.fdwRQUG6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/matrox/i2c-matroxfb.c: In function 'i2c_matroxfb_probe':
>> drivers/video/fbdev/matrox/i2c-matroxfb.c:178:23: error: too many arguments to function 'i2c_bus_reg'
     178 |                 err = i2c_bus_reg(&m2info->maven, minfo,
         |                       ^~~~~~~~~~~
   drivers/video/fbdev/matrox/i2c-matroxfb.c:102:12: note: declared here
     102 | static int i2c_bus_reg(struct i2c_bit_adapter* b, struct matrox_fb_info* minfo,
         |            ^~~~~~~~~~~


vim +/i2c_bus_reg +178 drivers/video/fbdev/matrox/i2c-matroxfb.c

^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  141  
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  142  static void* i2c_matroxfb_probe(struct matrox_fb_info* minfo) {
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  143  	int err;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  144  	unsigned long flags;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  145  	struct matroxfb_dh_maven_info* m2info;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  146  
2fdbe5cf27aff9 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2007-02-12  147  	m2info = kzalloc(sizeof(*m2info), GFP_KERNEL);
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  148  	if (!m2info)
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  149  		return NULL;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  150  
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  151  	matroxfb_DAC_lock_irqsave(flags);
316b4d644caceb drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2009-09-22  152  	matroxfb_DAC_out(minfo, DAC_XGENIODATA, 0xFF);
316b4d644caceb drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2009-09-22  153  	matroxfb_DAC_out(minfo, DAC_XGENIOCTRL, 0x00);
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  154  	matroxfb_DAC_unlock_irqrestore(flags);
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  155  
fc2d10ddfc8989 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2009-09-22  156  	switch (minfo->chip) {
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  157  		case MGA_2064:
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  158  		case MGA_2164:
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14  159  			err = i2c_bus_reg(&m2info->ddc1, minfo,
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14  160  					  DDC1B_DATA, DDC1B_CLK,
d0e2994db76d4c drivers/video/fbdev/matrox/i2c-matroxfb.c Heiner Kallweit 2023-11-18  161  					  "DDC:fb%u #0");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  162  			break;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  163  		default:
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14  164  			err = i2c_bus_reg(&m2info->ddc1, minfo,
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14  165  					  DDC1_DATA, DDC1_CLK,
d0e2994db76d4c drivers/video/fbdev/matrox/i2c-matroxfb.c Heiner Kallweit 2023-11-18  166  					  "DDC:fb%u #0");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  167  			break;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  168  	}
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  169  	if (err)
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  170  		goto fail_ddc1;
fc2d10ddfc8989 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2009-09-22  171  	if (minfo->devflags.dualhead) {
d0e2994db76d4c drivers/video/fbdev/matrox/i2c-matroxfb.c Heiner Kallweit 2023-11-18  172  		err = i2c_bus_reg(&m2info->ddc2, minfo, DDC2_DATA, DDC2_CLK, "DDC:fb%u #1");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  173  		if (err == -ENODEV) {
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  174  			printk(KERN_INFO "i2c-matroxfb: VGA->TV plug detected, DDC unavailable.\n");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  175  		} else if (err)
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  176  			printk(KERN_INFO "i2c-matroxfb: Could not register secondary output i2c bus. Continuing anyway.\n");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  177  		/* Register maven bus even on G450/G550 */
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14 @178  		err = i2c_bus_reg(&m2info->maven, minfo,
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14  179  				  MAT_DATA, MAT_CLK, "MAVEN:fb%u", 0);
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  180  		if (err)
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  181  			printk(KERN_INFO "i2c-matroxfb: Could not register Maven i2c bus. Continuing anyway.\n");
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  182  		else {
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  183  			struct i2c_board_info maven_info = {
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  184  				I2C_BOARD_INFO("maven", 0x1b),
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  185  			};
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  186  			unsigned short const addr_list[2] = {
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  187  				0x1b, I2C_CLIENT_END
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  188  			};
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  189  
a72e27f7a47069 drivers/video/fbdev/matrox/i2c-matroxfb.c Wolfram Sang    2019-11-06  190  			i2c_new_scanned_device(&m2info->maven.adapter,
9a94241afcc9a4 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2010-08-11  191  					       &maven_info, addr_list, NULL);
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  192  		}
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  193  	}
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  194  	return m2info;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  195  fail_ddc1:;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  196  	kfree(m2info);
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  197  	printk(KERN_ERR "i2c-matroxfb: Could not register primary adapter DDC bus.\n");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  198  	return NULL;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  199  }
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


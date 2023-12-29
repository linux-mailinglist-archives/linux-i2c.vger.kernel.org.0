Return-Path: <linux-i2c+bounces-1057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB84281FD11
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 06:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A0F61C21405
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 05:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0784B1FC9;
	Fri, 29 Dec 2023 05:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mzx47iMC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01E1FB6
	for <linux-i2c@vger.kernel.org>; Fri, 29 Dec 2023 05:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703827062; x=1735363062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrZq5ZFJJe1GvzivOfUcytL5T4AYlw2znDO10AOUgAc=;
  b=Mzx47iMCIhNGRgvpoOvJS4IhNE1fYy/DvqegMZb4rb3f7yQ599aFq963
   wd0mMUW3lIGmyF4HoQAc3W/s1rxZ4vR+v53uey9H8nLSnr/+RRNWW0kog
   k1WICvR64TTL/cL/hu8TcI8EOvtAGGAoVDhrrcOQ+genlp9Mc9rdtJiU2
   fOpRJUx5hH15dcXvPin+PIxB9uvXOWaGPDf+rKEGpcklEDz0/6JykfUm0
   L67/6v38IOPjnKo49Xr5yaW0RV/g4HHmBjFveNhSdIfFOft5QeJmeFHYh
   hStuuPkP1mraJsnSQD7UATDCXJ/S6Z4QgGIwLW1SXbZWR1F1hutTWdQ4m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3408834"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="3408834"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 21:17:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="902145498"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="902145498"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Dec 2023 21:17:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ5FY-000H6v-1Y;
	Fri, 29 Dec 2023 05:17:36 +0000
Date: Fri, 29 Dec 2023 13:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Hu <hanshu-oc@zhaoxin.com>, wsa@kernel.org,
	linux-i2c@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andi.shyti@kernel.org,
	cobechen@zhaoxin.com, hanshu-oc@zhaoxin.com
Subject: Re: [PATCH v5 8/8] i2c: add zhaoxin i2c controller driver
Message-ID: <202312291225.cWVt6YF9-lkp@intel.com>
References: <efbdee3ccae776a8f45d3ea5e28fdee334a3c07b.1703733126.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efbdee3ccae776a8f45d3ea5e28fdee334a3c07b.1703733126.git.hanshu-oc@zhaoxin.com>

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wsa/i2c/for-next]
[cannot apply to linus/master v6.7-rc7 next-20231220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Hu/i2c-wmt-create-wmt_i2c_init-for-general-init/20231228-112208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/efbdee3ccae776a8f45d3ea5e28fdee334a3c07b.1703733126.git.hanshu-oc%40zhaoxin.com
patch subject: [PATCH v5 8/8] i2c: add zhaoxin i2c controller driver
config: loongarch-randconfig-r081-20231229 (https://download.01.org/0day-ci/archive/20231229/202312291225.cWVt6YF9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312291225.cWVt6YF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312291225.cWVt6YF9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-zhaoxin-plt.c:265:12: warning: 'zxi2c_resume' defined but not used [-Wunused-function]
     265 | static int zxi2c_resume(struct device *dev)
         |            ^~~~~~~~~~~~


vim +/zxi2c_resume +265 drivers/i2c/busses/i2c-zhaoxin-plt.c

   264	
 > 265	static int zxi2c_resume(struct device *dev)
   266	{
   267		struct zxi2c *i2c = dev_get_drvdata(dev);
   268	
   269		iowrite8(ZXI2C_CR_MST_RST, i2c->base + VIAI2C_REG_CR);
   270		zxi2c_set_bus_speed(i2c);
   271	
   272		return 0;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


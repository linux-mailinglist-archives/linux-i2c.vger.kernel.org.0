Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095F94A3CB1
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 04:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357480AbiAaDOH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 22:14:07 -0500
Received: from mga04.intel.com ([192.55.52.120]:26345 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236781AbiAaDOH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 22:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643598847; x=1675134847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1hoSBezV03FowDQunnNIG1S0o8SrP7Xm8gxkO7KSfLQ=;
  b=UBoPj7MDdVfCeOoP3iYe1ufx7WTjt/Bd5egGX9Vy5N9bX1zYi3kXPUu2
   HYuL77Zjrr2tgF0LXmtLufUeGpBuiPeI62iR0IXWwt0T9NY+yckjLM6cZ
   0+PF9MV9dcE/rInyO3+RCWyi304ayNAH9TJiA5xx/+T3ysGTTqos7AcyS
   lrFaWMjNsHB4aHUFH4Fj8MBu8wd1nD3YcHIK0Zombd9VE8+tV83FUiEXi
   aeuWPStdqfKqNtzid8WMWWwtfUeMuTfGI5lpWofuYxICpCqEUTVypX8/v
   RL7l+vAHR1qSiMOW3zCig39F7XB+zkuLvajKMpRscm/mAutMhD6A7UiIx
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="246228986"
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; 
   d="scan'208";a="246228986"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 19:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; 
   d="scan'208";a="478933682"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Jan 2022 19:14:03 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nEN8l-000RJc-7t; Mon, 31 Jan 2022 03:14:03 +0000
Date:   Mon, 31 Jan 2022 11:13:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH v4 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
Message-ID: <202201311102.xyggUF8Z-lkp@intel.com>
References: <20220130191225.303115-3-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130191225.303115-3-terry.bowman@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Terry,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linux/master linus/master v5.17-rc2 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Terry-Bowman/Watchdog-sp5100_tco-Replace-cd6h-cd7h-port-I-O-accesses-with-MMIO-accesses/20220131-031525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: x86_64-randconfig-a013-20220131 (https://download.01.org/0day-ci/archive/20220131/202201311102.xyggUF8Z-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18acb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e6855f66e7e915cd09a8f8dae411997df8a7c641
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Terry-Bowman/Watchdog-sp5100_tco-Replace-cd6h-cd7h-port-I-O-accesses-with-MMIO-accesses/20220131-031525
        git checkout e6855f66e7e915cd09a8f8dae411997df8a7c641
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/watchdog/sp5100_tco.c:270:60: warning: format specifies type 'unsigned int' but the argument has type 'void *' [-Wformat]
           dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", tco->tcobase);
                                  ~~~~                               ^~~~~~~~~~~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                    ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +270 drivers/watchdog/sp5100_tco.c

   238	
   239	static u32 sp5100_tco_prepare_base(struct sp5100_tco *tco,
   240					   u32 mmio_addr,
   241					   u32 alt_mmio_addr,
   242					   const char *dev_name)
   243	{
   244		struct device *dev = tco->wdd.parent;
   245	
   246		dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n", mmio_addr);
   247	
   248		if (!mmio_addr && !alt_mmio_addr)
   249			return -ENODEV;
   250	
   251		/* Check for MMIO address and alternate MMIO address conflicts */
   252		if (mmio_addr)
   253			mmio_addr = sp5100_tco_request_region(dev, mmio_addr, dev_name);
   254	
   255		if (!mmio_addr && alt_mmio_addr)
   256			mmio_addr = sp5100_tco_request_region(dev, alt_mmio_addr, dev_name);
   257	
   258		if (!mmio_addr) {
   259			dev_err(dev, "Failed to reserve MMIO or alternate MMIO region\n");
   260			return -EBUSY;
   261		}
   262	
   263		tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
   264		if (!tco->tcobase) {
   265			dev_err(dev, "MMIO address 0x%08x failed mapping\n", mmio_addr);
   266			devm_release_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
   267			return -ENOMEM;
   268		}
   269	
 > 270		dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", tco->tcobase);
   271	
   272		return 0;
   273	}
   274	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE1F4A3D87
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 06:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235039AbiAaF7N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 00:59:13 -0500
Received: from mga05.intel.com ([192.55.52.43]:29021 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232130AbiAaF7N (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Jan 2022 00:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643608753; x=1675144753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qSMFveX5lVTif1dekQa1h/+KX8io6E0LwxZv+DKJcis=;
  b=Vfs+DEMAfzgmsz5ZiOxc6g8yardRZalNNWHKYd/zQxkPhAt+qzEoJt5p
   0FsdZK0UfUawfHskhRHTHEKEwSq4Ozf+GuiX00NMZCWurYDW/AHs026gr
   Jf1eCVu6SEwr8HIdQ5ea8Zx1gVrUg4JevF8QyY7+AQuU0lcYKyDN34rim
   wfu+BrFVZCnz/9YP5hCcuWTrKZzZ1F50y75JuIWytUT+0gozLkV5C0FE9
   BH4f2AFyjC8ifoo+aoQl96uKRatVooai0E9trs28xyBEONTq0nY/hM6l3
   u0FrhH4DePNcPizl7Yxh5EOPK/ylsG366x7SC60+U6xaRvT3qYnvd4Biq
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="333763378"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="333763378"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 21:59:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="522530559"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jan 2022 21:59:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nEPiW-000RUE-Mz; Mon, 31 Jan 2022 05:59:08 +0000
Date:   Mon, 31 Jan 2022 13:58:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH v4 3/4] Watchdog: sp5100_tco: Add initialization using
 EFCH MMIO
Message-ID: <202201311323.CdxiFZ8V-lkp@intel.com>
References: <20220130191225.303115-4-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130191225.303115-4-terry.bowman@amd.com>
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
config: x86_64-randconfig-a013-20220131 (https://download.01.org/0day-ci/archive/20220131/202201311323.CdxiFZ8V-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18acb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/92f6f8c644fc7df3d1f3f8e32f8b1f4efc3f321f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Terry-Bowman/Watchdog-sp5100_tco-Replace-cd6h-cd7h-port-I-O-accesses-with-MMIO-accesses/20220131-031525
        git checkout 92f6f8c644fc7df3d1f3f8e32f8b1f4efc3f321f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/watchdog/sp5100_tco.c:272:60: warning: format specifies type 'unsigned int' but the argument has type 'void *' [-Wformat]
           dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", tco->tcobase);
                                  ~~~~                               ^~~~~~~~~~~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                    ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/watchdog/sp5100_tco.c:345:8: error: implicit declaration of function 'request_mem_region_muxed' [-Werror,-Wimplicit-function-declaration]
           res = request_mem_region_muxed(EFCH_PM_ACPI_MMIO_PM_ADDR,
                 ^
>> drivers/watchdog/sp5100_tco.c:345:6: warning: incompatible integer to pointer conversion assigning to 'struct resource *' from 'int' [-Wint-conversion]
           res = request_mem_region_muxed(EFCH_PM_ACPI_MMIO_PM_ADDR,
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +345 drivers/watchdog/sp5100_tco.c

   333	
   334	static int sp5100_tco_setupdevice_mmio(struct device *dev,
   335					       struct watchdog_device *wdd)
   336	{
   337		struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
   338		const char *dev_name = SB800_DEVNAME;
   339		u32 mmio_addr = 0, alt_mmio_addr = 0;
   340		struct resource *res;
   341		void __iomem *addr;
   342		int ret;
   343		u32 val;
   344	
 > 345		res = request_mem_region_muxed(EFCH_PM_ACPI_MMIO_PM_ADDR,
   346					       EFCH_PM_ACPI_MMIO_PM_SIZE,
   347					       "sp5100_tco");
   348	
   349		if (!res) {
   350			dev_err(dev,
   351				"Memory region 0x%08x already in use\n",
   352				EFCH_PM_ACPI_MMIO_PM_ADDR);
   353			return -EBUSY;
   354		}
   355	
   356		addr = ioremap(EFCH_PM_ACPI_MMIO_PM_ADDR, EFCH_PM_ACPI_MMIO_PM_SIZE);
   357		if (!addr) {
   358			dev_err(dev, "Address mapping failed\n");
   359			ret = -ENOMEM;
   360			goto out;
   361		}
   362	
   363		/*
   364		 * EFCH_PM_DECODEEN_WDT_TMREN is dual purpose. This bitfield
   365		 * enables sp5100_tco register MMIO space decoding. The bitfield
   366		 * also starts the timer operation. Enable if not already enabled.
   367		 */
   368		val = efch_read_pm_reg8(addr, EFCH_PM_DECODEEN);
   369		if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
   370			efch_update_pm_reg8(addr, EFCH_PM_DECODEEN, 0xff,
   371					    EFCH_PM_DECODEEN_WDT_TMREN);
   372		}
   373	
   374		/* Error if the timer could not be enabled */
   375		val = efch_read_pm_reg8(addr, EFCH_PM_DECODEEN);
   376		if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
   377			dev_err(dev, "Failed to enable the timer\n");
   378			ret = -EFAULT;
   379			goto out;
   380		}
   381	
   382		mmio_addr = EFCH_PM_WDT_ADDR;
   383	
   384		/* Determine alternate MMIO base address */
   385		val = efch_read_pm_reg8(addr, EFCH_PM_ISACONTROL);
   386		if (val & EFCH_PM_ISACONTROL_MMIOEN)
   387			alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
   388				EFCH_PM_ACPI_MMIO_WDT_OFFSET;
   389	
   390		ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
   391		if (!ret) {
   392			tco_timer_enable_mmio(addr);
   393			ret = sp5100_tco_timer_init(tco);
   394		}
   395	
   396	out:
   397		if (addr)
   398			iounmap(addr);
   399	
   400		release_resource(res);
   401	
   402		return ret;
   403	}
   404	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

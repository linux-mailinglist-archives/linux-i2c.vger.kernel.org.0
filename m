Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E219069E624
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Feb 2023 18:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbjBURmi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 12:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233564AbjBURmh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 12:42:37 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F462D14C;
        Tue, 21 Feb 2023 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677001355; x=1708537355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kBBoBZu1FD2rTBEFA0gVprbFv3kOigQKo3h0nWRaWas=;
  b=KhIkTaDcYBT9+GpneMVNXU5+ZjF7kVksUuBPAsWJhY9enhTdgzYVzO4V
   bTNnqSK4mYd0lY5kwRovdAA0jWRNe9xynHg74p2cD7Rox+MWJGMV5dMj8
   kOdwBULFCS5VkgLDW02AuW4EXDr9Nwx5bDmrzV6jIQ16L8Urzha/i4rbc
   554o69dkgl4PMFMd9auHzHtt+2pbMSYHNYyiHXD7GsZJgv6d0qcC+HtYH
   oKiRrrLwtnkxwiqWGnLx/aoyRpwLh+ivyxha6Bj35zdoF2/JJ06u0T83h
   zurbMlUIsDKQ25A1syMBjaiPO/Ly0qUoA0aADjzzoOPJlu3qbXGvJk5ej
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="320839368"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="320839368"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 09:42:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="1000689706"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="1000689706"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2023 09:42:31 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pUWes-00005l-2S;
        Tue, 21 Feb 2023 17:42:30 +0000
Date:   Wed, 22 Feb 2023 01:41:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sumit.semwal@linaro.org,
        thierry.reding@gmail.com, wsa@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, akhilrajeev@nvidia.com
Subject: Re: [PATCH] i2c: tegra: Share same DMA channel for Rx and Tx
Message-ID: <202302220130.flKenlan-lkp@intel.com>
References: <20230221135726.40720-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221135726.40720-1-akhilrajeev@nvidia.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akhil,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tegra/for-next]
[also build test ERROR on linus/master v6.2 next-20230221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/i2c-tegra-Share-same-DMA-channel-for-Rx-and-Tx/20230221-215924
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20230221135726.40720-1-akhilrajeev%40nvidia.com
patch subject: [PATCH] i2c: tegra: Share same DMA channel for Rx and Tx
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230222/202302220130.flKenlan-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/643ca30fdac50b54b2ee65f97e6e2eda9974dd3c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Akhil-R/i2c-tegra-Share-same-DMA-channel-for-Rx-and-Tx/20230221-215924
        git checkout 643ca30fdac50b54b2ee65f97e6e2eda9974dd3c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220130.flKenlan-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:13,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:36,
                    from include/linux/acpi.h:13,
                    from drivers/i2c/busses/i2c-tegra.c:9:
   drivers/i2c/busses/i2c-tegra.c: In function 'tegra_i2c_init_dma':
>> drivers/i2c/busses/i2c-tegra.c:465:26: error: 'struct tegra_i2c_dev' has no member named 'tx_dma_chan'; did you mean 'dma_chan'?
     465 |         WARN_ON(i2c_dev->tx_dma_chan->device != i2c_dev->rx_dma_chan->device);
         |                          ^~~~~~~~~~~
   include/asm-generic/bug.h:122:32: note: in definition of macro 'WARN_ON'
     122 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
>> drivers/i2c/busses/i2c-tegra.c:465:58: error: 'struct tegra_i2c_dev' has no member named 'rx_dma_chan'; did you mean 'dma_chan'?
     465 |         WARN_ON(i2c_dev->tx_dma_chan->device != i2c_dev->rx_dma_chan->device);
         |                                                          ^~~~~~~~~~~
   include/asm-generic/bug.h:122:32: note: in definition of macro 'WARN_ON'
     122 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~


vim +465 drivers/i2c/busses/i2c-tegra.c

86c92b9965ff17 Sowjanya Komatineni 2019-02-12  432  
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  433  static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  434  {
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  435  	struct dma_chan *chan;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  436  	dma_addr_t dma_phys;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  437  	u32 *dma_buf;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  438  	int err;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  439  
48cb6356fae125 Akhil R             2022-09-06  440  	if (i2c_dev->is_vi)
89328b1b81858f Jonathan Hunter     2019-02-21  441  		return 0;
89328b1b81858f Jonathan Hunter     2019-02-21  442  
48cb6356fae125 Akhil R             2022-09-06  443  	if (!i2c_dev->hw->has_apb_dma) {
89328b1b81858f Jonathan Hunter     2019-02-21  444  		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
48cb6356fae125 Akhil R             2022-09-06  445  			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
48cb6356fae125 Akhil R             2022-09-06  446  			return 0;
48cb6356fae125 Akhil R             2022-09-06  447  		}
48cb6356fae125 Akhil R             2022-09-06  448  	} else if (!IS_ENABLED(CONFIG_TEGRA186_GPC_DMA)) {
48cb6356fae125 Akhil R             2022-09-06  449  		dev_dbg(i2c_dev->dev, "GPC DMA support not enabled\n");
89328b1b81858f Jonathan Hunter     2019-02-21  450  		return 0;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  451  	}
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  452  
643ca30fdac50b Akhil R             2023-02-21  453  	/* The same channel will be used for both Rx and Tx.
643ca30fdac50b Akhil R             2023-02-21  454  	 * Keeping the name as tx for backward compatibility with
643ca30fdac50b Akhil R             2023-02-21  455  	 * existing devicetrees.
643ca30fdac50b Akhil R             2023-02-21  456  	 */
79e4be2c08bbbf Peter Ujfalusi      2019-11-13  457  	chan = dma_request_chan(i2c_dev->dev, "tx");
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  458  	if (IS_ERR(chan)) {
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  459  		err = PTR_ERR(chan);
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  460  		goto err_out;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  461  	}
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  462  
643ca30fdac50b Akhil R             2023-02-21  463  	i2c_dev->dma_chan = chan;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  464  
cdbf26251d3b35 Thierry Reding      2022-10-20 @465  	WARN_ON(i2c_dev->tx_dma_chan->device != i2c_dev->rx_dma_chan->device);
cdbf26251d3b35 Thierry Reding      2022-10-20  466  	i2c_dev->dma_dev = chan->device->dev;
cdbf26251d3b35 Thierry Reding      2022-10-20  467  
55c52f16a017ca Dmitry Osipenko     2020-09-30  468  	i2c_dev->dma_buf_size = i2c_dev->hw->quirks->max_write_len +
55c52f16a017ca Dmitry Osipenko     2020-09-30  469  				I2C_PACKET_HEADER_SIZE;
55c52f16a017ca Dmitry Osipenko     2020-09-30  470  
cdbf26251d3b35 Thierry Reding      2022-10-20  471  	dma_buf = dma_alloc_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_size,
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  472  				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  473  	if (!dma_buf) {
76d06443cc5b37 Dmitry Osipenko     2020-09-30  474  		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  475  		err = -ENOMEM;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  476  		goto err_out;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  477  	}
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  478  
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  479  	i2c_dev->dma_buf = dma_buf;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  480  	i2c_dev->dma_phys = dma_phys;
c886a4a03a0155 Dmitry Osipenko     2020-09-30  481  
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  482  	return 0;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  483  
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  484  err_out:
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  485  	tegra_i2c_release_dma(i2c_dev);
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  486  	if (err != -EPROBE_DEFER) {
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  487  		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
bb0e9b1d2a1f93 Colin Ian King      2019-02-15  488  		dev_err(i2c_dev->dev, "falling back to PIO\n");
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  489  		return 0;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  490  	}
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  491  
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  492  	return err;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  493  }
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  494  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3DEC69C297
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Feb 2023 22:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjBSVCy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Feb 2023 16:02:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbjBSVCx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Feb 2023 16:02:53 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0C92129;
        Sun, 19 Feb 2023 13:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676840571; x=1708376571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VNv/1ldBntMd/FJITMCdGtSXrxXFf8y5UFGudkW5Hao=;
  b=aVcA0E1M4N4GR2hkvvWKs7ZNGjKEou8pHFlFTILOHzGh+SZqH/eAWBBJ
   zL/NjXN/ynxeYsCQzQpcqrcSzXf9YFzvJ2UfvhF7qs1jlW/KljzXC+uBE
   IS7CrFZArqd7D1Wslzmc7o1RFOlAagXSdWUL0boHFeuD7R9IqX2XLtuh3
   BTd2d9VZ5vTy6X0Rh17GYB25D3RIibS0nBfdp+bx40fDLQxgm6tHYZuE6
   0Xl62hTiqjDlatHEhctalxLIyZ+ojIN+RTFVk8SsTVQWhqmhLkz+GaZx1
   oDw2YHJJqq4RxJeTzMiQ851Ev+RWQQJ+QoVWYMGf9VOaF9fnIKu7onCQt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="334487317"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="334487317"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 13:02:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="813931397"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="813931397"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2023 13:02:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pTqpZ-000DS5-00;
        Sun, 19 Feb 2023 21:02:45 +0000
Date:   Mon, 20 Feb 2023 05:02:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ye Xiang <xiang.ye@intel.com>, Lee Jones <lee@kernel.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: Re: [PATCH 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Message-ID: <202302200441.JkVSzKjZ-lkp@intel.com>
References: <20230219183059.1029525-3-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219183059.1029525-3-xiang.ye@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on wsa/i2c/for-next broonie-spi/for-next linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Xiang/mfd-Add-support-for-Intel-LJCA-device/20230220-023253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230219183059.1029525-3-xiang.ye%40intel.com
patch subject: [PATCH 2/5] gpio: Add support for Intel LJCA USB GPIO driver
config: hexagon-randconfig-r005-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200441.JkVSzKjZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ddd4f4ee32eff2fd7cb9933efdc8966d58894160
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ye-Xiang/mfd-Add-support-for-Intel-LJCA-device/20230220-023253
        git checkout ddd4f4ee32eff2fd7cb9933efdc8966d58894160
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200441.JkVSzKjZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpio/gpio-ljca.c:12:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpio/gpio-ljca.c:12:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpio/gpio-ljca.c:12:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/gpio/gpio-ljca.c:436:40: warning: unused variable 'ljca_gpio_id' [-Wunused-const-variable]
   static const struct platform_device_id ljca_gpio_id[] = {
                                          ^
   7 warnings generated.


vim +/ljca_gpio_id +436 drivers/gpio/gpio-ljca.c

   434	
   435	#define LJCA_GPIO_DRV_NAME "ljca-gpio"
 > 436	static const struct platform_device_id ljca_gpio_id[] = {
   437		{ LJCA_GPIO_DRV_NAME, 0 },
   438		{ /* sentinel */ }
   439	};
   440	MODULE_DEVICE_TABLE(platform, ljca_gpio_id);
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

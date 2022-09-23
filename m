Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2303B5E71DF
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 04:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbiIWC1b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 22:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiIWC13 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 22:27:29 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E9D1181E1;
        Thu, 22 Sep 2022 19:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663900048; x=1695436048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EeOgxiuny3VNGnlzzeQqLXhBftKvebsU3Y2OekHhnE4=;
  b=Fbo+jCVoH7tKUooDMIqEUcEzMOWr2080v2DjVudLMOYgIpXqHL0ZwZ1y
   oKNsVhOE/glUk2jZD0/UKYeln1E1eNQ+xmEAQ7FDpp+A/WBvxsdxMz8Hy
   z2LibwYAIVvpCfSX4n+e+tXA4xjMbhuZY9lJaL5fqXU5udvC9zfzmEeNV
   hWRI1BUQvgddgET1e0pWClRt6rdecZwIruQX/uRVz/mRYk7Ifuhue7IHf
   Lu0rESZPk7sYES+BkVAxNceWVVBadnR7aWmS01TpcOwxPU6Dj7QwyA5mz
   oIfzBv/Q1Aa2LGTnGW5zie3H2Vkl+MWiEyNEyfbkfjGkhh/ZGM14TIFeI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="362296217"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="362296217"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 19:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="709136697"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2022 19:27:25 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obYPU-0005DO-33;
        Fri, 23 Sep 2022 02:27:24 +0000
Date:   Fri, 23 Sep 2022 10:26:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     kbuild-all@lists.01.org, loongarch@lists.linux.dev,
        linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 4/5] i2c: Add driver for Loongson-2K/LS7A I2C controller
Message-ID: <202209231036.KnY4wKcL-lkp@intel.com>
References: <ba10e9fd6deb70a2c59d5c02f30a8abbe8aa825e.1663835855.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba10e9fd6deb70a2c59d5c02f30a8abbe8aa825e.1663835855.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Binbin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.0-rc6 next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/i2c-ls2x-Add-support-for-the-Loongson-2K-LS7A-I2C/20220922-194252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20220923/202209231036.KnY4wKcL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/df754cf9cc58fc815223d6126fa1c86717cd3465
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Binbin-Zhou/i2c-ls2x-Add-support-for-the-Loongson-2K-LS7A-I2C/20220922-194252
        git checkout df754cf9cc58fc815223d6126fa1c86717cd3465
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ls2x.c: In function 'i2c_stop':
>> drivers/i2c/busses/i2c-ls2x.c:45:33: error: implicit declaration of function 'writeb' [-Werror=implicit-function-declaration]
      45 | #define i2c_writeb(val, addr)   writeb(val, dev->base + addr)
         |                                 ^~~~~~
   drivers/i2c/busses/i2c-ls2x.c:60:9: note: in expansion of macro 'i2c_writeb'
      60 |         i2c_writeb(LS2X_I2C_CMD_STOP, LS2X_I2C_CR_REG);
         |         ^~~~~~~~~~
>> drivers/i2c/busses/i2c-ls2x.c:44:33: error: implicit declaration of function 'readb' [-Werror=implicit-function-declaration]
      44 | #define i2c_readb(addr)         readb(dev->base + addr)
         |                                 ^~~~~
   drivers/i2c/busses/i2c-ls2x.c:63:9: note: in expansion of macro 'i2c_readb'
      63 |         i2c_readb(LS2X_I2C_SR_REG);
         |         ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/writeb +45 drivers/i2c/busses/i2c-ls2x.c

    43	
  > 44	#define i2c_readb(addr)		readb(dev->base + addr)
  > 45	#define i2c_writeb(val, addr)	writeb(val, dev->base + addr)
    46	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

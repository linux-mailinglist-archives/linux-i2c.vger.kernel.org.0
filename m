Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFE569C47D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Feb 2023 04:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjBTD0I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Feb 2023 22:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjBTD0H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Feb 2023 22:26:07 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CCCAC165;
        Sun, 19 Feb 2023 19:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676863563; x=1708399563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/FKG+kLC7zN9Z05qh2Wi25UR5M4uashZ0aGzWIvhyNY=;
  b=DpxFErmVZRXzDIzQqAzIjEdwBgSEsiNWrt3HNB/6ZGfj9yO+kp1Z11Qr
   fNK74xvZLFaFQd1ZL0xUlvYPE6n8QQ+53zbQ1fubIq3UkY+OivrX4pt/m
   p8CNhEGLGUVPfQmrwujB3jUEdNGFMej7gNaRTSMgZvEzP/p1rHca133vC
   MpFu+F7IlUonYRb8JsIrbpAjxLlVddFJOHPXqZk2sFzRjoKvMD3S+mh0s
   bzowvM+5IZ6RvGHX1ITdv0t7+GoZxmob5PPnxWzIQ8aRAMlDJKiw2xJcZ
   ZcPriKZ/iulytUm3uUiVNQFsdnHtlsOoKnSWzzv6j6bOsBqc22FqsOGB0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="316028654"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="316028654"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 19:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="664489510"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="664489510"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Feb 2023 19:25:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pTwoO-000DdN-2d;
        Mon, 20 Feb 2023 03:25:56 +0000
Date:   Mon, 20 Feb 2023 11:25:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ye Xiang <xiang.ye@intel.com>, Lee Jones <lee@kernel.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: Re: [PATCH 4/5] spi: Add support for Intel LJCA USB SPI driver
Message-ID: <202302201128.XeS2tn5i-lkp@intel.com>
References: <20230219183059.1029525-5-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219183059.1029525-5-xiang.ye@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes wsa/i2c/for-next broonie-spi/for-next linus/master v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Xiang/mfd-Add-support-for-Intel-LJCA-device/20230220-023253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230219183059.1029525-5-xiang.ye%40intel.com
patch subject: [PATCH 4/5] spi: Add support for Intel LJCA USB SPI driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230220/202302201128.XeS2tn5i-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/6fbec44daa135bd057079083efafd579c710467e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ye-Xiang/mfd-Add-support-for-Intel-LJCA-device/20230220-023253
        git checkout 6fbec44daa135bd057079083efafd579c710467e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302201128.XeS2tn5i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-ljca.c:269:40: warning: 'ljca_spi_id' defined but not used [-Wunused-const-variable=]
     269 | static const struct platform_device_id ljca_spi_id[] = {
         |                                        ^~~~~~~~~~~


vim +/ljca_spi_id +269 drivers/spi/spi-ljca.c

   267	
   268	#define LJCA_SPI_DRV_NAME "ljca-spi"
 > 269	static const struct platform_device_id ljca_spi_id[] = {
   270		{ LJCA_SPI_DRV_NAME, 0 },
   271		{ /* sentinel */ }
   272	};
   273	MODULE_DEVICE_TABLE(platform, ljca_spi_id);
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

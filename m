Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A01F5BD9E2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 04:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiITCMx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 22:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiITCMw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 22:12:52 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5EF57541;
        Mon, 19 Sep 2022 19:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663639971; x=1695175971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WwkSfOxPmAZwYaiBBQ8ZxTjUKezOhW2aAc04ysU8N1I=;
  b=et/ZOdr1e+WpNUtc7THE30/1Eoiw7ZL8qY8mHC3Ub+F3bPP9XQ/2f/GG
   6ClKfRsEtaDPZmaOxD9E93QU+dk5cB2uCl66vXZTQl6GWqfds6xyju+Nw
   q+K8d+8Ah+ERuDj/cEIpBtY+dv/1vLCqHn9+Dki/4JCyMgYLq4bGfO/6e
   Mg68286zMyyc/h7C8yOsIAyjd01RPY7Kjg1b16OVeRgv9eO1kZpC29w7a
   IR9qkINNaRor57KP5dqzl4B2rgcg9RowhSv4fj6syx8gdj5MfWLIBFkDO
   /zwmofgOT8BO4zRBxokY/M9+Xb1FeYOi1NBBbjDPGkmvUREYoKmmnyvWh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282600238"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="282600238"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 19:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="569890529"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Sep 2022 19:12:48 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oaSkh-0002Ob-1O;
        Tue, 20 Sep 2022 02:12:47 +0000
Date:   Tue, 20 Sep 2022 10:12:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     tumic@gpxsee.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Michal Simek <monstr@monstr.eu>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH v2 2/3] Added Xilinx XDMA IP core driver
Message-ID: <202209201009.KI4tLr7u-lkp@intel.com>
References: <20220919185556.5215-3-tumic@gpxsee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919185556.5215-3-tumic@gpxsee.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.0-rc6 next-20220919]
[cannot apply to media-tree/master xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/tumic-gpxsee-org/Digiteq-Automotive-MGB4-driver/20220920-021718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20220920/202209201009.KI4tLr7u-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ad840c5e2b9ee9a8b1ceb4879fe7f82edcc767c5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review tumic-gpxsee-org/Digiteq-Automotive-MGB4-driver/20220920-021718
        git checkout ad840c5e2b9ee9a8b1ceb4879fe7f82edcc767c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/dma/xilinx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dma/xilinx/xilinx_xdma.c: In function 'read_interrupts':
>> drivers/dma/xilinx/xilinx_xdma.c:409:17: warning: variable 'hi' set but not used [-Wunused-but-set-variable]
     409 |         u32 lo, hi;
         |                 ^~
>> drivers/dma/xilinx/xilinx_xdma.c:409:13: warning: variable 'lo' set but not used [-Wunused-but-set-variable]
     409 |         u32 lo, hi;
         |             ^~


vim +/hi +409 drivers/dma/xilinx/xilinx_xdma.c

   404	
   405	static void read_interrupts(struct xdma_dev *xdev)
   406	{
   407		struct interrupt_regs *reg =
   408			(struct interrupt_regs *)(xdev->config_bar + XDMA_OFS_INT_CTRL);
 > 409		u32 lo, hi;
   410	
   411		hi = ioread32(&reg->user_int_request);
   412		lo = ioread32(&reg->channel_int_request);
   413	}
   414	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

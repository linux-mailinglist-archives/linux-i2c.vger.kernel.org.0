Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFB869C376
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Feb 2023 00:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjBSX45 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Feb 2023 18:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjBSX44 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Feb 2023 18:56:56 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0EDB75C;
        Sun, 19 Feb 2023 15:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676851015; x=1708387015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QuqAZMkv8e5xHu6tpVsHvWSVQn/x1TSjubi9vKxBjv0=;
  b=UzKfsTi+yLhrpNh/m8K7YIdQZ29HWUtmpdlwVyNkuE4qhCmtp/q/sTvi
   4neF/lcU9xSfli2BmCyk85n4WpvWXXmqm+LLA5F7jL5zmZNMfO+JYUT8R
   EYRJCVAPD5/Z6ob8Q4lldywJhp5gnRm0zEpNXD3NOD1eyb1ygafLiotcg
   SB1LlKY8+WQUUcuODGH7tZpB6NdPRncgYp1vcR1TEpiDWN81m8+tEi2jY
   tqVqdlBs2eAJ3rF60JhyWycunCEtcwF1B3sKUe+rAWAdC8KdlLoqQTgF/
   jhM7I1KATKp+Rnxp53Kf/9b/LB4RJ2Al+blgiRKq5VTtcr38F/ki0fY6x
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="320414121"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="320414121"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 15:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="1000088693"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="1000088693"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Feb 2023 15:56:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pTtY2-000DVD-1L;
        Sun, 19 Feb 2023 23:56:50 +0000
Date:   Mon, 20 Feb 2023 07:56:30 +0800
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
Subject: Re: [PATCH 3/5] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <202302200748.p6HZohuJ-lkp@intel.com>
References: <20230219183059.1029525-4-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219183059.1029525-4-xiang.ye@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes wsa/i2c/for-next broonie-spi/for-next linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Xiang/mfd-Add-support-for-Intel-LJCA-device/20230220-023253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230219183059.1029525-4-xiang.ye%40intel.com
patch subject: [PATCH 3/5] i2c: Add support for Intel LJCA USB I2C driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230220/202302200748.p6HZohuJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9faeca641d7d776bbd8158b606a77830eddde590
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ye-Xiang/mfd-Add-support-for-Intel-LJCA-device/20230220-023253
        git checkout 9faeca641d7d776bbd8158b606a77830eddde590
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/i2c/busses/ drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200748.p6HZohuJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-ljca.c:339:40: warning: 'ljca_i2c_id' defined but not used [-Wunused-const-variable=]
     339 | static const struct platform_device_id ljca_i2c_id[] = {
         |                                        ^~~~~~~~~~~


vim +/ljca_i2c_id +339 drivers/i2c/busses/i2c-ljca.c

   337	
   338	#define LJCA_I2C_DRV_NAME "ljca-i2c"
 > 339	static const struct platform_device_id ljca_i2c_id[] = {
   340		{ LJCA_I2C_DRV_NAME, 0 },
   341		{ /* sentinel */ }
   342	};
   343	MODULE_DEVICE_TABLE(platform, ljca_i2c_id);
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

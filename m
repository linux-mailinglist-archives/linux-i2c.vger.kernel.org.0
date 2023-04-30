Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 232056F2A04
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Apr 2023 19:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbjD3Ras (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Apr 2023 13:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjD3Ras (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Apr 2023 13:30:48 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE77810EA;
        Sun, 30 Apr 2023 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682875846; x=1714411846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EmOg6EOUyCPJdIgtaCmi0uNZdCAby1mxeqx8iFroNo0=;
  b=ecGo+hjbFEzIBEnn0hU3n8cgRwTWzx5Edl1qfaU95yCbS797HWDPqUnH
   Ay9oyHgNPM6rvwVmL2aF1+T/cJVswQf4Sr2Z2m8SmGEc1vzeWRMmdKIM6
   E/iuGALVZ+ZwMPV+1EKIusoGAppV7kGwWlwNFkB3SxevBrDszigxuBOpO
   r+8mCxuoljKM6HBpa6hjMZZBZ3sdezKSPR/duBwxFZkAE38Xdh7WcTBlv
   eXvuuUz4psBayzSf/UHBBntApeEvES/KpsDZwGIh8vuRgq/IublEE+foJ
   ym3HupHHXxGBYO5HKdEGEt8fPJnp1qBgHDvVcQrzEppRbX4r5aKqFVe1Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="411168834"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="411168834"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 10:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="869930794"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="869930794"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Apr 2023 10:30:41 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ptAsj-00004D-0l;
        Sun, 30 Apr 2023 17:30:41 +0000
Date:   Mon, 1 May 2023 01:30:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     oe-kbuild-all@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Message-ID: <202305010110.yAHNljHe-lkp@intel.com>
References: <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Delphine,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/dt-bindings-hwmon-Add-lltc-ltc4286-driver-bindings/20230424-181521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230424101352.28117-3-Delphine_CC_Chiu%40Wiwynn.com
patch subject: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
config: arm-randconfig-s043-20230430 (https://download.01.org/0day-ci/archive/20230501/202305010110.yAHNljHe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/318b8a252bb2d7430f1cf7b93bb5df8d0e4fee29
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Delphine-CC-Chiu/dt-bindings-hwmon-Add-lltc-ltc4286-driver-bindings/20230424-181521
        git checkout 318b8a252bb2d7430f1cf7b93bb5df8d0e4fee29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/hwmon/pmbus/ drivers/i3c/master/ drivers/spi/ sound/soc/cirrus/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010110.yAHNljHe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/ltc4286.c:134:18: error: initialization of 'int (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *, const struct i2c_device_id *)' [-Werror=incompatible-pointer-types]
     134 |         .probe = ltc4286_probe,
         |                  ^~~~~~~~~~~~~
   drivers/hwmon/pmbus/ltc4286.c:134:18: note: (near initialization for 'ltc4286_driver.<anonymous>.probe')
   cc1: some warnings being treated as errors


vim +134 drivers/hwmon/pmbus/ltc4286.c

   127	
   128	/* This is the driver that will be inserted */
   129	static struct i2c_driver ltc4286_driver = {
   130		.driver = {
   131			.name = "ltc4286",
   132			.of_match_table = ltc4286_of_match,
   133		},
 > 134		.probe = ltc4286_probe,
   135		.id_table = ltc4286_id,
   136	};
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

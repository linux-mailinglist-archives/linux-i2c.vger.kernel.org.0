Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5426F8CAD
	for <lists+linux-i2c@lfdr.de>; Sat,  6 May 2023 01:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjEEXOg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 May 2023 19:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjEEXOf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 May 2023 19:14:35 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E5049EC;
        Fri,  5 May 2023 16:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683328474; x=1714864474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bn9rIXC2Q9CkYc/5/WBXDL7bL8vDXlXsynHQzgsGgZc=;
  b=TFP0+VbUXEYdLiW9ubFmK6VH/COxuly2zpsGj8o3TNyHa4t+8OPsz0M9
   iZ5TAqikXBwl4ZuZcUNUAnMhVaygzJsRSzAtEFkrgVuXMl35v0DskpSVE
   kuQrAgmpbufd+iyIq4CGS/XDv/nvE7nUzh42bNXdIUR6OcCh/40LVqLMn
   ygO19v3YxHuAivYkiUAO7ngPKYFqRXWbyKOXfNtuljLM/+vbKlDFbIQUN
   YEsV2b803WNh3GD3OT8yqzn9pehbQw1ubCd7i6Tr/+Jr9zPtUik+SK0k9
   m+LWKigxBasgaCN//nf43yYxG6QGlqxDb4ch2zatjdHYZydayq7HZxyOJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="351462858"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="351462858"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 16:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="675290752"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="675290752"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 May 2023 16:14:30 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pv4dB-0000uv-1l;
        Fri, 05 May 2023 23:14:29 +0000
Date:   Sat, 6 May 2023 07:14:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Message-ID: <202305060716.5xAx86T8-lkp@intel.com>
References: <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Delphine,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.3 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/dt-bindings-hwmon-Add-lltc-ltc4286-driver-bindings/20230424-181521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230424101352.28117-3-Delphine_CC_Chiu%40Wiwynn.com
patch subject: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230506/202305060716.5xAx86T8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/318b8a252bb2d7430f1cf7b93bb5df8d0e4fee29
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Delphine-CC-Chiu/dt-bindings-hwmon-Add-lltc-ltc4286-driver-bindings/20230424-181521
        git checkout 318b8a252bb2d7430f1cf7b93bb5df8d0e4fee29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060716.5xAx86T8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/ltc4286.c:46:24: warning: implicit conversion from 'double' to 'int' changes value from 273.15 to 273 [-Wliteral-conversion]
           .b[PSC_TEMPERATURE] = 273.15,
                                 ^~~~~~
>> drivers/hwmon/pmbus/ltc4286.c:134:11: error: incompatible function pointer types initializing 'int (*)(struct i2c_client *)' with an expression of type 'int (struct i2c_client *, const struct i2c_device_id *)' [-Werror,-Wincompatible-function-pointer-types]
           .probe = ltc4286_probe,
                    ^~~~~~~~~~~~~
   1 warning and 1 error generated.


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

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 180336EDAF8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 06:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjDYEtX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 00:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjDYEtW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 00:49:22 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B28E7D97;
        Mon, 24 Apr 2023 21:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682398161; x=1713934161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7rZnvjZU75nXYCbRspPe2A4WrOUI0wNa/u5RdGhCn8U=;
  b=WC2r/tuyNZ6Nh7isRIk9Hhry8VI0o8MseUVNAFdOUsCZRmfBhv1qitPB
   ocHQ0BHHEgtM4jJEFSjY1QuTXJiz4K5bR2Q3N28GZsXuJperHzkJAdwxV
   mEn5HWggXixwAEhVNmBCeRW1MJJfNOf4MphHVhdGaD8NZpgBVu9SYmAwg
   aDc1AB51D0AYGhk2YYbYsczCfE1h9eZkHzvXBFn1VfcqRVlK7D8i3lx0z
   5WdFQ9cOS8fjs/S/5PPBm37pwqG0Yq4igiooyisLrrNS/Vm0zrvxvopWj
   whFpnh3LLna5Y0UNK5eDiwSYDbd+XKzu95ETmCdj45FXyWLs8gSjN6C8T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="432911947"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="432911947"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 21:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867747810"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="867747810"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Apr 2023 21:49:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1prAc8-000izS-0r;
        Tue, 25 Apr 2023 04:49:16 +0000
Date:   Tue, 25 Apr 2023 12:48:32 +0800
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
Message-ID: <202304251257.oiVqQ5cl-lkp@intel.com>
References: <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Delphine,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.3 next-20230424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/dt-bindings-hwmon-Add-lltc-ltc4286-driver-bindings/20230424-181521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230424101352.28117-3-Delphine_CC_Chiu%40Wiwynn.com
patch subject: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
config: riscv-randconfig-r021-20230425 (https://download.01.org/0day-ci/archive/20230425/202304251257.oiVqQ5cl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/318b8a252bb2d7430f1cf7b93bb5df8d0e4fee29
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Delphine-CC-Chiu/dt-bindings-hwmon-Add-lltc-ltc4286-driver-bindings/20230424-181521
        git checkout 318b8a252bb2d7430f1cf7b93bb5df8d0e4fee29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/hwmon/pmbus/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251257.oiVqQ5cl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/ltc4286.c:46:24: warning: implicit conversion from 'double' to 'int' changes value from 273.15 to 273 [-Wliteral-conversion]
           .b[PSC_TEMPERATURE] = 273.15,
                                 ^~~~~~
>> drivers/hwmon/pmbus/ltc4286.c:134:11: error: incompatible function pointer types initializing 'int (*)(struct i2c_client *)' with an expression of type 'int (struct i2c_client *, const struct i2c_device_id *)' [-Wincompatible-function-pointer-types]
           .probe = ltc4286_probe,
                    ^~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +134 drivers/hwmon/pmbus/ltc4286.c

    25	
    26	static struct pmbus_driver_info ltc4286_info = {
    27		.pages = 1,
    28		.format[PSC_VOLTAGE_IN] = direct,
    29		.format[PSC_VOLTAGE_OUT] = direct,
    30		.format[PSC_CURRENT_OUT] = direct,
    31		.format[PSC_POWER] = direct,
    32		.format[PSC_TEMPERATURE] = direct,
    33		.m[PSC_VOLTAGE_IN] = 32,
    34		.b[PSC_VOLTAGE_IN] = 0,
    35		.R[PSC_VOLTAGE_IN] = 1,
    36		.m[PSC_VOLTAGE_OUT] = 32,
    37		.b[PSC_VOLTAGE_OUT] = 0,
    38		.R[PSC_VOLTAGE_OUT] = 1,
    39		.m[PSC_CURRENT_OUT] = 1024,
    40		.b[PSC_CURRENT_OUT] = 0,
    41		.R[PSC_CURRENT_OUT] = 3 - 6,
    42		.m[PSC_POWER] = 1,
    43		.b[PSC_POWER] = 0,
    44		.R[PSC_POWER] = 4 - 6,
    45		.m[PSC_TEMPERATURE] = 1,
  > 46		.b[PSC_TEMPERATURE] = 273.15,
    47		.R[PSC_TEMPERATURE] = 0,
    48		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
    49			   PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP,
    50	};
    51	
    52	static int ltc4286_probe(struct i2c_client *client,
    53				 const struct i2c_device_id *id)
    54	{
    55		int ret;
    56		u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
    57		struct device *dev = &client->dev;
    58		struct pmbus_driver_info *info;
    59		u32 rsense;
    60	
    61		ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
    62		if (ret < 0) {
    63			dev_err(&client->dev, "failed to read manufacturer id\n");
    64			return ret;
    65		}
    66	
    67		/* Refer to ltc4286 datasheet page 20
    68		 * the default manufacturer id is LTC
    69		 */
    70		if (ret != LTC4286_MFR_ID_SIZE ||
    71		    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
    72			dev_err(&client->dev, "unsupported manufacturer id\n");
    73			return -ENODEV;
    74		}
    75	
    76		ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
    77		if (ret < 0) {
    78			dev_err(&client->dev, "failed to read manufacturer model\n");
    79			return ret;
    80		}
    81	
    82		ret = of_property_read_u32(client->dev.of_node, "rsense-micro-ohms",
    83					   &rsense);
    84		if (ret < 0)
    85			return ret;
    86	
    87		if (rsense == 0)
    88			return -EINVAL;
    89	
    90		info = &ltc4286_info;
    91	
    92		/* Default of VRANGE_SELECT = 1 */
    93		if (device_property_read_bool(dev, "vrange_select_25p6")) {
    94			/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
    95			ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
    96			if (ret < 0) {
    97				dev_err(&client->dev,
    98					"failed to read manufacturer configuration one\n");
    99				return ret;
   100			}
   101	
   102			ret &= ~VRANGE_SELECT; /* VRANGE_SELECT = 0, 25.6V */
   103			i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1, ret);
   104	
   105			info->m[PSC_VOLTAGE_IN] = 128;
   106			info->m[PSC_VOLTAGE_OUT] = 128;
   107			info->m[PSC_POWER] = 4 * rsense;
   108		} else {
   109			info->m[PSC_POWER] = rsense;
   110		}
   111	
   112		info->m[PSC_CURRENT_OUT] = 1024 * rsense;
   113	
   114		return pmbus_do_probe(client, info);
   115	}
   116	
   117	static const struct i2c_device_id ltc4286_id[] = { { "ltc4286", ltc4286 },
   118							   { "ltc4287", ltc4287 },
   119							   {} };
   120	MODULE_DEVICE_TABLE(i2c, ltc4286_id);
   121	
   122	static const struct of_device_id ltc4286_of_match[] = {
   123		{ .compatible = "lltc,ltc4286" },
   124		{ .compatible = "lltc,ltc4287" },
   125		{}
   126	};
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

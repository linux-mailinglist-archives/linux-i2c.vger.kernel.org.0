Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09E02676128
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jan 2023 00:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjATXDh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 18:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjATXDg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 18:03:36 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216BE5E504;
        Fri, 20 Jan 2023 15:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674255815; x=1705791815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f+Y2d5WifdWH1iAgu4lhYlkNGFsn/bMB3NVjAbTRvn0=;
  b=c0qpu9ktofRaL9dRv0HKrtozxNS9pspsmJNjWaSOx8gNbtG4TnOAylAa
   D/V3WyJp6grDPudpeSIGpG0ujB/fBp/xPeWS0ESEPtJgBTil4MKYFWI5r
   nU7YP/dGzHbJfIBy+Bj1dqEbQJKNglboVprG5Y4DUVRT+HO7KylR9rJjM
   PkcrjlmDGFuZBgioZakvb7oUdOIH41gbAFTF0Y17NZLOmMqD6ys8yFP5S
   Pg1HAerlImgostrIgkKG86deodXtX/GJl++CEWT7Az3PSaxyj0Uzi7nM5
   HwKQQS7x6+xd3uqIl9bAHxW0LUg+7rDrPYUV54VAV61MM9vESQpNjdkKm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="309293551"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="309293551"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 15:03:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834573078"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="834573078"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 15:03:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pJ0Py-00034u-1a;
        Fri, 20 Jan 2023 23:03:30 +0000
Date:   Sat, 21 Jan 2023 07:02:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     nick.hawkins@hpe.com, verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/5] i2c: hpe: Add GXP SoC I2C Controller
Message-ID: <202301210607.KSWIWehq-lkp@intel.com>
References: <20230120190159.23459-2-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120190159.23459-2-nick.hawkins@hpe.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on robh/for-next linus/master v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/nick-hawkins-hpe-com/i2c-hpe-Add-GXP-SoC-I2C-Controller/20230121-030628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230120190159.23459-2-nick.hawkins%40hpe.com
patch subject: [PATCH v3 1/5] i2c: hpe: Add GXP SoC I2C Controller
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230121/202301210607.KSWIWehq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/944feebf5cf838fc72fae192e832e5fc96d1cad9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review nick-hawkins-hpe-com/i2c-hpe-Add-GXP-SoC-I2C-Controller/20230121-030628
        git checkout 944feebf5cf838fc72fae192e832e5fc96d1cad9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-gxp.c: In function 'gxp_i2c_probe':
>> drivers/i2c/busses/i2c-gxp.c:533:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     533 |         drvdata->engine = ((u32)drvdata->base & 0xf00) >> 8;
         |                            ^


vim +533 drivers/i2c/busses/i2c-gxp.c

   499	
   500	static int gxp_i2c_probe(struct platform_device *pdev)
   501	{
   502		struct gxp_i2c_drvdata *drvdata;
   503		int rc;
   504		struct i2c_adapter *adapter;
   505	
   506		if (!i2c_global_init_done) {
   507			i2cg_map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
   508								   "hpe,sysreg");
   509			if (IS_ERR(i2cg_map)) {
   510				return dev_err_probe(&pdev->dev, IS_ERR(i2cg_map),
   511						     "failed to map i2cg_handle\n");
   512			}
   513	
   514			/* Disable interrupt */
   515			regmap_update_bits(i2cg_map, GXP_I2CINTEN, 0x00000FFF, 0);
   516			i2c_global_init_done = true;
   517		}
   518	
   519		drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata),
   520				       GFP_KERNEL);
   521		if (!drvdata)
   522			return -ENOMEM;
   523	
   524		platform_set_drvdata(pdev, drvdata);
   525		drvdata->dev = &pdev->dev;
   526		init_completion(&drvdata->completion);
   527	
   528		drvdata->base = devm_platform_ioremap_resource(pdev, 0);
   529		if (IS_ERR(drvdata->base))
   530			return PTR_ERR(drvdata->base);
   531	
   532		/* Use physical memory address to determine which I2C engine this is. */
 > 533		drvdata->engine = ((u32)drvdata->base & 0xf00) >> 8;
   534	
   535		if (drvdata->engine >= GXP_MAX_I2C_ENGINE) {
   536			return dev_err_probe(&pdev->dev, -EINVAL, "i2c engine% is unsupported\n",
   537				drvdata->engine);
   538		}
   539	
   540		rc = platform_get_irq(pdev, 0);
   541		if (rc < 0)
   542			return rc;
   543	
   544		drvdata->irq = rc;
   545		rc = devm_request_irq(&pdev->dev, drvdata->irq, gxp_i2c_irq_handler,
   546				      IRQF_SHARED, gxp_i2c_name[drvdata->engine], drvdata);
   547		if (rc < 0)
   548			return dev_err_probe(&pdev->dev, rc, "irq request failed\n");
   549	
   550		i2c_parse_fw_timings(&pdev->dev, &drvdata->t, true);
   551	
   552		gxp_i2c_init(drvdata);
   553	
   554		/* Enable interrupt */
   555		regmap_update_bits(i2cg_map, GXP_I2CINTEN, BIT(drvdata->engine),
   556				   BIT(drvdata->engine));
   557	
   558		adapter = &drvdata->adapter;
   559		i2c_set_adapdata(adapter, drvdata);
   560	
   561		adapter->owner = THIS_MODULE;
   562		strscpy(adapter->name, "HPE GXP I2C adapter", sizeof(adapter->name));
   563		adapter->algo = &gxp_i2c_algo;
   564		adapter->dev.parent = &pdev->dev;
   565		adapter->dev.of_node = pdev->dev.of_node;
   566	
   567		rc = i2c_add_adapter(adapter);
   568		if (rc)
   569			return dev_err_probe(&pdev->dev, rc, "i2c add adapter failed\n");
   570	
   571		return 0;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

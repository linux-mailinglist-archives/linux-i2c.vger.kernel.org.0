Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C8D7D1B7B
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Oct 2023 09:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjJUHTE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Oct 2023 03:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjJUHTD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Oct 2023 03:19:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33982D63;
        Sat, 21 Oct 2023 00:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697872738; x=1729408738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ird0lBAgWOCgFp5VyruLNWyvOrnWYbzy17TTHvnJ2Q0=;
  b=lVfKNeMMBzhDra810cajxXwuCzptGpOBZiNCpjvBqlocZ/Q0ipqo357p
   Ge4i9unIridFRchi1xwbk1LOUeiYXrt9ht/6D31Xs3WUH5FrlRb08rkUx
   aP7vEHX2SWBP6dhA03XRjMD4mTIbnQTD5CDYMmHLsOPPUposrDEYwQWe1
   fDXcJs3pZTMW7v5qDMDw9585g3d4IFZy24JbwdJ6jsOHDhsTOWyE8cfXy
   aNGIY8C7jdSywJCn8flMJZp0ZEdwsqVi2PVmFvc0EeqIaiD+ZoeizsHzL
   YpelYbGijbqckQU95iXZ6UWlLCOijk1HkmEOkytyFdBFAxymDgJpIwVUe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="365951545"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="365951545"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 00:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="823474085"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="823474085"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Oct 2023 00:18:55 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qu6G5-0004Ye-0O;
        Sat, 21 Oct 2023 07:18:53 +0000
Date:   Sat, 21 Oct 2023 15:18:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 2/2] i2c: mv64xxx: add an optional reset-gpios property
Message-ID: <202310211508.57kpcEto-lkp@intel.com>
References: <20231012035838.2804064-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012035838.2804064-3-chris.packham@alliedtelesis.co.nz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/dt-bindings-i2c-mv64xxx-add-reset-gpios-property/20231017-102540
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20231012035838.2804064-3-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH 2/2] i2c: mv64xxx: add an optional reset-gpios property
config: i386-buildonly-randconfig-001-20231021 (https://download.01.org/0day-ci/archive/20231021/202310211508.57kpcEto-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211508.57kpcEto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211508.57kpcEto-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-mv64xxx.c: In function 'mv64xxx_i2c_probe':
>> drivers/i2c/busses/i2c-mv64xxx.c:1028:32: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_clk_get_optional'? [-Werror=implicit-function-declaration]
    1028 |         drv_data->reset_gpio = devm_gpiod_get_optional(&pd->dev, "reset", GPIOD_OUT_HIGH);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                devm_clk_get_optional
>> drivers/i2c/busses/i2c-mv64xxx.c:1028:75: error: 'GPIOD_OUT_HIGH' undeclared (first use in this function)
    1028 |         drv_data->reset_gpio = devm_gpiod_get_optional(&pd->dev, "reset", GPIOD_OUT_HIGH);
         |                                                                           ^~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mv64xxx.c:1028:75: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/i2c/busses/i2c-mv64xxx.c:1068:17: error: implicit declaration of function 'gpiod_set_value_cansleep' [-Werror=implicit-function-declaration]
    1068 |                 gpiod_set_value_cansleep(drv_data->reset_gpio, 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1028 drivers/i2c/busses/i2c-mv64xxx.c

   983	
   984	static int
   985	mv64xxx_i2c_probe(struct platform_device *pd)
   986	{
   987		struct mv64xxx_i2c_data		*drv_data;
   988		struct mv64xxx_i2c_pdata	*pdata = dev_get_platdata(&pd->dev);
   989		int	rc;
   990	
   991		if ((!pdata && !pd->dev.of_node))
   992			return -ENODEV;
   993	
   994		drv_data = devm_kzalloc(&pd->dev, sizeof(struct mv64xxx_i2c_data),
   995					GFP_KERNEL);
   996		if (!drv_data)
   997			return -ENOMEM;
   998	
   999		drv_data->reg_base = devm_platform_ioremap_resource(pd, 0);
  1000		if (IS_ERR(drv_data->reg_base))
  1001			return PTR_ERR(drv_data->reg_base);
  1002	
  1003		strscpy(drv_data->adapter.name, MV64XXX_I2C_CTLR_NAME " adapter",
  1004			sizeof(drv_data->adapter.name));
  1005	
  1006		init_waitqueue_head(&drv_data->waitq);
  1007		spin_lock_init(&drv_data->lock);
  1008	
  1009		/* Not all platforms have clocks */
  1010		drv_data->clk = devm_clk_get(&pd->dev, NULL);
  1011		if (IS_ERR(drv_data->clk)) {
  1012			if (PTR_ERR(drv_data->clk) == -EPROBE_DEFER)
  1013				return -EPROBE_DEFER;
  1014			drv_data->clk = NULL;
  1015		}
  1016	
  1017		drv_data->reg_clk = devm_clk_get(&pd->dev, "reg");
  1018		if (IS_ERR(drv_data->reg_clk)) {
  1019			if (PTR_ERR(drv_data->reg_clk) == -EPROBE_DEFER)
  1020				return -EPROBE_DEFER;
  1021			drv_data->reg_clk = NULL;
  1022		}
  1023	
  1024		drv_data->irq = platform_get_irq(pd, 0);
  1025		if (drv_data->irq < 0)
  1026			return drv_data->irq;
  1027	
> 1028		drv_data->reset_gpio = devm_gpiod_get_optional(&pd->dev, "reset", GPIOD_OUT_HIGH);
  1029		if (IS_ERR(drv_data->reset_gpio))
  1030			return PTR_ERR(drv_data->reset_gpio);
  1031	
  1032		if (pdata) {
  1033			drv_data->freq_m = pdata->freq_m;
  1034			drv_data->freq_n = pdata->freq_n;
  1035			drv_data->adapter.timeout = msecs_to_jiffies(pdata->timeout);
  1036			drv_data->offload_enabled = false;
  1037			memcpy(&drv_data->reg_offsets, &mv64xxx_i2c_regs_mv64xxx, sizeof(drv_data->reg_offsets));
  1038		} else if (pd->dev.of_node) {
  1039			rc = mv64xxx_of_config(drv_data, &pd->dev);
  1040			if (rc)
  1041				return rc;
  1042		}
  1043	
  1044		rc = mv64xxx_i2c_init_recovery_info(drv_data, &pd->dev);
  1045		if (rc == -EPROBE_DEFER)
  1046			return rc;
  1047	
  1048		drv_data->adapter.dev.parent = &pd->dev;
  1049		drv_data->adapter.algo = &mv64xxx_i2c_algo;
  1050		drv_data->adapter.owner = THIS_MODULE;
  1051		drv_data->adapter.class = I2C_CLASS_DEPRECATED;
  1052		drv_data->adapter.nr = pd->id;
  1053		drv_data->adapter.dev.of_node = pd->dev.of_node;
  1054		platform_set_drvdata(pd, drv_data);
  1055		i2c_set_adapdata(&drv_data->adapter, drv_data);
  1056	
  1057		pm_runtime_set_autosuspend_delay(&pd->dev, MSEC_PER_SEC);
  1058		pm_runtime_use_autosuspend(&pd->dev);
  1059		pm_runtime_enable(&pd->dev);
  1060		if (!pm_runtime_enabled(&pd->dev)) {
  1061			rc = mv64xxx_i2c_runtime_resume(&pd->dev);
  1062			if (rc)
  1063				goto exit_disable_pm;
  1064		}
  1065	
  1066		if (drv_data->reset_gpio) {
  1067			udelay(1);
> 1068			gpiod_set_value_cansleep(drv_data->reset_gpio, 0);
  1069			udelay(1);
  1070		}
  1071	
  1072		rc = request_irq(drv_data->irq, mv64xxx_i2c_intr, 0,
  1073				 MV64XXX_I2C_CTLR_NAME, drv_data);
  1074		if (rc) {
  1075			dev_err(&drv_data->adapter.dev,
  1076				"mv64xxx: Can't register intr handler irq%d: %d\n",
  1077				drv_data->irq, rc);
  1078			goto exit_disable_pm;
  1079		} else if ((rc = i2c_add_numbered_adapter(&drv_data->adapter)) != 0) {
  1080			dev_err(&drv_data->adapter.dev,
  1081				"mv64xxx: Can't add i2c adapter, rc: %d\n", -rc);
  1082			goto exit_free_irq;
  1083		}
  1084	
  1085		return 0;
  1086	
  1087	exit_free_irq:
  1088		free_irq(drv_data->irq, drv_data);
  1089	exit_disable_pm:
  1090		pm_runtime_disable(&pd->dev);
  1091		if (!pm_runtime_status_suspended(&pd->dev))
  1092			mv64xxx_i2c_runtime_suspend(&pd->dev);
  1093	
  1094		return rc;
  1095	}
  1096	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

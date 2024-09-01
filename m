Return-Path: <linux-i2c+bounces-5974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEE2967408
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 02:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AF4C1F21F20
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 00:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E498817577;
	Sun,  1 Sep 2024 00:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkPMFJC7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C5015ACA
	for <linux-i2c@vger.kernel.org>; Sun,  1 Sep 2024 00:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725150988; cv=none; b=nHwk94P/TA/ffsm6lAUQaQzkudeuuYB+99eyKMKlKc+3+nGN5IDl3/sER5+2dHZkq6pIYp+lHhQYppJyEXeyuFhot87tASw7RGvKuxiGJ/O2Z7ZVfdnRp3Ft8SbAvPsJyvIiEGUXjp5sJuQKU0g/GOy/oeYYRjApG4QaFHhDj90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725150988; c=relaxed/simple;
	bh=x5VJBzweQnNZYFNf8QCL5sEMfv0aCsnl9w5SPrvaQro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emlm4APaLSnSZu85wh9GwBht/XoFW951jdXMk0zwsYPcO1NdMMSGurPX0WMmTxzMQl8JouUxUbbKjW578V4kcIqcbvLZVEE1qMqey96CWNz5PFw5RVC7mgPwVReZS57iu6X730pdrkHZVDQApfFxN6S7u1BSUkHceJW4BaBsVwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkPMFJC7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725150986; x=1756686986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x5VJBzweQnNZYFNf8QCL5sEMfv0aCsnl9w5SPrvaQro=;
  b=DkPMFJC78p8d15yEdC0jQc3SAbYPHLF7l8d4mGewsJ622SVDzp3ruYXJ
   E9Aa9sPR1z++BmxBzQXdIoGNPKYqnX8m+wvL4xUeJ+XdnTQWLIIzBiNw4
   l4AcHQiyz8pZh7DLmIxUosYIdi3jwR0Fls3nLvkqZQ9x8A23OltNcWhlF
   OykUv20dmzN1MsfVxTEI5HVD1v/tUo92Bd99ep7oxB5bhE6Mz4Ht6KU4E
   FgIpgxG31QGEXlzirRKsDW7VyREgJJJHIh3iPiAyLuhbD6OcHKQVKfPDs
   GcygsOssnSzjDdijuQwL4aomEm1UEWKz3r62Klab1+u+s0qnisW9GcBak
   w==;
X-CSE-ConnectionGUID: N1AJXwjHR0+qPebP6j0HMw==
X-CSE-MsgGUID: VtTv9R+WTVe2KIN4DUtVDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23628728"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23628728"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 17:36:26 -0700
X-CSE-ConnectionGUID: F+WrRPzIQISM4nxReYgmpA==
X-CSE-MsgGUID: Rt+MGArtSqi1n8iFthJijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="64741465"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Aug 2024 17:36:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skYZp-0003Dw-2v;
	Sun, 01 Sep 2024 00:36:21 +0000
Date: Sun, 1 Sep 2024 08:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Group all DesignWare drivers under a
 single option
Message-ID: <202409010801.ysO33Po0-lkp@intel.com>
References: <20240830111222.2131172-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240830111222.2131172-1-heikki.krogerus@linux.intel.com>

Hi Heikki,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heikki-Krogerus/i2c-designware-Group-all-DesignWare-drivers-under-a-single-option/20240830-191656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240830111222.2131172-1-heikki.krogerus%40linux.intel.com
patch subject: [PATCH] i2c: designware: Group all DesignWare drivers under a single option
config: arm64-randconfig-003-20240901 (https://download.01.org/0day-ci/archive/20240901/202409010801.ysO33Po0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010801.ysO33Po0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010801.ysO33Po0-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_runtime_resume':
>> drivers/i2c/busses/i2c-designware-platdrv.c:380:(.text+0x60): undefined reference to `i2c_dw_prepare_clk'
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_runtime_suspend':
>> drivers/i2c/busses/i2c-designware-platdrv.c:360:(.text+0x9c): undefined reference to `i2c_dw_disable'
>> aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.c:361:(.text+0xa8): undefined reference to `i2c_dw_prepare_clk'
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_remove':
   drivers/i2c/busses/i2c-designware-platdrv.c:331:(.text+0x1ac): undefined reference to `i2c_dw_disable'
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_suspend':
   drivers/i2c/busses/i2c-designware-platdrv.c:360:(.text+0x3c4): undefined reference to `i2c_dw_disable'
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.c:361:(.text+0x3d0): undefined reference to `i2c_dw_prepare_clk'
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_probe':
>> drivers/i2c/busses/i2c-designware-platdrv.c:240:(.text+0x564): undefined reference to `i2c_dw_fw_parse_and_configure'
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_probe':
>> drivers/i2c/busses/i2c-designware-core.h:406:(.text+0x588): undefined reference to `i2c_dw_configure_master'
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_probe':
   drivers/i2c/busses/i2c-designware-platdrv.c:263:(.text+0x5d0): undefined reference to `i2c_dw_prepare_clk'
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_probe':
>> drivers/i2c/busses/i2c-designware-core.h:394:(.text+0x734): undefined reference to `i2c_dw_probe_master'
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-platdrv.o: in function `dw_i2c_plat_resume':
   drivers/i2c/busses/i2c-designware-platdrv.c:380:(.text+0x7e0): undefined reference to `i2c_dw_prepare_clk'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_DESIGNWARE_PLATFORM
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && I2C_DESIGNWARE_CORE [=n] && (ACPI [=n] && COMMON_CLK [=y] || !ACPI [=n])
   Selected by [y]:
   - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y] && COMMON_CLK [=y]


vim +380 drivers/i2c/busses/i2c-designware-platdrv.c

78d5e9e299e31b Jan Dabros         2022-02-08  207  
6ad6fde3970c98 Jarkko Nikula      2015-08-31  208  static int dw_i2c_plat_probe(struct platform_device *pdev)
2373f6b9744d53 Dirk Brandewie     2011-10-29  209  {
2373f6b9744d53 Dirk Brandewie     2011-10-29  210  	struct i2c_adapter *adap;
e393f674c5fedc Luis Oliveira      2017-06-14  211  	struct dw_i2c_dev *dev;
f9288fcc5c6154 Andy Shevchenko    2020-05-19  212  	int irq, ret;
2373f6b9744d53 Dirk Brandewie     2011-10-29  213  
2373f6b9744d53 Dirk Brandewie     2011-10-29  214  	irq = platform_get_irq(pdev, 0);
b20d386485e259 Alexey Brodkin     2015-03-09  215  	if (irq < 0)
b20d386485e259 Alexey Brodkin     2015-03-09  216  		return irq;
2373f6b9744d53 Dirk Brandewie     2011-10-29  217  
1cb715ca46946b Andy Shevchenko    2013-04-10  218  	dev = devm_kzalloc(&pdev->dev, sizeof(struct dw_i2c_dev), GFP_KERNEL);
1cb715ca46946b Andy Shevchenko    2013-04-10  219  	if (!dev)
1cb715ca46946b Andy Shevchenko    2013-04-10  220  		return -ENOMEM;
2373f6b9744d53 Dirk Brandewie     2011-10-29  221  
fac25d7aaa03c4 Serge Semin        2020-05-28  222  	dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
2f8d1ed793453b Jiawen Wu          2023-06-05  223  	if (device_property_present(&pdev->dev, "wx,i2c-snps-model"))
535677e44d57a3 Jarkko Nikula      2024-02-13  224  		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
2f8d1ed793453b Jiawen Wu          2023-06-05  225  
1cb715ca46946b Andy Shevchenko    2013-04-10  226  	dev->dev = &pdev->dev;
2373f6b9744d53 Dirk Brandewie     2011-10-29  227  	dev->irq = irq;
2373f6b9744d53 Dirk Brandewie     2011-10-29  228  	platform_set_drvdata(pdev, dev);
2373f6b9744d53 Dirk Brandewie     2011-10-29  229  
b7c3d0777808cd Serge Semin        2020-05-28  230  	ret = dw_i2c_plat_request_regs(dev);
b7c3d0777808cd Serge Semin        2020-05-28  231  	if (ret)
b7c3d0777808cd Serge Semin        2020-05-28  232  		return ret;
b7c3d0777808cd Serge Semin        2020-05-28  233  
ab809fd81fde3d Zhangfei Gao       2016-12-27  234  	dev->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
a6af48ec0712a0 Andy Shevchenko    2019-08-19  235  	if (IS_ERR(dev->rst))
a6af48ec0712a0 Andy Shevchenko    2019-08-19  236  		return PTR_ERR(dev->rst);
a6af48ec0712a0 Andy Shevchenko    2019-08-19  237  
ab809fd81fde3d Zhangfei Gao       2016-12-27  238  	reset_control_deassert(dev->rst);
ab809fd81fde3d Zhangfei Gao       2016-12-27  239  
82e495069926e7 Andy Shevchenko    2024-08-22 @240  	ret = i2c_dw_fw_parse_and_configure(dev);
20ee1d9020c923 Andy Shevchenko    2020-05-19  241  	if (ret)
ab809fd81fde3d Zhangfei Gao       2016-12-27  242  		goto exit_reset;
9803f868944e87 Christian Ruppert  2013-06-26  243  
e393f674c5fedc Luis Oliveira      2017-06-14  244  	ret = i2c_dw_probe_lock_support(dev);
e393f674c5fedc Luis Oliveira      2017-06-14  245  	if (ret)
ab809fd81fde3d Zhangfei Gao       2016-12-27  246  		goto exit_reset;
894acb2f823b13 David Box          2015-01-15  247  
3ebe40ed1c3901 Andy Shevchenko    2020-04-25  248  	i2c_dw_configure(dev);
2fa8326b4b1e5f Dirk Brandewie     2011-10-06  249  
c62ebb3d5f0d0e Phil Edworthy      2019-02-28  250  	/* Optional interface clock */
c62ebb3d5f0d0e Phil Edworthy      2019-02-28  251  	dev->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
71dc297ca9ab63 Andy Shevchenko    2019-08-19  252  	if (IS_ERR(dev->pclk)) {
71dc297ca9ab63 Andy Shevchenko    2019-08-19  253  		ret = PTR_ERR(dev->pclk);
71dc297ca9ab63 Andy Shevchenko    2019-08-19  254  		goto exit_reset;
71dc297ca9ab63 Andy Shevchenko    2019-08-19  255  	}
c62ebb3d5f0d0e Phil Edworthy      2019-02-28  256  
27071b5cbca59d Serge Semin        2022-06-10  257  	dev->clk = devm_clk_get_optional(&pdev->dev, NULL);
27071b5cbca59d Serge Semin        2022-06-10  258  	if (IS_ERR(dev->clk)) {
27071b5cbca59d Serge Semin        2022-06-10  259  		ret = PTR_ERR(dev->clk);
27071b5cbca59d Serge Semin        2022-06-10  260  		goto exit_reset;
27071b5cbca59d Serge Semin        2022-06-10  261  	}
27071b5cbca59d Serge Semin        2022-06-10  262  
27071b5cbca59d Serge Semin        2022-06-10  263  	ret = i2c_dw_prepare_clk(dev, true);
27071b5cbca59d Serge Semin        2022-06-10  264  	if (ret)
27071b5cbca59d Serge Semin        2022-06-10  265  		goto exit_reset;
27071b5cbca59d Serge Semin        2022-06-10  266  
27071b5cbca59d Serge Semin        2022-06-10  267  	if (dev->clk) {
82e495069926e7 Andy Shevchenko    2024-08-22  268  		struct i2c_timings *t = &dev->timings;
e3ea52b578be22 Andy Shevchenko    2018-07-25  269  		u64 clk_khz;
e3ea52b578be22 Andy Shevchenko    2018-07-25  270  
925ddb240d6c76 Mika Westerberg    2014-09-30  271  		dev->get_clk_rate_khz = i2c_dw_get_clk_rate_khz;
e3ea52b578be22 Andy Shevchenko    2018-07-25  272  		clk_khz = dev->get_clk_rate_khz(dev);
925ddb240d6c76 Mika Westerberg    2014-09-30  273  
e3ea52b578be22 Andy Shevchenko    2018-07-25  274  		if (!dev->sda_hold_time && t->sda_hold_ns)
e3ea52b578be22 Andy Shevchenko    2018-07-25  275  			dev->sda_hold_time =
c045214a0f31dd Andy Shevchenko    2021-07-12  276  				DIV_S64_ROUND_CLOSEST(clk_khz * t->sda_hold_ns, MICRO);
925ddb240d6c76 Mika Westerberg    2014-09-30  277  	}
925ddb240d6c76 Mika Westerberg    2014-09-30  278  
2373f6b9744d53 Dirk Brandewie     2011-10-29  279  	adap = &dev->adapter;
2373f6b9744d53 Dirk Brandewie     2011-10-29  280  	adap->owner = THIS_MODULE;
db2a8b6f1df93d Ricardo Ribalda    2020-07-02  281  	adap->class = dmi_check_system(dw_i2c_hwmon_class_dmi) ?
db2a8b6f1df93d Ricardo Ribalda    2020-07-02  282  					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
8eb5c87a92c065 Dustin Byford      2015-10-23  283  	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
af71100c7acf3c Rob Herring        2011-11-08  284  	adap->dev.of_node = pdev->dev.of_node;
77f3381a83c2f6 Hans de Goede      2019-03-12  285  	adap->nr = -1;
2373f6b9744d53 Dirk Brandewie     2011-10-29  286  
d79294d0de12dd Hans de Goede      2020-04-07  287  	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
d79294d0de12dd Hans de Goede      2020-04-07  288  		dev_pm_set_driver_flags(&pdev->dev,
75507a319876ab Richard Fitzgerald 2022-12-19  289  					DPM_FLAG_SMART_PREPARE);
d79294d0de12dd Hans de Goede      2020-04-07  290  	} else {
02e45646d53bdb Rafael J. Wysocki  2018-01-03  291  		dev_pm_set_driver_flags(&pdev->dev,
02e45646d53bdb Rafael J. Wysocki  2018-01-03  292  					DPM_FLAG_SMART_PREPARE |
75507a319876ab Richard Fitzgerald 2022-12-19  293  					DPM_FLAG_SMART_SUSPEND);
d79294d0de12dd Hans de Goede      2020-04-07  294  	}
422cb781e0d0f8 Rafael J. Wysocki  2018-01-03  295  
7c5b3c158b38dc Rajat Jain         2021-10-25  296  	device_enable_async_suspend(&pdev->dev);
7c5b3c158b38dc Rajat Jain         2021-10-25  297  
126dbc6b49c867 Rafael J. Wysocki  2017-09-25  298  	/* The code below assumes runtime PM to be disabled. */
126dbc6b49c867 Rafael J. Wysocki  2017-09-25  299  	WARN_ON(pm_runtime_enabled(&pdev->dev));
126dbc6b49c867 Rafael J. Wysocki  2017-09-25  300  
43452335224bc0 Mika Westerberg    2013-04-10  301  	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
43452335224bc0 Mika Westerberg    2013-04-10  302  	pm_runtime_use_autosuspend(&pdev->dev);
7272194ed391f9 Mika Westerberg    2013-01-17  303  	pm_runtime_set_active(&pdev->dev);
126dbc6b49c867 Rafael J. Wysocki  2017-09-25  304  
9cbeeca05049b1 Hans de Goede      2018-09-05  305  	if (dev->shared_with_punit)
126dbc6b49c867 Rafael J. Wysocki  2017-09-25  306  		pm_runtime_get_noresume(&pdev->dev);
126dbc6b49c867 Rafael J. Wysocki  2017-09-25  307  
7272194ed391f9 Mika Westerberg    2013-01-17  308  	pm_runtime_enable(&pdev->dev);
7272194ed391f9 Mika Westerberg    2013-01-17  309  
e393f674c5fedc Luis Oliveira      2017-06-14  310  	ret = i2c_dw_probe(dev);
e393f674c5fedc Luis Oliveira      2017-06-14  311  	if (ret)
ab809fd81fde3d Zhangfei Gao       2016-12-27  312  		goto exit_probe;
ab809fd81fde3d Zhangfei Gao       2016-12-27  313  
e393f674c5fedc Luis Oliveira      2017-06-14  314  	return ret;
36d48fb5766aee Wolfram Sang       2015-10-09  315  
ab809fd81fde3d Zhangfei Gao       2016-12-27  316  exit_probe:
126dbc6b49c867 Rafael J. Wysocki  2017-09-25  317  	dw_i2c_plat_pm_cleanup(dev);
ab809fd81fde3d Zhangfei Gao       2016-12-27  318  exit_reset:
ab809fd81fde3d Zhangfei Gao       2016-12-27  319  	reset_control_assert(dev->rst);
e393f674c5fedc Luis Oliveira      2017-06-14  320  	return ret;
2373f6b9744d53 Dirk Brandewie     2011-10-29  321  }
2373f6b9744d53 Dirk Brandewie     2011-10-29  322  
e190a0c389e601 Uwe Kleine-König   2023-05-08  323  static void dw_i2c_plat_remove(struct platform_device *pdev)
2373f6b9744d53 Dirk Brandewie     2011-10-29  324  {
2373f6b9744d53 Dirk Brandewie     2011-10-29  325  	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
2373f6b9744d53 Dirk Brandewie     2011-10-29  326  
7272194ed391f9 Mika Westerberg    2013-01-17  327  	pm_runtime_get_sync(&pdev->dev);
7272194ed391f9 Mika Westerberg    2013-01-17  328  
2373f6b9744d53 Dirk Brandewie     2011-10-29  329  	i2c_del_adapter(&dev->adapter);
2373f6b9744d53 Dirk Brandewie     2011-10-29  330  
45438d5d5e973d Andy Shevchenko    2024-08-22  331  	i2c_dw_disable(dev);
2373f6b9744d53 Dirk Brandewie     2011-10-29  332  
edfc39012364a6 Mika Westerberg    2015-06-17  333  	pm_runtime_dont_use_autosuspend(&pdev->dev);
edfc39012364a6 Mika Westerberg    2015-06-17  334  	pm_runtime_put_sync(&pdev->dev);
126dbc6b49c867 Rafael J. Wysocki  2017-09-25  335  	dw_i2c_plat_pm_cleanup(dev);
126dbc6b49c867 Rafael J. Wysocki  2017-09-25  336  
78d5e9e299e31b Jan Dabros         2022-02-08  337  	i2c_dw_remove_lock_support(dev);
78d5e9e299e31b Jan Dabros         2022-02-08  338  
ab809fd81fde3d Zhangfei Gao       2016-12-27  339  	reset_control_assert(dev->rst);
2373f6b9744d53 Dirk Brandewie     2011-10-29  340  }
2373f6b9744d53 Dirk Brandewie     2011-10-29  341  
6ad6fde3970c98 Jarkko Nikula      2015-08-31  342  static int dw_i2c_plat_prepare(struct device *dev)
8503ff16650427 Jisheng Zhang      2015-05-20  343  {
422cb781e0d0f8 Rafael J. Wysocki  2018-01-03  344  	/*
422cb781e0d0f8 Rafael J. Wysocki  2018-01-03  345  	 * If the ACPI companion device object is present for this device, it
422cb781e0d0f8 Rafael J. Wysocki  2018-01-03  346  	 * may be accessed during suspend and resume of other devices via I2C
422cb781e0d0f8 Rafael J. Wysocki  2018-01-03  347  	 * operation regions, so tell the PM core and middle layers to avoid
422cb781e0d0f8 Rafael J. Wysocki  2018-01-03  348  	 * skipping system suspend/resume callbacks for it in that case.
422cb781e0d0f8 Rafael J. Wysocki  2018-01-03  349  	 */
422cb781e0d0f8 Rafael J. Wysocki  2018-01-03  350  	return !has_acpi_companion(dev);
8503ff16650427 Jisheng Zhang      2015-05-20  351  }
8503ff16650427 Jisheng Zhang      2015-05-20  352  
c57813b8b288dc Hans de Goede      2022-02-23  353  static int dw_i2c_plat_runtime_suspend(struct device *dev)
3bf3b289c233c2 Deepak Sikri       2012-02-24  354  {
9242e72aaea05c Masahiro Yamada    2017-07-28  355  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
3bf3b289c233c2 Deepak Sikri       2012-02-24  356  
9cbeeca05049b1 Hans de Goede      2018-09-05  357  	if (i_dev->shared_with_punit)
9d9a152ebaa86a Hans de Goede      2018-08-29  358  		return 0;
9d9a152ebaa86a Hans de Goede      2018-08-29  359  
45438d5d5e973d Andy Shevchenko    2024-08-22 @360  	i2c_dw_disable(i_dev);
0326f9f801b241 Phil Reid          2017-11-02 @361  	i2c_dw_prepare_clk(i_dev, false);
3bf3b289c233c2 Deepak Sikri       2012-02-24  362  
3bf3b289c233c2 Deepak Sikri       2012-02-24  363  	return 0;
3bf3b289c233c2 Deepak Sikri       2012-02-24  364  }
3bf3b289c233c2 Deepak Sikri       2012-02-24  365  
a9e4d8b641bc6c Paul Cercueil      2023-07-22  366  static int dw_i2c_plat_suspend(struct device *dev)
c57813b8b288dc Hans de Goede      2022-02-23  367  {
c57813b8b288dc Hans de Goede      2022-02-23  368  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
c57813b8b288dc Hans de Goede      2022-02-23  369  
80704a84a9f827 Hans de Goede      2022-02-23  370  	i2c_mark_adapter_suspended(&i_dev->adapter);
c57813b8b288dc Hans de Goede      2022-02-23  371  
c57813b8b288dc Hans de Goede      2022-02-23  372  	return dw_i2c_plat_runtime_suspend(dev);
c57813b8b288dc Hans de Goede      2022-02-23  373  }
c57813b8b288dc Hans de Goede      2022-02-23  374  
c57813b8b288dc Hans de Goede      2022-02-23  375  static int dw_i2c_plat_runtime_resume(struct device *dev)
3bf3b289c233c2 Deepak Sikri       2012-02-24  376  {
9242e72aaea05c Masahiro Yamada    2017-07-28  377  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
3bf3b289c233c2 Deepak Sikri       2012-02-24  378  
9cbeeca05049b1 Hans de Goede      2018-09-05  379  	if (!i_dev->shared_with_punit)
0326f9f801b241 Phil Reid          2017-11-02 @380  		i2c_dw_prepare_clk(i_dev, true);
9d9a152ebaa86a Hans de Goede      2018-08-29  381  
541527728341b4 Rafael J. Wysocki  2017-09-25  382  	i_dev->init(i_dev);
c57813b8b288dc Hans de Goede      2022-02-23  383  
c57813b8b288dc Hans de Goede      2022-02-23  384  	return 0;
c57813b8b288dc Hans de Goede      2022-02-23  385  }
c57813b8b288dc Hans de Goede      2022-02-23  386  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


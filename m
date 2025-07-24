Return-Path: <linux-i2c+bounces-12028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6600CB11084
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 19:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49761AC0B32
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 17:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64912EBB9B;
	Thu, 24 Jul 2025 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/s3NRoj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECAA29ACC3;
	Thu, 24 Jul 2025 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753379577; cv=none; b=dP053r46xHWsHkEqtYlnYVKzbts72rJTV9fZ4Y7iBq3VugFrkW+CthRQTHdiZ3J4sp92GMZJVJACSa26H8ojx5utj2Qhsx81M62RzNpyx6g6etf40UqU1giIFCyUGxgWSM+xLVVXuoMZCLpmyfPFCz6cZaRtpB9Xv3UX0l4GH/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753379577; c=relaxed/simple;
	bh=gxDP/x72vErdUhHDu7ZYb3KxsYEkC9jJpG8VMxaDJ/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOzcnKpzGKhqVypXx3T+/cQt1X0ScyGE3KbaEbSkmb9NU/iGlZe+5e4v8LT+fFNTMYsXrOlDcvD5qI9Nng9yHXKx3iQe3giTm/QdlIwbrCBJzh+N/Fm3CCcukznU7Y7DIr9Xw4Gt7c3sQgAmXQGf7MpbBfPA/87aK5wkKQPiIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/s3NRoj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753379574; x=1784915574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gxDP/x72vErdUhHDu7ZYb3KxsYEkC9jJpG8VMxaDJ/0=;
  b=K/s3NRojgbP8hqXyfqQwDzYWLuG/aQ0/DrPmbbQeJGXdqZXm5IdfRHEr
   dX4qyuiEadd5LBfGSByOVJR59jxWs7QeiMxAZFJ6G8AoUOXhae+ExxFqF
   eftG+jZA3pEqprFUeKWUwEfDR2Lf4AO5y3Me1jNwpgKimcTM3/y5P+fK9
   Tg6nbo2mR1sMFhgmSYfcfxL4KqhDsxLt0KgczzlMrkgFnUJp6dVL4zP55
   R7ODQW/LPmF8AWVSsQRiEGz4T6G2Rny3zW5268CNS027KBWPQVozyhNfy
   u+lTX4PGtT2TLzvg2W6a4qk7NOR0NxCVZioOVmfiY3aODSrzL/oXia/hO
   Q==;
X-CSE-ConnectionGUID: zACTvptrT06WTR0atjdmhg==
X-CSE-MsgGUID: KLg3zQ6eSbWK51WfuiMMBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59513949"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="59513949"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 10:52:54 -0700
X-CSE-ConnectionGUID: v0GAKouXT6Wjl/qSpXusPg==
X-CSE-MsgGUID: /mxl6SAJSDW+5F9O94puxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="184052772"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jul 2025 10:52:51 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf07d-000Khb-01;
	Thu, 24 Jul 2025 17:52:49 +0000
Date: Fri, 25 Jul 2025 01:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ajay Neeli <ajay.neeli@amd.com>, git@amd.com, andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	michal.simek@amd.com, srinivas.goud@amd.com,
	radhey.shyam.pandey@amd.com, Ajay Neeli <ajay.neeli@amd.com>
Subject: Re: [PATCH v2] i2c: cadence: Add shutdown handler
Message-ID: <202507250134.05RWuclB-lkp@intel.com>
References: <20250724051243.22051-1-ajay.neeli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724051243.22051-1-ajay.neeli@amd.com>

Hi Ajay,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on soc/for-next linus/master v6.16-rc7 next-20250724]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ajay-Neeli/i2c-cadence-Add-shutdown-handler/20250724-131658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250724051243.22051-1-ajay.neeli%40amd.com
patch subject: [PATCH v2] i2c: cadence: Add shutdown handler
config: x86_64-buildonly-randconfig-002-20250724 (https://download.01.org/0day-ci/archive/20250725/202507250134.05RWuclB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250134.05RWuclB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250134.05RWuclB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-cadence.c:1608:53: error: use of undeclared identifier 'irq'
    1608 |                  id->i2c_clk / 1000, (unsigned long)r_mem->start, irq);
         |                                                                   ^
   1 error generated.


vim +/irq +1608 drivers/i2c/busses/i2c-cadence.c

ba064873ce5d19 Lars-Peter Clausen   2023-03-17  1485  
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1486  /**
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1487   * cdns_i2c_probe - Platform registration call
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1488   * @pdev:	Handle to the platform device structure
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1489   *
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1490   * This function does all the memory allocation and registration for the i2c
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1491   * device. User can modify the address mode to 10 bit address mode using the
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1492   * ioctl call with option I2C_TENBIT.
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1493   *
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1494   * Return: 0 on success, negative error otherwise
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1495   */
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1496  static int cdns_i2c_probe(struct platform_device *pdev)
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1497  {
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1498  	struct resource *r_mem;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1499  	struct cdns_i2c *id;
a11a46d7bd0877 Ajay Neeli           2025-07-24  1500  	int ret;
63cab195bf4986 Anurag Kumar Vulisha 2015-07-10  1501  	const struct of_device_id *match;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1502  
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1503  	id = devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1504  	if (!id)
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1505  		return -ENOMEM;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1506  
7fa32329ca0314 Shubhrajyoti Datta   2015-11-24  1507  	id->dev = &pdev->dev;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1508  	platform_set_drvdata(pdev, id);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1509  
63cab195bf4986 Anurag Kumar Vulisha 2015-07-10  1510  	match = of_match_node(cdns_i2c_of_match, pdev->dev.of_node);
63cab195bf4986 Anurag Kumar Vulisha 2015-07-10  1511  	if (match && match->data) {
63cab195bf4986 Anurag Kumar Vulisha 2015-07-10  1512  		const struct cdns_platform_data *data = match->data;
63cab195bf4986 Anurag Kumar Vulisha 2015-07-10  1513  		id->quirks = data->quirks;
63cab195bf4986 Anurag Kumar Vulisha 2015-07-10  1514  	}
63cab195bf4986 Anurag Kumar Vulisha 2015-07-10  1515  
58b924241d0a23 Shubhrajyoti Datta   2022-07-28  1516  	id->rinfo.pinctrl = devm_pinctrl_get(&pdev->dev);
58b924241d0a23 Shubhrajyoti Datta   2022-07-28  1517  	if (IS_ERR(id->rinfo.pinctrl)) {
8bfd4ec726945c Carsten Haitzler     2022-11-28  1518  		int err = PTR_ERR(id->rinfo.pinctrl);
8bfd4ec726945c Carsten Haitzler     2022-11-28  1519  
58b924241d0a23 Shubhrajyoti Datta   2022-07-28  1520  		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
8bfd4ec726945c Carsten Haitzler     2022-11-28  1521  		if (err != -ENODEV)
8bfd4ec726945c Carsten Haitzler     2022-11-28  1522  			return err;
8bfd4ec726945c Carsten Haitzler     2022-11-28  1523  	} else {
8bfd4ec726945c Carsten Haitzler     2022-11-28  1524  		id->adap.bus_recovery_info = &id->rinfo;
58b924241d0a23 Shubhrajyoti Datta   2022-07-28  1525  	}
58b924241d0a23 Shubhrajyoti Datta   2022-07-28  1526  
c02fb2b8067a4b Dejin Zheng          2020-04-14  1527  	id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1528  	if (IS_ERR(id->membase))
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1529  		return PTR_ERR(id->membase);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1530  
a11a46d7bd0877 Ajay Neeli           2025-07-24  1531  	id->irq = platform_get_irq(pdev, 0);
a11a46d7bd0877 Ajay Neeli           2025-07-24  1532  	if (id->irq < 0)
a11a46d7bd0877 Ajay Neeli           2025-07-24  1533  		return id->irq;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1534  
a1f64317bbf5fe Masahiro Yamada      2015-07-21  1535  	id->adap.owner = THIS_MODULE;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1536  	id->adap.dev.of_node = pdev->dev.of_node;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1537  	id->adap.algo = &cdns_i2c_algo;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1538  	id->adap.timeout = CDNS_I2C_TIMEOUT;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1539  	id->adap.retries = 3;		/* Default retry value. */
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1540  	id->adap.algo_data = id;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1541  	id->adap.dev.parent = &pdev->dev;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1542  	init_completion(&id->xfer_done);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1543  	snprintf(id->adap.name, sizeof(id->adap.name),
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1544  		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1545  
3d36dd1161ca31 Michal Simek         2025-02-06  1546  	id->clk = devm_clk_get_enabled(&pdev->dev, NULL);
2d1a83a4f36f1a Krzysztof Kozlowski  2020-09-02  1547  	if (IS_ERR(id->clk))
2d1a83a4f36f1a Krzysztof Kozlowski  2020-09-02  1548  		return dev_err_probe(&pdev->dev, PTR_ERR(id->clk),
2d1a83a4f36f1a Krzysztof Kozlowski  2020-09-02  1549  				     "input clock not found.\n");
2d1a83a4f36f1a Krzysztof Kozlowski  2020-09-02  1550  
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1551  	id->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1552  	if (IS_ERR(id->reset))
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1553  		return dev_err_probe(&pdev->dev, PTR_ERR(id->reset),
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1554  				     "Failed to request reset.\n");
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1555  
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1556  	ret = reset_control_deassert(id->reset);
3d36dd1161ca31 Michal Simek         2025-02-06  1557  	if (ret)
3d36dd1161ca31 Michal Simek         2025-02-06  1558  		return dev_err_probe(&pdev->dev, ret,
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1559  				     "Failed to de-assert reset.\n");
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1560  
7fa32329ca0314 Shubhrajyoti Datta   2015-11-24  1561  	pm_runtime_set_autosuspend_delay(id->dev, CNDS_I2C_PM_TIMEOUT);
7fa32329ca0314 Shubhrajyoti Datta   2015-11-24  1562  	pm_runtime_use_autosuspend(id->dev);
7fa32329ca0314 Shubhrajyoti Datta   2015-11-24  1563  	pm_runtime_set_active(id->dev);
db3fad841d9bf5 Topi Kuutela         2019-12-09  1564  	pm_runtime_enable(id->dev);
7fa32329ca0314 Shubhrajyoti Datta   2015-11-24  1565  
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1566  	id->clk_rate_change_nb.notifier_call = cdns_i2c_clk_notifier_cb;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1567  	if (clk_notifier_register(id->clk, &id->clk_rate_change_nb))
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1568  		dev_warn(&pdev->dev, "Unable to register clock notifier.\n");
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1569  	id->input_clk = clk_get_rate(id->clk);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1570  
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1571  	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1572  			&id->i2c_clk);
90224e6468e15d Andy Shevchenko      2020-03-24  1573  	if (ret || (id->i2c_clk > I2C_MAX_FAST_MODE_FREQ))
90224e6468e15d Andy Shevchenko      2020-03-24  1574  		id->i2c_clk = I2C_MAX_STANDARD_MODE_FREQ;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1575  
1a351b10b9671f Radu Pirea           2020-01-06  1576  #if IS_ENABLED(CONFIG_I2C_SLAVE)
1a351b10b9671f Radu Pirea           2020-01-06  1577  	/* Set initial mode to master */
1a351b10b9671f Radu Pirea           2020-01-06  1578  	id->dev_mode = CDNS_I2C_MODE_MASTER;
1a351b10b9671f Radu Pirea           2020-01-06  1579  	id->slave_state = CDNS_I2C_SLAVE_STATE_IDLE;
1a351b10b9671f Radu Pirea           2020-01-06  1580  #endif
8b51a8e64443b9 Shubhrajyoti Datta   2021-07-13  1581  	id->ctrl_reg = CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1582  
a069fcd9fa1822 Lars-Peter Clausen   2023-03-17  1583  	id->fifo_depth = CDNS_I2C_FIFO_DEPTH_DEFAULT;
a069fcd9fa1822 Lars-Peter Clausen   2023-03-17  1584  	of_property_read_u32(pdev->dev.of_node, "fifo-depth", &id->fifo_depth);
a069fcd9fa1822 Lars-Peter Clausen   2023-03-17  1585  
ba064873ce5d19 Lars-Peter Clausen   2023-03-17  1586  	cdns_i2c_detect_transfer_size(id);
ba064873ce5d19 Lars-Peter Clausen   2023-03-17  1587  
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1588  	ret = cdns_i2c_setclk(id->input_clk, id);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1589  	if (ret) {
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1590  		dev_err(&pdev->dev, "invalid SCL clock: %u Hz\n", id->i2c_clk);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1591  		ret = -EINVAL;
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1592  		goto err_clk_notifier_unregister;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1593  	}
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1594  
a11a46d7bd0877 Ajay Neeli           2025-07-24  1595  	ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1596  				 DRIVER_NAME, id);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1597  	if (ret) {
a11a46d7bd0877 Ajay Neeli           2025-07-24  1598  		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1599  		goto err_clk_notifier_unregister;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1600  	}
8b51a8e64443b9 Shubhrajyoti Datta   2021-07-13  1601  	cdns_i2c_init(id);
681d15a0f527af Vishnu Motghare      2014-12-03  1602  
0e1929dedea367 Mike Looijmans       2017-01-16  1603  	ret = i2c_add_adapter(&id->adap);
0e1929dedea367 Mike Looijmans       2017-01-16  1604  	if (ret < 0)
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1605  		goto err_clk_notifier_unregister;
0e1929dedea367 Mike Looijmans       2017-01-16  1606  
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1607  	dev_info(&pdev->dev, "%u kHz mmio %08lx irq %d\n",
2264997254ca11 Lars-Peter Clausen   2023-01-07 @1608  		 id->i2c_clk / 1000, (unsigned long)r_mem->start, irq);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1609  
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1610  	return 0;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1611  
0cbc9a2c62d267 Lars-Peter Clausen   2023-04-06  1612  err_clk_notifier_unregister:
3501f0c6630635 Satish Nagireddy     2022-06-28  1613  	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
7fa32329ca0314 Shubhrajyoti Datta   2015-11-24  1614  	pm_runtime_disable(&pdev->dev);
db3fad841d9bf5 Topi Kuutela         2019-12-09  1615  	pm_runtime_set_suspended(&pdev->dev);
61b804548e1744 Manikanta Guntupalli 2025-02-06  1616  	reset_control_assert(id->reset);
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1617  	return ret;
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1618  }
df8eb5691c48d3 Soren Brinkmann      2014-04-04  1619  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


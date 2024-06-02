Return-Path: <linux-i2c+bounces-3746-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A07BF8D786A
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 23:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD8001C20AF3
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 21:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6F729401;
	Sun,  2 Jun 2024 21:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezKe8PrV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049CA1CD3D
	for <linux-i2c@vger.kernel.org>; Sun,  2 Jun 2024 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717364536; cv=none; b=dXdkq8CxsFNeFdz9N0alXeoRoir8sSieFmsVzrZPKRpiprtgQVQgvNSEw1JGggQvWpnVfF8zbJcacKhacELg3l3i6pedUD0roymstA45ePHFc0pkRrEt+JMgqmgsl5aabKvCTJZ57z4+9TyLsGcuwM4KCYFlF2MK0HeKQkiEDK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717364536; c=relaxed/simple;
	bh=hbJ3wHkhQ3tuqihB4rH0Z9XdKGCZ4cSlWhBPz44nwic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l17UjJmTn9dhRzxswYkGWYcdbQs4pyCKVKaYovJsD8zWAzjUK6deeW/S2Tz/kamOUFCYoqcTuW7XJkdHiUwLLUFTNmibfjinhmbwY9AVJ4IkaeqT2IvetHX3aQ6t1aXCN+hAjQXUyjTm7/3n2nanVj+RCMi7WMkMYKzdcyJzIFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezKe8PrV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717364535; x=1748900535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hbJ3wHkhQ3tuqihB4rH0Z9XdKGCZ4cSlWhBPz44nwic=;
  b=ezKe8PrVcYIvNj9r0XR1z2UQ8aqFbixbY2TyJQmQ2qoGu4VB9K6pzLay
   uqe7N6MAY3vKjQ2dRPTegmLOg/wdUihUmN40f3UWO6WjilIKasrLgwWqA
   XN2+bwW97bogd/vJ5fVzeqlmoPdKJzSRTJMvEjDceyGZirUvsf+GOZich
   FxA9hTQVMfMPFyIQch+M1h5PQlIamRVcR4jVYNgIOqzRBNntAwK0fIq2u
   kOUpGu+tsV6snRAtl9KTxwV2jhpOfqDkoMvJi/8fkQivHnSygyoO0NA46
   1EY4uwl2XuStcBSs4492LomLpvG7Xe6Z32QKBckQE/eRO1i2g8m/kfQ3z
   g==;
X-CSE-ConnectionGUID: Y5BPmw+hSyq6TJ7oAc0D9A==
X-CSE-MsgGUID: Zm34dk+eSn+lmYncWt8s6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="31385257"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="31385257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 14:42:14 -0700
X-CSE-ConnectionGUID: 5WdJsbmoTRC05FwxbSZrlw==
X-CSE-MsgGUID: 47x1voyoSPKd0eI/NYYQcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="67539307"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Jun 2024 14:42:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDsxu-000KUj-0P;
	Sun, 02 Jun 2024 21:42:10 +0000
Date: Mon, 3 Jun 2024 05:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <gerhard@engleder-embedded.com>,
	linux-i2c@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andi.shyti@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: Re: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
Message-ID: <202406030504.QcIr6Qaw-lkp@intel.com>
References: <20240601192846.68146-2-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601192846.68146-2-gerhard@engleder-embedded.com>

Hi Gerhard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gerhard-Engleder/i2c-keba-Add-KEBA-I2C-controller-support/20240602-040548
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240601192846.68146-2-gerhard%40engleder-embedded.com
patch subject: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
config: s390-randconfig-r062-20240603 (https://download.01.org/0day-ci/archive/20240603/202406030504.QcIr6Qaw-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406030504.QcIr6Qaw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-keba.c:491:14-15: WARNING comparing pointer to 0

vim +491 drivers/i2c/busses/i2c-keba.c

   480	
   481	static int ki2c_probe(struct platform_device *pdev)
   482	{
   483		struct i2c_keba_platform_data *pdata;
   484		struct device *dev = &pdev->dev;
   485		struct i2c_adapter *adap;
   486		struct resource *io;
   487		struct ki2c *ki2c;
   488		int ret;
   489	
   490		pdata = dev->platform_data;
 > 491		if (pdata == 0) {
   492			dev_err(dev, "Platform data not found!\n");
   493			return -ENODEV;
   494		}
   495	
   496		ki2c = devm_kzalloc(dev, sizeof(*ki2c), GFP_KERNEL);
   497		if (!ki2c)
   498			return -ENOMEM;
   499		ki2c->pdev = pdev;
   500		ki2c->client = devm_kcalloc(dev, pdata->info_size,
   501					    sizeof(*ki2c->client), GFP_KERNEL);
   502		if (!ki2c->client)
   503			return -ENOMEM;
   504		ki2c->client_size = pdata->info_size;
   505		platform_set_drvdata(pdev, ki2c);
   506	
   507		io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   508		ki2c->base = devm_ioremap_resource(dev, io);
   509		if (IS_ERR(ki2c->base))
   510			return PTR_ERR(ki2c->base);
   511	
   512		/* enable controller */
   513		iowrite8(KI2C_CONTROL_MEN, ki2c->base + KI2C_CONTROL_REG);
   514	
   515		adap = &ki2c->adapter;
   516		strscpy(adap->name, "KEBA I2C adapter", sizeof(adap->name));
   517		adap->owner = THIS_MODULE;
   518		adap->class = I2C_CLASS_HWMON;
   519		adap->algo = &ki2c_algo;
   520		adap->dev.parent = dev;
   521	
   522		i2c_set_adapdata(adap, ki2c);
   523	
   524		/* reset bus before probing I2C devices */
   525		ret = ki2c_reset_bus(ki2c);
   526		if (ret) {
   527			dev_err(dev, "Failed to reset bus (%d)!\n", ret);
   528			goto out_disable;
   529		}
   530	
   531		ret = i2c_add_adapter(adap);
   532		if (ret) {
   533			dev_err(dev, "Failed to add adapter (%d)!\n", ret);
   534			goto out_disable;
   535		}
   536	
   537		ret = ki2c_register_devices(ki2c, pdata);
   538		if (ret) {
   539			dev_err(dev, "Failed to register devices (%d)!\n", ret);
   540			goto out_delete;
   541		}
   542	
   543		return 0;
   544	
   545	out_delete:
   546		i2c_del_adapter(adap);
   547	out_disable:
   548		iowrite8(0, ki2c->base + KI2C_CONTROL_REG);
   549		return ret;
   550	}
   551	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


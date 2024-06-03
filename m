Return-Path: <linux-i2c+bounces-3759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5400D8FA628
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 01:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C641A1F23345
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 23:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20C9839F7;
	Mon,  3 Jun 2024 23:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbHR5k/g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E5B13D26A
	for <linux-i2c@vger.kernel.org>; Mon,  3 Jun 2024 23:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717455768; cv=none; b=hQgWbHknFzCoEkrST+j0DpoqiYLh9MAId2AUQx2YzQ16nFNnrqWbxYqVBRNDMwTuFhM1k3FMIxLJHEeQygAIwZPiv8zFts/gcJtOFUlgpymFqypX3gvJCDZqIMEpQiHA981bSiRpK0KJ1KDg1zUU2Zd+LZ4IfudvWI0LNHN5InU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717455768; c=relaxed/simple;
	bh=ogo9QjShsjI5pHCxr9mp3cKkK6L/QeUcMCAYliuKlyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pl8FBnwkjdmFDM0EwAO8IZkOV+cx0yh9V9Hj2wUboq3XBPTdApj//E/bcITPAvtd1Jl0NL9MEMhXdtSzlUVcH6PpEjS8twD8z1/MStjz3QvCqf/xgmAYdSHhLSzVLJeu/yPaiZAJYS5GZHAOqtwtYzfahi8RWbcwBZIopaQtyx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbHR5k/g; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717455767; x=1748991767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ogo9QjShsjI5pHCxr9mp3cKkK6L/QeUcMCAYliuKlyQ=;
  b=WbHR5k/gj2+zAFHondDfO3IymmTXBrRdO8dnTcDDMhh7DYJPDnEsL8dK
   6XwV7PFexhOsYJWTD2Jfk8FviSjXIEjrddiqsiWIvEyL3a7xIugEDXj/g
   jfrIYJFcxcolId0Plv3BWjhfJ0iJ+O7iYD23bTKBUqo7oiPQPSG8DGrLo
   zWGzayOjB0MG0pfSnxQToCh1aJtYqka2Kn22prJwob7wBY9OdmwRzE0DM
   Z/3ACHFVQRAaZePSjGz15JdBx9rDGc8f63YzEXM9urCGwgE73Vq51xl0X
   V1eJSwFVNhcMS/sxJPGmVJT6Lot9tckVAExP7QZXMc2kR007UrqcwKKm2
   g==;
X-CSE-ConnectionGUID: heqgggUgS4CiHbxDNUmcGw==
X-CSE-MsgGUID: ABc+e5TWQWuJyHbN10x3eA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14159503"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="14159503"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 16:02:46 -0700
X-CSE-ConnectionGUID: m7nRgeOtSo25PaIr1MtVkQ==
X-CSE-MsgGUID: AGZZqO7YTuGeFSgqc72e5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="42098261"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Jun 2024 16:02:44 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEGhN-000MIl-2y;
	Mon, 03 Jun 2024 23:02:41 +0000
Date: Tue, 4 Jun 2024 07:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <gerhard@engleder-embedded.com>,
	linux-i2c@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andi.shyti@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: Re: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
Message-ID: <202406040659.nZr6W80c-lkp@intel.com>
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
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.10-rc2 next-20240603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gerhard-Engleder/i2c-keba-Add-KEBA-I2C-controller-support/20240602-040548
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240601192846.68146-2-gerhard%40engleder-embedded.com
patch subject: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
config: csky-randconfig-r121-20240604 (https://download.01.org/0day-ci/archive/20240604/202406040659.nZr6W80c-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240604/202406040659.nZr6W80c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040659.nZr6W80c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-keba.c:491:22: sparse: sparse: Using plain integer as NULL pointer
   drivers/i2c/busses/i2c-keba.c:563:36: sparse: sparse: Using plain integer as NULL pointer

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


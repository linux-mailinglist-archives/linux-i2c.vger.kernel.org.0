Return-Path: <linux-i2c+bounces-3747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD48D792B
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 01:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F352D1C21136
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 23:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE947604F;
	Sun,  2 Jun 2024 23:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kult4cIO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FAD40C03
	for <linux-i2c@vger.kernel.org>; Sun,  2 Jun 2024 23:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717371512; cv=none; b=JOBEfpd4XggZxZpkOO14zhoHdC8/bXD0fi6xd6r8gh9NsJPeFiQpP74XpIijHo52724rLaQFNUdscZqzFeSHQAeBiItK8dxGh872GxgPPNNRomdfyKzmH1M4mh6peDAu6OYhuTW2B9TTjUVhlfh62hlWuo8bsxKYjOua9phOIe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717371512; c=relaxed/simple;
	bh=4MtAT1o0nKrS2OzJfprlpggFmSlKwNlDKr3BNA3Wh3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUpMfvt9dSg3YHSnpTHDnxbUViZaz4R9vpdnFrZduldQ//sxU1GpFJ8CAxhJgn+6KLqT51AQMpETmn4WamzX28o0GFynmeuT1x3Lj7icqaeW8pCbkd1jmfy6OSODsmb8f6KCj2NXmvMHZJtFLOdKrowEwiKolyCNtybAq82xHeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kult4cIO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717371511; x=1748907511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4MtAT1o0nKrS2OzJfprlpggFmSlKwNlDKr3BNA3Wh3U=;
  b=kult4cIOpRw0DgR66SLzNBkSWIgKfTKg2wlSuZA/olx+f3bD/jFjDd6i
   o7yoOFdGoSJhQ0QrPhULkQvGEU66qM4zRQ0gibFwLk8erhsfvstr1+9WZ
   blUMiLF3s8fBn53qRyZ+6rcqtEmnlOI0/rKvWjQoVFSGzPNbVkwEBVFZ2
   8jQdizpnXBeNJ2o+S2GZD7Qdue0jsinxLH5aURExBr31VRqIx/mNHXznj
   TMj0qsmOeDy2OlNuiDz0ElyqMqkA6zMIyBnYmGRhSmY7/tvOpD2fb5dLz
   M+6ppsEuZeosGYtZEWdWD4Joc5CK3Y0eavl0cSC8mgD20g9oGnXARUUvX
   Q==;
X-CSE-ConnectionGUID: P5+hKY6FTf2lbbFvaGA4gg==
X-CSE-MsgGUID: JQewiRFOROKVo7j69dqZsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14043630"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="14043630"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 16:38:30 -0700
X-CSE-ConnectionGUID: uTZhKBUrQ824olPugbPXYg==
X-CSE-MsgGUID: qrL2scdoQwuMVrVYrDM3rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="74198364"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Jun 2024 16:38:28 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDumP-000KZF-2r;
	Sun, 02 Jun 2024 23:38:25 +0000
Date: Mon, 3 Jun 2024 07:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <gerhard@engleder-embedded.com>,
	linux-i2c@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andi.shyti@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: Re: [PATCH 2/2] misc: keba: Add basic KEBA CP500 system FPGA support
Message-ID: <202406030714.6PytC3El-lkp@intel.com>
References: <20240601192846.68146-3-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601192846.68146-3-gerhard@engleder-embedded.com>

Hi Gerhard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gerhard-Engleder/i2c-keba-Add-KEBA-I2C-controller-support/20240602-040548
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240601192846.68146-3-gerhard%40engleder-embedded.com
patch subject: [PATCH 2/2] misc: keba: Add basic KEBA CP500 system FPGA support
config: s390-randconfig-r062-20240603 (https://download.01.org/0day-ci/archive/20240603/202406030714.6PytC3El-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406030714.6PytC3El-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/misc/keba/cp500.c:324:14-15: WARNING comparing pointer to 0

vim +324 drivers/misc/keba/cp500.c

   313	
   314	static int cp500_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
   315	{
   316		struct device *dev = &pci_dev->dev;
   317		struct resource startup;
   318		struct cp500 *cp500;
   319		u32 cp500_vers;
   320		char buf[64];
   321		int ret;
   322	
   323		cp500 = devm_kzalloc(dev, sizeof(*cp500), GFP_KERNEL);
 > 324		if (cp500 == 0)
   325			return -ENOMEM;
   326		cp500->pci_dev = pci_dev;
   327		cp500->sys_hwbase = pci_resource_start(pci_dev, CP500_SYS_BAR);
   328		cp500->ecm_hwbase = pci_resource_start(pci_dev, CP500_ECM_BAR);
   329		if (!cp500->sys_hwbase || !cp500->ecm_hwbase)
   330			return -ENODEV;
   331	
   332		if (CP500_IS_CP035(cp500))
   333			cp500->devs = &cp035_devices;
   334		else if (CP500_IS_CP505(cp500))
   335			cp500->devs = &cp505_devices;
   336		else if (CP500_IS_CP520(cp500))
   337			cp500->devs = &cp520_devices;
   338		else
   339			return -ENODEV;
   340	
   341		ret = pci_enable_device(pci_dev);
   342		if (ret)
   343			return ret;
   344		pci_set_master(pci_dev);
   345	
   346		startup = *pci_resource_n(pci_dev, CP500_SYS_BAR);
   347		startup.end = startup.start + cp500->devs->startup.size - 1;
   348		cp500->system_startup_addr = devm_ioremap_resource(&pci_dev->dev,
   349								   &startup);
   350		if (IS_ERR(cp500->system_startup_addr)) {
   351			ret = PTR_ERR(cp500->system_startup_addr);
   352			goto out_disable;
   353		}
   354	
   355		cp500->msix_num = pci_alloc_irq_vectors(pci_dev, CP500_NUM_MSIX_NO_MMI,
   356							CP500_NUM_MSIX, PCI_IRQ_MSIX);
   357		if (cp500->msix_num < CP500_NUM_MSIX_NO_MMI) {
   358			dev_err(&pci_dev->dev,
   359				"Hardware does not support enough MSI-X interrupts\n");
   360			ret = -ENODEV;
   361			goto out_disable;
   362		}
   363	
   364		cp500_vers = ioread32(cp500->system_startup_addr + CP500_VERSION_REG);
   365		cp500->version.major = (cp500_vers & 0xff);
   366		cp500->version.minor = (cp500_vers >> 8) & 0xff;
   367		cp500->version.build = (cp500_vers >> 16) & 0xffff;
   368		cp500_get_fpga_version(cp500, buf, sizeof(buf));
   369	
   370		dev_info(&pci_dev->dev, "FPGA version %s", buf);
   371	
   372		pci_set_drvdata(pci_dev, cp500);
   373	
   374		ret = sysfs_create_group(&pci_dev->dev.kobj, &attrs_group);
   375		if (ret != 0)
   376			goto out_free_irq;
   377	
   378		ret = cp500_enable(cp500);
   379		if (ret != 0)
   380			goto out_remove_group;
   381	
   382		cp500_register_platform_devs(cp500);
   383	
   384		return 0;
   385	
   386	out_remove_group:
   387		sysfs_remove_group(&pci_dev->dev.kobj, &attrs_group);
   388	out_free_irq:
   389		pci_free_irq_vectors(pci_dev);
   390	out_disable:
   391		pci_clear_master(pci_dev);
   392		pci_disable_device(pci_dev);
   393	
   394		return ret;
   395	}
   396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


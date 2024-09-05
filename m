Return-Path: <linux-i2c+bounces-6236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 891A696D379
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 11:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EFF91F2561D
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 09:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F6B19538D;
	Thu,  5 Sep 2024 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdwQ02fz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8749115531A
	for <linux-i2c@vger.kernel.org>; Thu,  5 Sep 2024 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725529167; cv=none; b=uRNLaW+zd8N2Y/SS9C4XMpKQ/xqAIF2tsI2q8Rj3/3ODhSZyQckqi8B6dSDucXZ4otb9//J+S+77U3io5XaXAtA+tJg+4lPZNoIOM/XiGihIKQ0Hh9hJKnE36Mxw6mulfEfPKapnItNVEhDzZ0pHPd/Cs4DhFrz2tR3Ghhu16YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725529167; c=relaxed/simple;
	bh=LJkQOZkZyeks+VvqKT7l0uwJK0ntC6MTmdlckrHGhHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6SJpaU3VlCobIfqrbTlk6pzRYZOAUnRipGOHa/yWho8YpBEwJ25zL0MAgoosJWHarjs2INq280BuxFRjb95iDaeKtVtAMAD+IGKRml7o1x6Yb7bCkDxDa4mPzPMkh2Ye+1RLjjddA709R1khbURBZQRI3C/+a/hoPl9rxkHP5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdwQ02fz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725529166; x=1757065166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LJkQOZkZyeks+VvqKT7l0uwJK0ntC6MTmdlckrHGhHo=;
  b=IdwQ02fzFqDoNnbQUCrju/PrsN2Hs/ccBudlKp55MvGG6hoOgoZPlCwn
   FqCBFHoSFdnfTi9fCg2DQn3BF7hf9hhbKMum34ARWj2wJLHaEi9NIChjC
   JYSmB94KEUhOtll99otxdnmLCPwj/qzwJ+444LQ4qzr/DNobe5IouOxIa
   3Rigonbh4kBAYm3or2+E/n4vqJrojck2f5Lt5n+XHeUS1TrTTnqIoB055
   trul7f8NJklPRJKZ9lyZFyzORpppHYGaajf/nRpSaswrfFL29SsBaeNOG
   zxsclrvu2E5Cf9vZVe7y0zWeW64M5ipMKr1Ya6yp84616rU+GE/KP2x/P
   w==;
X-CSE-ConnectionGUID: brb/mECaQDSvi+ZmJjyErw==
X-CSE-MsgGUID: XzFjlDw4T9+0iQCaBg8zvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24395938"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="24395938"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 02:39:25 -0700
X-CSE-ConnectionGUID: Dz9qirrKTGm2D9x5QPmJIw==
X-CSE-MsgGUID: V41y5R4iSNK0OsPD72Trpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="69977299"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Sep 2024 02:39:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm8xU-0009BZ-21;
	Thu, 05 Sep 2024 09:39:20 +0000
Date: Thu, 5 Sep 2024 17:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	Sanket.Goswami@amd.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Message-ID: <202409051743.1sRmenx6-lkp@intel.com>
References: <20240904105731.2246235-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904105731.2246235-4-Shyam-sundar.S-k@amd.com>

Hi Shyam,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc6 next-20240904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i2c-piix4-Allow-more-than-two-algo-selection-for-SMBus/20240904-190034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240904105731.2246235-4-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH v2 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240905/202409051743.1sRmenx6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051743.1sRmenx6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051743.1sRmenx6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-piix4.c: In function 'sb800_asf_add_adap':
   drivers/i2c/busses/i2c-piix4.c:1318:16: error: implicit declaration of function 'acpi_fetch_acpi_dev'; did you mean 'acpi_match_acpi_device'? [-Wimplicit-function-declaration]
    1318 |         adev = acpi_fetch_acpi_dev(handle);
         |                ^~~~~~~~~~~~~~~~~~~
         |                acpi_match_acpi_device
>> drivers/i2c/busses/i2c-piix4.c:1318:14: error: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1318 |         adev = acpi_fetch_acpi_dev(handle);
         |              ^
   drivers/i2c/busses/i2c-piix4.c:1322:15: error: implicit declaration of function 'acpi_dev_get_resources'; did you mean 'acpi_get_event_resources'? [-Wimplicit-function-declaration]
    1322 |         ret = acpi_dev_get_resources(adev, &res_list, sb800_asf_acpi_resource_cb, &data);
         |               ^~~~~~~~~~~~~~~~~~~~~~
         |               acpi_get_event_resources
   drivers/i2c/busses/i2c-piix4.c:1328:9: error: implicit declaration of function 'acpi_dev_free_resource_list'; did you mean 'pci_free_resource_list'? [-Wimplicit-function-declaration]
    1328 |         acpi_dev_free_resource_list(&res_list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_free_resource_list


vim +1318 drivers/i2c/busses/i2c-piix4.c

  1303	
  1304	static int sb800_asf_add_adap(struct pci_dev *dev)
  1305	{
  1306		struct i2c_piix4_adapdata *adapdata;
  1307		struct sb800_asf_data data;
  1308		struct acpi_device *adev;
  1309		LIST_HEAD(res_list);
  1310		acpi_status status;
  1311		acpi_handle handle;
  1312		int ret;
  1313	
  1314		status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
  1315		if (ACPI_FAILURE(status))
  1316			return -ENODEV;
  1317	
> 1318		adev = acpi_fetch_acpi_dev(handle);
  1319		if (!adev)
  1320			return -ENODEV;
  1321	
  1322		ret = acpi_dev_get_resources(adev, &res_list, sb800_asf_acpi_resource_cb, &data);
  1323		if (ret < 0) {
  1324			dev_err(&dev->dev, "Error getting ASF ACPI resource: %d\n", ret);
  1325			return ret;
  1326		}
  1327	
  1328		acpi_dev_free_resource_list(&res_list);
  1329		ret = piix4_add_adapter(dev, data.addr, SMBUS_ASF, piix4_adapter_count, false, 0,
  1330					piix4_main_port_names_sb800[piix4_adapter_count],
  1331					&piix4_main_adapters[piix4_adapter_count]);
  1332		if (ret) {
  1333			dev_err(&dev->dev, "Failed to add ASF adapter: %d\n", ret);
  1334			return -ENODEV;
  1335		}
  1336	
  1337		adapdata = i2c_get_adapdata(piix4_main_adapters[piix4_adapter_count]);
  1338		ret = devm_request_irq(&dev->dev, data.irq, sb800_asf_irq_handler, IRQF_SHARED,
  1339				       "sb800_smbus_asf", adapdata);
  1340		if (ret) {
  1341			dev_err(&dev->dev, "Unable to request irq: %d for use\n", data.irq);
  1342			return ret;
  1343		}
  1344	
  1345		INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
  1346		adapdata->is_asf = true;
  1347		/* Increment the adapter count by 1 as ASF is added to the list */
  1348		piix4_adapter_count += 1;
  1349		return 1;
  1350	}
  1351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


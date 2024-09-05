Return-Path: <linux-i2c+bounces-6235-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940596D34C
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 11:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E644F28930B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 09:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8007C19885B;
	Thu,  5 Sep 2024 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+uN5Qpg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BF119925B
	for <linux-i2c@vger.kernel.org>; Thu,  5 Sep 2024 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725528578; cv=none; b=UYFiQ7KuY28mpRI7qrhTQhvodpFSd8DlUHmkBOrTyaeisxE6NultUon1ZkTSwknhGOToyMaWb8hdO2Iw8RhactkSJBFpHX8fEyNw1guchaUoBUUKxkmQFFxlksbWvbOY76Mb4IUiCVyvbagpAHwRtB2OAIq/UKG0jt/P1EpJdn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725528578; c=relaxed/simple;
	bh=aGAdUfPjvzd1f2rtEf0my39kf6iv6uyYt8ePFxyxQtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7DN8T3Iobm9Leltie/ZNTLuMRmBKfxL4AgMbjLu87sz9w95XbGOoTjk4FI84oNKh+Ens2f4mH/fR5VwFxyDZEoFs9iJuL8K4pXfixvnTtehGT1sDcOTEV59rUklN2i01VWudOTQ995XilMG4CFGVcpWnjtrAxLpiFV8DRKeppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+uN5Qpg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725528575; x=1757064575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aGAdUfPjvzd1f2rtEf0my39kf6iv6uyYt8ePFxyxQtU=;
  b=H+uN5QpghFY3617A2hux4S4QckypVDslkS1TgVHQfXjsEnr7vgg1qTqO
   c61lk4nnPQCE3OsDl0FJNep/9+lNQGN8Y3MAXeDEo/dnxwxp7oFe4l3IZ
   PBIxsdTBUaJt/8uRYP3hKM2tPuhosWp2PG2Y58MxyWl3XE2GJxnTseNpU
   3NlpaoUsnEVkac7Soe93s89pGpDTBV9txWpuSULqJzozWQTwXhTi/GvxX
   +Kdv6D+Bwt1T0XUDE6Qsh1Kfd1VyZUJHZs5+QHO2XMfxmuCohlYGlziMX
   tqYk2YxfxN84OfJkUtRZZpYcuWWlc70rbMvkIjQtrMHsVwQ4HZuNitl6e
   g==;
X-CSE-ConnectionGUID: Lsuof1f2TPCutayL8ssKiw==
X-CSE-MsgGUID: ynkHQMH0QyC3UyndiOn8mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27986324"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="27986324"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 02:29:24 -0700
X-CSE-ConnectionGUID: IP9YLXe/RJqbIIAeBEW0jQ==
X-CSE-MsgGUID: JAZ4kFpsSKW2X1u3hwpRtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="70167761"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Sep 2024 02:29:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm8nn-0009AR-1V;
	Thu, 05 Sep 2024 09:29:19 +0000
Date: Thu, 5 Sep 2024 17:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Message-ID: <202409051719.oja4MkJZ-lkp@intel.com>
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
config: arm-randconfig-003-20240905 (https://download.01.org/0day-ci/archive/20240905/202409051719.oja4MkJZ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051719.oja4MkJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051719.oja4MkJZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-piix4.c:26:
   In file included from include/linux/pci.h:1646:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i2c/busses/i2c-piix4.c:1318:9: error: call to undeclared function 'acpi_fetch_acpi_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1318 |         adev = acpi_fetch_acpi_dev(handle);
         |                ^
   drivers/i2c/busses/i2c-piix4.c:1318:9: note: did you mean 'acpi_match_acpi_device'?
   include/linux/acpi.h:932:44: note: 'acpi_match_acpi_device' declared here
     932 | static inline const struct acpi_device_id *acpi_match_acpi_device(
         |                                            ^
>> drivers/i2c/busses/i2c-piix4.c:1318:7: error: incompatible integer to pointer conversion assigning to 'struct acpi_device *' from 'int' [-Wint-conversion]
    1318 |         adev = acpi_fetch_acpi_dev(handle);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-piix4.c:1322:8: error: call to undeclared function 'acpi_dev_get_resources'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1322 |         ret = acpi_dev_get_resources(adev, &res_list, sb800_asf_acpi_resource_cb, &data);
         |               ^
   drivers/i2c/busses/i2c-piix4.c:1322:8: note: did you mean 'acpi_get_event_resources'?
   include/acpi/acpixf.h:809:9: note: 'acpi_get_event_resources' declared here
     809 |                              acpi_get_event_resources(acpi_handle device_handle,
         |                              ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
>> drivers/i2c/busses/i2c-piix4.c:1328:2: error: call to undeclared function 'acpi_dev_free_resource_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1328 |         acpi_dev_free_resource_list(&res_list);
         |         ^
   drivers/i2c/busses/i2c-piix4.c:1328:2: note: did you mean 'pci_free_resource_list'?
   include/linux/pci.h:1496:6: note: 'pci_free_resource_list' declared here
    1496 | void pci_free_resource_list(struct list_head *resources);
         |      ^
   1 warning and 4 errors generated.


vim +/acpi_fetch_acpi_dev +1318 drivers/i2c/busses/i2c-piix4.c

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
> 1322		ret = acpi_dev_get_resources(adev, &res_list, sb800_asf_acpi_resource_cb, &data);
  1323		if (ret < 0) {
  1324			dev_err(&dev->dev, "Error getting ASF ACPI resource: %d\n", ret);
  1325			return ret;
  1326		}
  1327	
> 1328		acpi_dev_free_resource_list(&res_list);
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


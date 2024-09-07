Return-Path: <linux-i2c+bounces-6342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E16ED96FF48
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 04:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A01E41F23731
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 02:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95B114AA9;
	Sat,  7 Sep 2024 02:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ic5Sm5gT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6238D1798F
	for <linux-i2c@vger.kernel.org>; Sat,  7 Sep 2024 02:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725677410; cv=none; b=bpHO2dWa/ZLKAyxPkipyB+1HRgEBYxwKHab0PnqpXD4tRQF7Oi4gO+zIpk/lqYYHYNQeeB/0GzcgYO2z7TDES2moJ8XccZXUYKA6c1ky8TSOWGQeu9d3UL3As1Aa9C96juCsfFM7EoGPYZ1WbPxCJj3CoVSPRueyh2G3hZs09go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725677410; c=relaxed/simple;
	bh=pno590Yw+q9cUeT6i4Cvtu9XpvKFN3ChX4T/zY1J6y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBf0bXTwhs8cnjfeS77AlxCDoXqUjxQhA2AXA6qnTltrS1PhoEDUhw1tbe2iJnHKXYkj+QIwqXmMqmRH66JQv5nJsO+rPhBC5qAADfrJEJyymXwgNQYtQcITtUs/1/ZJmWdu6c2vec85sbjNcw3oKbqxI7wUD3kOuuK4DXa/EKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ic5Sm5gT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725677409; x=1757213409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pno590Yw+q9cUeT6i4Cvtu9XpvKFN3ChX4T/zY1J6y8=;
  b=ic5Sm5gTR2LX3dp6N88cZeiIScfcX8OtNhM0/IYW7UjWA/VtC9akQ/Z8
   358q7HLTJMytJIwkMGElXWT71cTaGJH2iSR8jBTEhM9kYdWtEdb73Q7qn
   JZRR3/zhmao2RnHoZYhtC7YtjqqTB7W7/d6A2rHHATQfjYhhgTTA/I0Ag
   STjf8XAMbbuz1tZhMrtzp2PEnpLV1kcfWj4cZhdyeahpKivZa3Nmgs6PB
   ZwIgV4itK7wIjuB/S1qqJw9hdXLYIH3fRYVRLbshVUecS8iFhYJLyAc32
   yiTAhqvfEVvBrHqCUqCtG/i0dqLstvezBmSpOllwnRukOwDIjpnVEQnnD
   g==;
X-CSE-ConnectionGUID: RntlEV1ATm261qRW92VBmw==
X-CSE-MsgGUID: mrXONNchRTOxZrsUM7DY7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28233141"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="28233141"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 19:50:08 -0700
X-CSE-ConnectionGUID: FLkR1FblSBeTG8tU6+b6zQ==
X-CSE-MsgGUID: ViBICSnpQ4ibYQ5M3qgxAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="89403146"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Sep 2024 19:50:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smlWV-000C47-3A;
	Sat, 07 Sep 2024 02:50:03 +0000
Date: Sat, 7 Sep 2024 10:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	Sanket.Goswami@amd.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Message-ID: <202409071045.2aUSULRN-lkp@intel.com>
References: <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>

Hi Shyam,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc6 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i2c-piix4-Allow-more-than-two-algo-selection-for-SMBus/20240906-152430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240906071201.2254354-4-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH v3 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
config: x86_64-buildonly-randconfig-006-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071045.2aUSULRN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071045.2aUSULRN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071045.2aUSULRN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-piix4.c: In function 'sb800_asf_add_adap':
   drivers/i2c/busses/i2c-piix4.c:1304:16: error: implicit declaration of function 'acpi_fetch_acpi_dev'; did you mean 'acpi_match_acpi_device'? [-Werror=implicit-function-declaration]
    1304 |         adev = acpi_fetch_acpi_dev(handle);
         |                ^~~~~~~~~~~~~~~~~~~
         |                acpi_match_acpi_device
   drivers/i2c/busses/i2c-piix4.c:1304:14: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1304 |         adev = acpi_fetch_acpi_dev(handle);
         |              ^
   drivers/i2c/busses/i2c-piix4.c:1309:15: error: implicit declaration of function 'acpi_dev_get_resources'; did you mean 'acpi_get_event_resources'? [-Werror=implicit-function-declaration]
    1309 |         ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
         |               ^~~~~~~~~~~~~~~~~~~~~~
         |               acpi_get_event_resources
   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/i2c/busses/i2c-piix4.c:26:
>> drivers/i2c/busses/i2c-piix4.c:1324:39: error: invalid use of undefined type 'struct acpi_device'
    1324 |                         dev_warn(&adev->dev, "Invalid ASF resource\n");
         |                                       ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/i2c/busses/i2c-piix4.c:1324:25: note: in expansion of macro 'dev_warn'
    1324 |                         dev_warn(&adev->dev, "Invalid ASF resource\n");
         |                         ^~~~~~~~
   drivers/i2c/busses/i2c-piix4.c:1329:9: error: implicit declaration of function 'acpi_dev_free_resource_list'; did you mean 'pci_free_resource_list'? [-Werror=implicit-function-declaration]
    1329 |         acpi_dev_free_resource_list(&res_list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_free_resource_list
   cc1: some warnings being treated as errors


vim +1324 drivers/i2c/busses/i2c-piix4.c

  1288	
  1289	static int sb800_asf_add_adap(struct pci_dev *dev)
  1290	{
  1291		struct i2c_piix4_adapdata *adapdata;
  1292		struct resource_entry *rentry;
  1293		struct sb800_asf_data data;
  1294		struct list_head res_list;
  1295		struct acpi_device *adev;
  1296		acpi_status status;
  1297		acpi_handle handle;
  1298		int ret;
  1299	
  1300		status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
  1301		if (ACPI_FAILURE(status))
  1302			return -ENODEV;
  1303	
  1304		adev = acpi_fetch_acpi_dev(handle);
  1305		if (!adev)
  1306			return -ENODEV;
  1307	
  1308		INIT_LIST_HEAD(&res_list);
  1309		ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
  1310		if (ret < 0) {
  1311			dev_err(&dev->dev, "Error getting ASF ACPI resource: %d\n", ret);
  1312			return ret;
  1313		}
  1314	
  1315		list_for_each_entry(rentry, &res_list, node) {
  1316			switch (resource_type(rentry->res)) {
  1317			case IORESOURCE_IO:
  1318				data.addr = rentry->res->start;
  1319				break;
  1320			case IORESOURCE_IRQ:
  1321				data.irq = rentry->res->start;
  1322				break;
  1323			default:
> 1324				dev_warn(&adev->dev, "Invalid ASF resource\n");
  1325				break;
  1326			}
  1327		}
  1328	
  1329		acpi_dev_free_resource_list(&res_list);
  1330		ret = piix4_add_adapter(dev, data.addr, SMBUS_ASF, piix4_adapter_count, false, 0,
  1331					piix4_main_port_names_sb800[piix4_adapter_count],
  1332					&piix4_main_adapters[piix4_adapter_count]);
  1333		if (ret) {
  1334			dev_err(&dev->dev, "Failed to add ASF adapter: %d\n", ret);
  1335			return -ENODEV;
  1336		}
  1337	
  1338		adapdata = i2c_get_adapdata(piix4_main_adapters[piix4_adapter_count]);
  1339		ret = devm_request_irq(&dev->dev, data.irq, sb800_asf_irq_handler, IRQF_SHARED,
  1340				       "sb800_smbus_asf", adapdata);
  1341		if (ret) {
  1342			dev_err(&dev->dev, "Unable to request irq: %d for use\n", data.irq);
  1343			return ret;
  1344		}
  1345	
  1346		INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
  1347		adapdata->is_asf = true;
  1348		/* Increment the adapter count by 1 as ASF is added to the list */
  1349		piix4_adapter_count++;
  1350		return 1;
  1351	}
  1352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


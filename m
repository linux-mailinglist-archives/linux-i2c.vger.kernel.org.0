Return-Path: <linux-i2c+bounces-6882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ABE97CE30
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 21:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0DCE1F20FE4
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 19:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFCB38F97;
	Thu, 19 Sep 2024 19:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8Z0iWAp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF3C55885
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 19:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726775059; cv=none; b=Exw93UsxGPYJbFy+ZGfRVHG4kbP0jB8kPbyzkppMAbvWYqxU4Z3qVw3B5bCPzK/Wqy9NNT+MPBXZkrrsY19+7qMYgqwdbWtd6vVGmDcBWZ5yM/D6H+GBsOQZSVthanHvRnjoYqJDNSxp+w6AIv8XhWyXxbQZQHRoKMHNogt3XdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726775059; c=relaxed/simple;
	bh=2hRqAHASlfIZuux8VpsPxQok60ErE1TRbUHCd7YpKEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSvk18gyp0ejnz0MGp5pIQMNPXwvyZKgjQPUhm5fRnUDY1IjyOjqyu/+HytE1XyrK9lIJP8eq29mr6Iw1ypyPblPal9fX2KgfAI1cgIFRs2J+h4CMhZZds8WkfCoiZS1EIRrIcPsCM+rOIAB60SLnkd2HvimQFRxuCaMljdvjww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8Z0iWAp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726775058; x=1758311058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2hRqAHASlfIZuux8VpsPxQok60ErE1TRbUHCd7YpKEk=;
  b=H8Z0iWApcX2weVFAAJkP/IN8PPMW70WJnuAXLCpd2t5WUzg33Zn1FPJI
   IpeYpgc+07EhsjmxWQRP8x6lwwV7DbVBHWCILBlsIVi0lg88qOI4RIt6S
   nkozxn8mj1Vh+Key/SpbRVkQyiRc2xuWHRpvNaNpL4Z56XrSmUsFM4hEE
   QqBG8lwOP/kQDrGuxUi0gzNb5LIVdiqiew3jqJB7cm4/+xxB8s0eKruMB
   D8C5gYuuprcd14O2leU3j0EY6L6whPFL5kDFOs2jE6StLx4QA6RTY1lVN
   ddDZXy8/cC0zl5ECk97SVAcFuwsE+BIsuIYIeBAomJmgvtSgZ/0ek1DDM
   Q==;
X-CSE-ConnectionGUID: vJ4n+KmAT6uVL6n9LtNNsA==
X-CSE-MsgGUID: dcYtsWKDQu64wRd8qzEJ1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25950276"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="25950276"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:44:18 -0700
X-CSE-ConnectionGUID: tCrg+SLzTB2nOTZMcFVYCg==
X-CSE-MsgGUID: M71sTAbLQcG8NtCsYNE/gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="69649950"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 12:44:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srN4X-000Dbw-0T;
	Thu, 19 Sep 2024 19:44:13 +0000
Date: Fri, 20 Sep 2024 03:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Patil.Reddy@amd.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v5 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Message-ID: <202409192333.P0Nve307-lkp@intel.com>
References: <20240913121110.1611340-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121110.1611340-5-Shyam-sundar.S-k@amd.com>

Hi Shyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.11 next-20240919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i2c-piix4-Change-the-parameter-list-of-piix4_transaction-function/20240913-201353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240913121110.1611340-5-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH v5 4/8] i2c: amd-asf: Add ACPI support for AMD ASF Controller
config: arm-randconfig-003-20240919 (https://download.01.org/0day-ci/archive/20240919/202409192333.P0Nve307-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409192333.P0Nve307-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409192333.P0Nve307-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-amd-asf-plat.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i2c/busses/i2c-amd-asf-plat.c:52:56: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
      52 |                  "SMBus ASF adapter%s at 0x%llx", amd_asf_port_name, asf_dev->port_addr->start);
         |                                            ~~~~                      ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            %x
   2 warnings generated.


vim +52 drivers/i2c/busses/i2c-amd-asf-plat.c

    30	
    31	static int amd_asf_probe(struct platform_device *pdev)
    32	{
    33		struct amd_asf_dev *asf_dev;
    34	
    35		asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
    36		if (!asf_dev)
    37			return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
    38	
    39		asf_dev->dev = &pdev->dev;
    40		asf_dev->mmio_cfg.use_mmio = true;
    41		platform_set_drvdata(pdev, asf_dev);
    42	
    43		asf_dev->port_addr = platform_get_resource(pdev, IORESOURCE_IO, 0);
    44		if (!asf_dev->port_addr)
    45			return dev_err_probe(&pdev->dev, -EINVAL, "missing IO resources\n");
    46	
    47		asf_dev->adap.owner = THIS_MODULE;
    48		asf_dev->adap.dev.parent = &pdev->dev;
    49	
    50		i2c_set_adapdata(&asf_dev->adap, asf_dev);
    51		snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name),
  > 52			 "SMBus ASF adapter%s at 0x%llx", amd_asf_port_name, asf_dev->port_addr->start);
    53	
    54		return devm_i2c_add_adapter(&pdev->dev, &asf_dev->adap);
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


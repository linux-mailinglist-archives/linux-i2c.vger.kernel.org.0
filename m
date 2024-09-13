Return-Path: <linux-i2c+bounces-6738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE61978B7C
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 00:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72F701C20869
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 22:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C5A158A2E;
	Fri, 13 Sep 2024 22:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejNZWv//"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35711474A5
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 22:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726267593; cv=none; b=grkgARG9WELO2X83jFvU0Cp+ev2gTqduLpy61SVbYqtgbHOho/olKlHg21L3PMSGa6nnG9zNmYMz0FkzQNpOyQoNMoWQgTpl3ucUfWjcr7eq50k3LgcvJ+R+iZUo1Kpu0PeuKAgRmYJ9ZPq2GJ3rxqpMaGYLuhtRO2UAZMf2NBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726267593; c=relaxed/simple;
	bh=bzZYx6X/0ts5emwyeq1oo9iSBwMC96Ac+YnFn+TnGdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOdJan85BO+Bw1KCeomtAHoxjq2Py8xIcEasqnftumgBYQt5vHam1OwAOvBtzUQp5GeuYXRefBVnUS0tE0YZujq5nmrFinbT8GB9CamVHYngciWNn1hAzp6flSe3vXCoPVFdMMeQpaQLlQWccoGJj2Iju34aijMl/XWET1pHqfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejNZWv//; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726267591; x=1757803591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bzZYx6X/0ts5emwyeq1oo9iSBwMC96Ac+YnFn+TnGdw=;
  b=ejNZWv//V+o7aBEJ+fuaUX9je0195MWE2D/7hFIUbaCUFpI3W7eP9XHC
   gVRqtevYpwVCVF08XdEaCze5OyHvt4zoy3yXYN6YYcTJSvbHL6CsanilD
   eptSxQ4hVcDZ2KS3RqvqWKj2mcahGYGEqEg0i+mESwG1vz+1SmZfbEc+i
   MtdsF5XDPAq244kArs7uLtBKCe6BIJaPwIxIGQVpHF4GEP+xHduSUf/yL
   z9PfHifZJFNjGA7LZmDlz9T8F6F7ewN94b6Lls3KLlVyjxYU+3URBqDGE
   jkBJENGSLiO7XqtU0NS/DxXtpn/egcjBrsVw6yJuOVZS8sr5HlTozLCNS
   A==;
X-CSE-ConnectionGUID: Rem+PIydTbCufYxP39MNXA==
X-CSE-MsgGUID: DjcAxPKiQWCj3jZp4bEgAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35856907"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="35856907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 15:46:31 -0700
X-CSE-ConnectionGUID: OSIAn2ZeQ0ex8ubiKnzNLg==
X-CSE-MsgGUID: jBrAiw88RpugICQcQ74wfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68085643"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2024 15:46:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spF3a-00076o-2M;
	Fri, 13 Sep 2024 22:46:26 +0000
Date: Sat, 14 Sep 2024 06:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	Sanket.Goswami@amd.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Patil.Reddy@amd.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v5 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Message-ID: <202409140624.TOshFT39-lkp@intel.com>
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
[also build test WARNING on linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i2c-piix4-Change-the-parameter-list-of-piix4_transaction-function/20240913-201353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240913121110.1611340-5-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH v5 4/8] i2c: amd-asf: Add ACPI support for AMD ASF Controller
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409140624.TOshFT39-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140624.TOshFT39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140624.TOshFT39-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-amd-asf-plat.c: In function 'amd_asf_probe':
>> drivers/i2c/busses/i2c-amd-asf-plat.c:52:47: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      52 |                  "SMBus ASF adapter%s at 0x%llx", amd_asf_port_name, asf_dev->port_addr->start);
         |                                            ~~~^                      ~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                               |                                        |
         |                                               long long unsigned int                   resource_size_t {aka unsigned int}
         |                                            %x


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


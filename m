Return-Path: <linux-i2c+bounces-11817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB6DAF7D79
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 18:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 734641C272B9
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 16:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052E62F0E31;
	Thu,  3 Jul 2025 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWAytJZ6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B5D2E7620;
	Thu,  3 Jul 2025 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558568; cv=none; b=Adjtu/Pj1s31kqHzF56RPyK/GmkPcYFdXLWM/hu4+2sDKbNrNTKIxbdk/mdO9XTUzYDxW5LsBBCL1gLxFfcTPgmoZA1IKkVAfGiIlsnGxUOJ2bOi60R8st4PFmgtQKwb6a9oTH0Ccyr11yCReu9MseYMalWnJGJ3YIhmVaNXL1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558568; c=relaxed/simple;
	bh=OzgEgyinOD2u+eSMzdaGCr7tFY0dcCCASCneanv0fW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ns08c+q+9Ac2UZf1SRsocuoeO5Zl3GmxRQhennYF9gLLdSqDKNSLg/mSWXVuzMxfjC7b6czZZEjkKwkL/1Z0JHsafGSqlxorSiJBQH6bSOSeFzFCbRP9PrYfQnpJm2OZ15hF0PHSLFWHZnMsIGiMEMHdMvAE0TGS9cvDjT8/UlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWAytJZ6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751558567; x=1783094567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OzgEgyinOD2u+eSMzdaGCr7tFY0dcCCASCneanv0fW4=;
  b=hWAytJZ6c69r80Quo4ULlMLQAuW6Q+DQSwfzsAYkDQyAdwEx6uZya78E
   Swyem4hXEP1OWNjXVfduHnQGQqePFs8wvaLOhkH3W/5OZb+j1YcApVuhn
   QxhmzNQf9LLBmHPJqnYaRGpJOu4xNziCZbuqWGDKX3LNqm5xy0CF06t5k
   WrVf/od1kBS1NgyRYn9UPKPfiZeNZ+6VEY++s/355Ud06IyvWoFMH1FVx
   7Kys7694lQJ/EFlVLLHahjlFjvBiQHMGIAUqXngyYA8G8YvMckT8ciV+3
   pj511KLosVmqmpdhXkWeo1VH4LvyPE8lOqmzYo4K/e/pp1h8vYk24t+La
   Q==;
X-CSE-ConnectionGUID: NTfIbjZtSXmPXH/y8ozzag==
X-CSE-MsgGUID: /GSqrALkT8ixg0ibcK8fXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57666242"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="57666242"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 09:02:46 -0700
X-CSE-ConnectionGUID: 5VJaoDJqRYODVXcNjGfdew==
X-CSE-MsgGUID: zVWz+w0NRn+byUEnsi9U/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154532412"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jul 2025 09:02:43 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXMOW-0002l1-0i;
	Thu, 03 Jul 2025 16:02:40 +0000
Date: Fri, 4 Jul 2025 00:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil R <akhilrajeev@nvidia.com>, andriy.shevchenko@linux.intel.com,
	andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
	thierry.reding@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, akhilrajeev@nvidia.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	ldewangan@nvidia.com, robh@kernel.org
Subject: Re: [PATCH v5 2/3] i2c: tegra: make reset an optional property
Message-ID: <202507032359.AfHPKWEQ-lkp@intel.com>
References: <20250702133450.64257-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702133450.64257-2-akhilrajeev@nvidia.com>

Hi Akhil,

kernel test robot noticed the following build errors:

[auto build test ERROR on tegra/for-next]
[also build test ERROR on andi-shyti/i2c/i2c-host linus/master v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/i2c-tegra-make-reset-an-optional-property/20250702-214005
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20250702133450.64257-2-akhilrajeev%40nvidia.com
patch subject: [PATCH v5 2/3] i2c: tegra: make reset an optional property
config: sh-randconfig-002-20250703 (https://download.01.org/0day-ci/archive/20250703/202507032359.AfHPKWEQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507032359.AfHPKWEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507032359.AfHPKWEQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/i2c/busses/i2c-tegra.c:9:
   drivers/i2c/busses/i2c-tegra.c: In function 'tegra_i2c_reset':
>> drivers/i2c/busses/i2c-tegra.c:632:23: error: implicit declaration of function 'acpi_has_method'; did you mean 'acpi_has_watchdog'? [-Wimplicit-function-declaration]
     632 |         if (handle && acpi_has_method(handle, "_RST")) {
         |                       ^~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/i2c/busses/i2c-tegra.c:632:9: note: in expansion of macro 'if'
     632 |         if (handle && acpi_has_method(handle, "_RST")) {
         |         ^~


vim +632 drivers/i2c/busses/i2c-tegra.c

   626	
   627	static int tegra_i2c_reset(struct tegra_i2c_dev *i2c_dev)
   628	{
   629		acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
   630		int err;
   631	
 > 632		if (handle && acpi_has_method(handle, "_RST")) {
   633			err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
   634			if (ACPI_FAILURE(err))
   635				return -EIO;
   636	
   637			return 0;
   638		}
   639	
   640		if (i2c_dev->rst)
   641			return reset_control_reset(i2c_dev->rst);
   642	
   643		return tegra_i2c_master_reset(i2c_dev);
   644	}
   645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


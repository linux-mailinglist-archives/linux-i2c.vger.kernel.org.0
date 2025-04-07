Return-Path: <linux-i2c+bounces-10146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9079A7E00F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 394551728EB
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 13:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154791B0F32;
	Mon,  7 Apr 2025 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7dreKtM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8F1AAA0F;
	Mon,  7 Apr 2025 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033726; cv=none; b=B3G/W2QkhPTBGn7RG6p05kiI/mQ6Al8O8RmMT1OF2lwBsPH++5OocwACXlKfsSBnIMLAKz2A4d4qW3Tg2MoHqoWBEgFTFM+M86qw6P4cIk1XMwofDZ8xI7iSiH7WOe1W8k3j/QDg2WUpbyHoWCW9HreXRECfzMsko6oRUDPvHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033726; c=relaxed/simple;
	bh=hD+ZYmdj1bqxHe5n8QqhW5c1gy2hPeTRcreDRy6dSO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btHc8N0ZKbigiLKpqBbEsbp14cfXu8e67FWS3ld1d5CKfpIrXdiMPV1VkpvemXpO19Hcd4R/DX4hQEDHBT5zbO5I7n9hBl/OntEd4jJTRmK2J4jUpfRffI4OOAHL+wOQamJ97z2dU63NFvZYZoC5TYP3kS50uCrZuqatXvfDoF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7dreKtM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033724; x=1775569724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hD+ZYmdj1bqxHe5n8QqhW5c1gy2hPeTRcreDRy6dSO8=;
  b=k7dreKtMwU1Ai6OaXJ1amPQBBBI26YeDwhRSWGh92IJwLO5U4H5aHheD
   RZq/COdOwxMnuRI0205iQMwC1dGPhVuNrSbcWmzWtrE2NUKpeFx9tOmBF
   CAba1RQJ09vKLcwLD6cQn6w+ONT7/Yv1yHL7ETT0RAGJK5Z8yKzPIUADB
   +R/EmfZObVmbA86SRvfNyXAKqdGOo9tPCHHBNlX9wifw987pnlZ0oMob9
   HbCWzNOCJgonP5wPiCJseJTm+8pdJg/sUn3LxDgEoBPMb6XWKLadippul
   FNMiHGLPC1y1Q9sjh82SIMF1x+MZQSvki1+5mtxX4p+6L/1udweW4/r0y
   w==;
X-CSE-ConnectionGUID: FnHwAPhoSJWrR+2tqCG7cA==
X-CSE-MsgGUID: 2Xq4POEwSuKfe8noKqf+9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56790409"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56790409"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:48:44 -0700
X-CSE-ConnectionGUID: VwkqmzBxRSy+phQRCvg9Tw==
X-CSE-MsgGUID: orsXOEc6SJyFZBt9iHk+GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="165163325"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Apr 2025 06:48:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1mq7-0003S5-0y;
	Mon, 07 Apr 2025 13:48:39 +0000
Date: Mon, 7 Apr 2025 21:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 3/6] i2c: core: Switch to fwnode APIs to get IRQ
Message-ID: <202504072135.1Uy3AQ3g-lkp@intel.com>
References: <20250407095852.215809-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095852.215809-4-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-core-Drop-duplicate-check-before-calling-OF-APIs/20250407-180528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20250407095852.215809-4-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 3/6] i2c: core: Switch to fwnode APIs to get IRQ
config: i386-buildonly-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072135.1Uy3AQ3g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072135.1Uy3AQ3g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504072135.1Uy3AQ3g-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/i2c/i2c-core-base.c: In function 'i2c_dev_irq_from_resources':
>> drivers/i2c/i2c-core-base.c:911:32: error: implicit declaration of function 'irq_get_irq_data'; did you mean 'irq_set_irq_wake'? [-Werror=implicit-function-declaration]
     911 |                         irqd = irq_get_irq_data(r->start);
         |                                ^~~~~~~~~~~~~~~~
         |                                irq_set_irq_wake
>> drivers/i2c/i2c-core-base.c:911:30: warning: assignment to 'struct irq_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     911 |                         irqd = irq_get_irq_data(r->start);
         |                              ^
>> drivers/i2c/i2c-core-base.c:915:25: error: implicit declaration of function 'irqd_set_trigger_type' [-Werror=implicit-function-declaration]
     915 |                         irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c: In function 'i2c_host_notify_irq_map':
>> drivers/i2c/i2c-core-base.c:1458:9: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
    1458 |         irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/i2c-core-base.c:1458:41: error: 'dummy_irq_chip' undeclared (first use in this function)
    1458 |         irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
         |                                         ^~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:1458:41: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/i2c/i2c-core-base.c:1458:57: error: 'handle_simple_irq' undeclared (first use in this function)
    1458 |         irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
         |                                                         ^~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c: In function 'i2c_handle_smbus_host_notify':
>> drivers/i2c/i2c-core-base.c:1508:9: error: implicit declaration of function 'generic_handle_irq_safe' [-Werror=implicit-function-declaration]
    1508 |         generic_handle_irq_safe(irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +911 drivers/i2c/i2c-core-base.c

70762abb9f89d97 drivers/i2c/i2c-core.c      Jarkko Nikula   2013-11-14  897  
1d7534b6adcd3e4 drivers/i2c/i2c-core-base.c Charles Keepax  2019-06-27  898  int i2c_dev_irq_from_resources(const struct resource *resources,
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  899  			       unsigned int num_resources)
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  900  {
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  901  	struct irq_data *irqd;
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  902  	int i;
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  903  
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  904  	for (i = 0; i < num_resources; i++) {
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  905  		const struct resource *r = &resources[i];
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  906  
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  907  		if (resource_type(r) != IORESOURCE_IRQ)
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  908  			continue;
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  909  
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  910  		if (r->flags & IORESOURCE_BITS) {
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01 @911  			irqd = irq_get_irq_data(r->start);
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  912  			if (!irqd)
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  913  				break;
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  914  
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01 @915  			irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  916  		}
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  917  
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  918  		return r->start;
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  919  	}
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  920  
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  921  	return 0;
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  922  }
4124c4eba40256b drivers/i2c/i2c-core.c      Dmitry Torokhov 2017-03-01  923  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


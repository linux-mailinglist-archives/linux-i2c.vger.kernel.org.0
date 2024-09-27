Return-Path: <linux-i2c+bounces-7061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE09B988667
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 15:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7611A1F23C0F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 13:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7D219ABD4;
	Fri, 27 Sep 2024 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mohr5Vpl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4536619AA5D;
	Fri, 27 Sep 2024 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727444493; cv=none; b=sifDgNWUs0ir+kM0RKNI5MhUIj8kdeUoialMzQuJJmZsdeb9bYajTgIxF6+ndkne5AjIlXEuI1KYRYtobCHOmvpycKsEFTYAuC88mzHjSgqFKNeMo6hOlU6mx++abNkRizuI6f4xz4HRaHmC9FJ0JYYiBzS0juWqA57AzVdADiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727444493; c=relaxed/simple;
	bh=YWJgIOGhBxScyu3P5vF/TXVdwAQ44I0GxFG1b8KDCbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUZysEOwxdExuuUYyZrDTll5Jp/teHq2QvHhuwqdtYgUGpnzcYrzi7bx+rXV4Htip6l6TCSYKNQxkW+1PZcuP29sgUIZue1QQVw0X72QYZnBHY9iYuqXIs0kdTBYpUon/qAaFivRgb30+HFSKyAf2xbggOCEOk6yiAwKZPTUJrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mohr5Vpl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727444491; x=1758980491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YWJgIOGhBxScyu3P5vF/TXVdwAQ44I0GxFG1b8KDCbo=;
  b=Mohr5VplHKAzl3TLhtmnx7+jZdUnQsazMN5xW5Ptpy9D4EmLgmXnHrTM
   XIE1jL9CtAEr95sZQ/+Emf/KEs+/qjMhCQdBBRY3l07jwsZKtlDTvp13+
   l0adHesw9Q+R2lXmhNw7IcNAtkynThgotL3ULewrH3rhbgmlAxDGoqCiA
   wC8DhiP+TW5tGLAHf1satALj9Kp9YknTGHOt4WViYsxHMOZioxNJYwu6B
   ANbc/BNrwmzI6xMNWeHo6EsmsUxojVzfUyRiKPmV6L/TkzNZ6a9xNzRu2
   QbrRf7Hgo2tq7BkFAI4zMBaefOixwm4M+oqMmwHtcuvbyrmx+hmRa+stZ
   A==;
X-CSE-ConnectionGUID: tRaMddGXQqWG81kYTIu/5A==
X-CSE-MsgGUID: F+fKVm5qSIyplM+JvId+Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26761820"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26761820"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:41:27 -0700
X-CSE-ConnectionGUID: CoHiEqGcRie6yKf5wFbsTw==
X-CSE-MsgGUID: YuN0b83TSsmqpKujZ6spkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77323694"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Sep 2024 06:41:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suBDm-000MBZ-07;
	Fri, 27 Sep 2024 13:41:22 +0000
Date: Fri, 27 Sep 2024 21:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Wu <michael.wu@kneron.us>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>,
	Morgan Chang <morgan.chang@kneron.us>, linux-kernel@vger.kernel.org,
	Michael Wu <michael.wu@kneron.us>
Subject: Re: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based
 on HW paramters
Message-ID: <202409272122.Lw9sP2il-lkp@intel.com>
References: <20240925080432.186408-2-michael.wu@kneron.us>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925080432.186408-2-michael.wu@kneron.us>

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.11]
[cannot apply to andi-shyti/i2c/i2c-host linus/master next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Wu/i2c-designware-determine-HS-tHIGH-and-tLOW-based-on-HW-paramters/20240925-160823
base:   v6.11
patch link:    https://lore.kernel.org/r/20240925080432.186408-2-michael.wu%40kneron.us
patch subject: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based on HW paramters
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240927/202409272122.Lw9sP2il-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272122.Lw9sP2il-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272122.Lw9sP2il-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "i2c_dw_parse_of" [drivers/i2c/busses/i2c-designware-platform.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


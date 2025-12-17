Return-Path: <linux-i2c+bounces-14616-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B89CCC5EC8
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 04:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 371E9300ACFE
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 03:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039C42C21F5;
	Wed, 17 Dec 2025 03:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fwc0vm0j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD599460;
	Wed, 17 Dec 2025 03:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765942999; cv=none; b=lUonXNadicPD++h2imFs2Me5nvPewbJfCC3saSRMNv9fp71rvfcumKwnkzwYmbbqqyRvvRe7wqy3pq/ZftvmFxMijoe1C7l/R/GuXbwTFyfzjSSmkvMbU7IoXUSVC2ElkqBNftPjaEHvBYnTfqbsHeGOIN8Md6E3KgTqiwaC/Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765942999; c=relaxed/simple;
	bh=IWP8Za7xU6OSaTFzTOJuSz5e6nhOAQXERxEXmSeT0so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITAKNYZ3GIIfXQaTQi2klnfsGSIytbHtEeTifnzuaIB+zICFzTfhpQ5sn4wBegL0BhJajvokVYMjpMSIh6OA8fREGDoTimmM7Q3iIiEv9MGEFa/Wt88foturzf03VyvkQQfcij2RY0tSWgHxTcrViAqrmwE1q5mF0cMyAjDxLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fwc0vm0j; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765942998; x=1797478998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IWP8Za7xU6OSaTFzTOJuSz5e6nhOAQXERxEXmSeT0so=;
  b=Fwc0vm0jRTyl8TDdBHbN5RAnLSnyuDjhQIBj4yD10ZxTRwu4MGcZJ4xE
   5e20F3yAathpzIORNVwm1fGkXaA3TyE75Q5DqrMkevBGvetESA+46fcYe
   wgPDAWYied5pNpnLdcNfGHtlACS4/kpyFheiISHXumrJHkvzGTi8T2Xm9
   ab8s3Xt1BZ3pwBl/fhYOBG5ow+/AbCO16EIXvYaYGKeTB9PlxYw/UeuPp
   QhCpFgEHEuqUuCup7ShbEN+P5y2RB8k/eh13T9AZcf+Fbx8ETFUtWyr4+
   SbZL5uB36exe6Ck/Of06+22RYj/Qy02cinUEe40UwTgvuKZYeWP/DeHbi
   g==;
X-CSE-ConnectionGUID: oyWYke0AR5ia+xc6kTTO2w==
X-CSE-MsgGUID: sAUzq708RzOLzvmXf8Ej4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79326661"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="79326661"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 19:43:17 -0800
X-CSE-ConnectionGUID: XHtAX0MtRv6xBCmEmpomQA==
X-CSE-MsgGUID: qpHVKzNFSgCzYlREfl9LOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="202689429"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Dec 2025 19:43:15 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vViRU-0000000048a-3Ue2;
	Wed, 17 Dec 2025 03:43:12 +0000
Date: Wed, 17 Dec 2025 11:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] i2c: designware: Combine the init functions
Message-ID: <202512171104.XQjB99Ao-lkp@intel.com>
References: <20251216131442.8464-5-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216131442.8464-5-heikki.krogerus@linux.intel.com>

Hi Heikki,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on next-20251216]
[cannot apply to linus/master v6.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heikki-Krogerus/i2c-designware-Remove-useless-driver-specific-option-for-I2C-target/20251216-213313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20251216131442.8464-5-heikki.krogerus%40linux.intel.com
patch subject: [PATCH v1 4/6] i2c: designware: Combine the init functions
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251217/202512171104.XQjB99Ao-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171104.XQjB99Ao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171104.XQjB99Ao-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-designware-amdisp.c: In function 'amd_isp_dw_i2c_plat_runtime_resume':
>> drivers/i2c/busses/i2c-designware-amdisp.c:166:18: error: 'struct dw_i2c_dev' has no member named 'init'
     166 |         if (i_dev->init)
         |                  ^~
   drivers/i2c/busses/i2c-designware-amdisp.c:167:22: error: 'struct dw_i2c_dev' has no member named 'init'
     167 |                 i_dev->init(i_dev);
         |                      ^~


vim +166 drivers/i2c/busses/i2c-designware-amdisp.c

d6263c468a761c Pratap Nirujogi 2025-04-24  156  
d6263c468a761c Pratap Nirujogi 2025-04-24  157  static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
d6263c468a761c Pratap Nirujogi 2025-04-24  158  {
d6263c468a761c Pratap Nirujogi 2025-04-24  159  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
d6263c468a761c Pratap Nirujogi 2025-04-24  160  
d6263c468a761c Pratap Nirujogi 2025-04-24  161  	if (!i_dev)
d6263c468a761c Pratap Nirujogi 2025-04-24  162  		return -ENODEV;
d6263c468a761c Pratap Nirujogi 2025-04-24  163  
d6263c468a761c Pratap Nirujogi 2025-04-24  164  	if (!i_dev->shared_with_punit)
d6263c468a761c Pratap Nirujogi 2025-04-24  165  		i2c_dw_prepare_clk(i_dev, true);
d6263c468a761c Pratap Nirujogi 2025-04-24 @166  	if (i_dev->init)
d6263c468a761c Pratap Nirujogi 2025-04-24  167  		i_dev->init(i_dev);
d6263c468a761c Pratap Nirujogi 2025-04-24  168  
d6263c468a761c Pratap Nirujogi 2025-04-24  169  	return 0;
d6263c468a761c Pratap Nirujogi 2025-04-24  170  }
d6263c468a761c Pratap Nirujogi 2025-04-24  171  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-i2c+bounces-11908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF26B01969
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 12:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4BE4587BB7
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 10:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0D127F74E;
	Fri, 11 Jul 2025 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zwbqc6GC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F11F4282;
	Fri, 11 Jul 2025 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228679; cv=none; b=JmWUiCgFoSFE4EuPOW4DyLhRqYDeTIRfhmcmzjNoYc6SaK8MS6hiKdXWQLm70lZljEvjKX97Lmo7pTSmOjf+RZdSIcaOxC5t9nbKKJPSaW6F3FpDaD92PSDfjDD0l1M03yEF7on1Uo7vEGrp2+vqeydExzK6lwS6oHsx50/Ekp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228679; c=relaxed/simple;
	bh=08aQjm8ZTJCqhsNF6ca1jj1OuCN7Jpf1cll3RjPOcSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmBPbb07+xvgv3fqfLfXE1OWjssiBH4Yxkw6v1GyKKwPWC0GvD5VEa1mfjT9GKZ5AvZqE0BrY/FoCkU+kWeqMGKRYfLx6B+kGiEWg13xURNq0cokQFs41N6gkn5Oy1jOt8xn9Ke+b9D/OXm6KA/zO85AiB/ali3wF8gX0RGPF0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zwbqc6GC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752228678; x=1783764678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=08aQjm8ZTJCqhsNF6ca1jj1OuCN7Jpf1cll3RjPOcSk=;
  b=Zwbqc6GCqzMcSeTVeQx+dZOOVDDRfl/fBo0iWiKQ5yt/2+btZGvl2lzw
   jH4FU1V2Jf/cqxHh3+B71maQ99FuernbKPU2SkbNiQgc0pRTgBOdRZpvJ
   ZLXTqnlMBkGOyuwsRHwahh67YVoujsJKtP+q4rIsIedUiRqO9QZMTFGk7
   v7HhvfYS8E5oxCDGgE7lMO1YoXQTvuxeYIMVhGmQf2YuzAg3TcHaF+0C1
   RTSFvoIJ6YxF6NOXoSpqizGnVoEK1T1mM3o4acAev1akTznju6rGBd8S1
   wvZZdU3Oq7NM7XR9+3E54pqXGOuIhV3g9VTDaPR9HVH7b+S5+C0Lp401V
   A==;
X-CSE-ConnectionGUID: dDG5yGd7TPe8M9RE2G1Q1A==
X-CSE-MsgGUID: f7omxXDCR2GnfDvJlriK3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53632823"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="53632823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 03:11:17 -0700
X-CSE-ConnectionGUID: cSznht7+RVSyORAvTHSefQ==
X-CSE-MsgGUID: gdVHxMagQVmQtXgAZeIlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156673466"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jul 2025 03:11:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaAin-0006Ff-0B;
	Fri, 11 Jul 2025 10:11:13 +0000
Date: Fri, 11 Jul 2025 18:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] i2c: spacemit: configure ILCR for accurate SCL frequency
Message-ID: <202507111742.e8PMpk5t-lkp@intel.com>
References: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>

Hi Troy,

kernel test robot noticed the following build errors:

[auto build test ERROR on 733923397fd95405a48f165c9b1fbc8c4b0a4681]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/i2c-spacemit-configure-ILCR-for-accurate-SCL-frequency/20250710-135339
base:   733923397fd95405a48f165c9b1fbc8c4b0a4681
patch link:    https://lore.kernel.org/r/20250710-k1-i2c-ilcr-v1-1-188d1f460c7d%40linux.spacemit.com
patch subject: [PATCH] i2c: spacemit: configure ILCR for accurate SCL frequency
config: mips-randconfig-r052-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111742.e8PMpk5t-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111742.e8PMpk5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111742.e8PMpk5t-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/i2c/busses/i2c-k1.o: in function `spacemit_i2c_probe':
>> drivers/i2c/busses/i2c-k1.c:(.text.spacemit_i2c_probe+0x22c): undefined reference to `devm_clk_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


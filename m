Return-Path: <linux-i2c+bounces-7632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDEE9B310E
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 13:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B29CB1F21DC7
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 12:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067B81D0BA3;
	Mon, 28 Oct 2024 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8iEhkDq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A411D63D2;
	Mon, 28 Oct 2024 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119925; cv=none; b=rtr5EWlmXLf9aoOogdm2AGHwq4dLGgHS/DoTdz1OJSoGvNRWwc/RYtrihxgfruFbIkj6jdnnxsWgCqFIdFo2VSwbJuNOyJ/wZ0GVl5DUHgufsI33hDDTrDQ1KSlYBoDN8Enmd2f8f6JHoY9PvYouPz2JuS6m18WAasYfJ6spDBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119925; c=relaxed/simple;
	bh=ViqoxvYuvEE/rvI6dbIX3LUOrMTjFBetq6t2H5h8Knk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpBdl0cwdVP2K23wOZ8JD1EhVO6k/26GQhuN83pYR4MvXEfy7Cpj3vDN7h7m/7+7Un+dwv9BXiXvU4fwjMlbJUHGYs7yVwe6Zx0w5wD5+3pYqwdwOFEXlLnKjM8hvNx5ty7cgHbkndqkYdd3c2ER0qIdTWwL936bFx81xZYioIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8iEhkDq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730119923; x=1761655923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ViqoxvYuvEE/rvI6dbIX3LUOrMTjFBetq6t2H5h8Knk=;
  b=Y8iEhkDqWfE3l1vrLtMuAGhw527w4NqtNuCh+B2VHop1bsD6f9eK8KWP
   K+EemMiyeKjmivTCM5ouey82ao3kMPVI88oSXuOOHlQUXgJkvx66YNlw6
   nedSOGzdbFMS+wtqAAT7SEYeYHfTRskLtDF84iRWPTVBXYgCpDw922XTq
   vjLuLushcYB2irrbFN/GCvGrYMSvF2wTZTWADbIOuAw9j1WREJy1eyjut
   ibffNjA5740R1lVyifTPrpxdWUPNTqwlSz43zUv6ugZg5iKQiyYSEEUHS
   n/rPxf1cG2RCtwuiWqTvS1I3mne8wcJx3rlbf4JD2+kbfCVGPIJi6xtT9
   Q==;
X-CSE-ConnectionGUID: vAKTDLwtT4KMpUSqPTm1VQ==
X-CSE-MsgGUID: fIl/nQ5VS0mUpdMlCSpSng==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="41105100"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="41105100"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 05:52:03 -0700
X-CSE-ConnectionGUID: V79q7ukSSDmnEIMuNayl+Q==
X-CSE-MsgGUID: wRAFbqNRRaOdFfiRMs1v/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81668712"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2024 05:52:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5PDy-000cRp-1u;
	Mon, 28 Oct 2024 12:51:58 +0000
Date: Mon, 28 Oct 2024 20:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <202410282041.JgAO0LV0-lkp@intel.com>
References: <20241028053220.346283-3-TroyMitchell988@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028053220.346283-3-TroyMitchell988@gmail.com>

Hi Troy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on robh/for-next linus/master v6.12-rc5 next-20241028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/dt-bindings-i2c-spacemit-add-support-for-K1-SoC/20241028-133452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241028053220.346283-3-TroyMitchell988%40gmail.com
patch subject: [PATCH v2 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241028/202410282041.JgAO0LV0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410282041.JgAO0LV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410282041.JgAO0LV0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-k1.c: In function 'spacemit_i2c_is_last_msg':
>> drivers/i2c/busses/i2c-k1.c:340:12: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
     340 |         if (i2c->dir == DIR_READ)
         |            ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/else +340 drivers/i2c/busses/i2c-k1.c

   337	
   338	static int spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
   339	{
 > 340		if (i2c->dir == DIR_READ)
   341			if (i2c->unprocessed == 1 && i2c->msg_idx == i2c->msg_num - 1)
   342				return 1;
   343		else if (i2c->dir == DIR_WRITE)
   344			if (!i2c->unprocessed && i2c->msg_idx == i2c->msg_num - 1)
   345				return 1;
   346	
   347		return 0;
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


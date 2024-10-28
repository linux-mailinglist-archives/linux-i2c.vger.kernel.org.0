Return-Path: <linux-i2c+bounces-7634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB44A9B33F2
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 15:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3E191C21490
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 14:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9271DE2AC;
	Mon, 28 Oct 2024 14:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I20fvKWU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C281DDA1B;
	Mon, 28 Oct 2024 14:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126773; cv=none; b=e5+F5icTQvp4K5ifRNr0zo2sllxJxOVqFPNvxI4FATUQaplILrD+TeX5QJTDIxCxzJgc7ZviqxgsBDPWtZCPIMJbKVPEN4sqrRpfNCylJ72oUcbJcqy+u12/P+6v7VYUKOD3meRxxaAxVY5PViLsQKa8ezZmmZwZqr7tBpi8cbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126773; c=relaxed/simple;
	bh=MoiwdW45feoPpBQLvCm4IU9TkcFcNVfiMx4oM7HEuDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVpaVoyVtduqGmk6aljz8CSAVmEZUudUnWniG6OgLV5I7iqj62JdOsVrCnnvd2tJD+2A3eaUqmFr/x/8a78E5Tp8FO9iYsIs6gpp9NmT82wKoC7+c+UHxIWkKFMlUV0UD+YSE+7b4hVE4TTcXquyk5bDijMlG0ZcX+cMFopf3ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I20fvKWU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730126771; x=1761662771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MoiwdW45feoPpBQLvCm4IU9TkcFcNVfiMx4oM7HEuDo=;
  b=I20fvKWUXobDaXFfnzJY/4iztLxkEAPZ7gyph34iII6v0tuyk6r+ooMx
   UihnZp632r+mCiOSaAYgfVYfDSTvnwCg400SELYP43GRAjbUIErpM5SfA
   CbLPineJ6lYkIF4Ws/mB5mwuaqunG2Mp5p2xS+B3GaSzknOR+npii39lU
   //Tn5ESffusNVrtlzKUj9vuSF7Uj7LkXbUS6fC3hEFhQCm9+Fbyu1udvu
   LFTh6W3A81UHt/nPs2PTbDOx3lcvLgqsmqDOTyFTzBAPM5x+1TUNQdcob
   /NhusqgUyv/7Dc1ylIZYT3qLQVEEcW1ZPdSX2Mt1quEOOZz85fVKavWzo
   g==;
X-CSE-ConnectionGUID: 3SL+osclRVa9GfWQAVK3Dg==
X-CSE-MsgGUID: R9bph2toRPO0dZEDTkTh2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29155849"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="29155849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:46:11 -0700
X-CSE-ConnectionGUID: ZLz1SwV9SY+/cvNcBPOTRg==
X-CSE-MsgGUID: iSe3dLZWQcW3FLEJYu5IGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81535786"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Oct 2024 07:46:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5R0P-000cXx-1V;
	Mon, 28 Oct 2024 14:46:05 +0000
Date: Mon, 28 Oct 2024 22:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	troymitchell988@gmail.com, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <202410282220.vl7podpG-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241028/202410282220.vl7podpG-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410282220.vl7podpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410282220.vl7podpG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-k1.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-k1.c:343:2: warning: add explicit braces to avoid dangling else [-Wdangling-else]
     343 |         else if (i2c->dir == DIR_WRITE)
         |         ^
   5 warnings generated.


vim +343 drivers/i2c/busses/i2c-k1.c

   337	
   338	static int spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
   339	{
   340		if (i2c->dir == DIR_READ)
   341			if (i2c->unprocessed == 1 && i2c->msg_idx == i2c->msg_num - 1)
   342				return 1;
 > 343		else if (i2c->dir == DIR_WRITE)
   344			if (!i2c->unprocessed && i2c->msg_idx == i2c->msg_num - 1)
   345				return 1;
   346	
   347		return 0;
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-i2c+bounces-5027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF938934EAA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 16:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C8321F215EB
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 14:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E3513B286;
	Thu, 18 Jul 2024 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyXtHx3E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3799E2AEE3;
	Thu, 18 Jul 2024 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721311306; cv=none; b=dkZfbkrdaJzie9rBBF0LtXpU6yX8v2yJO8ywpIfquVx378vn9fVtB8qNUoDc+o1/DQkZZz6sp9g5VwIcLWb/jJo46ivYRlUX7GNPbP1oVDBcETjadRPz49kGdfI549+f3FNPvradHXppsW5KH1xiwvObf98LLrcESA+F0e1SUqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721311306; c=relaxed/simple;
	bh=3u6ra66H9X+D21t/UnEIF2rQlSIh7p+0chw6jFtUTTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BS2PhN6CMgD2VYMOQFtl9DKsMqjfyFmwxLEWS8D8rZ5qzryecCVjJvodT9IwJRPsy6dop/Nf8WWAReaybpzyq0MNcwpgo8199X6g/Wx8D6Oa+G53DeybhqVtk+XlqWXgeIlUJz5lVO5q+/Qn+gwlfWJ9IjrSONaRFgasjQtYVMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyXtHx3E; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721311304; x=1752847304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3u6ra66H9X+D21t/UnEIF2rQlSIh7p+0chw6jFtUTTw=;
  b=IyXtHx3E+keOF5w0eTbS3OG0vMHf5TxlzBrADs7L3jTRgFpW6fFJbwC0
   zoO4daSJ+s+tFR12HwNon6R0HIaYme/E8rYaxAiTcoGuk0LBJvqNBevyB
   Mya+zcSjLE8G980O7GVs8nPz+qI4asSvp7SS7DFIpvc4qrJEDP4d2qEr9
   n/PbwQDUzLoqqExXybypymaW3wWv3jN/fZy8YtA0zkdBcPgrxrG7h+WXH
   CehsPfWzRzi15/cqPuEciHWlUPj8TDhKyX4aou0ayeyWGLonCSIh18wDI
   qhMoU7eKz3SV6zro1ZeeXlQaHIXbX5RzFuwMJhyRj42WfCu7/DSI16sxs
   A==;
X-CSE-ConnectionGUID: BhLGY9bHSYWISEriQzNQ8g==
X-CSE-MsgGUID: 5V5jGDH0QFmAnA9bGzE0fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="12608691"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="12608691"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 07:01:44 -0700
X-CSE-ConnectionGUID: Ee/VQcu7Q9yMeV+C4xf+Ng==
X-CSE-MsgGUID: ozR5V3IyRXiTGnfs80KtOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="50495301"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jul 2024 07:01:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sURhS-000hJi-2Z;
	Thu, 18 Jul 2024 14:01:38 +0000
Date: Thu, 18 Jul 2024 22:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH 2/3] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <202407182128.dYt4Ud4g-lkp@intel.com>
References: <20240718011504.4106163-3-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718011504.4106163-3-mstrodl@csh.rit.edu>

Hi Mary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes akpm-mm/mm-everything andi-shyti/i2c/i2c-host linus/master v6.10 next-20240718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/mm-vmalloc-export-__vmalloc_node_range/20240718-091816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240718011504.4106163-3-mstrodl%40csh.rit.edu
patch subject: [PATCH 2/3] x86: Add basic support for the Congatec CGEB BIOS interface
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240718/202407182128.dYt4Ud4g-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407182128.dYt4Ud4g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407182128.dYt4Ud4g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/congatec-cgeb.c: In function 'cgeb_map_memory':
>> drivers/mfd/congatec-cgeb.c:360:52: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     360 |                                 ioremap_cache((u32)(resource_size_t)pmme->phys,
         |                                                    ^


vim +360 drivers/mfd/congatec-cgeb.c

   334	
   335	static int cgeb_map_memory(struct cgeb_board_data *board)
   336	{
   337		struct cgeb_map_mem_list *pmm;
   338		struct cgeb_map_mem *pmme;
   339		int i;
   340		int ret;
   341	
   342		ret = cgeb_call_simple(board, CgebMapGetMem, 0, (void *)&board->map_mem,
   343				NULL);
   344		if (ret)
   345			return ret;
   346		if (!board->map_mem)
   347			return 0;
   348	
   349		pmm = board->map_mem;
   350		pmme = pmm->entries;
   351	
   352		pr_debug("CGEB: Memory Map with %d entries\n", pmm->count);
   353	
   354		for (i = 0; i < pmm->count; i++, pmme++) {
   355			pr_debug("CGEB: Memory map entry phys=%px, size=%08x\n",
   356					pmme->phys, pmme->size);
   357			if (pmme->phys && pmme->size) {
   358				/* We only want to look at the lower 32 bits */
   359				pmme->virt.off =
 > 360					ioremap_cache((u32)(resource_size_t)pmme->phys,
   361						pmme->size);
   362				if (!pmme->virt.off)
   363					return -ENOMEM;
   364			 } else {
   365				pmme->virt.off = 0;
   366			}
   367	
   368			pmme->virt.seg = (pmme->virt.off) ? board->ds : 0;
   369	
   370			pr_debug("CGEB:   Map phys %p, size %08x, virt %04x:%p\n",
   371				pmme->phys, pmme->size, pmme->virt.seg,
   372				pmme->virt.off);
   373		}
   374	
   375		return cgeb_call_simple(board, CgebMapChanged, 0, NULL, NULL);
   376	}
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


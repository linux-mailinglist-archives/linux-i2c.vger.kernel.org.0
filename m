Return-Path: <linux-i2c+bounces-12067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB5B14B78
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 11:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD5DD16EC53
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 09:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DB52882AB;
	Tue, 29 Jul 2025 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Clurev6N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EEF287518;
	Tue, 29 Jul 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753781946; cv=none; b=gniVFywboexBA/oHG1ZppjtTuSszPKUwD42kYkilnUG9me8Ph+yJKsLQ13eZJR6lAOa3LZz4CfwqZ7s0Uif1B4vzwiieLgQFNNfyg5AKo/UfOCv7Te8JJNozVMeUUTc57EN8Am0/7XFLX5L1H3oHheNo4W7qkxpTOe6/xm1XG7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753781946; c=relaxed/simple;
	bh=6mJ0tinGIWuX9vzpnywv9jn5YAwMPCKDvqgCsfTONzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqx3EtlWnr/JhD/wr5Vw/NlOKo8eAbf2BoyO7BJi/ZikczDhT5aiClGOoBTeAQ0oOC58REM6qhGt19JgDBlgWXaG4OItSBsL7PFtYI1Dz6yk6jZTJmkKJaPu8tB+Q4b6UNFQzqC7X4YsPEWnSl/ynyRL31Wc4m3ivSiqki3ccuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Clurev6N; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753781943; x=1785317943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6mJ0tinGIWuX9vzpnywv9jn5YAwMPCKDvqgCsfTONzQ=;
  b=Clurev6N9TIIh+qhlyBOmHPfsxF2Z0ej4glab/t33HNapwDfXfSAanf+
   BZbgPXmtFrNexL3NiCLCgfDvVViqvY3aIg3EYe8ejPOxixZ6M8Ai70/Ch
   4Z14Xt779QInTp1tyeErakhfSH3Bu8GFAh5VHMUsRXM1mSIFavIImXnam
   IkFRoE46bP8q8wHMniNfVOaHML0YnUPDNKppdiA/lvssvNVUOnJSfL2/j
   cl1d71tIhQuNCPiruXnKZYJb/wSK3YXUpQX8xaQmwDRZfmVPoxMNQ7WPE
   5SCLVl3hDAUJEGElB3TkvlKLvIL5vQkGYBkgJjE76QbdefHwDazB9jrqH
   w==;
X-CSE-ConnectionGUID: WKBovr8PQPeRC1a547jKig==
X-CSE-MsgGUID: cVuA5Ig9TV6Tsu10lVjWmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55253501"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55253501"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 02:39:02 -0700
X-CSE-ConnectionGUID: j+ObINSRRxaWjdkgOpWOWA==
X-CSE-MsgGUID: 94cCGuZvQu2NCZ2KC6S4bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="199797228"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jul 2025 02:39:00 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uggnS-0001AN-1n;
	Tue, 29 Jul 2025 09:38:58 +0000
Date: Tue, 29 Jul 2025 17:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Darshan R." <rathod.darshan.0896@gmail.com>, jdelvare@suse.com,
	andi.shyti@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Darshan R." <rathod.darshan.0896@gmail.com>
Subject: Re: [PATCH] i2c: sis96x: Refactor for readability and style
 improvements
Message-ID: <202507291702.7DUZcvW4-lkp@intel.com>
References: <20250728131418.9424-1-rathod.darshan.0896@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728131418.9424-1-rathod.darshan.0896@gmail.com>

Hi Darshan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.16 next-20250729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darshan-R/i2c-sis96x-Refactor-for-readability-and-style-improvements/20250728-213139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250728131418.9424-1-rathod.darshan.0896%40gmail.com
patch subject: [PATCH] i2c: sis96x: Refactor for readability and style improvements
config: i386-randconfig-r071-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291702.7DUZcvW4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291702.7DUZcvW4-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-sis96x.c:94 sis96x_transaction() warn: inconsistent indenting

vim +94 drivers/i2c/busses/i2c-sis96x.c

^1da177e4c3f41 Linus Torvalds 2005-04-16   75  
^1da177e4c3f41 Linus Torvalds 2005-04-16   76  /* Execute a SMBus transaction.
^1da177e4c3f41 Linus Torvalds 2005-04-16   77     int size is from SIS96x_QUICK to SIS96x_BLOCK_DATA
^1da177e4c3f41 Linus Torvalds 2005-04-16   78   */
^1da177e4c3f41 Linus Torvalds 2005-04-16   79  static int sis96x_transaction(int size)
^1da177e4c3f41 Linus Torvalds 2005-04-16   80  {
^1da177e4c3f41 Linus Torvalds 2005-04-16   81  	int temp;
^1da177e4c3f41 Linus Torvalds 2005-04-16   82  	int result = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16   83  	int timeout = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16   84  
^1da177e4c3f41 Linus Torvalds 2005-04-16   85  	dev_dbg(&sis96x_adapter.dev, "SMBus transaction %d\n", size);
^1da177e4c3f41 Linus Torvalds 2005-04-16   86  
^1da177e4c3f41 Linus Torvalds 2005-04-16   87  	/* Make sure the SMBus host is ready to start transmitting */
1f3ce966edb415 Darshan R      2025-07-28   88  	temp = sis96x_read(SMB_CNT);
^1da177e4c3f41 Linus Torvalds 2005-04-16   89  
1f3ce966edb415 Darshan R      2025-07-28   90  	if ((temp & 0x03) != 0x00) {
1f3ce966edb415 Darshan R      2025-07-28   91  		dev_dbg(&sis96x_adapter.dev, "SMBus busy (0x%02x). Resetting...\n", temp);
^1da177e4c3f41 Linus Torvalds 2005-04-16   92  
^1da177e4c3f41 Linus Torvalds 2005-04-16   93  	/* kill the transaction */
^1da177e4c3f41 Linus Torvalds 2005-04-16  @94  	sis96x_write(SMB_HOST_CNT, 0x20);
^1da177e4c3f41 Linus Torvalds 2005-04-16   95  
^1da177e4c3f41 Linus Torvalds 2005-04-16   96  	/* check it again */
1f3ce966edb415 Darshan R      2025-07-28   97  	temp = sis96x_read(SMB_CNT);
1f3ce966edb415 Darshan R      2025-07-28   98  
1f3ce966edb415 Darshan R      2025-07-28   99  	if ((temp & 0x03) != 0x00) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  100  		dev_dbg(&sis96x_adapter.dev, "Failed (0x%02x)\n", temp);
97140342e69d47 David Brownell 2008-07-14  101  		return -EBUSY;
^1da177e4c3f41 Linus Torvalds 2005-04-16  102  	} else {
^1da177e4c3f41 Linus Torvalds 2005-04-16  103  		dev_dbg(&sis96x_adapter.dev, "Successful\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  104  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  105  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


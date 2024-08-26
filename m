Return-Path: <linux-i2c+bounces-5798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D295EF6E
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 13:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C73286B9A
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 11:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3454F13BACC;
	Mon, 26 Aug 2024 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6e5rLdL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2481422C7
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724670363; cv=none; b=ga1FF7ppgHisV7N/7wYgnTCXj5gJY15KpR4F6RdHbURQ0DuhUK9ay8J6nQNYhrfM/tYP1Aqa8THXolrV9lFreP6iBBNkf4KJ9wlppydfH7WA3aoTwRpbfB/qIilZBt1jvywlqveriCzuH2h7dzaYHwte9R13T+9Cu14ELfCp68k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724670363; c=relaxed/simple;
	bh=DeypC7wSzVm9rP4EFt3Nk1BcPUET9FJSGmxWDXQQwZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlOKmONTj4g2TuHDvhusPtBz6GXTql89QQ8JqQBb1xZRVH6VIktzLocHhKHhz0wmZAW4tesH5B/8dTfu/4DHe338UikyBpTbprktsJLFYmN/J/C/uKPntKq0I1dmFVEOYTJjhrHn9DKoq2wEtShELOnwTFyotrGoNfKKtEzsm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6e5rLdL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724670360; x=1756206360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DeypC7wSzVm9rP4EFt3Nk1BcPUET9FJSGmxWDXQQwZ4=;
  b=e6e5rLdLeyRiPHhHtVYgGq+3Md4Vp6baIZsMdCuC0au/ulKVPjfspS6v
   bAiB2srZScEXcOrcP2shEIziOUXCYLzN7GD16bxvRdVxlAlhDfj61n89w
   ytnbwjqDvCMKpQVxcpGPTBJs2hHyVXgFyE1w1ySY8yJdLp4EmNUSHCoZg
   jwlVubr6HWhMCBPDRfUpg6ctc+dka9JH2UqU5xXb4HLVpo5Ion932N5qd
   SAoEkru61Q2sXAXmEBamn553b0OeDwhQ6P0cdNWkVhYYtnhou7eGSf7cF
   zDdrLPiWcE28x6ViVBqsNrMuHyPYMYJAymm6OWfcyVxEIdGtdlU0csJOO
   w==;
X-CSE-ConnectionGUID: HfO4SxiCRPGk+RUZF2zPqA==
X-CSE-MsgGUID: 0NmWctz4Qm2NKqV3S0FY4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="48475859"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="48475859"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 04:05:59 -0700
X-CSE-ConnectionGUID: uSUROZIcRbWci/Uw9YCBvw==
X-CSE-MsgGUID: XPnzInLLRe2TXjZQyN7jYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62157586"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Aug 2024 04:05:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siXXn-000GyD-2n;
	Mon, 26 Aug 2024 11:05:55 +0000
Date: Mon, 26 Aug 2024 19:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 2/5] i2c: piix4: Add i2c_algorithm operations to support
 AMD ASF with SMBus
Message-ID: <202408261803.Zxa8c8JJ-lkp@intel.com>
References: <20240822142200.686842-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822142200.686842-3-Shyam-sundar.S-k@amd.com>

Hi Shyam,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc5 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i2c-piix4-Allow-more-than-two-algo-selection-for-SMBus/20240826-113028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240822142200.686842-3-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 2/5] i2c: piix4: Add i2c_algorithm operations to support AMD ASF with SMBus
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240826/202408261803.Zxa8c8JJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408261803.Zxa8c8JJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408261803.Zxa8c8JJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-piix4.c:1069:3: error: field designator 'reg_slave' does not refer to any field in type 'const struct i2c_algorithm'
    1069 |         .reg_slave = sb800_asf_reg_slave,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-piix4.c:1070:3: error: field designator 'unreg_slave' does not refer to any field in type 'const struct i2c_algorithm'
    1070 |         .unreg_slave = sb800_asf_unreg_slave,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1069 drivers/i2c/busses/i2c-piix4.c

  1066	
  1067	static const struct i2c_algorithm sb800_asf_smbus_algorithm = {
  1068		.master_xfer = sb800_asf_xfer,
> 1069		.reg_slave = sb800_asf_reg_slave,
> 1070		.unreg_slave = sb800_asf_unreg_slave,
  1071		.functionality = sb800_asf_func,
  1072	};
  1073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


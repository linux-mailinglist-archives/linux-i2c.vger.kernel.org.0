Return-Path: <linux-i2c+bounces-8805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD86B9FDD2D
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 04:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6905A188283C
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 03:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB2EC147;
	Sun, 29 Dec 2024 03:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfvQzkjl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84895680;
	Sun, 29 Dec 2024 03:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735443224; cv=none; b=NKFEaR7EfTXkdAls+Tk51BsCAozADhw6FtXiyAcYsa6wWu3188JO6KMi1x6YqAsa6n+qlcDYvAGlqiH11u8afzHVM7AEam62KsRIN5KWFWUzUJG5KTMj33rLOpcArTTXg8vHlv6gAGS6SLSRBXlFGitQxyT3+2LUOyzYiGMg5EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735443224; c=relaxed/simple;
	bh=XwoovLm8yoaFjgI4B0ibds4k+XbUr6BG+p7sFBLZz2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrxeQH7py7F7HJJUJaq2u894R3nCkV44brB6wp6TVZ6eEaiAN6zuPWM+DKb/a6easJ9kYatJXtfveipG+oYsjiug6TIZ2rAcpWRo3eICa3lyQPQCC4aelQMVqVnLCHdd8/I5WRO7c5W2Z5EzzzoSqJT2ES/E8jb5ylbZLn7k6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfvQzkjl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735443223; x=1766979223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XwoovLm8yoaFjgI4B0ibds4k+XbUr6BG+p7sFBLZz2s=;
  b=IfvQzkjlzmTou4aAkQ9yqYottTbeo64zqs3b3zoW7YthGF4+0v3SslNQ
   SwRRNC2hhZCW6yq87Ep7aUhDoX+uf6m/jpFsSkGpI3y/Xtu7us6Rykqx2
   vnXe6EqyUJYFWOstwWvGIzYCUWMisE7NQE+C1n60uddqnRxA+sE7o4Oot
   80ndjz+3FMJf5r7wyiUkOjvcvtnzhrTPmceiUGbmLVMhIv43RICnnnE6o
   PRE9NvjmIMaYyT7fwmxNC9pYWwR6LdVcxFNk5CceuFRiYU15ZtIoGEdpV
   i7vT9XutbdcquAgzWIizAww75zC8DplQDTZ1G22uxYe/q72iQkRusOkaH
   g==;
X-CSE-ConnectionGUID: w3vcQ+IkSRGG6OMeDIJL0A==
X-CSE-MsgGUID: Nlz6wMZVQlSEXnsFQ+Wfgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="53312109"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="53312109"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 19:33:42 -0800
X-CSE-ConnectionGUID: t7dwh/+4SVGFum/pILbHuA==
X-CSE-MsgGUID: tUqVM2o1TVCoYeN4iwYFQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100230565"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Dec 2024 19:33:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRk3e-0004SC-0U;
	Sun, 29 Dec 2024 03:33:38 +0000
Date: Sun, 29 Dec 2024 11:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <david.laight.linux@gmail.com>, andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com, masahiroy@kernel.org,
	u.kleine-koenig@baylibre.com, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
Message-ID: <202412291114.MzNzqKpo-lkp@intel.com>
References: <20241228184328.5ced280b@dsl-u17-10>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228184328.5ced280b@dsl-u17-10>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.13-rc4 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/module-Allow-DEFAULT_SYMBOL_NAMESPACE-be-set-after-export-h-included/20241229-024441
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241228184328.5ced280b%40dsl-u17-10
patch subject: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after export.h included
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241229/202412291114.MzNzqKpo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291114.MzNzqKpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291114.MzNzqKpo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-lpss.c:22:9: warning: 'DEFAULT_SYMBOL_NAMESPACE' macro redefined [-Wmacro-redefined]
      22 | #define DEFAULT_SYMBOL_NAMESPACE "PWM_LPSS"
         |         ^
   include/linux/export.h:63:9: note: previous definition is here
      63 | #define DEFAULT_SYMBOL_NAMESPACE ""
         |         ^
   1 warning generated.


vim +/DEFAULT_SYMBOL_NAMESPACE +22 drivers/pwm/pwm-lpss.c

093e00bb3f82f3 Alan Cox        2014-04-18  21  
ceb8bf2ceaa77f Masahiro Yamada 2024-12-03 @22  #define DEFAULT_SYMBOL_NAMESPACE "PWM_LPSS"
a3682d2fe3c36c Andy Shevchenko 2022-09-27  23  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


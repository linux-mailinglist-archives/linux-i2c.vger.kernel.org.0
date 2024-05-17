Return-Path: <linux-i2c+bounces-3553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD8A8C8664
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 14:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08B301C21AC4
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 12:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D45547A64;
	Fri, 17 May 2024 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHy+44uN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE10041C87;
	Fri, 17 May 2024 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715949549; cv=none; b=qFRVz9D8mbrehxOTFzQPQlrhUn3e+KdnhIpRjgaC5Do06AlGPdvE94WdgV5P3bDcFDdJIANsKGZwRA+Mk3IG7R6FPiAhfCapsdZKGDT+wfgAwhZnr1vvCIyThHIrZMKqVX6vUResbxRogoDYvs6yH2zL+NF7IyjXOexm5lI99u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715949549; c=relaxed/simple;
	bh=BOMB8wdBtR5zMTKdb1X0/tCLTze4IC2lvXPtLc/qX1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfLDNs7lIeie2GEIXftS6d0EMM/FLdlBV2k4DCpiMI3XL1hVBm0H8ewNEmOh8VzQmKIflHa5bmAS6ESwMPVypRoKdb+3viYB9T2BqMmwHrFz76zIKjV7Ue9jxUgmzB+R0jkc2UROE8gEMqH3iS5hYypIKeO+8wk4OkT+VtoZE1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHy+44uN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715949547; x=1747485547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BOMB8wdBtR5zMTKdb1X0/tCLTze4IC2lvXPtLc/qX1k=;
  b=kHy+44uNmaAQiaFKf6Zx9ZxBgt/fESze+va8bryzS3WeefPdzkLZ+s5m
   GKJeLO/H8llODcfO1wDpiUXp0ty0ICob39fZvyU3ye8cPJZUvjAEKSTZl
   p++KhnK1+dszv5hKtTRE8JV9BNqIZf+Mi+ZDcvQXyOX41HwqjJpGX0BYo
   +smY96iFOz/RcRYDNIM+s2Az1PNhRxqb4osFXfBndUmxdOeGbVlAkx8os
   ztC9AoAKk8MCKvxOIdM7KXsgIecO3WEBoLfdnHeNisdlvp+to3Ilc+XH8
   T7NQdBXiV5sViSjWtoF7j7ciCmbZXFhtoQsxJsuTGF28CgmK1O0Do4Pvj
   g==;
X-CSE-ConnectionGUID: 8ZJscZJ8QHmo42zM2GluTg==
X-CSE-MsgGUID: zZS8/rE8QNmtAN7cRveROg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12311898"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="12311898"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 05:39:06 -0700
X-CSE-ConnectionGUID: xSin/eagRWmk4w/QVnTxgw==
X-CSE-MsgGUID: hAFhE6QaR0y7LOOfqMlQng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="62603985"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 May 2024 05:39:03 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7wrU-0000go-0k;
	Fri, 17 May 2024 12:39:00 +0000
Date: Fri, 17 May 2024 20:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, broonie@kernel.org,
	andi.shyti@kernel.org, joel@jms.id.au, alistair@popple.id.au,
	jk@ozlabs.org, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, eajames@linux.ibm.com
Subject: Re: [PATCH v3 37/40] fsi: core: Add different types of CFAM
Message-ID: <202405172019.j3pOURPP-lkp@intel.com>
References: <20240516181907.3468796-38-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516181907.3468796-38-eajames@linux.ibm.com>

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on robh/for-next broonie-spi/for-next linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/fsi-hub-Set-master-index-to-link-number-plus-one/20240517-023205
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240516181907.3468796-38-eajames%40linux.ibm.com
patch subject: [PATCH v3 37/40] fsi: core: Add different types of CFAM
config: i386-buildonly-randconfig-002-20240517 (https://download.01.org/0day-ci/archive/20240517/202405172019.j3pOURPP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405172019.j3pOURPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405172019.j3pOURPP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fsi/fsi-core.c:1113:27: warning: no previous prototype for function 'fsi_get_cfam_type' [-Wmissing-prototypes]
    1113 | const struct device_type *fsi_get_cfam_type(u32 id)
         |                           ^
   drivers/fsi/fsi-core.c:1113:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1113 | const struct device_type *fsi_get_cfam_type(u32 id)
         |       ^
         | static 
   1 warning generated.


vim +/fsi_get_cfam_type +1113 drivers/fsi/fsi-core.c

  1112	
> 1113	const struct device_type *fsi_get_cfam_type(u32 id)
  1114	{
  1115		u32 major = (id & 0xf00) >> 8;
  1116		u32 minor = (id & 0xf0) >> 4;
  1117	
  1118		switch (major) {
  1119		case 0x9:
  1120			return &cfam_s_type;
  1121		case 0xc:
  1122			if (minor == 0)
  1123				return &cfam_ody_type;
  1124			fallthrough;
  1125		case 0xd:
  1126		default:
  1127			return &cfam_type;
  1128		}
  1129	}
  1130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


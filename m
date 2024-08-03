Return-Path: <linux-i2c+bounces-5124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610E946B56
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Aug 2024 00:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B91D1B20BD6
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Aug 2024 22:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52C1558BC;
	Sat,  3 Aug 2024 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMUfDz0D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D7017995;
	Sat,  3 Aug 2024 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722722835; cv=none; b=Cwppx24PjsSmX5LIcLd9EP/ZdTkfUUaWy4+VEKGgKZnQKZIF13KUPkmqsGM0eFC3oS9oBYaF/kJDZnBAaalmbDsTwU4MQzNuImH2uwFvoDp2ep+1Das4MBJwFyC+yBp8yZGU7TLPxcmsphNoSX9VTqtAt+ZQRXCCBy93WmQQOLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722722835; c=relaxed/simple;
	bh=wFTsXKLkF3epBDrhbKN+PdxI93pWRv4XEiAfS4d7lso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVSY00snsmCkxC1KVCGQiZkDbRqqWfVgiwjUiggYzvdXAu4uJ18b+Zu2Wd9IAFYSxnB213k9S8ogvomH05lgOlGBIsmhq6U8lIXI8Q/z/iuXLu37o+RdE+O4iuc1eV50tCGBq54kCWztVfqW4C793/qw+n7aEz7l9RExRZ85uGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMUfDz0D; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722722834; x=1754258834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wFTsXKLkF3epBDrhbKN+PdxI93pWRv4XEiAfS4d7lso=;
  b=gMUfDz0D3lQvXNe3LPCV8Wz9d+ELtbQQ7Yo3AY/6E1/C8FIGi4NzaOmQ
   JV4EQFQwAH/x1LLJF2kYMHqsJpFEMhkOf29WQIAz21Jc7A01CQBQdGmZ9
   AjoqFMU67wkVWMILnN/VJMKCBIb5ZXnVgEb2SRBApbw+Aa3mTWZofDJi+
   lp7syst9NdiPWQzEhmiCp3Cj+zAhor6zMaJ/4n3CFdj0pVKdFsWXi6394
   deTCmeZ+pLfspKWe03bxlhd3Bt4hH4m+WTx3qa5eQEi3GABhieEKirQdZ
   DvRlnWDXqXEjCiLB653ImtOSdA3jrJhI+WY/qDCihJwG2Z28Y3w3LKGRM
   A==;
X-CSE-ConnectionGUID: Iy2uUYlbQ1exZu8XtH1Ubw==
X-CSE-MsgGUID: y6GQXRWlQ/mLDP5iIvT62A==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20562871"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="20562871"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 15:07:14 -0700
X-CSE-ConnectionGUID: iJjWDPhURA+vFnb1HXJilA==
X-CSE-MsgGUID: bwGZPoiOSVCU7sYUpc2SjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="60586358"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Aug 2024 15:07:10 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saMtz-0000vu-0B;
	Sat, 03 Aug 2024 22:07:04 +0000
Date: Sun, 4 Aug 2024 06:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
	linux-mm@kvack.org, lee@kernel.org, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, s.hauer@pengutronix.de,
	christian.gmeiner@gmail.com, Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH v2 1/2] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <202408040501.vvHCkNqn-lkp@intel.com>
References: <20240801160610.101859-2-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801160610.101859-2-mstrodl@csh.rit.edu>

Hi Mary,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-mfd/for-mfd-fixes andi-shyti/i2c/i2c-host akpm-mm/mm-everything linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/x86-Add-basic-support-for-the-Congatec-CGEB-BIOS-interface/20240803-013725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240801160610.101859-2-mstrodl%40csh.rit.edu
patch subject: [PATCH v2 1/2] x86: Add basic support for the Congatec CGEB BIOS interface
config: i386-buildonly-randconfig-005-20240804 (https://download.01.org/0day-ci/archive/20240804/202408040501.vvHCkNqn-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040501.vvHCkNqn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040501.vvHCkNqn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cn_netlink_send" [drivers/mfd/congatec-cgeb.ko] undefined!
>> ERROR: modpost: "cn_add_callback" [drivers/mfd/congatec-cgeb.ko] undefined!
>> ERROR: modpost: "cn_del_callback" [drivers/mfd/congatec-cgeb.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


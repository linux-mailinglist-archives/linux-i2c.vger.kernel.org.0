Return-Path: <linux-i2c+bounces-14772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBA7CDE06F
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 19:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 178623000EA7
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 18:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1CB137930;
	Thu, 25 Dec 2025 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrnWoj97"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3E4DDC5;
	Thu, 25 Dec 2025 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766687494; cv=none; b=BHQ3QxG+PojDCRoQwOEv5ZOitvSoP0GkSf8BsIIRMl5HNtkbqq2QmcBsRHedM7EdB41pgU/ojMwtnzX7dP04qqSy4J88G8740fPb30n/Jajx8B2V/WqThN6h0C/kFPm8/wWsRB3R2FmfNqVCia8rwTEgADs7B4bd9unuDSxhL38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766687494; c=relaxed/simple;
	bh=yqnePlyRgEquO4uP2YmSaSpuW1av6DY6o/KZmR59zYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/JVj+u0MOUCADs85+ZWoOBLuA7iKCgpF72MFtJN1AL65BA1MzCB2EVf9gJw/DCt1OjVrLnwwzfB3wNJ+rhNXQjZFrqX2uuc2ok4hceTYPYA9dGr7Q9FnEaRNYaI8LXjl728WckBBN8/nXCl64ZgW9HYtMi9D23oZOE1KXuzAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrnWoj97; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766687492; x=1798223492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yqnePlyRgEquO4uP2YmSaSpuW1av6DY6o/KZmR59zYs=;
  b=JrnWoj973DtguEPpkrHRNkH2zRG0PQx3NianIjJww8GZ7o0d+kOPZl7M
   U7EgTrLu+3DVr6ldlWio3wyCQAxYdEk/ElIOvpshr8lrLO/aTXDD7p/FK
   RhnPyxCLel5ZOVn4I+B6jUaGPpONTr+w7XQGzUlz7Kd+OgahoYxUcNdya
   ymioT9JzyBrhmh98xGcMc3IjwvCQmioslXs4ZuQZraBVinqnQEfA6tuJE
   mwGZiuWi3QNAqMTQsaB4dln9zPx8+Mk4EXbjsbbjyYyZ5OyPtq+h44YG/
   P7dU5Fzf6hlit9qfFc+UQj8E8f7hQsRHBjCGOz3/SaLHsE/8Jt4lf8+yP
   w==;
X-CSE-ConnectionGUID: S7bIQrsvStmcDIjWJk8QCg==
X-CSE-MsgGUID: yGzFwymuR0iwBNL5FR8LXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="91131219"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="91131219"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 10:31:32 -0800
X-CSE-ConnectionGUID: OUwZDa35RUKTYtnAQpRyrg==
X-CSE-MsgGUID: qkIViPLzR9y7Zfey6SE2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="201171557"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Dec 2025 10:31:26 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYq7Q-000000004NB-2qAZ;
	Thu, 25 Dec 2025 18:31:24 +0000
Date: Fri, 26 Dec 2025 02:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
Message-ID: <202512260206.C1TExj8d-lkp@intel.com>
References: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/i2c-add-i2c_adapter-specific-printk-helpers/20251223-185417
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251223-i2c-printk-helpers-v1-1-46a08306afdb%40oss.qualcomm.com
patch subject: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251226/202512260206.C1TExj8d-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260206.C1TExj8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260206.C1TExj8d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/saa7134/saa7134-i2c.c:31:9: warning: 'i2c_dbg' redefined
      31 | #define i2c_dbg(level, fmt, arg...) do { \
         |         ^~~~~~~
   In file included from drivers/media/pci/saa7134/saa7134.h:14,
                    from drivers/media/pci/saa7134/saa7134-i2c.c:10:
   include/linux/i2c.h:775:9: note: this is the location of the previous definition
     775 | #define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~


vim +/i2c_dbg +31 drivers/media/pci/saa7134/saa7134-i2c.c

^1da177e4c3f41 drivers/media/video/saa7134/saa7134-i2c.c Linus Torvalds        2005-04-16  30  
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13 @31  #define i2c_dbg(level, fmt, arg...) do { \
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  32  	if (i2c_debug == level) \
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  33  		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  34  	} while (0)
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


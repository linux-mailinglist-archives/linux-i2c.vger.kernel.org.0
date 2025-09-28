Return-Path: <linux-i2c+bounces-13259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96926BA6718
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 05:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 101B51888EED
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 03:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02E62550DD;
	Sun, 28 Sep 2025 03:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUqxTB/s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F0E56A;
	Sun, 28 Sep 2025 03:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759030193; cv=none; b=GGk5LC8i/ZB1MexFLvVz3wOyQ5LJG8YdE8zU29QXR8OMOSjNEzhKd2aKqdEqyQkeU1nCAJ7QWnyjquJnngf/Csh/yCWGAww41b7WQzsuqT+AIPmal7zWGE5xOQJQVhFHmrZaN43YoGELUBX7dI1jmXQ28NRb1Ye143huwpOlLds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759030193; c=relaxed/simple;
	bh=/qYZ00/D9vXKmVXlN//jvAkniy/TQDfPH9vzPl7POUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvuI587sCEZ78YTaRQzjUOVXdFuGYzcPfXNmxMV7xm5NX0xbREnH+QZXDX3x3F3FuyfbtINwfw5/k5jDb4Q/4ES4aicVMYoDInQx8XvLnrOjK+XABs6ViwwsKvqU8RpUKtnF04fuE0PbHKNU0kkAJtcrHRCe5BWEKHSVRaJXM2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUqxTB/s; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759030192; x=1790566192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/qYZ00/D9vXKmVXlN//jvAkniy/TQDfPH9vzPl7POUI=;
  b=BUqxTB/smOlVpOKkFvFy1yaKoIFfnbqq3yZaBNAbbtV6W0gWo56wvLeS
   M/J0EaIXYi7sdTwxTqcOp1Js/YA4pvEB/n2T4n+sTwhSVUIKYBKicp4Vz
   zpztEhnWSTBrLZDs2WcVd0cVOJ1LEoe2nOZpxn9Be1187phh83UXFrtBK
   efyPvrwk20xM0lQ2Ud6EYlYntO+tLs+YRiFHR3f9hJjAB7N0MYjO6yJjb
   HDDng7LWssBHmPB07E5QGEAC9fNWgeZXf5lpfPG+3JOCcdSf/WYsYKWs+
   t1aG4zMI/gnrKTCkjeXQor4bUg5yFed5R33NGyihwfIGDDv2INa8gUzRl
   g==;
X-CSE-ConnectionGUID: +7xw1zETSaKNc+J4Sf0W2w==
X-CSE-MsgGUID: dHSZbxiSSsWz+wjK30h7BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="71558467"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="71558467"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 20:29:51 -0700
X-CSE-ConnectionGUID: ZWcjbtE2RdKaDmUHo7Xx+w==
X-CSE-MsgGUID: AuH/uVZoTA25DelqEObdaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="208860171"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2025 20:29:48 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2i6c-0007VH-0F;
	Sun, 28 Sep 2025 03:29:46 +0000
Date: Sun, 28 Sep 2025 11:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make24@iscas.ac.cn>, syniurge@gmail.com,
	shyam-sundar.s-k@amd.com, andi.shyti@kernel.org, wsa@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: fix reference leak in MP2 PCI device
Message-ID: <202509281110.ACsS1CDz-lkp@intel.com>
References: <20250927105729.19164-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927105729.19164-1-make24@iscas.ac.cn>

Hi Ma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.17-rc7 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/i2c-fix-reference-leak-in-MP2-PCI-device/20250927-190047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250927105729.19164-1-make24%40iscas.ac.cn
patch subject: [PATCH] i2c: fix reference leak in MP2 PCI device
config: i386-randconfig-013-20250928 (https://download.01.org/0day-ci/archive/20250928/202509281110.ACsS1CDz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509281110.ACsS1CDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509281110.ACsS1CDz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-amd-mp2-pci.c: In function 'amd_mp2_find_device':
   drivers/i2c/busses/i2c-amd-mp2-pci.c:467:9: error: 'mp2_dev' undeclared (first use in this function)
     467 |         mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
         |         ^~~~~~~
   drivers/i2c/busses/i2c-amd-mp2-pci.c:467:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/i2c/busses/i2c-amd-mp2-pci.c:470:1: warning: control reaches end of non-void function [-Wreturn-type]
     470 | }
         | ^


vim +470 drivers/i2c/busses/i2c-amd-mp2-pci.c

529766e0a01144 Elie Morisse     2019-03-05  456  
529766e0a01144 Elie Morisse     2019-03-05  457  struct amd_mp2_dev *amd_mp2_find_device(void)
529766e0a01144 Elie Morisse     2019-03-05  458  {
529766e0a01144 Elie Morisse     2019-03-05  459  	struct device *dev;
529766e0a01144 Elie Morisse     2019-03-05  460  	struct pci_dev *pci_dev;
529766e0a01144 Elie Morisse     2019-03-05  461  
6bf85ba9e55f65 Suzuki K Poulose 2019-07-23  462  	dev = driver_find_next_device(&amd_mp2_pci_driver.driver, NULL);
529766e0a01144 Elie Morisse     2019-03-05  463  	if (!dev)
529766e0a01144 Elie Morisse     2019-03-05  464  		return NULL;
529766e0a01144 Elie Morisse     2019-03-05  465  
529766e0a01144 Elie Morisse     2019-03-05  466  	pci_dev = to_pci_dev(dev);
10a231ddf6f43e Ma Ke            2025-09-27  467  	mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
10a231ddf6f43e Ma Ke            2025-09-27  468  	put_device(dev);
10a231ddf6f43e Ma Ke            2025-09-27  469  	return mp2_dev;
529766e0a01144 Elie Morisse     2019-03-05 @470  }
529766e0a01144 Elie Morisse     2019-03-05  471  EXPORT_SYMBOL_GPL(amd_mp2_find_device);
529766e0a01144 Elie Morisse     2019-03-05  472  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


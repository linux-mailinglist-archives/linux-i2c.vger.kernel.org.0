Return-Path: <linux-i2c+bounces-12706-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B03CFB4776D
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 23:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501623BF37E
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 21:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C05228725B;
	Sat,  6 Sep 2025 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EODzUgJS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912F4315D45;
	Sat,  6 Sep 2025 21:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757193992; cv=none; b=lm17LC6epfAzem4VJ8WvnHlUl+lwK3neOpKuO+mWhMipzp0X60bKa9NhalAnIsVnicsU8u0mF/tSaUiFAZW5QVPYhoqHI1IG4r9h+9Wy2NTMAKiJkfilKwqKQmH1u78/RKpg1lZIGVsn9iO8sjl31Hyi6tm3n0Hskp3OjcEvnqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757193992; c=relaxed/simple;
	bh=ke5wqDSXDzWZTjT1VQKkoHsP52zTCyKOa1jrumfRM+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzU/xDEc8zbx8sw65dgiQr0dD3NLEwfIG/B5vIKbjZdKLun+VK73dCLy6f5pg35XsBrhgtrCAQhnKAP3ZgLToo9vKz+Ak4zufeuwjM7Pw7QJd2ERvp6iHvcVbD/D8HsK5eO21XBU8dI4mgZSKrT5C2P6jg7XCPhx1laOilc+Q0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EODzUgJS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757193991; x=1788729991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ke5wqDSXDzWZTjT1VQKkoHsP52zTCyKOa1jrumfRM+w=;
  b=EODzUgJSQ/o/vvSNxkUHH1kkADmk9UFARthRcm9430v/7b19NmQ+8VQr
   iPmG6Q50BCFkLFb4a45sBJsuqig8xsIvrolJP9ZyJ0PF1AqpM7CO/5JoG
   GmO9nZFGUqWxo+bV+prx3m5a2KI4y2RKdcN8hKOfObYNyrT1a+4Op9g0a
   SBgCAdGwXZBdZBuN2TxWM+dWR600HME+PvN6j8P1hhyflxuj+0QJWNxCg
   e3tQego4cygoBXlVE9lIHJ9/p/LcTEJ6fVmPzUCTOtz+wivnrzZZadkYR
   oaykQw7AIAR4AGUx7sh0XU51OePyBKCYatihtsqItLW0bugQ9+GkVXfOH
   Q==;
X-CSE-ConnectionGUID: D6UeHcmsT763W1NsElRIig==
X-CSE-MsgGUID: 1eT+arxmSVOiQKa3ERAkMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="70601572"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="70601572"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 14:26:31 -0700
X-CSE-ConnectionGUID: vwB5n0t6RZeSc2w0Q4NDyA==
X-CSE-MsgGUID: E6u5wxe3R8ipXlHmzbaKhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="176766876"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Sep 2025 14:26:28 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv0QT-0001nn-1R;
	Sat, 06 Sep 2025 21:26:25 +0000
Date: Sun, 7 Sep 2025 05:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Artem Shimko <artyom.shimko@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Artem Shimko <artyom.shimko@gmail.com>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: amd-mp2-pci: Simplify PM code using
 DEFINE_RUNTIME_DEV_PM_OPS
Message-ID: <202509070541.ilqlMkml-lkp@intel.com>
References: <20250906001217.3792723-2-artyom.shimko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906001217.3792723-2-artyom.shimko@gmail.com>

Hi Artem,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Shimko/i2c-amd-mp2-pci-Simplify-PM-code-using-DEFINE_RUNTIME_DEV_PM_OPS/20250906-081304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250906001217.3792723-2-artyom.shimko%40gmail.com
patch subject: [PATCH 1/1] i2c: amd-mp2-pci: Simplify PM code using DEFINE_RUNTIME_DEV_PM_OPS
config: x86_64-buildonly-randconfig-002-20250907 (https://download.01.org/0day-ci/archive/20250907/202509070541.ilqlMkml-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070541.ilqlMkml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070541.ilqlMkml-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-amd-mp2-pci.c:393:16: error: no member named 'suspend' in 'struct amd_i2c_common'
     393 |                         i2c_common->suspend(i2c_common);
         |                         ~~~~~~~~~~  ^
>> drivers/i2c/busses/i2c-amd-mp2-pci.c:424:22: error: no member named 'resume' in 'struct amd_i2c_common'
     424 |                         ret = i2c_common->resume(i2c_common);
         |                               ~~~~~~~~~~  ^
   2 errors generated.


vim +393 drivers/i2c/busses/i2c-amd-mp2-pci.c

529766e0a01144 Elie Morisse    2019-03-05  381  
529766e0a01144 Elie Morisse    2019-03-05  382  static int amd_mp2_pci_suspend(struct device *dev)
529766e0a01144 Elie Morisse    2019-03-05  383  {
529766e0a01144 Elie Morisse    2019-03-05  384  	struct pci_dev *pci_dev = to_pci_dev(dev);
529766e0a01144 Elie Morisse    2019-03-05  385  	struct amd_mp2_dev *privdata = pci_get_drvdata(pci_dev);
529766e0a01144 Elie Morisse    2019-03-05  386  	struct amd_i2c_common *i2c_common;
529766e0a01144 Elie Morisse    2019-03-05  387  	unsigned int bus_id;
529766e0a01144 Elie Morisse    2019-03-05  388  	int ret = 0;
529766e0a01144 Elie Morisse    2019-03-05  389  
529766e0a01144 Elie Morisse    2019-03-05  390  	for (bus_id = 0; bus_id < 2; bus_id++) {
529766e0a01144 Elie Morisse    2019-03-05  391  		i2c_common = privdata->busses[bus_id];
529766e0a01144 Elie Morisse    2019-03-05  392  		if (i2c_common)
529766e0a01144 Elie Morisse    2019-03-05 @393  			i2c_common->suspend(i2c_common);
529766e0a01144 Elie Morisse    2019-03-05  394  	}
529766e0a01144 Elie Morisse    2019-03-05  395  
529766e0a01144 Elie Morisse    2019-03-05  396  	ret = pci_save_state(pci_dev);
529766e0a01144 Elie Morisse    2019-03-05  397  	if (ret) {
267e82b9592d0d Richard Neumann 2021-02-01  398  		pci_err(pci_dev, "pci_save_state failed = %d\n", ret);
529766e0a01144 Elie Morisse    2019-03-05  399  		return ret;
529766e0a01144 Elie Morisse    2019-03-05  400  	}
529766e0a01144 Elie Morisse    2019-03-05  401  
529766e0a01144 Elie Morisse    2019-03-05  402  	pci_disable_device(pci_dev);
529766e0a01144 Elie Morisse    2019-03-05  403  	return ret;
529766e0a01144 Elie Morisse    2019-03-05  404  }
529766e0a01144 Elie Morisse    2019-03-05  405  
529766e0a01144 Elie Morisse    2019-03-05  406  static int amd_mp2_pci_resume(struct device *dev)
529766e0a01144 Elie Morisse    2019-03-05  407  {
529766e0a01144 Elie Morisse    2019-03-05  408  	struct pci_dev *pci_dev = to_pci_dev(dev);
529766e0a01144 Elie Morisse    2019-03-05  409  	struct amd_mp2_dev *privdata = pci_get_drvdata(pci_dev);
529766e0a01144 Elie Morisse    2019-03-05  410  	struct amd_i2c_common *i2c_common;
529766e0a01144 Elie Morisse    2019-03-05  411  	unsigned int bus_id;
529766e0a01144 Elie Morisse    2019-03-05  412  	int ret = 0;
529766e0a01144 Elie Morisse    2019-03-05  413  
529766e0a01144 Elie Morisse    2019-03-05  414  	pci_restore_state(pci_dev);
529766e0a01144 Elie Morisse    2019-03-05  415  	ret = pci_enable_device(pci_dev);
529766e0a01144 Elie Morisse    2019-03-05  416  	if (ret < 0) {
267e82b9592d0d Richard Neumann 2021-02-01  417  		pci_err(pci_dev, "pci_enable_device failed = %d\n", ret);
529766e0a01144 Elie Morisse    2019-03-05  418  		return ret;
529766e0a01144 Elie Morisse    2019-03-05  419  	}
529766e0a01144 Elie Morisse    2019-03-05  420  
529766e0a01144 Elie Morisse    2019-03-05  421  	for (bus_id = 0; bus_id < 2; bus_id++) {
529766e0a01144 Elie Morisse    2019-03-05  422  		i2c_common = privdata->busses[bus_id];
529766e0a01144 Elie Morisse    2019-03-05  423  		if (i2c_common) {
529766e0a01144 Elie Morisse    2019-03-05 @424  			ret = i2c_common->resume(i2c_common);
529766e0a01144 Elie Morisse    2019-03-05  425  			if (ret < 0)
529766e0a01144 Elie Morisse    2019-03-05  426  				return ret;
529766e0a01144 Elie Morisse    2019-03-05  427  		}
529766e0a01144 Elie Morisse    2019-03-05  428  	}
529766e0a01144 Elie Morisse    2019-03-05  429  
529766e0a01144 Elie Morisse    2019-03-05  430  	return ret;
529766e0a01144 Elie Morisse    2019-03-05  431  }
529766e0a01144 Elie Morisse    2019-03-05  432  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-i2c+bounces-10147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67645A7E010
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3212C168EF5
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 13:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175081BEF74;
	Mon,  7 Apr 2025 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUDPVglC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA41B042F;
	Mon,  7 Apr 2025 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033728; cv=none; b=IWYqJsY5ifmGFbisEyAfITRVGUH+mwV8jiUS7WnRSUVNGuHJjwty40mSbAhZd9KtcWyxy22Z9eHZuWK7hMw+CsmFs8AX444DcEYDlH6fxPHmVl4mlsLjcVR7+HqXNtU9BNOCah/oZ0iKJcez4siczMQAf1CiNBwioAgIUiFSlYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033728; c=relaxed/simple;
	bh=DRFXhK1JzU2VBd/uy4yTqEAFDJzhKgAsa35yJcL9TRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEA2HVrAhEal1uEWYIjKOoT1+XeR1o7yovhDyjbZSTOrHeThtdvAFCAU55+n/E9gCL17xetH1Lrl9vkZmvI9+YvlJ6718e5fJRWwmoog6couF/PVinDaTgtSOc4OwxcWyKKDClbHPOcx4iPg8Dv3zYvPkfazPmfT37LxFvmAVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUDPVglC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033727; x=1775569727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DRFXhK1JzU2VBd/uy4yTqEAFDJzhKgAsa35yJcL9TRQ=;
  b=lUDPVglCVd3aYZ01tVbJvE+/6loScbr8uDHhBWiRvPVGejO8MiD8d7Kt
   4+kjqHPrgAbN2pHWVtro8G+Mp0k19MHla83V1ttX+PakfG18fQ1lEzuSb
   WjY3IY7gqefeV1Lnoox0k97tE8B6KgpZy9llUB9IL7cLtrzbIVFwBo9tS
   KuVEmGoGN0hi7KLGPyPPq4iO1jssO1bkHKN70CQxsrCK1yshn4UNbSmek
   GTnjvBsI/+4xujRSHZKXbB2LIgWRS5EuGwQiTxsJlXYzKcy10oFw86xGx
   HUE5skkc1iATZ0jkHM00XjpGM0VsB/GzoZQzb35azsISlnMq8KF8VV3j5
   Q==;
X-CSE-ConnectionGUID: d//c37E0S5yvspBqgjPubA==
X-CSE-MsgGUID: R/QF+PjkQDCWzU9HbQMXDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56790412"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56790412"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:48:44 -0700
X-CSE-ConnectionGUID: VK8AjloWTMKxZsrS58prFA==
X-CSE-MsgGUID: fPEcj9zoSOqCLCkYQ+Ns4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="165163324"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Apr 2025 06:48:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1mq7-0003S3-0q;
	Mon, 07 Apr 2025 13:48:39 +0000
Date: Mon, 7 Apr 2025 21:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 2/6] i2c: core: Unify the firmware node type check
Message-ID: <202504072133.J8njROAD-lkp@intel.com>
References: <20250407095852.215809-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095852.215809-3-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-core-Drop-duplicate-check-before-calling-OF-APIs/20250407-180528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20250407095852.215809-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 2/6] i2c: core: Unify the firmware node type check
config: arm-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072133.J8njROAD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072133.J8njROAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504072133.J8njROAD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/i2c-core-slave.c:117:3: error: call to undeclared function 'for_each_child_node_scoped'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |                 for_each_child_node_scoped(fwnode, child) {
         |                 ^
>> drivers/i2c/i2c-core-slave.c:117:44: error: expected ';' after expression
     117 |                 for_each_child_node_scoped(fwnode, child) {
         |                                                          ^
         |                                                          ;
>> drivers/i2c/i2c-core-slave.c:117:38: error: use of undeclared identifier 'child'; did you mean 'ihold'?
     117 |                 for_each_child_node_scoped(fwnode, child) {
         |                                                    ^~~~~
         |                                                    ihold
   include/linux/fs.h:2758:13: note: 'ihold' declared here
    2758 | extern void ihold(struct inode * inode);
         |             ^
   drivers/i2c/i2c-core-slave.c:118:29: error: use of undeclared identifier 'child'; did you mean 'ihold'?
     118 |                         fwnode_property_read_u32(child, "reg", &reg);
         |                                                  ^~~~~
         |                                                  ihold
   include/linux/fs.h:2758:13: note: 'ihold' declared here
    2758 | extern void ihold(struct inode * inode);
         |             ^
   4 errors generated.


vim +/for_each_child_node_scoped +117 drivers/i2c/i2c-core-slave.c

    97	
    98	/**
    99	 * i2c_detect_slave_mode - detect operation mode
   100	 * @dev: The device owning the bus
   101	 *
   102	 * This checks the device nodes for an I2C slave by checking the address
   103	 * used in the reg property. If the address match the I2C_OWN_SLAVE_ADDRESS
   104	 * flag this means the device is configured to act as a I2C slave and it will
   105	 * be listening at that address.
   106	 *
   107	 * Returns true if an I2C own slave address is detected, otherwise returns
   108	 * false.
   109	 */
   110	bool i2c_detect_slave_mode(struct device *dev)
   111	{
   112		struct fwnode_handle *fwnode = dev_fwnode(dev);
   113	
   114		if (is_of_node(fwnode)) {
   115			u32 reg;
   116	
 > 117			for_each_child_node_scoped(fwnode, child) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


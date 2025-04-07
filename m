Return-Path: <linux-i2c+bounces-10140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 161A4A7DE06
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 14:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0AFF1888B7F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 12:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3229F24DFFB;
	Mon,  7 Apr 2025 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4DkUFiO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0F22D4C3;
	Mon,  7 Apr 2025 12:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029939; cv=none; b=saAREuGulwr462xZcltMJrox4Gt+zaa2aQ72pfCRKikVfTO2pEUbySm8Ag+v+jDarO5/mAkYo+yRK9cEGGMZjm55oOzQAj8YXoVH22pklr0fu0WDt92tqesTod/PCixJaVJ+y1xdpJXGb2I2/foMXna31eG/LgbBOKL/DFaqm4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029939; c=relaxed/simple;
	bh=oi7xvK7sq6Mk30ayGug3Cz0ce7Qbzy8vn4VUDnl94Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIsQCgYTAL6C4wzXWcxwKGpP8mQ1zJoFym0WAHD9ItPf8nM+1x5jZbpnBBz5XX/rd+yYtKP6zw3y+N2qWvMY/BMQZJEZ61xjkuMUaChIWbCM/T17YBLRL4LlcyeHJodxDEPWcDTLYynhBIBDMLOrTvP2Jb3pBxfI5LLLPi6aKEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4DkUFiO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029937; x=1775565937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oi7xvK7sq6Mk30ayGug3Cz0ce7Qbzy8vn4VUDnl94Fk=;
  b=Q4DkUFiOhFowklIqPzGtu3CwTt1Ua2c3AnBn0Easq2fyZfO1Gcm0NPzg
   InRLUH9+Mr/4ccMFnYrY5Q7M9hqDtZqT/CHAoK8YdqhQ5qw4szTej+2AC
   Ay8SkNFFQ7d/SUm5X+LMI1T0UeJCJhPkw42dHy5tEyDGSFzx0nzd0kiFk
   tfvbrvzByZsct/keSi+Da9NiR9SSZizHbTX0MKoKmMJiDfZQpi4ZKCCoU
   9btS4r4Wq9ZR8NLYhqi+WkGONyuTDFV69gKtcIbj9jA2/hVVv50JZKSCr
   Z7Zu578OGubQI0QUgtBc6BlZ6gr92u0v0G4+D6UCV6CwKDTqym0L61/UF
   Q==;
X-CSE-ConnectionGUID: pXrqrFN/Sr+4zIAyrmGRJQ==
X-CSE-MsgGUID: aXZ3tTynQv6eWt25y4c34Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44660999"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="44660999"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:45:37 -0700
X-CSE-ConnectionGUID: 9P08ZSozR0Kdsb1iejdrkw==
X-CSE-MsgGUID: S8frljUTRLKrkL7PDqw5QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127829153"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Apr 2025 05:45:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1lr2-0003OR-0T;
	Mon, 07 Apr 2025 12:45:32 +0000
Date: Mon, 7 Apr 2025 20:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 2/6] i2c: core: Unify the firmware node type check
Message-ID: <202504072041.Bv9mOk4o-lkp@intel.com>
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
config: arc-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072041.Bv9mOk4o-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072041.Bv9mOk4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504072041.Bv9mOk4o-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/i2c/i2c-core-slave.c: In function 'i2c_detect_slave_mode':
>> drivers/i2c/i2c-core-slave.c:117:17: error: implicit declaration of function 'for_each_child_node_scoped'; did you mean 'for_each_child_of_node_scoped'? [-Wimplicit-function-declaration]
     117 |                 for_each_child_node_scoped(fwnode, child) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 for_each_child_of_node_scoped
>> drivers/i2c/i2c-core-slave.c:117:52: error: 'child' undeclared (first use in this function)
     117 |                 for_each_child_node_scoped(fwnode, child) {
         |                                                    ^~~~~
   drivers/i2c/i2c-core-slave.c:117:52: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/i2c/i2c-core-slave.c:117:58: error: expected ';' before '{' token
     117 |                 for_each_child_node_scoped(fwnode, child) {
         |                                                          ^~
         |                                                          ;
>> drivers/i2c/i2c-core-slave.c:115:21: warning: unused variable 'reg' [-Wunused-variable]
     115 |                 u32 reg;
         |                     ^~~


vim +117 drivers/i2c/i2c-core-slave.c

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
 > 115			u32 reg;
   116	
 > 117			for_each_child_node_scoped(fwnode, child) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


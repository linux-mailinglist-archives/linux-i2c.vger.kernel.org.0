Return-Path: <linux-i2c+bounces-5419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA9F952D8C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 13:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAA291C25263
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 11:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2741714AE;
	Thu, 15 Aug 2024 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoNcC9dU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C6214AD1A
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723721562; cv=none; b=KhBp6nNWXrst0MW5/LmLH/km/fTaEwtfhYSqoLzsRpTTSuLBizDqnq+oJbhEMo9pEN/9QyveCmOiRCmDaUri3DCpRGyCKFnVfBamS+UXeRy7D53VJwm79nrLBnYfaxsNCZIcsKLFIAQ2IJsuFAN+gpd4q4kmNJ0fbyL8UFHw9k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723721562; c=relaxed/simple;
	bh=qdrCPdY3XBiYUEslb4KEhpqzgaSlUPGZy1LMF2qmkPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBi06HxMBkJTdZVd5j0zynrUr6CoV6Wp6NASFA1M1MkgYUqWl0EBh7gnHUO+XWZj1+cA5AtJWA5NIEOSmcW3t7wPG/YSuLxUuiE0nN80IKXZw5n3EZinKNeFNtM4B8+ae6zuFWClE/G856gG5xzqKG42ZAsDIMsQL8Sh1ns6lug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoNcC9dU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723721560; x=1755257560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qdrCPdY3XBiYUEslb4KEhpqzgaSlUPGZy1LMF2qmkPQ=;
  b=FoNcC9dUn192Aoiw3J4Ul1+U2m/aP+Ew8dBlPfbuqQrhShARvPVKH0fI
   7xyFYnasj/++wvEnzEHwbkCxUSOX/lMtH/0zUtzoeiWdsiU3cVOWjufAW
   1bgieIbC3W41o0/bQSbG5MQttVew8Gva3Sta9SVGiUxC1t3370VkhgPno
   RHhsMvVjBHzgJlDWvNvUy773SZ8hSiepQ1364N4CROi/TtatCsoKblZbW
   LfLpyQBZiBX/eUnRO3eqGVrmDeJld4NWg/pzdIiwkgeF4wew37HFrMxmA
   0UWexMSGg+Yeg7wSP89DFfdnStJc5AZOUb19tnxeV0gqJpU0/d1YM6cnh
   A==;
X-CSE-ConnectionGUID: Lc1K1vygStmUOexafuoxRA==
X-CSE-MsgGUID: E+Yr8ZIHSTGLughC5MNlxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="47373576"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="47373576"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 04:30:16 -0700
X-CSE-ConnectionGUID: /O9zFCFMQqifd/D9NwmFJw==
X-CSE-MsgGUID: 7rEWyuojTLGbGnG8fgtNig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="59480869"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Aug 2024 04:30:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seYgG-0003Ve-0U;
	Thu, 15 Aug 2024 11:30:12 +0000
Date: Thu, 15 Aug 2024 19:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
Subject: Re: [PATCH] i2c: core: Lock address during client device
 instantiation
Message-ID: <202408151708.WYTNiDnN-lkp@intel.com>
References: <3b1964fa-56fd-464f-93d3-98d46c70b872@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b1964fa-56fd-464f-93d3-98d46c70b872@gmail.com>

Hi Heiner,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linus/master v6.11-rc3 next-20240814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/i2c-core-Lock-address-during-client-device-instantiation/20240814-223311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/3b1964fa-56fd-464f-93d3-98d46c70b872%40gmail.com
patch subject: [PATCH] i2c: core: Lock address during client device instantiation
config: x86_64-buildonly-randconfig-001-20240815 (https://download.01.org/0day-ci/archive/20240815/202408151708.WYTNiDnN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151708.WYTNiDnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151708.WYTNiDnN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/i2c-core-base.c:919: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Serialize device instantiation in case it can be instantiated explicitly


vim +919 drivers/i2c/i2c-core-base.c

   917	
   918	/**
 > 919	 * Serialize device instantiation in case it can be instantiated explicitly
   920	 * and by auto-detection
   921	 */
   922	static int i2c_lock_addr(struct i2c_adapter *adap, unsigned short addr,
   923				 unsigned short flags)
   924	{
   925		if (!(flags & I2C_CLIENT_TEN) && !(flags & I2C_CLIENT_SLAVE) &&
   926		    test_and_set_bit(addr, adap->addrs_in_instantiation))
   927			return -EBUSY;
   928	
   929		return 0;
   930	}
   931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


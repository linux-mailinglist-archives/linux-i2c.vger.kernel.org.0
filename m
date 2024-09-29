Return-Path: <linux-i2c+bounces-7073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1239892BD
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 04:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EFB41C22575
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 02:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6067B1BF37;
	Sun, 29 Sep 2024 02:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/ZjhZTb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D631CA9C;
	Sun, 29 Sep 2024 02:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727577735; cv=none; b=emUfCkSpaExNTJunyPubjPT6Q9I0iG9m8skb5CqqCm8zluNUEHgyGfKB5a3v33/DP4SmgZofeqirO8L66hkP++/EknliEHOQGWHrzf5tPPRh+GTNn+7sW6+8/ErQB8EfavPE7yZudqKd0gyfN2cXsrG7HBVovjrbtSR+QENvWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727577735; c=relaxed/simple;
	bh=YPx5QA97jipQMMLwP45wplNXnHwAHBwZK8de9l31+I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3EnOqbrJV7TYenwHZfQj7aN3XomNQMiyFAnCghFZxb8LmzMAOGtYoH7BLyNXSHMmJWL7F9qOudunuFj04f8EbIwjZXmNjxe7jgXg0gYATjBt/54Mc02oAgEj4dhmg+DWGkTdXLp4IBrBosLyzAt1QBQlvCtO3oGAtO4X6Ua7Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/ZjhZTb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727577734; x=1759113734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YPx5QA97jipQMMLwP45wplNXnHwAHBwZK8de9l31+I4=;
  b=M/ZjhZTbCBudGK/+mIeOdaK+ylyrhDE2zRJSBqsfgO17RuBcdLWPXHKD
   t6xlLH1Lb6ojUB9iz7gPxPbGirV4RhmMES10Xt5JGqsyTyPH2XnQuxrFt
   GMKDs2c1NNPHZQjpYecqn9eeRSVVZ7TzXL+3tZcY2uDarTN3c6Y1lgMmP
   hB+KDuV6CT3xke0HxIHy8FqGWrNzzSsyO+gVnIdDVEnPBAT9oxQl1ACR1
   Q8f+v1WkgEM+NFQBWDCEGkWNOpFwsJV3C937cBhFFU8uPGmB9kmWyRK37
   WBN+s6i28U0crikhrtmYLAOxcccoM+I8PmVNtm6R2R/CZ1pbTx5mLUuEI
   w==;
X-CSE-ConnectionGUID: ygH1ZY9OTCCF+xgFMv0xpg==
X-CSE-MsgGUID: dnH9syX+REefFvE42NwM8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30390405"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="30390405"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 19:42:13 -0700
X-CSE-ConnectionGUID: jGBL3PlkSTqpE3bOuJ2t/g==
X-CSE-MsgGUID: LuVzNOm3T9uf/yX7GmShIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77311263"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2024 19:42:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sujst-000NqV-1Z;
	Sun, 29 Sep 2024 02:42:07 +0000
Date: Sun, 29 Sep 2024 10:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lee@kernel.org, sre@kernel.org,
	tsbogend@alpha.franken.de
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v5 6/6] i2c: Add driver for the RTL9300 I2C controller
Message-ID: <202409291025.P4M4O1F2-lkp@intel.com>
References: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on andi-shyti/i2c/i2c-host sre-power-supply/for-next linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/dt-bindings-reset-syscon-reboot-Add-reg-property/20240926-060355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240925215847.3594898-7-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH v5 6/6] i2c: Add driver for the RTL9300 I2C controller
config: csky-randconfig-r111-20240929 (https://download.01.org/0day-ci/archive/20240929/202409291025.P4M4O1F2-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409291025.P4M4O1F2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291025.P4M4O1F2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-rtl9300.c:321:27: sparse: sparse: symbol 'rtl9300_i2c_quirks' was not declared. Should it be static?

vim +/rtl9300_i2c_quirks +321 drivers/i2c/busses/i2c-rtl9300.c

   320	
 > 321	struct i2c_adapter_quirks rtl9300_i2c_quirks = {
   322		.flags		= I2C_AQ_NO_CLK_STRETCH,
   323		.max_read_len	= 16,
   324		.max_write_len	= 16,
   325	};
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


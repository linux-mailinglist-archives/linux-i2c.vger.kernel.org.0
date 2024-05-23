Return-Path: <linux-i2c+bounces-3649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5798CD294
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 14:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCAEB1C20B6D
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 12:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C01314A4D2;
	Thu, 23 May 2024 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdhItuci"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E06C8174C;
	Thu, 23 May 2024 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716468559; cv=none; b=d8E6/jNTPBc5uI5jF4heLEydrmXrE0L6xwaQe4tP7tPtq4kiz1LhlOOXBeo7oxAgSHMN7Wlw2biuXe8Q2qk2smH34KzJhikXG7HDKHI2ENSJlgE5j1UiOMEj3YoYSqx4mTgfjq9IbiW8FuPyvoLoXrOvoG8PsVzXbDu4Bo0zIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716468559; c=relaxed/simple;
	bh=e1/5ituq3BLc4p6hJQCp0rH729ZvAK/JPQCVOmmZpdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrzPTujFrHtqi82cO9sR9Xdbg/0Yg6AsTpdHcZW42BgwA3/cvgJWIKXoWyxQyiPIytmJ6mfSNprfevm02TQah2U86G+wqYNYVJ3+WXbsOkaQGm0UhUvvg6SRXdDjG1hcnSWILGlA1zpzO/uE0PPzT4wJpmJMTHXIBSKRF2JY6HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdhItuci; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716468557; x=1748004557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e1/5ituq3BLc4p6hJQCp0rH729ZvAK/JPQCVOmmZpdg=;
  b=BdhItuciNLwKbdJeHrSFq/Fzx72rUDmS25J0LfUHefFmVqlsHZiupvPh
   on7mXYxRyy6hn20dJxW/PiQcLbqsP5h2kU7xCLXL7fxE5Gh0gWxpLKIOa
   ujPgjw5REhN92vftn1ZBmM91Fwa3FhaEcX3IbAvQKAM1iMzNTFXWkMAie
   YSvG5aEY+nkSQdvvi8Ngl78lYyIEL+KnWY8pu0XW3gDidTeSpwPX681sD
   f/HO3p7jDNLkReFcsDpnGYSLzjkF59X8TPbahv3s8Air9z36A4Q2NmjRj
   sk1DNwKGKhLoYcbFrq8p7SDrnM/uuC6kpuU70lpUeBEe/PBEd8UWIAlZn
   Q==;
X-CSE-ConnectionGUID: VuqQH3vpRDuW1J6YG7BL1Q==
X-CSE-MsgGUID: Mkw63Yt/Sx+0J+xjmj1+sA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23915456"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="23915456"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 05:49:16 -0700
X-CSE-ConnectionGUID: SjSzpwZNR5OHnoz4eUBT7g==
X-CSE-MsgGUID: ZdOLjEcxRHGI3Jt0zs7NxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="56886990"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 May 2024 05:49:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA7sZ-0002rl-2g;
	Thu, 23 May 2024 12:49:08 +0000
Date: Thu, 23 May 2024 20:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, eajames@linux.ibm.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ninad@linux.ibm.com, lakshmiy@us.ibm.com, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	andrew@codeconstruct.com.au, joel@jms.id.au, robh@kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org, andi.shyti@kernel.org,
	broonie@kernel.org
Subject: Re: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
Message-ID: <202405232008.olE9azVd-lkp@intel.com>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522192524.3286237-18-eajames@linux.ibm.com>

Hi Eddie,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.9 next-20240523]
[cannot apply to robh/for-next broonie-spi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/spi-dt-bindings-Document-the-IBM-FSI-attached-SPI-controller/20240523-033334
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240522192524.3286237-18-eajames%40linux.ibm.com
patch subject: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
config: arm-randconfig-001-20240523 (https://download.01.org/0day-ci/archive/20240523/202405232008.olE9azVd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405232008.olE9azVd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405232008.olE9azVd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dts:13.2-37 Properties must precede subnodes
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


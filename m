Return-Path: <linux-i2c+bounces-9682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F19A4BB2C
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 10:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED30E1894181
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 09:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26F81F1505;
	Mon,  3 Mar 2025 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXOcgK1Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5AB1F1300;
	Mon,  3 Mar 2025 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740995395; cv=none; b=U9y0PqEtmsqngQusPbsNmeM7vXIe0Opa3To1dCA4gGumVFHWoWrcjcUCJeCsBe0R9kqIVz4ion0Pn3xpDSTotZk9FA5jKoYVHsIDeAJCtU0ZYLGXNMLA2U2FPe5s8m2zYoS4w4PuDtmF4pv8jcjnoD032/sloUZaASdJzZQ+cQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740995395; c=relaxed/simple;
	bh=Bo1yf188xcuw3IK9QrIc76aTVVJHnLWeA4UExXopE4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raAkuFZny4UEH9hkr7D3/1FsPBaIvXVrpdlNQlA/zAZDoNs5HxhcwOuKHL6HHr+gU8VYab72mQVHErheBr3RQUgD41a8rTTCPx7f9/P70LSVhNj7dmErDKcgHp6iwy/EfYbatJAIPYXFeqOi1E1XNMXwCHQp3GSk5CEb9uU0MYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXOcgK1Z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740995394; x=1772531394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bo1yf188xcuw3IK9QrIc76aTVVJHnLWeA4UExXopE4E=;
  b=bXOcgK1ZoWELxvKzQBTaALpasguziCxtI8p3xEPSRWrDxFjCGEAaAA4Y
   28V0FtShgdA+comx7BmpF90ob+jS3TdcvaBURWC6uCS090VwwnV1xKv4F
   AQ3fv/otVOIP/bAB2xGtLXk2cnMETteJT3F2vNDhhh7Nar9/jXA5W7Tpr
   Vj1r15Emna8CLeIOLF1xPse9mluENtv740ZBwT3CZEwvUPH2eZ9IvN76d
   LyjFyxj1XP1//NX+hEsyPiRE7FOu+cnPGjXRD/WbHj/vuTCXKbDgiBi76
   hrAHVQM5O0ljrZtMp6QJZCWjSJTj/0LtdS9kuYpD1HEwTORfeXk9B+lOP
   w==;
X-CSE-ConnectionGUID: gvfph5E1TKyE8AQ3w0HZKg==
X-CSE-MsgGUID: I0B8c/VYRz6WW1NqQOf6WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="44674334"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="44674334"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 01:49:53 -0800
X-CSE-ConnectionGUID: 4SzUMc1GRdavlZ+yhy7IMg==
X-CSE-MsgGUID: uk7hq89SSX+Z07yFzn0LuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118503785"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Mar 2025 01:49:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp2Qn-000IId-0B;
	Mon, 03 Mar 2025 09:49:49 +0000
Date: Mon, 3 Mar 2025 17:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.chan@amd.com,
	Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: Re: [PATCH] i2c: amd-isp: Add ISP i2c-designware driver
Message-ID: <202503031743.THpYJdQE-lkp@intel.com>
References: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228164519.3453927-1-pratap.nirujogi@amd.com>

Hi Pratap,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.14-rc5 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pratap-Nirujogi/i2c-amd-isp-Add-ISP-i2c-designware-driver/20250301-005001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250228164519.3453927-1-pratap.nirujogi%40amd.com
patch subject: [PATCH] i2c: amd-isp: Add ISP i2c-designware driver
config: x86_64-randconfig-005-20250303 (https://download.01.org/0day-ci/archive/20250303/202503031743.THpYJdQE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503031743.THpYJdQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031743.THpYJdQE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "isp_power_set" [drivers/i2c/busses/i2c-designware-amdisp.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


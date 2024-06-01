Return-Path: <linux-i2c+bounces-3740-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D32818D7297
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 00:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E57A281B62
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 22:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC1E2D03B;
	Sat,  1 Jun 2024 22:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2eX01Sa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD8E2C87A
	for <linux-i2c@vger.kernel.org>; Sat,  1 Jun 2024 22:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717282371; cv=none; b=pUrqABFy7CqQ3dD1PVFUtLhcP7mVzJ0f6EAyihu9t/TdRYB0OYqZVUDkWoWJI0aBQUwK5QI8Hv2s9SI0g7a/Bj312K5vFj059QIlu2nHx7QvwFS30+2ztPg+OzBwL9XWRQoLvKp/j/BoGRe/3SNIalbESH4kEo4RZJtnlqobREw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717282371; c=relaxed/simple;
	bh=ocXYML42mn784O1Op9lmjxrbuZKI080VDiVmCKhpP3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8FJAntghQTtuaY2R68WP9AfU9upQfDhkVcsjOAEpp9DLlFlU3HXmzvV9OXXxeIhzcqtFPTtDKhHGRNQSF4NzDa/Rb+/x34GRMIQv7HYh5f/usAMpOZoP5WnyE7LZ2HCppQ3EcNQU6YTGkh/hPRQS5UeJyUN9z1xMgsbc0gn2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2eX01Sa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717282370; x=1748818370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ocXYML42mn784O1Op9lmjxrbuZKI080VDiVmCKhpP3w=;
  b=N2eX01Saw6O/rPw1F9o2jl4ebp8Rh3FSMIymVlgR+qvXa6BkmUfdWXOr
   nOCm8vZtr3dX1Gfz1Jhg0Z++3/IftRN4hCKAewwk8JxaTuE/nrqeeVSg7
   JjXvfK1Mi1JsB8QR1l+ELhpIiDxP1EoTeaiXl28JGktm4I45JOYL40dee
   GVcmsrE4AN6Wm3huuOx+jqrhvj27VwN7CrDu+EJ0Ao6kX50nkDeF9KvUD
   s/gpFL0MLXgJNho9TXqBy586ChWTIq/synxTs32QX+pOCPhruV9zBW9xn
   j+vU1YU2PegJzr+XqSzRcNkFv4pwr5KTK7OezoyNXciutUgXwtKV7GJem
   A==;
X-CSE-ConnectionGUID: OJqjrrIpQ5O2nggAA9JLcw==
X-CSE-MsgGUID: jeGnKzYbTSut6KNRAzT8kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="24925628"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="24925628"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 15:52:49 -0700
X-CSE-ConnectionGUID: X+C4K3ZdTLGS1QQXdigOlA==
X-CSE-MsgGUID: rpHvPhY+RbOpq0dXtC/gsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="36420804"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jun 2024 15:52:47 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDXae-000JS7-1y;
	Sat, 01 Jun 2024 22:52:44 +0000
Date: Sun, 2 Jun 2024 06:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <gerhard@engleder-embedded.com>,
	linux-i2c@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andi.shyti@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: Re: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
Message-ID: <202406020634.cfpd5wMw-lkp@intel.com>
References: <20240601192846.68146-2-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601192846.68146-2-gerhard@engleder-embedded.com>

Hi Gerhard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gerhard-Engleder/i2c-keba-Add-KEBA-I2C-controller-support/20240602-040548
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240601192846.68146-2-gerhard%40engleder-embedded.com
patch subject: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240602/202406020634.cfpd5wMw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406020634.cfpd5wMw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406020634.cfpd5wMw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-keba.c:568:34: warning: 'ki2c_devtype' defined but not used [-Wunused-variable]
     568 | static struct platform_device_id ki2c_devtype[] = {
         |                                  ^~~~~~~~~~~~


vim +/ki2c_devtype +568 drivers/i2c/busses/i2c-keba.c

   567	
 > 568	static struct platform_device_id ki2c_devtype[] = {
   569		{ .name = KI2C },
   570		{ }
   571	};
   572	MODULE_DEVICE_TABLE(platform, ki2c_devtype);
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


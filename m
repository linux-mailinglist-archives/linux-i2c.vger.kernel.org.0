Return-Path: <linux-i2c+bounces-11087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE41EABE62B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 23:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98AA1188A6F9
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC6C25E814;
	Tue, 20 May 2025 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3VL1+gF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1C524C09E;
	Tue, 20 May 2025 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776824; cv=none; b=BG4NHua2dY6u1/EPm2vPDRejZA6QgUD/Tw19FACYiBehGkdLk7Mo3r4TDdpvyq0O8pSStOORQQp1/ObF2CbV4mSLgmlv5WPHWB28qW/EGiM0c/Jc20cQ7xFQuV6S+HLnmSFhjA5XiSRV5TiqNgNDMu41YlA5OpqPpt70Vn01DP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776824; c=relaxed/simple;
	bh=2dBBkVKAjPqMQO6yAxkJdcJQvunb0imiwfvphMP3bMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mV/twWMJeYfcGzs1uNwmtMrYTsfNZ9+Z7oM1GmU0V8wXuTMesf9vLKbKxxfIGbzxh0x76mdgxkV2zAGoN9pTb9rf/LaJJU5r06SPYaok3C6Y4l/2QU7j+FaaQocA3ap9yHFIbG7kXN1ICaeVPFgOe9l9jdz/QlsT4HZVJkvmAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3VL1+gF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747776823; x=1779312823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2dBBkVKAjPqMQO6yAxkJdcJQvunb0imiwfvphMP3bMs=;
  b=U3VL1+gFt75Uj4DOsCKLH8QYfNgR1GPQY25lWmrGXmqBYWIqCGGvhOI2
   98x8ef9oOE/zUESh2vz7JOiX7n743wjbCbOU+oxyMjIg3tbpIB4aTTSm2
   K5vsfPpNre5pjFCby2u4AH7tyQBT0JnnpmUhGSfbwr9O/2CyIpw9+1n94
   j37ai65XObRaCs62/h/1ZFZttnMil1/YAh3VFSKGLR7RklFSiKxqgQboX
   HVARqCR13II+eoh8NNPg3E0ZwHbWIIcAHbntV2JaCeI05dPCE0pyHIdbf
   lnwATr0nFw+A4a7E90pYxamnvm1QWvlv4q5/I2Y47Qed1yKy9qHXwf5mu
   g==;
X-CSE-ConnectionGUID: FX8r+Xt7Q9SzCLKEYX4Fig==
X-CSE-MsgGUID: dvasTuh4QGuMPUdGONXEgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49886560"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49886560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 14:33:41 -0700
X-CSE-ConnectionGUID: qKGsHbZ/Soe+T5yrGWF48w==
X-CSE-MsgGUID: Rx5ednNxSfq2WVZorJIWPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143811827"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 14:33:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHUab-000NaO-0J;
	Tue, 20 May 2025 21:33:33 +0000
Date: Wed, 21 May 2025 05:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: a0282524688@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v11 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
Message-ID: <202505210555.mud6jZoi-lkp@intel.com>
References: <20250520020355.3885597-7-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520020355.3885597-7-tmyu0@nuvoton.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on mkl-can-next/testing groeck-staging/hwmon-next abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.15-rc7]
[cannot apply to lee-mfd/for-mfd-next brgl/gpio/for-next next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/a0282524688-gmail-com/mfd-Add-core-driver-for-Nuvoton-NCT6694/20250520-100732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250520020355.3885597-7-tmyu0%40nuvoton.com
patch subject: [PATCH v11 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
config: i386-randconfig-013-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210555.mud6jZoi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210555.mud6jZoi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210555.mud6jZoi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/nct6694-hwmon.c:12:10: fatal error: linux<mfd/core.h: No such file or directory
      12 | #include <linux<mfd/core.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +12 drivers/hwmon/nct6694-hwmon.c

  > 12	#include <linux<mfd/core.h>
    13	#include <linux/mfd/nct6694.h>
    14	#include <linux/module.h>
    15	#include <linux/platform_device.h>
    16	#include <linux/slab.h>
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


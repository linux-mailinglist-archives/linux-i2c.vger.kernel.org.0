Return-Path: <linux-i2c+bounces-14528-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED2ACBB0CE
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Dec 2025 16:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF89D300EA15
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Dec 2025 15:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE1026056D;
	Sat, 13 Dec 2025 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJFXRYZJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659F8221726;
	Sat, 13 Dec 2025 15:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765639202; cv=none; b=Jx4n97C8JG6tia9cBwkzD2AWzauK13yBs1UeLvyo6cCKtX5ZjfWsqwiXcvNVXE9Dte7b1o7JoCeyPyh2zWc/qnK+/OHbVO012DJt2U102KvOn/F9phFawiwEj3JsO7XCaXfFNOGBgXYpVPl8vD4fUn1wJwMyRNLHkh1iE1rGaQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765639202; c=relaxed/simple;
	bh=SfRsyNZlXG5eeLM8ItwniBCiImW1HWheHg8vcn/Omxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaTxkBHxiScdS3wkKzNzqDs77Rz+JyrPwjsZBjBgiHe/uQV8i5zyWGaSoNLBBMgiOjndWkFExQs6vVCGHCgJVlhTyEXxVjp6VwMKdUdgE99mgCCWVjIF0bQMRi+SYX15YPOCMFjhkCwX9SLd3Lr41zpxvoTkJ4xW+H1aVwJYRXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJFXRYZJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765639200; x=1797175200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SfRsyNZlXG5eeLM8ItwniBCiImW1HWheHg8vcn/Omxo=;
  b=EJFXRYZJmEpSyB9vXIZ5ouKMJXCbo4zgOywVXuHXkf8elqdfLzPdPXyx
   zy5QTOo7Ap+jqEkupX2+OPd4mJlefRwMGY4WLqVxuubBaLhd9RB0h3gGO
   TntDcMbgb95si37POsSbOr8hs+3U0/SLYKTSaGkPEzrP8t4/VAXem/g8O
   fujJjjmiIl9NV+q1eDdLrZzIFLujRNzxPo57t4gpqgtuv5UkBST6dT6k2
   MHrAHvHiR1rwfll6RMQ02FKWijylMDwEGiyheTJF4ySkdCWgi33Y8Vtds
   xFyEY4BevpKJLIfCoJbh0kFOEXbkzcuGn7MxBhJY5IwnJ1sYsqVPbsdRn
   g==;
X-CSE-ConnectionGUID: UbyUTfSIR22KsafAM62eNA==
X-CSE-MsgGUID: f86AqWXySEyhH6qMZ/AlDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67490529"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67490529"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 07:20:00 -0800
X-CSE-ConnectionGUID: z0Y2RG6kQ2uPXLwf/ZjKXw==
X-CSE-MsgGUID: Yp1UjaFaR1KDmEwIYcyCqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197325290"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 07:19:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vURPS-000000007nN-3CMB;
	Sat, 13 Dec 2025 15:19:50 +0000
Date: Sat, 13 Dec 2025 23:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ramiro Oliveira <ramiro.oliveira@advantech.com>,
	Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Wenkai Chung <wenkai.chung@advantech.com.tw>,
	Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>,
	Hongzhi Wang <hongzhi.wang@advantech.com>,
	Mikhail Tsukerman <mikhail.tsukerman@advantech.com>,
	Thomas Kastner <thomas.kastner@advantech.com>,
	Ramiro Oliveira <ramiro.oliveira@advantech.com>
Subject: Re: [PATCH 1/8] Add Advantech EIO MFD driver
Message-ID: <202512132239.HrAPSw6z-lkp@intel.com>
References: <20251212-upstream-v1-v1-1-d50d40ec8d8a@advantech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-upstream-v1-v1-1-d50d40ec8d8a@advantech.com>

Hi Ramiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9771d0dbe18dd643760431870a6abf9b0866bb0]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramiro-Oliveira/Add-Advantech-EIO-MFD-driver/20251213-004905
base:   d9771d0dbe18dd643760431870a6abf9b0866bb0
patch link:    https://lore.kernel.org/r/20251212-upstream-v1-v1-1-d50d40ec8d8a%40advantech.com
patch subject: [PATCH 1/8] Add Advantech EIO MFD driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512132239.HrAPSw6z-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132239.HrAPSw6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132239.HrAPSw6z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mfd/eio_core.c:37 cannot understand function prototype: 'uint timeout = DEFAULT_TIMEOUT;'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


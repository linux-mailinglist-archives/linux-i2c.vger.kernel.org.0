Return-Path: <linux-i2c+bounces-7581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8805D9B010E
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 13:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E8C91C20DB6
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 11:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0F51FF7B5;
	Fri, 25 Oct 2024 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEcU7ct/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100191C0DF0;
	Fri, 25 Oct 2024 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855156; cv=none; b=s8TcqKkio1Z9JEXLS4x8hHxMj93axLIx2V/h1nayGM54SRNtGqG1kqKaCAkcxuOHQFBkYEiybp4OfD6+KnCFBrXX6s8QZYMeRy9EybzBdiUq9DC4E6/o1Smg13qQ0KVqOMOTfu8OB2CXKGswyiLQ9VcvuFFXBQ57/UE8nvPsbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855156; c=relaxed/simple;
	bh=vCGAignBD2aACKDs7S5GJuHf9mCuUXHCpGJFImU69cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gd58L8PE2MbBanuUSwUat+OcxQmBQK4bKN7BhI0oCDey796XUmldK7D1lRE0x0zqarfQniCfiPssEJTi8Cd0c972SP5EltS/pO0pIFK0flJvLE4sWZfFzED4AJn0bEJOJLQ5JbYrtdJlLIrybDvd7HnnERkd+s5wJo4whLISlcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEcU7ct/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729855154; x=1761391154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vCGAignBD2aACKDs7S5GJuHf9mCuUXHCpGJFImU69cA=;
  b=WEcU7ct/FIg9kA2Y7FyQYiVPdqMiOqfozi+oge87XYMl0zhUUXzOvUy6
   a0Clyod5Ig+C+c3prbNPG+ldJ/jz+76GBUEhaFjRjCIUl1y8wCbSB+H3j
   t8RV4E5saBsFSdWvBc1z9kmj9rblSMxDGqr0G9wy2it1AErvsRMWziBOe
   SFIm7hTD77dKzB9GNN0Bn36485+T4/tE1YKdGKesXa0L/p8JYJdvBX7NF
   GeN8ALVG6PGI+OzoFV32BaegtD3eQ4kRZox5XO6VEVOLmZaHjowx1IZxg
   vz3M623lPehupCJdSxkHNpoKiv5tKzThIHH6UhIDvKOQIhpw92A5BRDdE
   A==;
X-CSE-ConnectionGUID: GUgupysyTuyekhI78fhiHA==
X-CSE-MsgGUID: +AmmUj8eQYCNdsrkaBy4lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29381352"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29381352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 04:19:12 -0700
X-CSE-ConnectionGUID: Nq9Fh6YPQYKn0TJAHVXvOg==
X-CSE-MsgGUID: 8G3UHRYvS4SIIxB3oCH72Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80803511"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Oct 2024 04:19:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ILJ-000Y8A-2O;
	Fri, 25 Oct 2024 11:18:57 +0000
Date: Fri, 25 Oct 2024 19:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
	linux@roeck-us.net, jdelvare@suse.com, jic23@kernel.org,
	lars@metafoo.de, ukleinek@kernel.org, alexandre.belloni@bootlin.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
Message-ID: <202410251825.ZVzMFUSc-lkp@intel.com>
References: <20241024085922.133071-5-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024085922.133071-5-tmyu0@nuvoton.com>

Hi Ming,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on brgl/gpio/for-next andi-shyti/i2c/i2c-host mkl-can-next/testing groeck-staging/hwmon-next jic23-iio/togreg abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Yu/mfd-Add-core-driver-for-Nuvoton-NCT6694/20241024-170528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20241024085922.133071-5-tmyu0%40nuvoton.com
patch subject: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241025/202410251825.ZVzMFUSc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251825.ZVzMFUSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251825.ZVzMFUSc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/net/can/nct6604_canfd.o', needed by 'drivers/net/can/built-in.a'.
   make[6]: Target 'drivers/net/can/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


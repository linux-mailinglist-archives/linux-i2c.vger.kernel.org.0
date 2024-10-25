Return-Path: <linux-i2c+bounces-7598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A99189B1340
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 01:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB4131C208BC
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 23:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD6A21441E;
	Fri, 25 Oct 2024 23:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d623BiNv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0DA1C4A14;
	Fri, 25 Oct 2024 23:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729899106; cv=none; b=QZCy6dL4larA0XIZfM8mCG74LQrNrh4yKnNUAiczt8ADoZ9UrhS0vO0DEiIQTyGsyS8UxkruFuS7kSR9/hTykULJ942ZrR+cqq5oh+cRs1jrJFEy7bGtPRqCn92S1a1imoCAP7McFHs3uLQmJfii7SFu4u6haiC6r7K7WyVVrK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729899106; c=relaxed/simple;
	bh=u4xiOrgzFrMQGY1E5QjpVZEvO5RqKSATtrfHUuQma7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0JfLyFSCVgIXtQQnPR2oQx9oouAcnGf24zQL8TdXqWooTKb7cqx3ffKCeCzzAaetUDNLVve0KFPyzoi+Id5+sokvHrE1TEP3+QY71IEACvaTPCV538mmjulNULXbNQYNZWm7ybo/XpWypfOfbvaQec3o/UKFLMPmMUOA4j4nns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d623BiNv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729899104; x=1761435104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u4xiOrgzFrMQGY1E5QjpVZEvO5RqKSATtrfHUuQma7Q=;
  b=d623BiNviPxMGSSc69bBZHGjHgq3hKfJTYNzNfOYuYarsGgP9Pa/8t5s
   6E7vF3fVp+dJrECYWr+lqKjKUHn/8jg0MG/9LJ8onTEsaseJtyaA4kpD5
   o5jv78sCxaf87dQBEcWyb11ScuQ1t/VTfxXgzVjxVAJ7AHgKkU2I3+GPA
   2VuA146yvxD4ZQbu1Wpe3Ibi3El0dRX+SIKfZLp38LM3Kr+kNwZ2vKQM/
   kE9XkrtbnDBF/7CoH7NjMue83CE3orBYJrrQKfaOj77k+cQWgcB0U4KfF
   eJ0OU1JKg/EQCj8AQ5IRCf51n9AyMjAw0VmCD/Pf4ulcNM7z/iuBe4oCb
   w==;
X-CSE-ConnectionGUID: gx6/qcNLSy+8FU2x+dmRNw==
X-CSE-MsgGUID: K0ki1pl3Q+2ZtEyfhSAQmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47041246"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47041246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 16:31:43 -0700
X-CSE-ConnectionGUID: bxTqJhq4TWC3gPnARMzMzA==
X-CSE-MsgGUID: bcWwe4LAR9eUK2EAfOP44g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="80989606"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Oct 2024 16:31:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4TmI-000Z1i-0o;
	Fri, 25 Oct 2024 23:31:34 +0000
Date: Sat, 26 Oct 2024 07:31:28 +0800
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
Message-ID: <202410260755.TBWkI6Jh-lkp@intel.com>
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
[also build test ERROR on brgl/gpio/for-next andi-shyti/i2c/i2c-host mkl-can-next/testing groeck-staging/hwmon-next jic23-iio/togreg abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Yu/mfd-Add-core-driver-for-Nuvoton-NCT6694/20241024-170528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20241024085922.133071-5-tmyu0%40nuvoton.com
patch subject: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241026/202410260755.TBWkI6Jh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260755.TBWkI6Jh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260755.TBWkI6Jh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/net/can/nct6604_canfd.o', needed by 'drivers/net/can/'.
   make[6]: Target 'drivers/net/can/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


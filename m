Return-Path: <linux-i2c+bounces-7605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6949B167F
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 11:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E6061F2240F
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 09:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CBA1D040B;
	Sat, 26 Oct 2024 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q714rRt/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680A718C023;
	Sat, 26 Oct 2024 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729934406; cv=none; b=fDB6RfvfzqFMTRrwwJxqoeLd32mF2YvJ4hCtEG4RamiI/P0HxMx5NOvaAvz8Uy1zhYsoC1acMhExAimJsguXg+TrV8pg9dKfUMvsj4K/lD5AlcoTv3/TbuY9oY8NUxf7X3SgIpUMQcgULh0C8PiMHCGRBXyCi9zlWPJL7CXO7r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729934406; c=relaxed/simple;
	bh=10Q0HTxapRuroNftzlAwfnnmV8FtywyCht+84Buc/bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXwxFv7SZIwP0cJd6F2G/ajoL+TQrnSVUtyZ60EvzVcQsZkIAc7uXpIHmq0MCTMyIys6mNCDKtJfjs5wHpSJl4iBC5zvX4mKJY/9vehkBl77NiGPiRoEikGfpaVXcsAK3yHMKBtchhXwSFOJG7tZexO5XsoIbJNJLXNwFNczwik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q714rRt/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729934404; x=1761470404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=10Q0HTxapRuroNftzlAwfnnmV8FtywyCht+84Buc/bo=;
  b=Q714rRt/34DyKrnM5vRl5o+qehTqQoCyrhFvNaOmWl+u5XpqNzUcshI0
   RPyEeFORW8ItMuHELdzkG4Q03XBHRZnRKjtqGfkUOOOBuUU4mkNMp3nRi
   Se0I5YzbvhlMKNC/3QOaBSHDw21dYFBn5U4aU3+DFpdlEDxWXzEcGMY/I
   Ry8U2zfJoc3vNt1dLvREfLBq5fJ18JuvtatnopYlz5KRdq8NF3iLqeC76
   0NXfVlTvHCeo5IoUHjUiiVWcfhgaLgnVjBUWvgQXiDnSVwcJiFUjVWsyt
   77UfJDJ2SIA/zSvbtDfe1YiA1E6QtlQG8H5ssd8iwaMI4doEN8LeLzQSN
   g==;
X-CSE-ConnectionGUID: VhVXWAfoTsypcQgOYIxwdA==
X-CSE-MsgGUID: x0ms3nWOT+qsQhXaW/oVwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40181199"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="40181199"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 02:20:02 -0700
X-CSE-ConnectionGUID: UUYp0zKATxul9nb+G/K1XQ==
X-CSE-MsgGUID: 8WPtDW1qQ6uodo7Tr5GRxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="85920356"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Oct 2024 02:19:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4cxc-000ZT6-2l;
	Sat, 26 Oct 2024 09:19:52 +0000
Date: Sat, 26 Oct 2024 17:19:17 +0800
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
Subject: Re: [PATCH v1 5/9] watchdog: Add Nuvoton NCT6694 WDT support
Message-ID: <202410261752.lUVTJO2Y-lkp@intel.com>
References: <20241024085922.133071-6-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024085922.133071-6-tmyu0@nuvoton.com>

Hi Ming,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on brgl/gpio/for-next andi-shyti/i2c/i2c-host mkl-can-next/testing groeck-staging/hwmon-next jic23-iio/togreg abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Yu/mfd-Add-core-driver-for-Nuvoton-NCT6694/20241024-170528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20241024085922.133071-6-tmyu0%40nuvoton.com
patch subject: [PATCH v1 5/9] watchdog: Add Nuvoton NCT6694 WDT support
config: arc-randconfig-r132-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261752.lUVTJO2Y-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241026/202410261752.lUVTJO2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261752.lUVTJO2Y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/watchdog/nct6694_wdt.c:133:42: sparse: sparse: cast to restricted __le32
>> drivers/watchdog/nct6694_wdt.c:133:42: sparse: sparse: cast to restricted __le32
>> drivers/watchdog/nct6694_wdt.c:133:42: sparse: sparse: cast to restricted __le32
>> drivers/watchdog/nct6694_wdt.c:133:42: sparse: sparse: cast to restricted __le32
>> drivers/watchdog/nct6694_wdt.c:133:42: sparse: sparse: cast to restricted __le32
>> drivers/watchdog/nct6694_wdt.c:133:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:134:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:134:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:134:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:134:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:134:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:134:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:166:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:166:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:166:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:166:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:166:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:166:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:167:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:167:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:167:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:167:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:167:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:167:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:220:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:220:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:220:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:220:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:220:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:220:42: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:221:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:221:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:221:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:221:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:221:45: sparse: sparse: cast to restricted __le32
   drivers/watchdog/nct6694_wdt.c:221:45: sparse: sparse: cast to restricted __le32

vim +133 drivers/watchdog/nct6694_wdt.c

   115	
   116	static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
   117					   unsigned int timeout)
   118	{
   119		struct nct6694_wdt_data *data = watchdog_get_drvdata(wdev);
   120		struct nct6694 *nct6694 = data->nct6694;
   121		unsigned int timeout_fmt, pretimeout_fmt;
   122		unsigned char buf[REQUEST_WDT_CMD0_LEN];
   123		int ret;
   124	
   125		if (timeout < wdev->pretimeout) {
   126			pr_err("%s: 'timeout' must be greater than 'pre timeout'!\n",
   127			       __func__);
   128			return -EINVAL;
   129		}
   130	
   131		timeout_fmt = timeout * 1000 | (WDT_TIMEOUT_ACT << 24);
   132		pretimeout_fmt = wdev->pretimeout * 1000 | (WDT_PRETIMEOUT_ACT << 24);
 > 133		set_buf32(&buf[WDT_TIMEOUT_IDX], le32_to_cpu(timeout_fmt));
   134		set_buf32(&buf[WDT_PRETIMEOUT_IDX], le32_to_cpu(pretimeout_fmt));
   135	
   136		ret = nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
   137					REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
   138					REQUEST_WDT_CMD0_LEN, buf);
   139		if (ret) {
   140			pr_err("%s: Don't write the setup command in Start stage!\n",
   141			       __func__);
   142			return ret;
   143		}
   144	
   145		wdev->timeout = timeout;
   146	
   147		return 0;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


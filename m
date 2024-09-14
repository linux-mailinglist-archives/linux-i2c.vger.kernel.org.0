Return-Path: <linux-i2c+bounces-6744-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8841C978CE2
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 04:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19045285522
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 02:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F99168DC;
	Sat, 14 Sep 2024 02:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6ROz1cV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81895EAF6;
	Sat, 14 Sep 2024 02:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726282605; cv=none; b=EMg+osIEeZGyQENGEdwFyTiI5SZnBBA65/9sH8f7J1M4KW5NCeUjhlApQp8yjvc1XEb5e+nB0wJJhoi5Yrcq94frJE9+Yf0oHDj4lc/AW0gk9p8jaXHLKcA6+cX//EwIUoKUWgoJ3mQetVyBAYuz1Wob8sn7hw2kAFkcFEh6CII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726282605; c=relaxed/simple;
	bh=TfRF/a3tZMACX33Nym0bwiApVNFyDJF2lXEejWZJEFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRlifns6r5eBFmlbTjnLLEbI4AJwImKBOS0cDXz4Xj3Y9hiALZiUzJ355ieKL0CEWfcwvsFJzeGbO8HLeAf8fU+YKP8iP6ikDfK7iBDbOBuzxxbt3cLjiZ7zIDsL431WH58DqGpm/L76UN2qxl/VwzX++fCQTHfflm6qqZkyCpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6ROz1cV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726282604; x=1757818604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TfRF/a3tZMACX33Nym0bwiApVNFyDJF2lXEejWZJEFc=;
  b=Y6ROz1cV9Q4pK9EO01Wc6uTTdSG0BAPytWDfjIK1Ss/o3UDSUxEYfKeL
   SFB+6xvJe5CnUi/rJLN0mQL21hEy0bEhmf5soEPphGB3osaARay0t7sFx
   gVIiW3YUTIv8VDS4g53L3SDS4isgk7RiLKwGVE4BSMAReUxdDt9vMzj7n
   oRi+D+tlLdSczBzTVJOrt6myDcNgCBlEvdEAMd1LjcNsi2y+/OQkYWbBP
   uSSgFzUjut2YFolsHY68jAXx+YYMukNtyHUhEXi3nkfo4ozYxxVwqXV+K
   maDmCSIHhQE3bINHw/UWmPE7ETQdVMp0bo5CroE5kf6SQWhFy1+uc8IvH
   Q==;
X-CSE-ConnectionGUID: wZJxR0HHS9OM8wC5Hlvz/A==
X-CSE-MsgGUID: P/UhmpTpRY64dJf8KlKrRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35770262"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="35770262"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 19:56:43 -0700
X-CSE-ConnectionGUID: lEjkV/aDSI6kXppHOWZz9Q==
X-CSE-MsgGUID: G84aYRYRSwaILiSOQmbkAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="91561390"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2024 19:56:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spIxe-0007Hg-0m;
	Sat, 14 Sep 2024 02:56:34 +0000
Date: Sat, 14 Sep 2024 10:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Malysa <greg.malysa@timesys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Utsav Agarwal <Utsav.Agarwal@analog.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	adsp-linux@analog.com,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Subject: Re: [PATCH 13/21] pinctrl: Add drivers for ADI ADSP-SC5xx platform
Message-ID: <202409141049.53oom3zJ-lkp@intel.com>
References: <20240912-test-v1-13-458fa57c8ccf@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-test-v1-13-458fa57c8ccf@analog.com>

Hi Arturs,

kernel test robot noticed the following build warnings:

[auto build test WARNING on da3ea35007d0af457a0afc87e84fddaebc4e0b63]

url:    https://github.com/intel-lab-lkp/linux/commits/Arturs-Artamonovs-via-B4-Relay/arm64-Add-ADI-ADSP-SC598-SoC/20240913-022308
base:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
patch link:    https://lore.kernel.org/r/20240912-test-v1-13-458fa57c8ccf%40analog.com
patch subject: [PATCH 13/21] pinctrl: Add drivers for ADI ADSP-SC5xx platform
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409141049.53oom3zJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141049.53oom3zJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141049.53oom3zJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-adsp.c:291: warning: Function parameter or struct member 'pctldev' not described in 'adsp_pinctrl_dt_node_to_map'
>> drivers/pinctrl/pinctrl-adsp.c:291: warning: Function parameter or struct member 'np' not described in 'adsp_pinctrl_dt_node_to_map'
>> drivers/pinctrl/pinctrl-adsp.c:291: warning: Function parameter or struct member 'map' not described in 'adsp_pinctrl_dt_node_to_map'
>> drivers/pinctrl/pinctrl-adsp.c:291: warning: Function parameter or struct member 'num_maps' not described in 'adsp_pinctrl_dt_node_to_map'
>> drivers/pinctrl/pinctrl-adsp.c:291: warning: expecting prototype for Handle device tree structures like(). Prototype was for adsp_pinctrl_dt_node_to_map() instead


vim +291 drivers/pinctrl/pinctrl-adsp.c

   271	
   272	/**
   273	 * Handle device tree structures like:
   274	 *
   275	 * pinctrl_uart0_hwflow: uart0_hwflow_pins {
   276	 *   pins_rxtx_ {
   277	 *     pinmux = <1>, <2>;
   278	 *     some-padconf-flag;
   279	 *   };
   280	 *   pins_hwflow {
   281	 *     pinmux = <3>, <4>;
   282	 *     some-other-padconf-flag;
   283	 *   };
   284	 * };
   285	 *
   286	 * where &pinctrl_uart0_hwflow is passed as an entry in pinctrl-0 on uart driver and
   287	 * enables all sub-pins at once
   288	 */
   289	static int adsp_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
   290		struct device_node *np, struct pinctrl_map **map, unsigned int *num_maps)
 > 291	{
   292		unsigned int reserved_maps;
   293		struct device_node *child_np;
   294		int ret;
   295	
   296		reserved_maps = 0;
   297		*map = NULL;
   298		*num_maps = 0;
   299	
   300		for_each_child_of_node(np, child_np) {
   301			ret = adsp_pinctrl_dt_subnode_to_map(pctldev, child_np, map,
   302						&reserved_maps, num_maps);
   303			if (ret < 0)
   304				goto exit;
   305		}
   306		return 0;
   307	
   308	exit:
   309		pinctrl_utils_free_map(pctldev, *map, *num_maps);
   310		return ret;
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


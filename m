Return-Path: <linux-i2c+bounces-6734-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFDE978A1F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 22:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 402E21C22DEB
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 20:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCF01527A7;
	Fri, 13 Sep 2024 20:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEFRRqqw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D69C14D2B8;
	Fri, 13 Sep 2024 20:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726260090; cv=none; b=D3J8A4evhJuQhbO4MVg0yoVgOFecn+JWZUgjknmZAyIlzOzuaM9DShKm21YYSns0DRC5178ovNjLagY656MZEvvt9K7AvAYsGzqgIwpW3lD/TYzYwm4JupZVVlvJbzHSs8uLg3K/IaZ0CcTq00F4I0vhX6GYrFpgTsIT+CimEHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726260090; c=relaxed/simple;
	bh=dxtHkHhZlIEtYto+4D7ABktR9JYb+fxPTDKaT0Bg+p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubymY+v6xpJibfRB6uabDweFx1zIOsQgGcPfa26MEQkDVEi+bTUoMmnzpOWpRkD6kt2oN6H3ZwrwVahcPMzhk+01AJt0IXAT2SNfuUa/dNXUES1OZ4JaejTpDmvDgHUav9XL1yg/92JJfnbrXvqkcCS1+Rgutomt1cgwk1d7mDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEFRRqqw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726260089; x=1757796089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dxtHkHhZlIEtYto+4D7ABktR9JYb+fxPTDKaT0Bg+p4=;
  b=FEFRRqqw99XR1fzmldi4aE/2gu3SzpE0qsz5k/hYLIyAFWrjpaXundza
   hbnkzWAOf8+KWaMxGV/IYDoiVdDZoWx8YPcnzpsdL2GuqNticiufOHPab
   kGvs8nT6ib0055yzshaWCbt3fBzglVMWK7Qn8k364Byicte2uACnXtq08
   1hj0r6K/Zy+qtYPO0KS/OZfmPsNb9isHmqJy9qDi1G55H8OCfuDPcM3fi
   KQetAtGIoicyaIMmgsKBILdfnxOsa8DGHl8PDAyJOZiapWHhh6xEFUWjT
   KPQJrDhwDWUqqYaB6VDtZG5I0SAHckhCM67xAJKxh5SqTxAJa1GrpMj4m
   Q==;
X-CSE-ConnectionGUID: rdGknI2rQSSfI6dODY7nVA==
X-CSE-MsgGUID: 5/iOL3BETrO2GjKZojzLfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35848673"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="35848673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 13:41:28 -0700
X-CSE-ConnectionGUID: GVjA4IFURsadu4GOWs5ACw==
X-CSE-MsgGUID: 1LTFprj9SQKpm0G8VRBwfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68966522"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2024 13:41:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spD6U-0006yI-2Y;
	Fri, 13 Sep 2024 20:41:18 +0000
Date: Sat, 14 Sep 2024 04:40:58 +0800
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
Subject: Re: [PATCH 11/21] irqchip: Add irqchip for ADI ADSP-SC5xx platform
Message-ID: <202409140451.t2a9fck6-lkp@intel.com>
References: <20240912-test-v1-11-458fa57c8ccf@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-test-v1-11-458fa57c8ccf@analog.com>

Hi Arturs,

kernel test robot noticed the following build warnings:

[auto build test WARNING on da3ea35007d0af457a0afc87e84fddaebc4e0b63]

url:    https://github.com/intel-lab-lkp/linux/commits/Arturs-Artamonovs-via-B4-Relay/arm64-Add-ADI-ADSP-SC598-SoC/20240913-022308
base:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
patch link:    https://lore.kernel.org/r/20240912-test-v1-11-458fa57c8ccf%40analog.com
patch subject: [PATCH 11/21] irqchip: Add irqchip for ADI ADSP-SC5xx platform
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409140451.t2a9fck6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140451.t2a9fck6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140451.t2a9fck6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-adi-adsp.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * ADSP PINT PORT driver.
   drivers/irqchip/irq-adi-adsp.c:51: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Each gpio device should be connected to one of the two valid pints with an
   drivers/irqchip/irq-adi-adsp.c:152: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This handles the GIC interrupt associated with this PINT being activated.


vim +3 drivers/irqchip/irq-adi-adsp.c

   > 3	 * ADSP PINT PORT driver.
     4	 *
     5	 * The default mapping is used for all PINTs, refer to the HRM to identify
     6	 * PORT mapping to PINTs. For example, PINT0 has PORT B (0-15) and PORT A
     7	 * (16-31).
     8	 *
     9	 * Copyright (C) 2022-2024, Analog Devices, Inc.
    10	 */
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


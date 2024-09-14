Return-Path: <linux-i2c+bounces-6747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D988A97917E
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 16:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0B95282034
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 14:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95BB1D04B8;
	Sat, 14 Sep 2024 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0KnTf4D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99141D04A2;
	Sat, 14 Sep 2024 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726324213; cv=none; b=Uk/y/ZkucILzq+qtBXJ/nmRTfJxjKJtnsGS9FsPrb53YP5NGgqAcJM3s+9b1O75r4d2czt8t/UoaV6BeMV+Iu8tZkk0BY/ZRwl+fJ0GhOObPy5mXvexkdxUc/YF4CCCfbRh3IZ+atfxBxK3tqdk9v/PpqNjCzcXEpgoSLQbU5DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726324213; c=relaxed/simple;
	bh=vj0dap+8opSjreuwJLUhajPAlrqrGKJV97jnetQYfZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jm1hi3f34tfpyYkwNIP5706CXYtD5zmFOwqfFf6I1PVl5ZvvmOZSJZFCDb/3xXysEaYw8D3yk8JnVRbIFNT5kr9vzFLrp7s+S3AJyiht5PviWbveDVF8/KRzd3IHW+/rI3v0ED1qHt95SiHkEg5S0n2nH6ysZRDm0S03pQ0VkyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0KnTf4D; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726324212; x=1757860212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vj0dap+8opSjreuwJLUhajPAlrqrGKJV97jnetQYfZ4=;
  b=m0KnTf4DaMYsO2AmcRs94chYGo3d9hgfVrySy9U3IN893/SRFQRbCpTV
   Ywb+Ky+ZAG7mnL224Ane3Dr0dWtsQMmIj1Xc/Ofa6is7/7FsuHzjzzZ0D
   HwTFh9Q3QyuY2l6ge5zHBeR1rqkHCeipTP8omPDBbCY8QMjVRshimKw43
   9ElLYSBlxra2+tPg99omM7dHAB7V3PpZnH7EicV1ymbiBdlqJN+oltNCp
   u9QNKtzm6cWCcuot6vNNSG5MYWP5ntak+Oq3d5qxc72TU3tSjgWv5TWuh
   dRrOGUDn4O+0TiAMCQ70Akyqw/6uXXJuJWfIYpN4arwnvku6NYx2OLKAP
   A==;
X-CSE-ConnectionGUID: RlcyB1DBREWeQ5PR3b5X3w==
X-CSE-MsgGUID: ebwREOhsQ0WHPFjpnMejig==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25312600"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25312600"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 07:30:11 -0700
X-CSE-ConnectionGUID: L/RndIocTvCEN1pVWjT92w==
X-CSE-MsgGUID: RM/ZJeCFSvqM+AIx3hfyiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="91682817"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Sep 2024 07:30:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spTmj-0007qK-2B;
	Sat, 14 Sep 2024 14:30:01 +0000
Date: Sat, 14 Sep 2024 22:29:11 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	adsp-linux@analog.com,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Subject: Re: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
Message-ID: <202409142215.olyOwnPE-lkp@intel.com>
References: <20240912-test-v1-9-458fa57c8ccf@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-test-v1-9-458fa57c8ccf@analog.com>

Hi Arturs,

kernel test robot noticed the following build errors:

[auto build test ERROR on da3ea35007d0af457a0afc87e84fddaebc4e0b63]

url:    https://github.com/intel-lab-lkp/linux/commits/Arturs-Artamonovs-via-B4-Relay/arm64-Add-ADI-ADSP-SC598-SoC/20240913-022308
base:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
patch link:    https://lore.kernel.org/r/20240912-test-v1-9-458fa57c8ccf%40analog.com
patch subject: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
config: arm64-randconfig-r071-20240914 (https://download.01.org/0day-ci/archive/20240914/202409142215.olyOwnPE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142215.olyOwnPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142215.olyOwnPE-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpio/gpio-adi-adsp-port.o: in function `adsp_gpio_probe':
>> gpio-adi-adsp-port.c:(.text+0x1cc): undefined reference to `adsp_attach_pint_to_gpio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


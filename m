Return-Path: <linux-i2c+bounces-973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E781D131
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 03:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8AAB1F236F6
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 02:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488551113;
	Sat, 23 Dec 2023 02:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoywBHE+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6115EC2;
	Sat, 23 Dec 2023 02:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703297368; x=1734833368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ekeuoa497ZgFzIEjn/5Xeu97N8IhNPV7uMRulAKkYao=;
  b=AoywBHE+EAsou1qL+t3Fkey9FUPBrWjFCybL0ORpnFIoi5dOh5wcuWpL
   mSlSNj5ZDZ1uSw+4YIAxdN/gB9Y3kwCJ0ntngwF2AKawTOsqHG9zmEzcI
   dCDsB5wAC/pcRXoEkLAFe20In9r8mAZi0dKokz1okUsmL14JqKG32CXeP
   lqhj2ixhHCD1nqhXNImWNKA0Xddl8rD7pRIhKnAtlCX/TTtS5pLl7grDv
   +qZeG0ZLyrg1F9221bixyRGExVYePZO88X6IOc7/CidZV9wAwlsF59YYE
   IgRnl5ByBz/fIEY+dpT7DZ1GcqQDuFk/VxwLssYV5aXvH92Y9BRPCoM0V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="393339586"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="393339586"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 18:09:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="806163004"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="806163004"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Dec 2023 18:09:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGrS0-000A8h-0c;
	Sat, 23 Dec 2023 02:09:17 +0000
Date: Sat, 23 Dec 2023 10:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Hasemeyer <markhas@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 01/22] gpiolib: acpi: Modify
 acpi_dev_irq_wake_get_by() to use resource
Message-ID: <202312230907.szXqJyXq-lkp@intel.com>
References: <20231220165423.v2.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220165423.v2.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>

Hi Mark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on chrome-platform/for-next chrome-platform/for-firmware-next wsa/i2c/for-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.7-rc6 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Hasemeyer/gpiolib-acpi-Modify-acpi_dev_irq_wake_get_by-to-use-resource/20231222-172104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231220165423.v2.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea%40changeid
patch subject: [PATCH v2 01/22] gpiolib: acpi: Modify acpi_dev_irq_wake_get_by() to use resource
config: x86_64-randconfig-161-20231222 (https://download.01.org/0day-ci/archive/20231223/202312230907.szXqJyXq-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230907.szXqJyXq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230907.szXqJyXq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib-acpi.c:117: warning: Function parameter or member 'shareable' not described in 'acpi_gpio_info'


vim +117 drivers/gpio/gpiolib-acpi.c

aa92b6f689acf1 Mika Westerberg 2014-03-10   93  
b7452d670fdef8 Dmitry Torokhov 2022-11-15   94  /**
b7452d670fdef8 Dmitry Torokhov 2022-11-15   95   * struct acpi_gpio_info - ACPI GPIO specific information
b7452d670fdef8 Dmitry Torokhov 2022-11-15   96   * @adev: reference to ACPI device which consumes GPIO resource
b7452d670fdef8 Dmitry Torokhov 2022-11-15   97   * @flags: GPIO initialization flags
b7452d670fdef8 Dmitry Torokhov 2022-11-15   98   * @gpioint: if %true this GPIO is of type GpioInt otherwise type is GpioIo
b7452d670fdef8 Dmitry Torokhov 2022-11-15   99   * @pin_config: pin bias as provided by ACPI
b7452d670fdef8 Dmitry Torokhov 2022-11-15  100   * @polarity: interrupt polarity as provided by ACPI
b7452d670fdef8 Dmitry Torokhov 2022-11-15  101   * @triggering: triggering type as provided by ACPI
b7452d670fdef8 Dmitry Torokhov 2022-11-15  102   * @wake_capable: wake capability as provided by ACPI
b7452d670fdef8 Dmitry Torokhov 2022-11-15  103   * @debounce: debounce timeout as provided by ACPI
b7452d670fdef8 Dmitry Torokhov 2022-11-15  104   * @quirks: Linux specific quirks as provided by struct acpi_gpio_mapping
b7452d670fdef8 Dmitry Torokhov 2022-11-15  105   */
b7452d670fdef8 Dmitry Torokhov 2022-11-15  106  struct acpi_gpio_info {
b7452d670fdef8 Dmitry Torokhov 2022-11-15  107  	struct acpi_device *adev;
b7452d670fdef8 Dmitry Torokhov 2022-11-15  108  	enum gpiod_flags flags;
b7452d670fdef8 Dmitry Torokhov 2022-11-15  109  	bool gpioint;
b7452d670fdef8 Dmitry Torokhov 2022-11-15  110  	int pin_config;
b7452d670fdef8 Dmitry Torokhov 2022-11-15  111  	int polarity;
b7452d670fdef8 Dmitry Torokhov 2022-11-15  112  	int triggering;
b7452d670fdef8 Dmitry Torokhov 2022-11-15  113  	bool wake_capable;
189f4620fa2d51 Mark Hasemeyer  2023-12-20  114  	bool shareable;
b7452d670fdef8 Dmitry Torokhov 2022-11-15  115  	unsigned int debounce;
b7452d670fdef8 Dmitry Torokhov 2022-11-15  116  	unsigned int quirks;
b7452d670fdef8 Dmitry Torokhov 2022-11-15 @117  };
b7452d670fdef8 Dmitry Torokhov 2022-11-15  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


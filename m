Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B5D44BDA7
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 10:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhKJJTV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 04:19:21 -0500
Received: from mga18.intel.com ([134.134.136.126]:46669 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229781AbhKJJTV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Nov 2021 04:19:21 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="219530956"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="gz'50?scan'50,208,50";a="219530956"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2021 01:16:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="gz'50?scan'50,208,50";a="533989132"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2021 01:16:30 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mkjiX-000Ehd-HW; Wed, 10 Nov 2021 09:16:29 +0000
Date:   Wed, 10 Nov 2021 17:15:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Shreeya Patel <shreeya.patel@collabora.com>,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, krisman@collabora.com,
        sebastian.reichel@collabora.com
Cc:     kbuild-all@lists.01.org, kernel@collabora.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Shreeya Patel <shreeya.patel@collabora.com>
Subject: Re: [PATCH v2] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
Message-ID: <202111101719.VzKfSYAQ-lkp@intel.com>
References: <20211018220504.8301-1-shreeya.patel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <20211018220504.8301-1-shreeya.patel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shreeya,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linusw-gpio/for-next]
[also build test ERROR on v5.15 next-20211110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Shreeya-Patel/gpio-Return-EPROBE_DEFER-if-gc-to_irq-is-NULL/20211019-060640
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: sh-rsk7269_defconfig (attached as .config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e807153b3cae5acb6d78393087c28e4004cb9856
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Shreeya-Patel/gpio-Return-EPROBE_DEFER-if-gc-to_irq-is-NULL/20211019-060640
        git checkout e807153b3cae5acb6d78393087c28e4004cb9856
        # save the attached .config to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sh SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   cc1: warning: arch/sh/include/mach-rsk: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-rsk: No such file or directory [-Wmissing-include-dirs]
   drivers/gpio/gpiolib.c: In function 'gpiod_to_irq':
>> drivers/gpio/gpiolib.c:3068:15: error: 'struct gpio_chip' has no member named 'irq'
    3068 |         if (gc->irq.chip) {
         |               ^~


vim +3068 drivers/gpio/gpiolib.c

  3036	
  3037	/**
  3038	 * gpiod_to_irq() - return the IRQ corresponding to a GPIO
  3039	 * @desc: gpio whose IRQ will be returned (already requested)
  3040	 *
  3041	 * Return the IRQ corresponding to the passed GPIO, or an error code in case of
  3042	 * error.
  3043	 */
  3044	int gpiod_to_irq(const struct gpio_desc *desc)
  3045	{
  3046		struct gpio_chip *gc;
  3047		int offset;
  3048	
  3049		/*
  3050		 * Cannot VALIDATE_DESC() here as gpiod_to_irq() consumer semantics
  3051		 * requires this function to not return zero on an invalid descriptor
  3052		 * but rather a negative error number.
  3053		 */
  3054		if (!desc || IS_ERR(desc) || !desc->gdev || !desc->gdev->chip)
  3055			return -EINVAL;
  3056	
  3057		gc = desc->gdev->chip;
  3058		offset = gpio_chip_hwgpio(desc);
  3059		if (gc->to_irq) {
  3060			int retirq = gc->to_irq(gc, offset);
  3061	
  3062			/* Zero means NO_IRQ */
  3063			if (!retirq)
  3064				return -ENXIO;
  3065	
  3066			return retirq;
  3067		}
> 3068		if (gc->irq.chip) {
  3069			/* avoid race condition with other code, which tries to lookup
  3070			 * an IRQ before the irqchip has been properly registered
  3071			 * (i.e. while gpiochip is still being brought up).
  3072			 */
  3073			return -EPROBE_DEFER;
  3074		}
  3075	
  3076		return -ENXIO;
  3077	}
  3078	EXPORT_SYMBOL_GPL(gpiod_to_irq);
  3079	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--/04w6evG8XlLl3ft
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--/04w6evG8XlLl3ft--

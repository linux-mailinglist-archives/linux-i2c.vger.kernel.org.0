Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153A82C8A69
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 18:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbgK3REX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 12:04:23 -0500
Received: from mga01.intel.com ([192.55.52.88]:51853 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729293AbgK3REW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 12:04:22 -0500
IronPort-SDR: PcEo3YYOfYN4A7OJ0DYlwZfUt9SybAYp/DtVJDqbIPvICjn9ogvtGn/gAhJoLQ8upDdxdeJaBB
 Y1vT2iPkflvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="190856690"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="gz'50?scan'50,208,50";a="190856690"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:03:17 -0800
IronPort-SDR: 7bdzUFKMlOVX2p75LgOORfei0TYSoLTUkM0qI4d628tIM4SLb/47KVtBJE4RbnvsszHRQVQu6p
 HhikGVD9lnRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="gz'50?scan'50,208,50";a="315338956"
Received: from lkp-server01.sh.intel.com (HELO 6b2307aab78b) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Nov 2020 09:03:12 -0800
Received: from kbuild by 6b2307aab78b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kjma0-00002R-8T; Mon, 30 Nov 2020 17:03:12 +0000
Date:   Tue, 1 Dec 2020 01:02:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org
Cc:     kbuild-all@lists.01.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH 17/18] gpio: gpiolib-acpi: Export acpi_get_gpiod()
Message-ID: <202012010027.JNVAUExJ-lkp@intel.com>
References: <20201130133129.1024662-18-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-18-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linuxtv-media/master]
[also build test ERROR on driver-core/driver-core-testing pm/linux-next v5.10-rc6 next-20201130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Add-functionality-to-ipu3-cio2-driver-allowing-software_node-connections-to-sensors-on-platforms-designed-for-Windows/20201130-214014
base:   git://linuxtv.org/media_tree.git master
config: s390-randconfig-p001-20201130 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/eb1854ac694a8e59c0ea703e46fe2ee7e3118b42
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Scally/Add-functionality-to-ipu3-cio2-driver-allowing-software_node-connections-to-sensors-on-platforms-designed-for-Windows/20201130-214014
        git checkout eb1854ac694a8e59c0ea703e46fe2ee7e3118b42
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/sysctl.o: in function `acpi_get_gpiod':
>> sysctl.c:(.text+0x2bb8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: kernel/irq/irqdomain.o: in function `acpi_get_gpiod':
   irqdomain.c:(.text+0x378): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: kernel/dma/mapping.o: in function `acpi_get_gpiod':
   mapping.c:(.text+0xb0): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/gpio/gpiolib.o: in function `acpi_get_gpiod':
   gpiolib.c:(.text+0x1c00): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/gpio/gpio-pca953x.o: in function `acpi_get_gpiod':
   gpio-pca953x.c:(.text+0x29e0): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/gpio/gpio-pca9570.o: in function `acpi_get_gpiod':
   gpio-pca9570.c:(.text+0x338): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/gpio/gpio-pcf857x.o: in function `acpi_get_gpiod':
   gpio-pcf857x.c:(.text+0xcb0): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/gpio/gpio-tpic2810.o: in function `acpi_get_gpiod':
   gpio-tpic2810.c:(.text+0x418): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/pwm/core.o: in function `acpi_get_gpiod':
   core.c:(.text+0x660): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/pwm/pwm-pca9685.o: in function `acpi_get_gpiod':
   pwm-pca9685.c:(.text+0x10d8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/dma/dmaengine.o: in function `acpi_get_gpiod':
   dmaengine.c:(.text+0x1f30): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/dma/dw/platform.o: in function `acpi_get_gpiod':
   platform.c:(.text+0x420): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/dma/qcom/hidma.o: in function `acpi_get_gpiod':
   hidma.c:(.text+0x28e8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/88pg86x.o: in function `acpi_get_gpiod':
   88pg86x.c:(.text+0x198): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/ad5398.o: in function `acpi_get_gpiod':
   ad5398.c:(.text+0x780): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/da9210-regulator.o: in function `acpi_get_gpiod':
   da9210-regulator.c:(.text+0x628): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/isl6271a-regulator.o: in function `acpi_get_gpiod':
   isl6271a-regulator.c:(.text+0x3b8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/isl9305.o: in function `acpi_get_gpiod':
   isl9305.c:(.text+0x1a0): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/lp872x.o: in function `acpi_get_gpiod':
   lp872x.c:(.text+0x11c0): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/lp8755.o: in function `acpi_get_gpiod':
   lp8755.c:(.text+0x1148): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/ltc3589.o: in function `acpi_get_gpiod':
   ltc3589.c:(.text+0x8c8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/max8649.o: in function `acpi_get_gpiod':
   max8649.c:(.text+0x7a0): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/max8660.o: in function `acpi_get_gpiod':
   max8660.c:(.text+0xe28): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/max77826-regulator.o: in function `acpi_get_gpiod':
   max77826-regulator.c:(.text+0x230): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/mp8859.o: in function `acpi_get_gpiod':
   mp8859.c:(.text+0x2e0): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/mt6311-regulator.o: in function `acpi_get_gpiod':
   mt6311-regulator.c:(.text+0x248): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/pca9450-regulator.o: in function `acpi_get_gpiod':
   pca9450-regulator.c:(.text+0x790): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/pfuze100-regulator.o: in function `acpi_get_gpiod':
   pfuze100-regulator.c:(.text+0xaa8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/pv88060-regulator.o: in function `acpi_get_gpiod':
   pv88060-regulator.c:(.text+0x870): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/pv88080-regulator.o: in function `acpi_get_gpiod':
   pv88080-regulator.c:(.text+0xb38): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/pv88090-regulator.o: in function `acpi_get_gpiod':
   pv88090-regulator.c:(.text+0x960): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/rt4801-regulator.o: in function `acpi_get_gpiod':
   rt4801-regulator.c:(.text+0x6a0): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/rtmv20-regulator.o: in function `acpi_get_gpiod':
   rtmv20-regulator.c:(.text+0xb20): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/slg51000-regulator.o: in function `acpi_get_gpiod':
   slg51000-regulator.c:(.text+0xb28): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/tps62360-regulator.o: in function `acpi_get_gpiod':
   tps62360-regulator.c:(.text+0xe68): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/regulator/tps65132-regulator.o: in function `acpi_get_gpiod':
   tps65132-regulator.c:(.text+0x728): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/base/core.o: in function `acpi_get_gpiod':
   core.c:(.text+0x27f8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/base/platform.o: in function `acpi_get_gpiod':
   platform.c:(.text+0x798): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/base/cpu.o: in function `acpi_get_gpiod':
   cpu.c:(.text+0x8c8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/base/property.o: in function `acpi_get_gpiod':
   property.c:(.text+0x2f8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/base/cacheinfo.o: in function `acpi_get_gpiod':
   cacheinfo.c:(.text+0xca8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `acpi_get_gpiod':
   regmap-i2c.c:(.text+0xcb0): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/misc/ad525x_dpot-i2c.o: in function `acpi_get_gpiod':
   ad525x_dpot-i2c.c:(.text+0x278): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/misc/bh1770glc.o: in function `acpi_get_gpiod':
   bh1770glc.c:(.text+0x28a8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/misc/apds990x.o: in function `acpi_get_gpiod':
   apds990x.c:(.text+0x23a8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/misc/isl29003.o: in function `acpi_get_gpiod':
   isl29003.c:(.text+0xad8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/misc/isl29020.o: in function `acpi_get_gpiod':
   isl29020.c:(.text+0x5e8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/misc/tsl2550.o: in function `acpi_get_gpiod':
   tsl2550.c:(.text+0x9d8): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/misc/ds1682.o: in function `acpi_get_gpiod':
   ds1682.c:(.text+0x578): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/misc/hmc6352.o: in function `acpi_get_gpiod':
   hmc6352.c:(.text+0x568): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here
   s390-linux-ld: drivers/misc/eeprom/eeprom.o: in function `acpi_get_gpiod':
   eeprom.c:(.text+0x7a0): multiple definition of `acpi_get_gpiod'; init/main.o:main.c:(.text+0x0): first defined here

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--AqsLC8rIMeq19msA
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
VPsfSfz1LA/uAAA=

--AqsLC8rIMeq19msA--

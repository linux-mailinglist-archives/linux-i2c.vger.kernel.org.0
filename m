Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6E01E43A7
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 15:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388095AbgE0Na2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 09:30:28 -0400
Received: from mga07.intel.com ([134.134.136.100]:24606 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387650AbgE0Na2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 09:30:28 -0400
IronPort-SDR: KqJ6YvlAHUplWnYUJ2epsV66h7xqsFpmK8lTORLNzj2Cy2PE/0Po7Zc9/c+UBAsJ1VM/BX6NBS
 r93A3CGdIRgQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 06:30:27 -0700
IronPort-SDR: G42sm5gZNR8bI25Za1GihKpgbVWEad9kvNaTVQfDPDHa1UKfiixpWUzOR0CT1u2y4rNulGACM/
 eCYLAShPkrJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="442519950"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2020 06:30:23 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdw8Y-009EdR-CD; Wed, 27 May 2020 16:30:26 +0300
Date:   Wed, 27 May 2020 16:30:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/12] i2c: designeware: Add Baikal-T1 System I2C
 support
Message-ID: <20200527133026.GT1634618@smile.fi.intel.com>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 12:55:16AM +0300, Serge Semin wrote:
> Jarkko, Wolfram, the merge window is upon us, please review/merge in/whatever
> the patchset.
> 
> Initially this has been a small patchset which embedded the Baikal-T1
> System I2C support into the DW APB I2C driver as is by using a simplest
> way. After a short discussion with Andy we decided to implement what he
> suggested (introduce regmap-based accessors and create a glue driver) and
> even more than that to provide some cleanups of the code. So here is what
> this patchset consists of.
> 
> First of all we've found out that current implementation of scripts/dtc
> didn't support i2c dt nodes with 10bit and slave flags set in the
> reg property. You'll see an error if you try to dt_binding_check it.
> So the very first patch fixes the problem by adding these flags support
> into the check_i2c_bus_reg() method.
> 
> Traditionally we converted the plain text-based DT binding to the DT schema
> and added Baikal-T1 System I2C device support there. This required to mark
> the reg property redundant for Baikal-T1 I2C since its reg-space is
> indirectly accessed by means of the System Controller cmd/read/write
> registers.
> 
> Then as Andy suggested we replaced the Synopsys DW APB I2C common driver
> registers IO accessors into the regmap API methods. This doesn't change
> the code logic much, though in two places we managed to replace some bulky
> peaces of code with a ready-to-use regmap methods.
> 
> Additionally before adding the glue layer API we initiated a set of cleanups:
> - Define components of the multi-object drivers (like i2c-designware-core.o
>   and i2c-designware-paltform.o) with using `-y` suffixed makefile
>   variables instead of `-objs` suffixed one. This is encouraged by
>   Documentation/kbuild/makefiles.rst text since `-objs` is supposed to be used
>   to build host programs.
> - Make DW I2C slave driver depended on the DW I2C core code instead of the
>   platform one, which it really is.
> - Move Intel Baytrail semaphore feature to the platform if-clause of the
>   kernel config.
> 
> After this we finally can introduce the glue layer API for the DW APB I2C
> platform driver. So there are three methods exported from the driver:
> i2c_dw_plat_setup(), i2c_dw_plat_clear(), &i2c_dw_plat_dev_pm_ops to
> setup, cleanup and add PM operations to the glue driven I2C device. Before
> setting the platform DW I2C device up the glue probe code is supposed to
> create an instance of DW I2C device generic object and pre-initialize
> its `struct device` pointer together with optional platform-specific
> flags. In addition to that we converted the MSCC Ocelot SoC I2C specific
> code into the glue layer seeing it's really too specific and, which is more
> important, isn't that complicated so we could unpin it without much of
> worrying to break something.
> 
> Meanwhile we discovered that MODEL_CHERRYTRAIL and MODEL_MASK actually
> were no longer used in the code. MODEL_MSCC flag has been discarded since
> the MSCC Ocelot I2C code conversion to the glue driver. So now we can get
> rid of all the MODEL-specific flags.
> 
> Finally we introduced a glue driver with Baikal-T1 System I2C device
> support. The driver probe tries to find a syscon regmap, creates the DW
> APB I2C regmap based on it and passes it further to the DW I2C device
> descriptor. Then it does normal DW APB I2C platform setup by calling a
> generic setup method. Cleanup is straightforward. It's just calling a
> generic DW APB I2C clean method.
> 
> This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
> base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> tag: v5.7-rc4
> 
> Note new vendor prefix for Baikal-T1 System I2C device will be added in
> the framework of the next patchset:
> https://lkml.org/lkml/2020/5/6/1047

>   scripts/dtc: check: Add 10bit/slave i2c reg flags support

Hmm... I don't see this patch.

-- 
With Best Regards,
Andy Shevchenko



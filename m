Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116A51E43D9
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 15:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387730AbgE0Ng4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 09:36:56 -0400
Received: from mga05.intel.com ([192.55.52.43]:32006 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387581AbgE0Ng4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 09:36:56 -0400
IronPort-SDR: KEhTh1JpNi/U/YkWUhqnIblRjtOWypbT9abLQdWEyMKIpaheV+A4jZbJPajTGc/jKEBPrBC7r3
 Rjl4wu0CN4Yw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 06:36:55 -0700
IronPort-SDR: znFbgevaueWvVVuU1HEBaUyl6TZuapozyshN0ew9BhJ1e9rR1ruTKeC7m5B6UD4C+CgDk9UK78
 +O5YpSRlwq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="255468688"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 27 May 2020 06:36:53 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdwEq-009Eh5-3x; Wed, 27 May 2020 16:36:56 +0300
Date:   Wed, 27 May 2020 16:36:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     devicetree-compiler@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] check: Add 10bit/slave i2c reg flags support
Message-ID: <20200527133656.GV1634618@smile.fi.intel.com>
References: <20200527122525.6929-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527122525.6929-1-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 03:25:25PM +0300, Serge Semin wrote:
> Recently the I2C-controllers slave interface support was added to the
> kernel I2C subsystem. In this case Linux can be used as, for example,
> a I2C EEPROM machine. See [1] for details. Other than instantiating
> the EEPROM-slave device from user-space there is a way to declare the
> device in dts. In this case firstly the I2C bus controller must support
> the slave interface. Secondly I2C-slave sub-node of that controller
> must have "reg"-property with flag I2C_OWN_SLAVE_ADDRESS set (flag is
> declared in [2]). That flag is declared as (1 << 30), which when set
> makes dtc unhappy about too big address set for a I2C-slave:
> 
> Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> 
> Similar problem would have happened if we had set the 10-bit address
> flag I2C_TEN_BIT_ADDRESS in the "reg"-property.
> 
> In order to fix the problem we suggest to alter the I2C-bus reg-check
> algorithm, so one would be aware of the upper bits set. Normally if no
> flag specified, the 7-bit address is expected in the "reg"-property.
> If I2C_TEN_BIT_ADDRESS is set, then the 10-bit address check will be
> performed. The I2C_OWN_SLAVE_ADDRESS flag will be just ignored.
> 
> [1] kernel/Documentation/i2c/slave-interface.rst
> [2] kernel/include/dt-bindings/i2c/i2c.h

...

> +		addr = reg & 0x3FFFFFFFU;
> +		if ((reg & (1 << 31)) && addr > 0x3ff)
>  			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 10-bits, got \"0x%x\"",
> -				  reg);
> -
> +				  addr);
> +		else if (!(reg & (1 << 31)) && addr > 0x7f)
> +			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 7-bits, got \"0x%x\"",
> +				  addr);

1 << 31 is UB.

-- 
With Best Regards,
Andy Shevchenko



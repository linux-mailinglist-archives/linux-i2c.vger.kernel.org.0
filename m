Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8373AC847
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jun 2021 11:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbhFRKBl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Jun 2021 06:01:41 -0400
Received: from mga02.intel.com ([134.134.136.20]:20339 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232740AbhFRKBk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Jun 2021 06:01:40 -0400
IronPort-SDR: rk7a0cMixwIChTgPt5xhfiQVin++LJgWIkDopPfdV2SlAFQUrHT1Ytp1tXG9Kd/y1CRO/mCvnv
 wFx6xahUoPNQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="193659005"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; 
   d="scan'208";a="193659005"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2021 02:59:30 -0700
IronPort-SDR: skSE3amv8mKVXb+EWAHxoHXR1wl2/JzlAJCk0BlYpeVNHRHZmDiZtMmFL07HiG7D9N2XTzskgH
 jcbnbvO1e9Pw==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; 
   d="scan'208";a="555527300"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2021 02:59:24 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1luBHU-003ZKx-Se; Fri, 18 Jun 2021 12:59:20 +0300
Date:   Fri, 18 Jun 2021 12:59:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jamin Lin <jamin_lin@aspeedtech.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Mike Rapoport <rppt@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        ChiaWei Wang <chiawei_wang@aspeedtech.com>,
        Troy Lee <troy_lee@aspeedtech.com>,
        Steven Lee <steven_lee@aspeedtech.com>
Subject: Re: [PATCH 3/3] i2c:support new register set for ast2600
Message-ID: <YMxueLOhlXjy1ZRH@smile.fi.intel.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
 <YMslFSOrnUc5b+zP@smile.fi.intel.com>
 <20210618035340.GA31659@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618035340.GA31659@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 18, 2021 at 11:53:41AM +0800, Jamin Lin wrote:
> The 06/17/2021 10:33, Andy Shevchenko wrote:
> > On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:

...

> > > + *
> > > + *  This program is free software; you can redistribute it and/or modify
> > > + *  it under the terms of the GNU General Public License version 2 as
> > > + *  published by the Free Software Foundation.
> > 
> > SPDX covers this.
> >
> Will change as following what do you think?
> // SPDX-License-Identifier: GPL-2.0-or-later
> /*
>  *  Aspeed I2C Interrupt Controller.
>  * Copyright (C) ASPEED Technology Inc.
>  * Ryan Chen <ryan_chen@aspeedtech.com>
>  */

Yes, something like this.

...

> > > +static const struct aspeed_i2c_base_clk i2c_base_clk[BASE_CLK_COUNT] = {
> > > +	/* name	target_freq */
> > > +	{  "base_clk0",	1000000 },	/* 1M */
> > > +	{  "base_clk1",	4000000 },	/* 4M */
> > > +	{  "base_clk2",	10000000 },	/* 10M */
> > > +	{  "base_clk3",	40000000 },	/* 40M */
> > > +};
> > 
> > Why it's not provided as the clock provider(s)?

> According to the design of ASPEED AST2600 SOC, the I2C bus is connected to PHB bus.
> The clock driver provides PHB clock and its default frequency is 100MHZ.
> AST2600 support the bus frequency of I2C from 0.1kbps to 5Mbps if PHB clock is 50MHZ.
> To meet the different bus frequency of I2C, we use this programmer to calculate the divider to 
> change the base clock.
> For example, 
> It calculates divider to change base_clock 1 to 1M to support I2C bus frequency 100KHZ
> It calculates divider to change base_clock 2 to 4M to support I2C bus frequency 400KHZ 

My question is, why don't you provide a clock provider (under drivers/clk) for
this platform and use it instead?

...

> > > +	struct clk_hw_onecell_data *onecell;
> > > +	struct clk_hw *hw;
> > > +	int err;
> > > +	u32 clk_divider = 0;
> > > +	int i, j;
> > > +	unsigned long base_freq;
> > 
> > Use reversed xmas tree order for all these blocks.
> > 
> > The rule of thumb, btw, that any comment applies to all similar places by
> > default (independently on which line it was given against).
> >
> Do you mena change as following?
> struct clk_hw_onecell_data *onecell;
> unsigned long base_freq;
> u32 clk_divider = 0;
> struct clk_hw *hw;
> int err;
> int i;
> int j;

Yes.

...

> > > +		for (i = 0; i < 0xff; i++) {
> > > +			/*
> > > +			 * i maps to div:
> > > +			 * 0x00: div 1
> > > +			 * 0x01: div 1.5
> > > +			 * 0x02: div 2
> > > +			 * 0x03: div 2.5
> > > +			 * 0x04: div 3
> > > +			 * ...
> > > +			 * 0xFE: div 128
> > > +			 * 0xFF: div 128.5
> > > +			 */
> > > +			base_freq = base_clk * 2 / (2 + i);
> > > +			if (base_freq <= i2c_base_clk[j].base_freq)
> > > +				break;
> > > +		}
> > 
> > oAre yuo sure you can't eliminate the entire for-loop? Think about it a bit,
> > please.
> >
> What do you think if we use "lookup table" instaed of above for loop?

Besides that it should be a part of clock provider, no, you may use a formula
(bit operations and so on).

...

> > > +	i2c_ic->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);

> > > +	if (IS_ERR(i2c_ic->rst)) {
> > 
> > > +		dev_dbg(&pdev->dev,
> > > +			"missing or invalid reset controller device tree entry");
> > 
> > Make it optional.
> Can I change to use "dev_err"?

What I meant here is to make the reset optional (there is even specific API for
that) and return an error in that case.

> > > +	} else {
> > > +		/* SCU I2C Reset */
> > > +		reset_control_assert(i2c_ic->rst);
> > > +		udelay(3);
> > > +		reset_control_deassert(i2c_ic->rst);
> > > +	}

...

> > > +static struct ast_i2c_timing_table aspeed_old_i2c_timing_table[] = {
> > 
> > What the ... is this for?!
> AST2600 support old/new register set for I2C controller.
> This lookup table is used to find the divisor for the specific I2C bus
> frequency for AST2600 I2C controller with old register set.
> For example
> If I2C bus frequency is 100KHZ and PHB clock is 100MHZ, it will find this table
> because 100000000/1024 < 100000
> "{ 1024, 0x00000300 | (0x5) | (0xf << 20) | (0xf << 16) | (0xf << 12) }"

Can't you derive it by formula(s)?

> > > +	/* Divisor : Base Clock : tCKHighMin : tCK High : tCK Low  */
> > > +	/* Divisor :	  [3:0] : [23: 20]   :   [19:16]:   [15:12] */

> > > +};

-- 
With Best Regards,
Andy Shevchenko



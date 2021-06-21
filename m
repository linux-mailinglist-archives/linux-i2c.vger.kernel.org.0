Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF563AE2A2
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jun 2021 07:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbhFUFPw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Jun 2021 01:15:52 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:34113 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhFUFPw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Jun 2021 01:15:52 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15L4wwS9005360;
        Mon, 21 Jun 2021 12:58:58 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Jun
 2021 13:13:33 +0800
Date:   Mon, 21 Jun 2021 13:13:31 +0800
From:   Jamin Lin <jamin_lin@aspeedtech.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        "Andrew Jeffery" <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Jean Delvare" <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Mike Rapoport <rppt@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
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
Message-ID: <20210621051330.GA27876@aspeedtech.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
 <YMslFSOrnUc5b+zP@smile.fi.intel.com>
 <20210618035340.GA31659@aspeedtech.com>
 <YMxueLOhlXjy1ZRH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YMxueLOhlXjy1ZRH@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15L4wwS9005360
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 06/18/2021 09:59, Andy Shevchenko wrote:
> On Fri, Jun 18, 2021 at 11:53:41AM +0800, Jamin Lin wrote:
> > The 06/17/2021 10:33, Andy Shevchenko wrote:
> > > On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:
> 
> ...
> 
> > > > + *
> > > > + *  This program is free software; you can redistribute it and/or modify
> > > > + *  it under the terms of the GNU General Public License version 2 as
> > > > + *  published by the Free Software Foundation.
> > > 
> > > SPDX covers this.
> > >
> > Will change as following what do you think?
> > // SPDX-License-Identifier: GPL-2.0-or-later
> > /*
> >  *  Aspeed I2C Interrupt Controller.
> >  * Copyright (C) ASPEED Technology Inc.
> >  * Ryan Chen <ryan_chen@aspeedtech.com>
> >  */
> 
> Yes, something like this.
> 
> ...
> 
> > > > +static const struct aspeed_i2c_base_clk i2c_base_clk[BASE_CLK_COUNT] = {
> > > > +	/* name	target_freq */
> > > > +	{  "base_clk0",	1000000 },	/* 1M */
> > > > +	{  "base_clk1",	4000000 },	/* 4M */
> > > > +	{  "base_clk2",	10000000 },	/* 10M */
> > > > +	{  "base_clk3",	40000000 },	/* 40M */
> > > > +};
> > > 
> > > Why it's not provided as the clock provider(s)?
> 
Will try it
> > According to the design of ASPEED AST2600 SOC, the I2C bus is connected to PHB bus.
> > The clock driver provides PHB clock and its default frequency is 100MHZ.
> > AST2600 support the bus frequency of I2C from 0.1kbps to 5Mbps if PHB clock is 50MHZ.
> > To meet the different bus frequency of I2C, we use this programmer to calculate the divider to 
> > change the base clock.
> > For example, 
> > It calculates divider to change base_clock 1 to 1M to support I2C bus frequency 100KHZ
> > It calculates divider to change base_clock 2 to 4M to support I2C bus frequency 400KHZ 
> 
> My question is, why don't you provide a clock provider (under drivers/clk) for
> this platform and use it instead?
Will try it
> 
> ...
> 
> > > > +	struct clk_hw_onecell_data *onecell;
> > > > +	struct clk_hw *hw;
> > > > +	int err;
> > > > +	u32 clk_divider = 0;
> > > > +	int i, j;
> > > > +	unsigned long base_freq;
> > > 
> > > Use reversed xmas tree order for all these blocks.
> > > 
> > > The rule of thumb, btw, that any comment applies to all similar places by
> > > default (independently on which line it was given against).
> > >
> > Do you mena change as following?
> > struct clk_hw_onecell_data *onecell;
> > unsigned long base_freq;
> > u32 clk_divider = 0;
> > struct clk_hw *hw;
> > int err;
> > int i;
> > int j;
> 
> Yes.
> 
> ...
> 
> > > > +		for (i = 0; i < 0xff; i++) {
> > > > +			/*
> > > > +			 * i maps to div:
> > > > +			 * 0x00: div 1
> > > > +			 * 0x01: div 1.5
> > > > +			 * 0x02: div 2
> > > > +			 * 0x03: div 2.5
> > > > +			 * 0x04: div 3
> > > > +			 * ...
> > > > +			 * 0xFE: div 128
> > > > +			 * 0xFF: div 128.5
> > > > +			 */
> > > > +			base_freq = base_clk * 2 / (2 + i);
> > > > +			if (base_freq <= i2c_base_clk[j].base_freq)
> > > > +				break;
> > > > +		}
> > > 
> > > oAre yuo sure you can't eliminate the entire for-loop? Think about it a bit,
> > > please.
> > >
> > What do you think if we use "lookup table" instaed of above for loop?
> 
> Besides that it should be a part of clock provider, no, you may use a formula
> (bit operations and so on).
> 
Will provide a formula
> ...
> 
> > > > +	i2c_ic->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> 
> > > > +	if (IS_ERR(i2c_ic->rst)) {
> > > 
> > > > +		dev_dbg(&pdev->dev,
> > > > +			"missing or invalid reset controller device tree entry");
> > > 
> > > Make it optional.
> > Can I change to use "dev_err"?
> 
> What I meant here is to make the reset optional (there is even specific API for
> that) and return an error in that case.
> 
> > > > +	} else {
> > > > +		/* SCU I2C Reset */
> > > > +		reset_control_assert(i2c_ic->rst);
> > > > +		udelay(3);
> > > > +		reset_control_deassert(i2c_ic->rst);
> > > > +	}
> 
> ...
> 
> > > > +static struct ast_i2c_timing_table aspeed_old_i2c_timing_table[] = {
> > > 
> > > What the ... is this for?!
> > AST2600 support old/new register set for I2C controller.
> > This lookup table is used to find the divisor for the specific I2C bus
> > frequency for AST2600 I2C controller with old register set.
> > For example
> > If I2C bus frequency is 100KHZ and PHB clock is 100MHZ, it will find this table
> > because 100000000/1024 < 100000
> > "{ 1024, 0x00000300 | (0x5) | (0xf << 20) | (0xf << 16) | (0xf << 12) }"
> 
> Can't you derive it by formula(s)?
> 
Will provide formula(s)
> > > > +	/* Divisor : Base Clock : tCKHighMin : tCK High : tCK Low  */
> > > > +	/* Divisor :	  [3:0] : [23: 20]   :   [19:16]:   [15:12] */
> 
> > > > +};
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

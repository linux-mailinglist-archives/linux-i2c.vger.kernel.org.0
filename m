Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB3B3AE2A6
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jun 2021 07:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhFUFRI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Jun 2021 01:17:08 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:18364 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhFUFRH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Jun 2021 01:17:07 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15L50DTC006012;
        Mon, 21 Jun 2021 13:00:13 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Jun
 2021 13:14:48 +0800
Date:   Mon, 21 Jun 2021 13:14:46 +0800
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
Message-ID: <20210621051446.GB27876@aspeedtech.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
 <YMslyzUKp/7J0ncu@smile.fi.intel.com>
 <20210618035855.GB31659@aspeedtech.com>
 <YMxuz03aTijWH6uj@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YMxuz03aTijWH6uj@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15L50DTC006012
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 06/18/2021 10:00, Andy Shevchenko wrote:
> On Fri, Jun 18, 2021 at 11:58:55AM +0800, Jamin Lin wrote:
> > The 06/17/2021 10:36, Andy Shevchenko wrote:
> > > On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:
> > > > Add i2c new driver to support new register set for AST2600.
> > > > AST2600 support three modes for data transfer which are
> > > > byte mode, buffer mode and dma mode, respectively.
> > > > The global driver of i2c is used to set the new register
> > > > mode and define the base clock frequency
> > > > of baseclk_1~baseclk_4.
> 
> > >  - shrink the code base by at least ~15% (it's possible), i.e. -200 LOCs
> > Can you describe it more detail?
> > Do you mean I should separate the patch file to fix size limitation? 
> 
> No. Based on my brief review you introduce to many redundant LOCs (lines of
> code). Remove them, refactor the code, make it small and neat and easy to read
> and understand. It is possible to achieve!
>
Will fix
Thanks
> > >  - rethink how you do calculations and bit operations
> > >  - better code style
> > >
> > Thanks for your review and very good suggestion
> > I will update them and sent patch again.
> > By the way, I received test failed email from Robot due to compiling
> > warning. I will fix them, too.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

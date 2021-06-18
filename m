Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595D23AC1B2
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jun 2021 05:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhFREBQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Jun 2021 00:01:16 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:14923 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhFREBQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Jun 2021 00:01:16 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15I3ic7p020343;
        Fri, 18 Jun 2021 11:44:38 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 11:59:01 +0800
Date:   Fri, 18 Jun 2021 11:58:55 +0800
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
Message-ID: <20210618035855.GB31659@aspeedtech.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
 <YMslyzUKp/7J0ncu@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YMslyzUKp/7J0ncu@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15I3ic7p020343
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 06/17/2021 10:36, Andy Shevchenko wrote:
> On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:
> > Add i2c new driver to support new register set for AST2600.
> > AST2600 support three modes for data transfer which are
> > byte mode, buffer mode and dma mode, respectively.
> > The global driver of i2c is used to set the new register
> > mode and define the base clock frequency
> > of baseclk_1~baseclk_4.
> > 
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >  drivers/i2c/busses/Kconfig              |   11 +
> >  drivers/i2c/busses/Makefile             |    1 +
> >  drivers/i2c/busses/ast2600-i2c-global.c |  205 +++
> >  drivers/i2c/busses/ast2600-i2c-global.h |   25 +
> >  drivers/i2c/busses/i2c-new-aspeed.c     | 1796 +++++++++++++++++++++++
> 
> I commented _something_ (but read comments carefully, they will cover much
> more). The overall it seems you have to:
>  - shrink the code base by at least ~15% (it's possible), i.e. -200 LOCs
Can you describe it more detail?
Do you mean I should separate the patch file to fix size limitation? 
>  - rethink how you do calculations and bit operations
>  - better code style
>
Thanks for your review and very good suggestion
I will update them and sent patch again.
By the way, I received test failed email from Robot due to compiling
warning. I will fix them, too. 

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

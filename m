Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCD91DC508
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 04:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgEUCDD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 22:03:03 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:34392 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbgEUCDC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 May 2020 22:03:02 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 22B0C803087B;
        Thu, 21 May 2020 02:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id V8qhQs_h6n-P; Thu, 21 May 2020 05:02:58 +0300 (MSK)
Date:   Thu, 21 May 2020 05:02:56 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/12] i2c: designware: Convert driver to using regmap
 API
Message-ID: <20200521020256.mfdark6vzinuktf7@mobilestation>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-5-Sergey.Semin@baikalelectronics.ru>
 <a0d4c6d8-c2c0-b7ea-d77b-e1fe610fd966@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a0d4c6d8-c2c0-b7ea-d77b-e1fe610fd966@linux.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 20, 2020 at 03:16:07PM +0300, Jarkko Nikula wrote:
> On 5/10/20 12:50 PM, Serge Semin wrote:
> > Seeing the DW I2C driver is using flags-based accessors with two
> > conditional clauses it would be better to replace them with the regmap
> > API IO methods and to initialize the regmap object with read/write
> > callbacks specific to the controller registers map implementation. This
> > will be also handy for the drivers with non-standard registers mapping
> > (like an embedded into the Baikal-T1 System Controller DW I2C block, which
> > glue-driver is a part of this series).
> > 
> > As before the driver tries to detect the mapping setup at probe stage and
> > creates a regmap object accordingly, which will be used by the rest of the
> > code to correctly access the controller registers. In two places it was
> > appropriate to convert the hand-written read-modify-write and
> > read-poll-loop design patterns to the corresponding regmap API
> > ready-to-use methods.
> > 
> > Note the regmap IO methods return value is checked only at the probe
> > stage. The rest of the code won't do this because basically we have
> > MMIO-based regmap so non of the read/write methods can fail (this also
> > won't be needed for the Baikal-T1-specific I2C controller).
> > 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Wolfram Sang <wsa@the-dreams.de>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-mips@vger.kernel.org
> > ---
> >   drivers/i2c/busses/Kconfig                 |   1 +
> >   drivers/i2c/busses/i2c-designware-common.c | 171 +++++++++++++++------
> >   drivers/i2c/busses/i2c-designware-core.h   |  18 +--
> >   drivers/i2c/busses/i2c-designware-master.c | 125 ++++++++-------
> >   drivers/i2c/busses/i2c-designware-slave.c  |  77 +++++-----
> >   5 files changed, 239 insertions(+), 153 deletions(-)
> > 
> Looking at patches 4/12-12/12 I think it would be good to move fixes and
> less invasive patches before this. Like
> 
> i2c: designware: slave: Set DW I2C core module dependency
> i2c: designware: Use `-y` to build multi-object modules
> i2c: designware: Move Baytrail sem config to the platform if-clause
> 
> That said, you may add:
> 
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Ok. I'll move those three patches to be before this one in v3. Thanks.

-Sergey

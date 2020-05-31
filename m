Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0638B1E992E
	for <lists+linux-i2c@lfdr.de>; Sun, 31 May 2020 19:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgEaRMu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 31 May 2020 13:12:50 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:45784 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgEaRMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 31 May 2020 13:12:50 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id CDB5F8030866;
        Sun, 31 May 2020 17:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WwALV05hloaX; Sun, 31 May 2020 20:12:40 +0300 (MSK)
Date:   Sun, 31 May 2020 20:12:39 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 08/11] i2c: designware: Convert driver to using regmap
 API
Message-ID: <20200531171239.l64zfkoncecngfll@mobilestation>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
 <20200528093322.23553-9-Sergey.Semin@baikalelectronics.ru>
 <20200530110930.GC1038@ninjato>
 <20200530210554.GA15682@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200530210554.GA15682@ninjato>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, May 30, 2020 at 11:05:54PM +0200, Wolfram Sang wrote:
> On Sat, May 30, 2020 at 01:09:30PM +0200, Wolfram Sang wrote:
> > On Thu, May 28, 2020 at 12:33:18PM +0300, Serge Semin wrote:
> > > Seeing the DW I2C driver is using flags-based accessors with two
> > > conditional clauses it would be better to replace them with the regmap
> > > API IO methods and to initialize the regmap object with read/write
> > > callbacks specific to the controller registers map implementation. This
> > > will be also handy for the drivers with non-standard registers mapping
> > > (like an embedded into the Baikal-T1 System Controller DW I2C block, which
> > > glue-driver is a part of this series).
> > > 
> > > As before the driver tries to detect the mapping setup at probe stage and
> > > creates a regmap object accordingly, which will be used by the rest of the
> > > code to correctly access the controller registers. In two places it was
> > > appropriate to convert the hand-written read-modify-write and
> > > read-poll-loop design patterns to the corresponding regmap API
> > > ready-to-use methods.
> > > 
> > > Note the regmap IO methods return value is checked only at the probe
> > > stage. The rest of the code won't do this because basically we have
> > > MMIO-based regmap so non of the read/write methods can fail (this also
> > > won't be needed for the Baikal-T1-specific I2C controller).
> > > 
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-mips@vger.kernel.org
> > 
> > My codecheckers found these, rightfully I'd say:
> > 
> > SPARSE
> > drivers/i2c/busses/i2c-designware-master.c:427:53: warning: incorrect type in argument 3 (different signedness)
> > drivers/i2c/busses/i2c-designware-master.c:427:53:    expected unsigned int *val
> > drivers/i2c/busses/i2c-designware-master.c:427:53:    got int *
> > 
> > CC
> > drivers/i2c/busses/i2c-designware-common.c:127: warning: Excess function parameter 'base' description in 'i2c_dw_init_regmap'
> > 
> > ^ means there is an argument documented which does not exist in the
> > function declaration
> 
> Well, I fixed these two minor things for your now...
> 

Great! Sorry for me not doing it on time. I was away from my laptop and internet
last day to do that. I saw your message about the sparse detecting the problems
while I was on my way to outskirts and was going to fix them today either in a
new version of the patchset or sending follow-up patches. But you already fixed
the problems. Thank you very much for doing that for me. 

-Sergey

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E681E3FBB
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 13:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388207AbgE0LUG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 07:20:06 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:34554 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388146AbgE0LUF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 07:20:05 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 90624803080A;
        Wed, 27 May 2020 11:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9Bltaobyr5kB; Wed, 27 May 2020 14:20:01 +0300 (MSK)
Date:   Wed, 27 May 2020 14:20:01 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Frank Rowand <frowand.list@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 01/12] scripts/dtc: check: Add 10bit/slave i2c reg
 flags support
Message-ID: <20200527112001.pxnzd4ofxsps7x57@mobilestation>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
 <20200526215528.16417-2-Sergey.Semin@baikalelectronics.ru>
 <20200527011704.GA808104@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527011704.GA808104@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 26, 2020 at 07:17:04PM -0600, Rob Herring wrote:
> On Wed, May 27, 2020 at 12:55:17AM +0300, Serge Semin wrote:
> > Recently the I2C-controllers slave interface support was added to the
> > kernel I2C subsystem. In this case Linux can be used as, for example,
> > a I2C EEPROM machine. See [1] for details. Other than instantiating
> > the EEPROM-slave device from user-space there is a way to declare the
> > device in dts. In this case firstly the I2C bus controller must support
> > the slave interface. Secondly I2C-slave sub-node of that controller
> > must have "reg"-property with flag I2C_OWN_SLAVE_ADDRESS set (flag is
> > declared in [2]). That flag is declared as (1 << 30), which when set
> > makes dtc unhappy about too big address set for a I2C-slave:
> > 
> > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> > 
> > Similar problem would have happened if we had set the 10-bit address
> > flag I2C_TEN_BIT_ADDRESS in the "reg"-property.
> > 
> > In order to fix the problem we suggest to alter the I2C-bus reg-check
> > algorithm, so one would be aware of the upper bits set. Normally if no
> > flag specified, the 7-bit address is expected in the "reg"-property.
> > If I2C_TEN_BIT_ADDRESS is set, then the 10-bit address check will be
> > performed. The I2C_OWN_SLAVE_ADDRESS flag will be just ignored.
> > 
> > [1] Documentation/i2c/slave-interface.rst
> > [2] include/dt-bindings/i2c/i2c.h
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: linux-mips@vger.kernel.org
> > Cc: linux-i2c@vger.kernel.org
> > ---
> >  scripts/dtc/checks.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> I've lost track of who all I've said this to already for this issue, but 
> patches to dtc should be against upstream and a version of this has been 
> sent there already. But it seems they've lost interest in addressing the 
> review comments. So feel free to send another one. The same comment 
> applies here.

There is another patch in this series:
[PATCH v3 04/12] dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C controller
which is also waiting for your review. I've updated it as you requested.
Could you take a look at that too?

-Sergey

> 
> Rob

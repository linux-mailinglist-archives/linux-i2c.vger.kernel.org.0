Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5DC1E868D
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 20:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgE2SXC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 14:23:02 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:50456 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgE2SXC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 May 2020 14:23:02 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 977ED8030772;
        Fri, 29 May 2020 18:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id L6U1eB5jbbow; Fri, 29 May 2020 21:22:57 +0300 (MSK)
Date:   Fri, 29 May 2020 21:22:56 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200529182256.3bp4uvvrvz3ddlrq@mobilestation>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-3-Sergey.Semin@baikalelectronics.ru>
 <20200527153351.rmzguymz7lm6gvsx@mobilestation>
 <20200529181338.GA2676189@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200529181338.GA2676189@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 29, 2020 at 12:13:38PM -0600, Rob Herring wrote:
> On Wed, May 27, 2020 at 06:33:51PM +0300, Serge Semin wrote:
> > Rob,
> > Could you pay attention to this patch? The patchset review procedure is
> > nearly over, while the DT part is only partly reviewed by you.
> 

> Pretty sure I commented on this. Not sure what version, you're sending 
> new versions too fast. Give people time to review.

Yeah, you did. Sorry for sending the new versions very fast. Normally I prefer
to keep up with comments so to past a particular maintainer review as fast as
possible without long delays. In my experience the longer you wait, the lesser
maintainers remember about your patchset, the harder for one to continue the
next versions review.

Regarding this patch the brand new version on is v6:
[PATCH v6 02/11] dt-bindings: i2c: Convert DW I2C slave to the DW I2C master example

Could you please find it in your email log? I've left a note there for you about
options what we can do with this case.

-Sergey

> 
> > 
> > Thanks
> > -Sergey
> > 
> > On Wed, May 27, 2020 at 06:30:37PM +0300, Serge Semin wrote:
> > > dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
> > > i2c "reg" property. If it is the compiler will print a warning:
> > > 
> > > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> > > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> > > 
> > > In order to silence dtc up let's discard the flag from the DW I2C DT
> > > binding example for now. Just revert this commit when dtc is fixed.
> > > 
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > Cc: linux-mips@vger.kernel.org
> > > 
> > > ---
> > > 
> > > Changelog v3:
> > > - This is a new patch created as a result of the Rob request to remove
> > >   the EEPROM-slave bit setting in the DT binndings example until the dtc
> > >   is fixed.
> > > ---
> > >  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > > index 4bd430b2b41d..101d78e8f19d 100644
> > > --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > > +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > > @@ -137,7 +137,7 @@ examples:
> > >  
> > >        eeprom@64 {
> > >          compatible = "linux,slave-24c02";
> > > -        reg = <0x40000064>;
> > > +        reg = <0x64>;
> 
> This is wrong though because "linux,slave-24c02" should have bit 30 set. 
> (And either the unit-address was wrong or we can define the unit-address 
> does not include the high bits.)
> 
> Rob

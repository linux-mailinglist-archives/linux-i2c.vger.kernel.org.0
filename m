Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35F61E4BB4
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 19:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730179AbgE0RSp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 13:18:45 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37466 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729534AbgE0RSp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 13:18:45 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 5C8B58030833;
        Wed, 27 May 2020 17:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id J1BUg-MTvr5n; Wed, 27 May 2020 20:18:41 +0300 (MSK)
Date:   Wed, 27 May 2020 20:18:41 +0300
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
Subject: Re: [PATCH v4 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200527171841.am2iaynff243xoep@mobilestation>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-3-Sergey.Semin@baikalelectronics.ru>
 <20200527171204.GA2348490@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527171204.GA2348490@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 11:12:04AM -0600, Rob Herring wrote:
> On Wed, May 27, 2020 at 03:01:02PM +0300, Serge Semin wrote:
> > dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
> > i2c "reg" property. If it is the compiler will print a warning:
> > 
> > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> > 
> > In order to silence dtc up let's discard the flag from the DW I2C DT
> > binding example for now. Just revert this commit when dtc is fixed.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: linux-mips@vger.kernel.org
> > 
> > ---
> > 
> > Changelog v3:
> > - This is a new patch created as a result of the Rob request to remove
> >   the EEPROM-slave bit setting in the DT binndings example until the dtc
> >   is fixed.
> > ---
> >  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > index 4bd430b2b41d..101d78e8f19d 100644
> > --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > @@ -137,7 +137,7 @@ examples:
> >  
> >        eeprom@64 {
> >          compatible = "linux,slave-24c02";
> > -        reg = <0x40000064>;
> > +        reg = <0x64>;
> 
> But the compatible is a slave, so you need an example with a different 
> device.

Ok. I'll replace the sub-node with just "atmel,24c02" compatible string then.

-Sergey

> 
> >        };
> >      };
> >    - |
> > -- 
> > 2.26.2
> > 

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995F51E414D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 14:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgE0MHY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 08:07:24 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:34850 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgE0MHX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 08:07:23 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 3ED58803080A;
        Wed, 27 May 2020 12:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6yp1ZNgKw_kt; Wed, 27 May 2020 15:07:17 +0300 (MSK)
Date:   Wed, 27 May 2020 15:07:16 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-mips@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/12] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200527120716.4dke6psqpw726wrd@mobilestation>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
 <20200526215528.16417-4-Sergey.Semin@baikalelectronics.ru>
 <CAHp75VdHC+fZNgc5oFbgYaNDebudDROcM_peRzOZpTVy55+tJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75VdHC+fZNgc5oFbgYaNDebudDROcM_peRzOZpTVy55+tJg@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 12:30:04PM +0300, Andy Shevchenko wrote:
> On Wed, May 27, 2020 at 1:00 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
> > i2c "reg" property. If it is the compiler will print a warning:
> 
> Shouldn't be dtc whatever tools fixed?

See the first patch in the series.

> 
> > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> >
> > In order to silence dtc up let's discard the flag from the DW I2C DT
> > binding example for now. Just revert this commit when dtc is fixed.
> 
> Doesn't sound like a good idea. If user happens in between of these
> ping-pong change, how they will know this subtle issue?

As I see it, there are three ways we can follow.
1) Apply the patch and revert when dtc is fixed.
2) Apply the patch, but add a comment above the property, that we need
   to get the 0x40000064 address back when dtc is dixed.
3) Leave this ugly warning be until dtc is fixed.

In a comment to v2 Rob mentioned a solution like 1). Personally I am ok with
either, though I'd like to see a Rob's final comment about this.

-Sergey 

> 
> -- 
> With Best Regards,
> Andy Shevchenko

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EF51E4971
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 18:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390255AbgE0QKs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 12:10:48 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37118 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388257AbgE0QKs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 12:10:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 2BC618030809;
        Wed, 27 May 2020 16:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qrg-3_C7rak6; Wed, 27 May 2020 19:10:45 +0300 (MSK)
Date:   Wed, 27 May 2020 19:10:45 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 11/11] i2c: designware: Add Baikal-T1 System I2C
 support
Message-ID: <20200527161045.goiwimxlubrkodlj@mobilestation>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-12-Sergey.Semin@baikalelectronics.ru>
 <20200527160544.GM1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527160544.GM1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 07:05:44PM +0300, Andy Shevchenko wrote:
> On Wed, May 27, 2020 at 06:30:46PM +0300, Serge Semin wrote:
> > Baikal-T1 System Controller is equipped with a dedicated I2C Controller
> > which functionality is based on the DW APB I2C IP-core, the only
> > difference in a way it' registers are accessed. There are three access
> > register provided in the System Controller registers map, which indirectly
> > address the normal DW APB I2C registers space. So in order to have the
> > Baikal-T1 System I2C Controller supported by the common DW APB I2C driver
> > we created a dedicated Dw I2C controller model quirk, which retrieves the
> > syscon regmap from the parental dt node and creates a new regmap based on
> > it.
> 
> ...
> 
> > +static struct regmap_config bt1_i2c_cfg = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +	.fast_io = true,
> > +	.reg_read = bt1_i2c_read,
> > +	.reg_write = bt1_i2c_write,
> 
> > +	.max_register = DW_IC_COMP_TYPE
> 
> Perhaps leave comma here.

If v6 is required, I'll fix it there.

-Sergey

> 
> > +};
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

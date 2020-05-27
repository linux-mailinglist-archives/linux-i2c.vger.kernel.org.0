Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584661E3E01
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 11:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729434AbgE0Juk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 05:50:40 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:34018 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729391AbgE0Juj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 05:50:39 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id BDCD5803080A;
        Wed, 27 May 2020 09:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id k5YrOO-wnkEP; Wed, 27 May 2020 12:50:35 +0300 (MSK)
Date:   Wed, 27 May 2020 12:50:34 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 11/12] i2c: designware: Move reg-space remapping into
 a dedicated function
Message-ID: <20200527095034.xd52qv45nzcnkbnz@mobilestation>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
 <20200526215528.16417-12-Sergey.Semin@baikalelectronics.ru>
 <CAHp75Veygd2y8Tp28p+ZX8Hm_u975QdqatKbsNOG9tNz6HOCAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75Veygd2y8Tp28p+ZX8Hm_u975QdqatKbsNOG9tNz6HOCAg@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 12:26:09PM +0300, Andy Shevchenko wrote:
> On Wed, May 27, 2020 at 4:03 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > This is a preparation patch before adding a quirk with custom registers
> > map creation required for the Baikal-T1 System I2C support. Since we've
> > touched this code anyway let's replace
> > platform_get_resource()-devm_ioremap_resource() tuple with ready-to-use
> > helper devm_platform_get_and_ioremap_resource().
> 
> ...
> 
> > +static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
> > +{
> > +       struct platform_device *pdev = to_platform_device(dev->dev);
> 
> > +       int ret = 0;
> 
> Redundant.
> 
> > +       dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> 
> What's the point of this API if you don't use resource parameter?
> 
> > +       if (IS_ERR(dev->base))
> > +               ret = PTR_ERR(dev->base);
> > +
> > +       return ret;
> 
> return PTR_ERR_OR_ZERO(dev->base);
> 
> > +}
> 
> > -       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -       dev->base = devm_ioremap_resource(&pdev->dev, mem);
> > -       if (IS_ERR(dev->base))
> > -               return PTR_ERR(dev->base);
> 
> Wolfram, did my last series make your tree? I think there was a patch
> that touched this part...

Right. It is there. I'll rebase the series on top of the i2c/for-next branch.

-Serge

> 
> -- 
> With Best Regards,
> Andy Shevchenko

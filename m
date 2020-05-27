Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3F11E4964
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 18:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgE0QJ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 12:09:57 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37104 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgE0QJ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 12:09:57 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id BA1EA8030835;
        Wed, 27 May 2020 16:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bDkvW9sg6A7Z; Wed, 27 May 2020 19:09:53 +0300 (MSK)
Date:   Wed, 27 May 2020 19:09:50 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 08/11] i2c: designware: Convert driver to using regmap
 API
Message-ID: <20200527160950.p3brpiup3pihlzi6@mobilestation>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-9-Sergey.Semin@baikalelectronics.ru>
 <20200527160337.GL1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527160337.GL1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 07:03:37PM +0300, Andy Shevchenko wrote:
> On Wed, May 27, 2020 at 06:30:43PM +0300, Serge Semin wrote:
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
> 
> ...
> 
> > +	struct regmap_config map_cfg = {
> > +		.reg_bits = 32,
> > +		.val_bits = 32,
> > +		.reg_stride = 4,
> > +		.disable_locking = true,
> > +		.reg_read = dw_reg_read,
> > +		.reg_write = dw_reg_write,
> 
> > +		.max_register = DW_IC_COMP_TYPE
> 

> Perhaps leave comma here as well.

If v6 is required, it'll be fixed there.

-Sergey

> 
> > +	};
> 
> ...
> 
> > +	/*
> > +	 * Note we'll check the return value of the regmap IO accessors only
> > +	 * at the probe stage. The rest of the code won't do this because
> > +	 * basically we have MMIO-based regmap so non of the read/write methods
> > +	 * can fail.
> > +	 */
> > +	dev->map = devm_regmap_init(dev->dev, NULL, dev, &map_cfg);
> > +	if (IS_ERR(dev->map)) {
> > +		dev_err(dev->dev, "Failed to init the registers map\n");
> 
> > +		return PTR_ERR(dev->map);
> > +	}
> > +
> >  	return 0;
> 
> 	return PTR_ERR_OR_ZERO(dev->map);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

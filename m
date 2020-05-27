Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A6D1E494A
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 18:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390779AbgE0QHS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 12:07:18 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37070 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389666AbgE0QHQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 12:07:16 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id F02A68030809;
        Wed, 27 May 2020 16:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mrdXYHAst9Vn; Wed, 27 May 2020 19:07:13 +0300 (MSK)
Date:   Wed, 27 May 2020 19:07:13 +0300
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
Subject: Re: [PATCH v5 07/11] i2c: designware: Discard Cherry Trail model flag
Message-ID: <20200527160713.qocbv7c72d2fx2hu@mobilestation>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-8-Sergey.Semin@baikalelectronics.ru>
 <20200527155725.GK1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527155725.GK1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 06:57:25PM +0300, Andy Shevchenko wrote:
> On Wed, May 27, 2020 at 06:30:42PM +0300, Serge Semin wrote:
> > A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
> > since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
> > bus pm_disabled workaround"), but the flag most likely by mistake has been
> > left in the Dw I2C drivers. Let's remove it.
> 
> Same comment as per previous version.
> 
> > Since MODEL_MSCC_OCELOT is
> > the only model-flag left, redefine it to be 0x100 so setting a very first
> > bit in the MODEL_MASK bits range.
> 
> Cool, but why should we care?
> 
> > -#define MODEL_MSCC_OCELOT	0x00000200
> > +#define MODEL_MSCC_OCELOT	0x00000100
> 
> We have 4 bits for that, and you are going to reuse this anyway.
> 
> I consider this unneeded churn.

I'll leave it as is since prefer keeping the bit setting in the
historical order. Let's see what Jarkko thinks.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

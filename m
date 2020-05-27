Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0F21E45DF
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 16:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389049AbgE0O3F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 10:29:05 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:36218 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388899AbgE0O3F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 10:29:05 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 4B6248030835;
        Wed, 27 May 2020 14:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8gpHHTAcHaR0; Wed, 27 May 2020 17:29:02 +0300 (MSK)
Date:   Wed, 27 May 2020 17:29:02 +0300
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
Subject: Re: [PATCH v4 07/11] i2c: designware: Discard Cherry Trail model flag
Message-ID: <20200527142902.2xpteguuotsl3z7y@mobilestation>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-8-Sergey.Semin@baikalelectronics.ru>
 <20200527134339.GY1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527134339.GY1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 04:43:39PM +0300, Andy Shevchenko wrote:
> On Wed, May 27, 2020 at 03:01:07PM +0300, Serge Semin wrote:
> > A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
> > since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
> > bus pm_disabled workaround"), but the flag most likely by mistake has been
> > left in the Dw I2C drivers. Let's remove it.
> 
> ...
> 
> > -#define MODEL_MSCC_OCELOT	0x00000200
> > +#define MODEL_MSCC_OCELOT	0x00000100
> 
> But why?
> 
> Does 0x200 work or not? I didn't see this in commit message.

I removed the MODEL_CHERRYTRAIL flag and redefined the only left
MODEL_MSCC_OCELOT flag to set the very first bit allocated for the model
flags. Isn't that obvious?

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

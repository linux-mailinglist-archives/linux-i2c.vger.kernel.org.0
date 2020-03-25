Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C24DF19325B
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Mar 2020 22:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgCYVJw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Mar 2020 17:09:52 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:48478 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgCYVJw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Mar 2020 17:09:52 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 85E2A80307C2;
        Wed, 25 Mar 2020 21:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Cv3gjaAA1V8B; Thu, 26 Mar 2020 00:09:49 +0300 (MSK)
Date:   Thu, 26 Mar 2020 00:09:41 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C
 controller
Message-ID: <20200325210941.x6wqnlmauxmfkd4j@ubsrv2.baikal.int>
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132018.C268A8030792@mail.baikalelectronics.ru>
 <20200312214340.GA30360@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200312214340.GA30360@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 12, 2020 at 04:43:40PM -0500, Rob Herring wrote:
> On Fri, 6 Mar 2020 16:19:52 +0300, <Sergey.Semin@baikalelectronics.ru> wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > Just add the "be,bt1-i2c" compatible string to the bindings. The rest of
> > the DW APB I2C properties can be freely used to describe the Baikal-T1
> > I2C controller dts-node.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > ---
> >  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

Seeing you and us having doubts regarding our vendor prefix and the
corresponding patch still hasn't been accepted, in the next patchset release
perhaps I will have to change the compatible string of this driver. It depends
on a result of the discussion: https://lkml.org/lkml/2020/3/13/239

Rob, could you get back to it, so we could come up with a solution?

Currently most of our team members are leaning towards "baikal,t1" = "vendor,chip"
prefixes to all the SoC specific devices. So the Baikal-T1 I2C compatible string
would be renamed to "baikal,t1-i2c". What do you think?

Regards,
-Sergey

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9925252570
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 04:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgHZCQR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 25 Aug 2020 22:16:17 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:65071 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgHZCQQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Aug 2020 22:16:16 -0400
X-Greylist: delayed 1020 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Aug 2020 22:16:14 EDT
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 07Q1g5JQ015625
        for <linux-i2c@vger.kernel.org>; Wed, 26 Aug 2020 09:42:05 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 07Q1fxVs015567;
        Wed, 26 Aug 2020 09:41:59 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Wed, 26 Aug
 2020 09:59:11 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Wed, 26 Aug 2020 09:59:11 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Tao Ren <rentao.bupt@gmail.com>,
        Eddie James <eajames@linux.ibm.com>
CC:     Joel Stanley <joel@jms.id.au>,
        devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Thread-Topic: [PATCH 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Thread-Index: AQHWdwzk/wcXUhvRB0iNVkduNVuxEqlH4GIAgADco4CAAATnAIAA6Fog
Date:   Wed, 26 Aug 2020 01:59:11 +0000
Message-ID: <f84a5ad1064142b78b3fc5eeb4659627@TWMBX02.aspeed.com>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-4-eajames@linux.ibm.com>
 <CACPK8XdG1+3eQPQ71fZYZdHwcn8WNLQKF=5iKrOvGhLwispSQA@mail.gmail.com>
 <8fc365dd-8a89-9e5c-ed70-093ef2bf7265@linux.ibm.com>
 <20200825200523.GA22083@taoren-ubuntu-R90MNF91>
In-Reply-To: <20200825200523.GA22083@taoren-ubuntu-R90MNF91>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.2.87]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 07Q1fxVs015567
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Tao Ren [mailto:rentao.bupt@gmail.com]
> Sent: Wednesday, August 26, 2020 4:05 AM
> To: Eddie James <eajames@linux.ibm.com>
> Cc: Joel Stanley <joel@jms.id.au>; devicetree <devicetree@vger.kernel.org>;
> linux-aspeed <linux-aspeed@lists.ozlabs.org>; dmitry.torokhov@gmail.com;
> Brendan Higgins <brendanhiggins@google.com>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>; Rob Herring <robh+dt@kernel.org>;
> linux-i2c@vger.kernel.org; linux-input@vger.kernel.org; Ryan Chen
> <ryan_chen@aspeedtech.com>
> Subject: Re: [PATCH 3/5] i2c: aspeed: Mask IRQ status to relevant bits
> 
> On Tue, Aug 25, 2020 at 02:47:51PM -0500, Eddie James wrote:
> >
> > On 8/25/20 1:38 AM, Joel Stanley wrote:
> > > On Thu, 20 Aug 2020 at 16:12, Eddie James <eajames@linux.ibm.com>
> wrote:
> > > > Mask the IRQ status to only the bits that the driver checks. This
> > > > prevents excessive driver warnings when operating in slave mode
> > > > when additional bits are set that the driver doesn't handle.
> > > >
> > > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > > ---
> > > >   drivers/i2c/busses/i2c-aspeed.c | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/i2c/busses/i2c-aspeed.c
> > > > b/drivers/i2c/busses/i2c-aspeed.c index 31268074c422..abf40f2af8b4
> > > > 100644
> > > > --- a/drivers/i2c/busses/i2c-aspeed.c
> > > > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > > > @@ -604,6 +604,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq,
> void *dev_id)
> > > >          writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> > > >                 bus->base + ASPEED_I2C_INTR_STS_REG);
> > > >          readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> > > > +       irq_received &= 0xf000ffff;
> > > >          irq_remaining = irq_received;
> > > This would defeat the check for irq_remaining. I don't think we want to do
> this.
> > >
> > > Can you explain why these bits are being set in slave mode?
> >
> >
> > No, I don't have any documentation for the bits that are masked off
> > here, so I don't know why they would get set.
> >
> > The check for irq_remaining is still useful for detecting that the
> > driver state machine might be out of sync with what the master is doing.
> 
> I have a similar patch in my local tree, and the reason being: AST2600 I2C
> Controller may set I2CD10[25:24] to report Current Slave Parking Status
> (defined in new register I2CS24) even though the new register mode is off. The
> 2 bits can be ignored in legacy mode, and Ryan from ASPEED could confirm it.
Yes, in AST2600 i2cd10[25:24] will be the same with new mode register i2cs24[25:24]
Thanks Tao.
> 
> 
> Cheers,
> 
> Tao

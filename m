Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F0D31D276
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 23:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhBPWKR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 17:10:17 -0500
Received: from smtp2.axis.com ([195.60.68.18]:30576 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229722AbhBPWKQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Feb 2021 17:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1613513416;
  x=1645049416;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=jlpRjvnBwlHe14+tAbAX/DLQjSwvp1QJtpM4pjNbj+w=;
  b=koZW1J88s94/NDcC1oWaVm1zVQkL5Z2wdkjfV3Vje93/A/z8pQNDw5mH
   sOvszUwedB2qXASz/8Na0aeSXySaRoVSc6r5xDJ9/te2Y7x6syLDHulNr
   jmj6Tm+mnK4hX91r4yZrIaerLkO/Uki46O9MLEoq/K+YcF5MRBPkgj76u
   Js71hQqRr0TJu3a2XWd1iYcYrhFy82ouu3E7P/3zQKgLU7NF6jLS+5Cip
   IfIpx7RpAycXaZQSWtuBrRyafbIvMDdpFQ1TtqemGiusnDV2Mky8RnW08
   0xhpvfOR/GmAxBb44aIt/29YLjckUmCBL9T6VkDp0XieHTtvoeUXO/qBl
   w==;
Date:   Tue, 16 Feb 2021 23:09:33 +0100
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@axis.com>
Subject: Re: [PATCH] i2c: exynos5: Preserve high speed master code
Message-ID: <20210216220933.2wzmft72bhjptzl3@axis.com>
References: <20210215190322.22094-1-marten.lindahl@axis.com>
 <20210216075141.o4wjnwmmjze2p3cn@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210216075141.o4wjnwmmjze2p3cn@kozik-lap>
User-Agent: NeoMutt/20170113 (1.7.2)
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof!

Thank you for your comments! Please see my reply below.
I will send v2 in a moment.

On Tue, Feb 16, 2021 at 08:51:41AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Feb 15, 2021 at 08:03:21PM +0100, Mårten Lindahl wrote:
> > From: Mårten Lindahl <martenli@axis.com>
> > 
> > When the controller starts to send a message with the MASTER_ID field
> > set (high speed), the whole I2C_ADDR register is overwritten including
> > MASTER_ID as the SLV_ADDR_MAS field is set.
> 
> Are you here describing bug in driver or hardware (the controller?)?
> Looking at the code, I think the driver, but description got me
> confused.
> 

Yes, it is the driver. I will change.

> > 
> > This patch preserves already written fields in I2C_ADDR when writing
> > SLV_ADDR_MAS.
> > 
> > Signed-off-by: Mårten Lindahl <martenli@axis.com>
> > ---
> >  drivers/i2c/busses/i2c-exynos5.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> > index 20a9881a0d6c..f2d04c241299 100644
> > --- a/drivers/i2c/busses/i2c-exynos5.c
> > +++ b/drivers/i2c/busses/i2c-exynos5.c
> > @@ -606,6 +606,7 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
> >  	u32 i2c_ctl;
> >  	u32 int_en = 0;
> >  	u32 i2c_auto_conf = 0;
> > +	u32 i2c_addr = 0;
> >  	u32 fifo_ctl;
> >  	unsigned long flags;
> >  	unsigned short trig_lvl;
> > @@ -640,7 +641,12 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
> >  		int_en |= HSI2C_INT_TX_ALMOSTEMPTY_EN;
> >  	}
> >  
> > -	writel(HSI2C_SLV_ADDR_MAS(i2c->msg->addr), i2c->regs + HSI2C_ADDR);
> > +	i2c_addr = HSI2C_SLV_ADDR_MAS(i2c->msg->addr);
> > +
> > +	if (i2c->op_clock >= I2C_MAX_FAST_MODE_PLUS_FREQ)
> > +		i2c_addr |= readl(i2c->regs + HSI2C_ADDR);
> 
> Any reason why not "|= MASTER_ID(i2c->adap.nr)" here instead of more
> expensive IO read? It's quite important because your current code will
> bitwise-or old I2C slave address with a new one... This should break
> during tests with multiple I2C slave devices, shouldn't it?
> 

You are correct. It is better to use the macro instead, and yes,
safer too. I only have one device that supports high speed i2c, but
I get your point. It could potentially break.

> On which HW did you test it?

I used an Artpec development board as master and INA230EVM board
as slave.

> 
> Best regards,
> Krzysztof
> 

Best regards
Mårten
> 
> > +
> > +	writel(i2c_addr, i2c->regs + HSI2C_ADDR);

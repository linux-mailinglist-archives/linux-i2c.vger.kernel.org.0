Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5F31BD6DF
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 10:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgD2IMz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 29 Apr 2020 04:12:55 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:45649 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgD2IMz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 04:12:55 -0400
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 03T82qFe086043;
        Wed, 29 Apr 2020 16:02:52 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Wed, 29 Apr
 2020 16:12:46 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Wed, 29 Apr 2020 16:12:45 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Thread-Topic: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Thread-Index: AQHWHdeQ1mqTBOPAdE+n+yVhmYVsFKiPNOCAgACLErA=
Date:   Wed, 29 Apr 2020 08:12:45 +0000
Message-ID: <56add9c6e6b5410986325a1360466e4b@TWMBX02.aspeed.com>
References: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
 <20200429075357.GA1957@kunai>
In-Reply-To: <20200429075357.GA1957@kunai>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.2.87]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 03T82qFe086043
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-----Original Message-----
From: Wolfram Sang [mailto:wsa@the-dreams.de] 
Sent: Wednesday, April 29, 2020 3:54 PM
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Brendan Higgins <brendanhiggins@google.com>; Benjamin Herrenschmidt <benh@kernel.crashing.org>; Joel Stanley <joel@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>; linux-i2c@vger.kernel.org; openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status clear race condition.

On Wed, Apr 29, 2020 at 11:37:37AM +0800, ryan_chen wrote:
> In AST2600 there have a slow peripheral bus between CPU  and i2c 
> controller.
> Therefore GIC i2c interrupt status clear have delay timing, when CPU 
> issue write clear i2c controller interrupt status.
> To avoid this issue, the driver need have read after write  clear at 
> i2c ISR.
> 
> Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>

v0? is it a prototype?
[Ryan Chen] It is not prototype it is official patch.
And is there maybe a Fixes: tag for it?
[Ryan Chen] Yes it is a fix patch.

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c 
> b/drivers/i2c/busses/i2c-aspeed.c index 07c1993274c5..f51702d86a90 
> 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -603,6 +603,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  	/* Ack all interrupts except for Rx done */
>  	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>  	       bus->base + ASPEED_I2C_INTR_STS_REG);
> +	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>  	irq_remaining = irq_received;
>  
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> @@ -645,9 +646,11 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  			irq_received, irq_handled);
>  
>  	/* Ack Rx done */
> -	if (irq_received & ASPEED_I2CD_INTR_RX_DONE)
> +	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
>  		writel(ASPEED_I2CD_INTR_RX_DONE,
>  		       bus->base + ASPEED_I2C_INTR_STS_REG);
> +		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +	}
>  	spin_unlock(&bus->lock);
>  	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;  }
> --
> 2.17.1
> 

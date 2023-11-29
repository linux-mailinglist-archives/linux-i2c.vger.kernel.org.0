Return-Path: <linux-i2c+bounces-524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACD7FCBAF
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 01:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8A072832B8
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 00:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C911867;
	Wed, 29 Nov 2023 00:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+c/QVVl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28081863
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 00:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78E4C433C7;
	Wed, 29 Nov 2023 00:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701218712;
	bh=BoDVFsUwHvuFZBXmTakeJFuui2uZQsPNMqQoXk1kNR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+c/QVVlFt+4XBozCUgCmmdawfa41r0LR0C0rmMKZavCT4ks2DZVIA/7g4tpDjbZA
	 D+4vAHH+Z3nDvsqsGxlYgioWFDizCwTyExQcZ4DIAaozf4IOE/lb4EwH2FcuzfUS7u
	 WI8AU8MQ2Gk9Oc68S3WD7SqOG4HOWYGJ/xK6e3//MbbPpHdLB+IS4aGEQdZwD1mw60
	 3QCh07zZTWZpudVjCmniRaNIO3stHLKDG/IbQFKnK+R/b7+ttxFieOGowaz2w7dZ03
	 x7ecp7hwRyK7AM4bCcl8nDcbVzD+v4N8mY3b50gTDdClQ274lEB59KPvwWcR1is+5v
	 YcnIOBhcd/Ukw==
Date: Wed, 29 Nov 2023 01:45:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wolfram Sang <wsa@kernel.org>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v2 RESEND 2/2] i2c: aspeed: Acknowledge Tx done with and
 without ACK irq late
Message-ID: <20231129004509.ilriuwm3hulvy67l@zenone.zhora.eu>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
 <20231128075236.2724038-3-quan@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231128075236.2724038-3-quan@os.amperecomputing.com>

Hi Quan,

On Tue, Nov 28, 2023 at 02:52:36PM +0700, Quan Nguyen wrote:
> Commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in
> interrupt handler") acknowledges most interrupts early before the slave
> irq handler is executed, except for the "Receive Done Interrupt status"
> which is acknowledged late in the interrupt.
> However, it is observed that the early acknowledgment of "Transmit Done
> Interrupt Status" (with ACK or NACK) often causes the interrupt to be
> raised in READ REQUEST state, resulting in "Unexpected ACK on read
> request." complaint messages.
> 
> Assuming that the "Transmit Done" interrupt should only be acknowledged
> once it is truly processed, this commit fixes this issue by acknowledging
> this interrupt for both ACK and NACK cases late in the interrupt handler
> also.
> 
> Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v2:
>   + Split to separate series [Joel]
>   + Added the Fixes line [Joel]
>   + Fixed multiline comment [Joel]
>   + Refactor irq clearing code [Joel, Guenter]
>   + Revised commit message [Joel]
>   + Revised commit message [Quan]
>   + About a note to remind why the readl() should immediately follow the
> writel() to fix the race condition when clearing irq status from commit
> c926c87b8e36 ("i2c: aspeed: Avoid i2c interrupt status clear race
> condition"), I think it looks straight forward in this patch and decided
> not to add that note. [Joel]
> 
> v1:
>   + First introduced in
> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 79476b46285b..3231f430e335 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -611,8 +611,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  
>  	spin_lock(&bus->lock);
>  	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> -	/* Ack all interrupts except for Rx done */
> -	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> +	/* Ack all interrupts except for Rx done and Tx done with/without ACK */
> +	writel(irq_received &
> +	       ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
>  	       bus->base + ASPEED_I2C_INTR_STS_REG);
>  	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>  	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
> @@ -657,12 +658,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>  			irq_received, irq_handled);
>  
> -	/* Ack Rx done */
> -	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
> -		writel(ASPEED_I2CD_INTR_RX_DONE,
> -		       bus->base + ASPEED_I2C_INTR_STS_REG);
> -		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> -	}
> +	/* Ack Rx done and Tx done with/without ACK */
> +	writel(irq_received &
> +	       (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
> +	       bus->base + ASPEED_I2C_INTR_STS_REG);
> +	readl(bus->base + ASPEED_I2C_INTR_STS_REG);

So, you are acknowledging everything here. Why wasn’t it done
this way in the first place?

I would appreciate a comment here from Guenter, whose commit you
are fixing.

Thanks,
Andi

>  	spin_unlock(&bus->lock);
>  	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>  }
> -- 
> 2.35.1
> 


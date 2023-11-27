Return-Path: <linux-i2c+bounces-483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F059F7FAD6F
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 23:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB26F2819E7
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 22:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005FB46532;
	Mon, 27 Nov 2023 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pjb9M3dg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DB93FB0C
	for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 22:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870A7C433C8;
	Mon, 27 Nov 2023 22:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701123926;
	bh=GRyFkV0q85dCw/8aaH+ce1mWfZBdwTA+ebfxJuBFea8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pjb9M3dguGR27IGPgk/7/jJ7HJDeS4kcZHWrGtB6092BMnDwGSeo6greCg8V3ZJMw
	 h+Un3fkdNsnqi2kCK1/1wVmliPfj9ayXqqBZ+i0Rb2ymnHNVXCyGeS7FGCc/ipMIA5
	 xpyJJ1iLa9qeTTlGGs2qtZ11lSX2hEctXIaxJblHMQcmw7tT3hU9NGiSisDXJtTQ4q
	 fNKPhB9JRF2v1qDFyuPZr39+7oV4r8dQvnqfhl1NElCvV95Qw/cwdKNY8bmZP0UmEj
	 UonC0osEUR63TOcFdhGbXTC1I+8DWlnG/n/Tn5WKfozXD8vuuRyQk+EB06+umtURVW
	 eaS1NLYatfWfg==
Date: Mon, 27 Nov 2023 23:25:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux@roeck-us.net, wsa@kernel.org,
	jae.hyun.yoo@linux.intel.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com
Subject: Re: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in
 SLAVE_READ_PROCESSED
Message-ID: <20231127222522.wjdd6btbug6shd7y@zenone.zhora.eu>
References: <20231120091746.2866232-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120091746.2866232-1-chou.cosmo@gmail.com>

Hi Cosmo,

On Mon, Nov 20, 2023 at 05:17:46PM +0800, Cosmo Chou wrote:
> commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early
> in interrupt handler") moved most interrupt acknowledgments to the
> start of the interrupt handler to avoid race conditions. However,
> slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSED
> is handled.
> 
> Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fix
> the problem that the next byte is not sent correctly.
> 
> Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 28e2a5fc4528..c2d74e4b7e50 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -337,6 +337,12 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  		break;
>  	}
>  
> +	/* Ack Tx ack */
> +	if (irq_handled & ASPEED_I2CD_INTR_TX_ACK) {
> +		writel(ASPEED_I2CD_INTR_TX_ACK, bus->base + ASPEED_I2C_INTR_STS_REG);
> +		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +	}
> +
>  	return irq_handled;
>  }
>  #endif /* CONFIG_I2C_SLAVE */
> @@ -602,13 +608,18 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  {
>  	struct aspeed_i2c_bus *bus = dev_id;
> -	u32 irq_received, irq_remaining, irq_handled;
> +	u32 irq_received, irq_remaining, irq_handled, irq_acked;
>  
>  	spin_lock(&bus->lock);
>  	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>  	/* Ack all interrupts except for Rx done */
> -	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> -	       bus->base + ASPEED_I2C_INTR_STS_REG);
> +	irq_acked = irq_received & ~ASPEED_I2CD_INTR_RX_DONE;
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	/* shouldn't ack Slave Tx Ack before it's handled */
> +	if (bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED)
> +		irq_acked &= ~ASPEED_I2CD_INTR_TX_ACK;
> +#endif
> +	writel(irq_acked, bus->base + ASPEED_I2C_INTR_STS_REG);

which branch are you? You don't look like being in the latest.
Please update your branch.

Andi

>  	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>  	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
>  	irq_remaining = irq_received;
> -- 
> 2.34.1
> 


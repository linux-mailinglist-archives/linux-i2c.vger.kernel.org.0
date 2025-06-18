Return-Path: <linux-i2c+bounces-11517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C73AADF9B4
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 01:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADDE63B0100
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jun 2025 23:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BB827FD52;
	Wed, 18 Jun 2025 23:19:56 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE12213E6D;
	Wed, 18 Jun 2025 23:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750288796; cv=none; b=Bvkikhs7nzUTNkwh8lhfQeiH3McfZP0FDVs5c+BJUNeEuVEL17Ot3k2JwG52wRy8+Csocl/D9o/ln0Q0YG4qACMPW2f9gijJn2XuJJSPVtLaId6UouNpkv5dxJGIuuxaPnHT7Or2R6sAovEnKf722WqXlyE4o26FeKczPjhw98M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750288796; c=relaxed/simple;
	bh=rhqkHqpHMwd47r5ajjM1n1LuaTRbXA190PRn1Pxwhrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=UWEhWNhRNU2FEIXictABWmEvMd4iAgrRJ2Y3uTUFSpZJ9lUrA8Ovl8GC143OJvl43+KHyTGabGysAEaSnFWF9VK4RE76jtXjJLpMlDhfp6s7eD6Yh1Mw4XYXauMdTG3t5ozOi3SYixuGo0V1c+ASM1Vz1SRQa/5e12ipnaPRpG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.5] (ip5f5af305.dynamic.kabel-deutschland.de [95.90.243.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id EB61D60288261;
	Thu, 19 Jun 2025 01:18:33 +0200 (CEST)
Message-ID: <63e740bf-cd0c-4671-9254-6846048b0366@molgen.mpg.de>
Date: Thu, 19 Jun 2025 01:18:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: aspeed: change debug level in irq handler
To: Jian Zhang <zhangjian.3032@bytedance.com>
References: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Jian,


Thank you for the patch.

Am 18.06.25 um 12:21 schrieb Jian Zhang:
> In interrupt context, using dev_err() can potentially cause latency
> or affect system responsiveness due to printing to console.
> 
> In our scenario, under certain conditions, i2c1 repeatedly printed
> "irq handled != irq. expected ..." around 20 times within 1 second.

Any idea, why you hit this error at all?

> Each dev_err() log introduced approximately 10ms of blocking time,
> which delayed the handling of other interrupts — for example, i2c2.
> 
> At the time, i2c2 was performing a PMBus firmware upgrade. The
> target device on i2c2 was time-sensitive, and the upgrade protocol
> was non-retryable. As a result, the delay caused by frequent error
> logging led to a timeout and ultimately a failed firmware upgrade.
> 
> Frequent error printing in interrupt context can be dangerous,
> as it introduces latency and interferes with time-critical tasks.
> This patch changes the log level from dev_err() to dev_dbg() to
> reduce potential impact.

Thank you for the patch and the problem description. Hiding an error 
condition behind debug level is also not good, as administrators might 
miss hardware issues. I do not have a solution. Is there something 
similar to WARN_ONCE? Maybe the level should be a warning instead of 
error, because the system is often able to cope with this?

The code is from 2017, so should be well tested actually, shouldn’t it?

> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> ---
>   drivers/i2c/busses/i2c-aspeed.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 1550d3d552ae..38e23c826f39 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -317,7 +317,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   	switch (bus->slave_state) {
>   	case ASPEED_I2C_SLAVE_READ_REQUESTED:
>   		if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
> -			dev_err(bus->dev, "Unexpected ACK on read request.\n");
> +			dev_dbg(bus->dev, "Unexpected ACK on read request.\n");
>   		bus->slave_state = ASPEED_I2C_SLAVE_READ_PROCESSED;
>   		i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
>   		writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
> @@ -325,7 +325,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		break;
>   	case ASPEED_I2C_SLAVE_READ_PROCESSED:
>   		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> -			dev_err(bus->dev,
> +			dev_dbg(bus->dev,
>   				"Expected ACK after processed read.\n");
>   			break;
>   		}
> @@ -354,7 +354,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		/* Slave was just started. Waiting for the next event. */;
>   		break;
>   	default:
> -		dev_err(bus->dev, "unknown slave_state: %d\n",
> +		dev_dbg(bus->dev, "unknown slave_state: %d\n",
>   			bus->slave_state);
>   		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
>   		break;
> @@ -459,7 +459,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   
>   	/* We are in an invalid state; reset bus to a known state. */
>   	if (!bus->msgs) {
> -		dev_err(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
> +		dev_dbg(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
>   			irq_status);
>   		bus->cmd_err = -EIO;
>   		if (bus->master_state != ASPEED_I2C_MASTER_STOP &&
> @@ -523,7 +523,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>   			goto error_and_stop;
>   		} else if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> -			dev_err(bus->dev, "slave failed to ACK TX\n");
> +			dev_dbg(bus->dev, "slave failed to ACK TX\n");
>   			goto error_and_stop;
>   		}
>   		irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
> @@ -546,7 +546,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		fallthrough;
>   	case ASPEED_I2C_MASTER_RX:
>   		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_RX_DONE))) {
> -			dev_err(bus->dev, "master failed to RX\n");
> +			dev_dbg(bus->dev, "master failed to RX\n");
>   			goto error_and_stop;
>   		}
>   		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
> @@ -577,7 +577,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		goto out_no_complete;
>   	case ASPEED_I2C_MASTER_STOP:
>   		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))) {
> -			dev_err(bus->dev,
> +			dev_dbg(bus->dev,
>   				"master failed to STOP. irq_status:0x%x\n",
>   				irq_status);
>   			bus->cmd_err = -EIO;
> @@ -589,7 +589,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
>   		goto out_complete;
>   	case ASPEED_I2C_MASTER_INACTIVE:
> -		dev_err(bus->dev,
> +		dev_dbg(bus->dev,
>   			"master received interrupt 0x%08x, but is inactive\n",
>   			irq_status);
>   		bus->cmd_err = -EIO;
> @@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>   
>   	irq_remaining &= ~irq_handled;
>   	if (irq_remaining)
> -		dev_err(bus->dev,
> +		dev_dbg(bus->dev,
>   			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>   			irq_received, irq_handled);
>   


Kind regards,

Paul


Return-Path: <linux-i2c+bounces-2585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA388B5E7
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 01:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A25661C362B3
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 00:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B2336F;
	Tue, 26 Mar 2024 00:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ql2z3Q9V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6BB163;
	Tue, 26 Mar 2024 00:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711412272; cv=none; b=r/c3QL7WN5i+4e17Y19qTYAQcGH/YPcXBBgerQs/fCB5E+qeGK0Av/X+Jyoy3WyzZhSPCQix3mQhHpNNfTYjAcExxb0/1eDONqDByRxYG3xN5qgjzeQNTyKWi+uj/BzdruP66SZsvTL2A7IBVNOtgQAoG3DLKYg3BAf/IXs5zg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711412272; c=relaxed/simple;
	bh=DzwoMxfvZ+a0x0ZrAQfdTRiDFr9eaI4ZTx/k5Lkg1jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/RExfd0PPmrFY4OLeh+j8+bayh+ZgoKi2kSc705cxS6awY3czOIxU9/ConKZdC3OYhQGcIJyk1yLAQfdNd23pe08U7VTr28x8pm8p/MpksXn5zkP6xZYHKIn9lHntqcdWn6eDYHym96c4d3dC3e3nKo4dQk/WXNucAiG0MvWmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ql2z3Q9V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED6CC43390;
	Tue, 26 Mar 2024 00:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711412271;
	bh=DzwoMxfvZ+a0x0ZrAQfdTRiDFr9eaI4ZTx/k5Lkg1jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ql2z3Q9Va2O3ZD24FUv4udV3A0FUrLQBpuYl2RtDYysFDl6ejEWXKAh049CVM34EE
	 QWsGi9dOs+LROWXQ8Utpmux0W21ur1gFoBnHN1MiuIvMHW+2wdgx0HM8xWpSha+pV6
	 1o1HMXmPFjckLzr70g204mpNiITuMr9ORo6dXpd8FDAkKewNQnp+dUE9rmT3On8Ffr
	 8qY/aGdf9NPNXvYa/JD2syROd9MAcEAlTnNu0aEYLLFR8P0WtUJBjIqCSO1CKo1+SR
	 ZSD8zY7h5H8Zbdvk5Y1HMwbWZpnicdR3wyK9vc5ig38OLHoK8tfqyJheM3t0pMZCOj
	 xEebc/CmHcIAw==
Date: Tue, 26 Mar 2024 01:17:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/64] i2c: aspeed: reword according to newest
 specification
Message-ID: <vb4hempklviz6w4gd3eimprplybm4ckefwz2gyy7cp2uww2anv@b4egbq4u4rrg>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-6-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:24:58PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ce8c4846b7fa..4e6ea4a5cab9 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -159,7 +159,7 @@ struct aspeed_i2c_bus {
>  	bool				send_stop;
>  	int				cmd_err;
>  	/* Protected only by i2c_lock_bus */
> -	int				master_xfer_result;
> +	int				xfer_result;
>  	/* Multi-master */
>  	bool				multi_master;
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> @@ -608,9 +608,9 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  out_complete:
>  	bus->msgs = NULL;
>  	if (bus->cmd_err)
> -		bus->master_xfer_result = bus->cmd_err;
> +		bus->xfer_result = bus->cmd_err;
>  	else
> -		bus->master_xfer_result = bus->msgs_index + 1;
> +		bus->xfer_result = bus->msgs_index + 1;
>  	complete(&bus->cmd_complete);
>  out_no_complete:
>  	return irq_handled;
> @@ -679,7 +679,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>  }
>  
> -static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
> +static int aspeed_i2c_xfer(struct i2c_adapter *adap,
>  				  struct i2c_msg *msgs, int num)

here the alignment goes a bi off.

>  {
>  	struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);
> @@ -738,7 +738,7 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>  		return -ETIMEDOUT;
>  	}
>  
> -	return bus->master_xfer_result;
> +	return bus->xfer_result;
>  }
>  
>  static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
> @@ -748,7 +748,7 @@ static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
>  
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  /* precondition: bus.lock has been acquired. */
> -static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
> +static void __aspeed_i2c_reg_target(struct aspeed_i2c_bus *bus, u16 slave_addr)

We  have the word master/slave forgotten here and there, but as
we are here, /slave_addr/target_addr/

>  {
>  	u32 addr_reg_val, func_ctrl_reg_val;
>  
> @@ -770,7 +770,7 @@ static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
>  	bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
>  }
>  
> -static int aspeed_i2c_reg_slave(struct i2c_client *client)
> +static int aspeed_i2c_reg_target(struct i2c_client *client)
>  {
>  	struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
>  	unsigned long flags;
> @@ -781,7 +781,7 @@ static int aspeed_i2c_reg_slave(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>  
> -	__aspeed_i2c_reg_slave(bus, client->addr);
> +	__aspeed_i2c_reg_target(bus, client->addr);
>  
>  	bus->slave = client;
>  	spin_unlock_irqrestore(&bus->lock, flags);
> @@ -789,7 +789,7 @@ static int aspeed_i2c_reg_slave(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int aspeed_i2c_unreg_slave(struct i2c_client *client)
> +static int aspeed_i2c_unreg_target(struct i2c_client *client)
>  {
>  	struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
>  	u32 func_ctrl_reg_val;
> @@ -814,11 +814,11 @@ static int aspeed_i2c_unreg_slave(struct i2c_client *client)
>  #endif /* CONFIG_I2C_SLAVE */
>  
>  static const struct i2c_algorithm aspeed_i2c_algo = {
> -	.master_xfer	= aspeed_i2c_master_xfer,
> +	.xfer	= aspeed_i2c_xfer,

here the alignment goes a bit off.

Andi


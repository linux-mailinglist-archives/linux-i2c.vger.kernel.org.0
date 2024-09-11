Return-Path: <linux-i2c+bounces-6545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E09E097504E
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 12:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 897151F2A1B6
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 10:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6690B1862AE;
	Wed, 11 Sep 2024 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmNE7nNr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD5185B67;
	Wed, 11 Sep 2024 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726052264; cv=none; b=deOEKL833xxUx8Ep5y5AnwJLAm6vGJIYBWDiKmMk34fqj9n/5ZS0TdiFMHBLb7UBWjHhXKaysG7HYt+LojDZ4tzKKjBDiKUEuc74Rws68HErGbAf/v8KKyY37o40UXwa0wcObvVhr4R6WzgJReCxfBRorPBkng5SR0sgCNLm3UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726052264; c=relaxed/simple;
	bh=KNrTDepDPuGxtTmBbgCKo0Gtxg+JrP7T4JGklJVrrOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWP8gR4IT7aQlXPcUmbIjhbrTMLNIsMhfNzDAUZiKOTxeS/SeNlCnUx1E8tTswLnxd4ImMlSI4g0q2iUT4eMQmoOIkLe7+e0IWt8nZ6a89MOeb4gwY4BipE5RfLjxAhWSNUFWYb+Ree0EEgLQXxl6aIBanFQG6QqUmE9z5wpV60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmNE7nNr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBF7C4CEC5;
	Wed, 11 Sep 2024 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726052263;
	bh=KNrTDepDPuGxtTmBbgCKo0Gtxg+JrP7T4JGklJVrrOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmNE7nNrQZr1i8uI6cLz5m+pKTG2pNQh1ygtOLlaWJxKqBhz0ii0bv6RLnD1uC/FP
	 gqE3zUJUWqpwn1Mf1L6w8Gk3pfd5kzNdxyF7XudoPiIhlWrJ1jNlJvRBKgTLPd1c0H
	 TCuSiXDuhePum7noQxWMzK/FPzR1jfFy44q45bxsRM+MUl5t+tBlxk+RUXV7uuwUgL
	 p1Gfm+MtA9ihcuDxSVQsZC6R+F/2puuN5sPxPnLKEkwdqv7ewxUg8+SRLUvgVaEvaQ
	 /FAoaA6yHtoH+OOOC/gn6CQ0VVFLlxcn+ax/Sj1TSLv7tjxSJCrbq+d90swYMrT37s
	 efMijMQK3C/3A==
Date: Wed, 11 Sep 2024 12:57:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, wsa@kernel.org, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v3] i2c: aspeed: Update the stop sw state when the bus
 recovery occurs
Message-ID: <yoqhvha64bir33hcq6tlcehkusxu2b45w3ut4pzmvrot6bl63a@y3xn2xdespcu>
References: <20240911093951.1674824-1-tommy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911093951.1674824-1-tommy_huang@aspeedtech.com>

Hi,

On Wed, Sep 11, 2024 at 05:39:51PM GMT, Tommy Huang wrote:
> When the i2c bus recovery occurs, driver will send i2c stop command
> in the scl low condition. In this case the sw state will still keep
> original situation. Under multi-master usage, i2c bus recovery will
> be called when i2c transfer timeout occurs. Update the stop command
> calling with aspeed_i2c_do_stop function to update master_state.
> 
> Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> 

the blank line in between tags (Fixes and the rest) needs to be
removed.

No worries, I will take care of it before merging.

Meantime, Brendan, Benjamin, Joel, any comment on this change?

Thanks,
Andi

> Cc: <stable@vger.kernel.org> # v4.13+
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ce8c4846b7fa..2a03a221e2dd 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -170,6 +170,13 @@ struct aspeed_i2c_bus {
>  
>  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
>  
> +/* precondition: bus.lock has been acquired. */
> +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus)
> +{
> +	bus->master_state = ASPEED_I2C_MASTER_STOP;
> +	writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +}
> +
>  static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  {
>  	unsigned long time_left, flags;
> @@ -187,7 +194,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  			command);
>  
>  		reinit_completion(&bus->cmd_complete);
> -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +		aspeed_i2c_do_stop(bus);
>  		spin_unlock_irqrestore(&bus->lock, flags);
>  
>  		time_left = wait_for_completion_timeout(
> @@ -390,13 +397,6 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
>  	writel(command, bus->base + ASPEED_I2C_CMD_REG);
>  }
>  
> -/* precondition: bus.lock has been acquired. */
> -static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus)
> -{
> -	bus->master_state = ASPEED_I2C_MASTER_STOP;
> -	writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> -}
> -
>  /* precondition: bus.lock has been acquired. */
>  static void aspeed_i2c_next_msg_or_stop(struct aspeed_i2c_bus *bus)
>  {
> -- 
> 2.25.1
> 


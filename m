Return-Path: <linux-i2c+bounces-1903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB83885E9BC
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 22:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457CA286D2F
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 21:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74237126F0F;
	Wed, 21 Feb 2024 21:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvD9pA4A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F60183CD8;
	Wed, 21 Feb 2024 21:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708550091; cv=none; b=taUGbCYLxD3LNj8wwx6D5L5UVYNwQoccz1mFjK4y7T4k2qra1K/Z6MugS94m3onp9qUmiq0dIuH3a+Q57nOegUGkdgv/EguyK+29pr3XgKX9apwPsjMwanDu7hYgSJ4Onj5GnAhPctK9HJDSxfexIcwJSfJ5WjPw3X8iS/sq1FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708550091; c=relaxed/simple;
	bh=+EdDNbEsAKZRG0zuuQG5RTrKozfYoT2Jo7rs3XByyDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UknOA7iEzZKmCLXtAJeLWOy441NSsONtdM/64isb2A+nrHU1dMAd85i9KVaVv/F1+DL7j+zHEi0PURXe2ogOGtnXP3yCnjPJwgH4jadaU6DYVA21o2T5ghvoi+YbuTvxhfbEZCLVJxNShvBkoPG+ffP+dyctz5A9op/3+xp/JmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvD9pA4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB035C433C7;
	Wed, 21 Feb 2024 21:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708550090;
	bh=+EdDNbEsAKZRG0zuuQG5RTrKozfYoT2Jo7rs3XByyDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvD9pA4AqNbNBkzO7LgRGJtM3iQqVlQPGMqpx3Omqi+g54/KXwHnkereA0ovaKlm4
	 WseGRIOQH/DIChpAJuWH5mKcyQCFhcANqueAgHtTt2Xx1R7tSL9pbLeWLjmLKKlXSF
	 oM9wcJ2vWNtAkW/KRr5V7IcVGmQWdbn7zmjK2coqK5AhMg+S1djDUlGAxaqFonyTc0
	 lqCvXAW3xe3Yf5R8Tq7D3mIoEJN3Mf6C8J7zQC1dClU8VJOqXGQn2xIR6pjfxKw0OP
	 m33qeF22uontgE1lJ8tHHoYW7W3QmXzxQ1J2lyV6gEuVIsjVMxlZoesDIZptNvhg0W
	 goVCLPc8/ET4Q==
Date: Wed, 21 Feb 2024 22:14:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: brendan.higgins@linux.dev, p.zabel@pengutronix.de, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, benh@kernel.crashing.org, 
	joel@jms.id.au, andrew@aj.id.au, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Message-ID: <nbkkaktcozbhly44hii3zwie7ivsra3qxzdibyzhyhooxrudvb@zik6skmkki2c>
References: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>

Hi Tommy,

On Fri, Feb 16, 2024 at 08:04:55PM +0800, Tommy Huang wrote:
> When the i2c error condition occurred and master state was not idle,
> the master irq function will goto complete state without any other
> interrupt handling. It would cause dummy irq expected print. Under
> this condition, assign the irq_status into irq_handle.

I'm sorry, but I don't understand much from your log here.

Do you mean that irq_handled in aspeed_i2c_master_irq() is left
with some states that is not supposed to have and then you
end up printing here:

	dev_err(bus->dev,
		"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
		irq_received, irq_handled);

Can you please explain better?

If that's the case, wouldn't it make more sense to check for 
bus->master_state != ASPEED_I2C_MASTER_INACTIVE) earlier?

And, still, If that's the case, I believe you might need the
Fixes tag. It's true that you are not really failing, but you are
not reporting a failure by mistake.

Thanks,
Andi

> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 5511fd46a65e..ce8c4846b7fa 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -445,6 +445,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  			irq_status);
>  		irq_handled |= (irq_status & ASPEED_I2CD_INTR_MASTER_ERRORS);
>  		if (bus->master_state != ASPEED_I2C_MASTER_INACTIVE) {
> +			irq_handled = irq_status;
>  			bus->cmd_err = ret;
>  			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
>  			goto out_complete;
> -- 
> 2.25.1
> 


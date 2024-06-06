Return-Path: <linux-i2c+bounces-3882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DECF8FDC1F
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 03:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82059283B5E
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 01:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82095F4EB;
	Thu,  6 Jun 2024 01:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/jWDVwm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B70A8BE8;
	Thu,  6 Jun 2024 01:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717637220; cv=none; b=QY1VHOMK//x1+/MtNw0T4aE6DSSRG+pCZuLXnHD1Xpxd0kVzw9i0LJGGG4ZbiGbZKSq01Am1uTu756uVUGnBCZsEo0n4SB+LMgqZu2MIdRokzh+G+FMWbXLrrEEaoH39SabBc2u3GpRKK/9PuVN4qtWKiZv4LTTGV+NEkKrUJyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717637220; c=relaxed/simple;
	bh=hXn+odQqb9ycP7ylEs86A0/+bXD9RU1Tq6JA4ws0mxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tunkU/cnZ5akye6QXjehEDxp024+sTOLeRfz519QemFzB7j2PhO0lMe7hYDpIKXy5jURpzenAIpZq1sZNMnTNhpxi1xGnJj0jOZrDQuaLBEc3DRElmF/y/ggw/xq5xAzkmiTD/T8XZDsPhVmrI98tJnb47QUKB6SGSyKijof/iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/jWDVwm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6354C2BD11;
	Thu,  6 Jun 2024 01:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717637219;
	bh=hXn+odQqb9ycP7ylEs86A0/+bXD9RU1Tq6JA4ws0mxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/jWDVwmXLfu9EKZyPkMPbGlChXCRH9hOYb7kYUBcg8t2ylmiG78N6sjy11HCBDSq
	 CcizWLwQOlXpplGIMUiIhrfuOL/YNuQ+u+RQZnjsIGvucMXlJtG3N2js1GByT/4Ngv
	 QZPnGTk0Xqbsi4FpHLXbe00o6yxeJKJjsGIb4X09hYL6AvQ+ZnPeUpF7uYcygfOGhM
	 5J4hm3ugv4YRnF8doOCgjP3lS34+HNwW2vYavpfzN9LZKNCARwEROxfQYrGCqdxPOc
	 1qXLtE8vHtc68RZH2Mx+7XEtcqI3+y4b6buhEaoHsZeacHh4231DMi3K3ojLP2JaRB
	 G9z651baDhqWQ==
Date: Thu, 6 Jun 2024 02:26:55 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, wsa@kernel.org, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH] i2c: aspeed: Update the stop sw state when the bus
 recovry occurs
Message-ID: <kts7ib2rxq4g26ayumcyaohs37zl43qo66gok3vae3reyabobe@nbbborkf2eow>
References: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>

Hi Tommy,

On Thu, May 30, 2024 at 03:06:56PM +0800, Tommy Huang wrote:
> When the i2c bus recovey occurs, driver will send i2c stop command
> in the scl low condition. In this case the sw state will still keep
> original situation. Under multi-master usage, i2c bus recovery will
> be called when i2c transfer timeout occurs. Update the stop command
> calling with aspeed_i2c_do_stop function to update master_state.
> 
> Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> 
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>

Can you please add:

Cc: <stable@vger.kernel.org> # v4.13+

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ce8c4846b7fa..32f8b0c1c174 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -169,6 +169,7 @@ struct aspeed_i2c_bus {
>  };
>  
>  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
> +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);

Can you please move aspeed_i2c_do_stop() on top? Doesn't make
much sense to add the prototype here as there is no dependencies.

It's different the case of aspeed_i2c_reset() because it needs
aspeed_i2c_init().

>  static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  {
> @@ -187,7 +188,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  			command);
>  
>  		reinit_completion(&bus->cmd_complete);
> -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +		aspeed_i2c_do_stop(bus);

The patch is good, though!

Thanks,
Andi


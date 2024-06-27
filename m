Return-Path: <linux-i2c+bounces-4416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CF191AB4D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED1F8B2AB15
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 15:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6D9199386;
	Thu, 27 Jun 2024 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eH3LbD4L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BEE198E71;
	Thu, 27 Jun 2024 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501937; cv=none; b=Xf/dzQEePKzeMsY43Kp0a88sOgjIp0Pg8XmYL9cISUC1YCZ/dVABKdJOiQ+89LVLkGSjtW2c9G/IsFueRbstDqS7NFfMnD0nX2ZSc/Y+lVKMEL9hxhUiMWQ7c7vHs83f1cqejzLL7W2+2Zp4ejB4xD8F+8r0yNdQEGWXHA/7z6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501937; c=relaxed/simple;
	bh=DcIqrfoXRxHNxqbWkcMoWg8BFR191VB6t9DH5BOodQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=as3YDaEWzrQsMxQT8ymkRM0a77aWGFSy2kuWzl1wa2lianV8G1Racgxv5OKoN883GyVFm5Er7RLyLIJDrDnZBbwmwufCuo0p1/3FoTOJ6OmKwL0sJDfMcz9q7ftwMnPYnKfbnaaLVmkU7Es75qgMrRYAGmLbjB3STsi6Mf4pWoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eH3LbD4L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEF9C2BBFC;
	Thu, 27 Jun 2024 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719501937;
	bh=DcIqrfoXRxHNxqbWkcMoWg8BFR191VB6t9DH5BOodQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eH3LbD4LMJBU52nravUhcazsfvfmVmy1p/PKyBtPNa2I3v0IEv/MbXFRfhgbgo+vy
	 g8O5SLA7juKfFyeRtiaP2rwgDRT2G+XTFFitFYiYUi/cgnRYySoeWVxTtlf+ht0AlT
	 QuGlRFDxKQV21chZqgny9mdYpNKqS1eFX6nuRDW1/jYGGnNZ5uEQjl5mmPcXY51ad9
	 qKoppAJqBLynl8o7uilVtC86RdoYIP2ZvocuixFxup4WZnMZ9WWFatdLCqGHIMNWjI
	 xbnW9CNIcPCLZMELio4RyhfeCCmL8/2cOIU00Y26YYRSuHzjb17AcX9Xc6SBQWYpP8
	 iVcCEwmTqRodA==
Date: Thu, 27 Jun 2024 17:25:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, wsa@kernel.org, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2] i2c: aspeed: Update the stop sw state when the bus
 recovery occurs
Message-ID: <pbsrfzbd237k5inof3wy6qabdmolmweozkn5kq7jlvstj2nkvo@nzp2sbrxpn44>
References: <20240608043653.4086647-1-tommy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240608043653.4086647-1-tommy_huang@aspeedtech.com>

Hi Tommy,

any update on this patch?

Andi

On Sat, Jun 08, 2024 at 12:36:53PM GMT, Tommy Huang wrote:
> When the i2c bus recovery occurs, driver will send i2c stop command
> in the scl low condition. In this case the sw state will still keep
> original situation. Under multi-master usage, i2c bus recovery will
> be called when i2c transfer timeout occurs. Update the stop command
> calling with aspeed_i2c_do_stop function to update master_state.
> 
> Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> 
> Cc: <stable@vger.kernel.org> # v4.13+
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ce8c4846b7fa..be64e419adf0 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -25,6 +25,8 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  
> +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
> +
>  /* I2C Register */
>  #define ASPEED_I2C_FUN_CTRL_REG				0x00
>  #define ASPEED_I2C_AC_TIMING_REG1			0x04
> @@ -187,7 +189,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  			command);
>  
>  		reinit_completion(&bus->cmd_complete);
> -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +		aspeed_i2c_do_stop(bus);
>  		spin_unlock_irqrestore(&bus->lock, flags);
>  
>  		time_left = wait_for_completion_timeout(
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


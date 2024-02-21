Return-Path: <linux-i2c+bounces-1902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B28385E952
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 21:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC6D11C2232F
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 20:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B2986636;
	Wed, 21 Feb 2024 20:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzW9GLDx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA58C3A1AF;
	Wed, 21 Feb 2024 20:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708549107; cv=none; b=BjPDfDpgAr1qIoHDkW3LOFParCaTNQGzQ7wH9iVwSzhZYSLNc+7DmNuhIerT9+PA703p3dsS4r2wdJeSb9bhHknUoAg6RrKy38FCACadwPnmU2zYjzVI8gJDcfgB2U8ykG/Dt08nM1ktGacdZniuhIFDI6kp17y862aSTz0GdU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708549107; c=relaxed/simple;
	bh=a+JDh1FFIqaHPqou/rENlBnsnFcJSsYpw/0jB2FoUoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6IwQrSvMbYjOhAWr15TY7OKdITw5g9tvAURvrIA7+spQDU+lKGtkAUUbWGshmlkYV8kT4er7Ec0WNPwV9iAeL4QGIKSykekgn9YBl3l16ihnrttEdm0spny75hwTL+8QTii3ME8AJwhN24utV9BFPkiASQBlnJPNX9fyL/SdF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzW9GLDx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3251C433F1;
	Wed, 21 Feb 2024 20:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708549107;
	bh=a+JDh1FFIqaHPqou/rENlBnsnFcJSsYpw/0jB2FoUoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzW9GLDxb7lMYGUDAEl7xKagQesuhRDH5tGnzJDx77zfodhK451n19WiFHEVZ18oK
	 LZmEuD+F+jqE9z+CqZqQvvLVzFMNVhxz/DL6SbXHS5f9YGLtH2jiNw0dCBeTkNZ/OK
	 HltrjmeafGoV1mxz2LAIt7wlPQhbROVKjK+2RPbGp0QUMnvyiAjliw3+z7nYuDicyx
	 0jiTxTbS2/USJMcLoCPUOyg5P37TOPe0L1N5UJqo0r8n/+xJSr7on8EmuqICdiOy7M
	 9JKClM8DyQXi+a24RW0uUYoL9ut3uSUTMMY9mJzU0Fru6xB2IinIttIdZl07PzDt9d
	 Cp4u+/V2rVo7w==
Date: Wed, 21 Feb 2024 21:58:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Corey Minyard <minyard@acm.org>, 
	Andrew Manley <andrew.manley@sealingtech.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: imx: when being a target, mark the last read as
 processed
Message-ID: <kgfagzj5vez56levwam6n6tzxl2lu7efnw5x3eadl3uophxism@ph2tghrvedg5>
References: <20240221193013.14233-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221193013.14233-2-wsa+renesas@sang-engineering.com>

Hi Wolfram and Corey,

On Wed, Feb 21, 2024 at 08:27:13PM +0100, Wolfram Sang wrote:
> From: Corey Minyard <minyard@acm.org>
> 
> When being a target, NAK from the controller means that all bytes have
> been transferred. So, the last byte needs also to be marked as
> 'processed'. Otherwise index registers of backends may not increase.
> 
> Signed-off-by: Corey Minyard <minyard@acm.org>
> Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
> Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
> Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> [wsa: fixed comment and commit message to properly describe the case]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

is this a fix?

Andi

> ---
> 
> Changes since v2:
> * updated commit message and comment
> 
> In the stalled discussion[1], it seems I couldn't make my suggestions
> clear. So, here are the changes how I meant them. I hope this can be
> agreed on.
> 
> [1] http://patchwork.ozlabs.org/project/linux-i2c/patch/20211112133956.655179-3-minyard@acm.org/
> 
>  drivers/i2c/busses/i2c-imx.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 88a053987403..60e813137f84 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -803,6 +803,11 @@ static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
>  		ctl &= ~I2CR_MTX;
>  		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
>  		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +
> +		/* flag the last byte as processed */
> +		i2c_imx_slave_event(i2c_imx,
> +				    I2C_SLAVE_READ_PROCESSED, &value);
> +
>  		i2c_imx_slave_finish_op(i2c_imx);
>  		return IRQ_HANDLED;
>  	}
> -- 
> 2.43.0
> 


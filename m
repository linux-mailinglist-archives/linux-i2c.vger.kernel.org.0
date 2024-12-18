Return-Path: <linux-i2c+bounces-8606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7040D9F6CF6
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 19:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89F4A7A3784
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 18:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495621C5CAA;
	Wed, 18 Dec 2024 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMrAxgQq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24C838F9C;
	Wed, 18 Dec 2024 18:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734545789; cv=none; b=DB5kWaL2L7IslEkx4v0DzbjDJw7VvMArTY373HtI3ZLkk2jQHdcRzxVTKSy4EROTfKtiNS32JojH4bnug/9brQ8Kqd+y7qFRfvaX8CkRHZ3uclJA/30ZQGLNoJPAY2ujVd599At773bj0zCRWKWwfeCH9sUEIN+WWDMmP1rHuik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734545789; c=relaxed/simple;
	bh=IoS8V5OJJU6ewXW9pzCcwYKAq51QATQ5Pb5qNsYdWfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LINjf8zNIqaln/VPPjX4xKS7D4SOn7fPyMrFD0Bom33khfdQ+LLqHs4/BF9pGHUrQ9hfq69Q2ntP38Mw2uuYMksOY+CstOHSuQoDCQJfsyViCZE+K92HYx/JWMw0zrHpTMUBTPEcOUP2lvapZ6Y7rPd6EmTlcQexKMUQh3vesec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMrAxgQq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EF2C4CECD;
	Wed, 18 Dec 2024 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734545787;
	bh=IoS8V5OJJU6ewXW9pzCcwYKAq51QATQ5Pb5qNsYdWfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMrAxgQqqMyB9LgVl3p28na48MJ0GAphgSvZQHaIeR28xUwqS9Siwc9H9DOXli9eS
	 1f2/eclGFbXferEJZxopZFlDHqQaYmm8rYajUQAJdS4H+StalszSeoJvauEif0icUh
	 lbXNjpr+Co6S8uFOkUtLZdIHoh+cPovwT01Sb71KVI8KXauIOG2oQl4cxOXt7xnTMl
	 xbYb5fTp7uJ+2WJDcXvRNV6W4ujsm5DqrD+WifaRgUuuBLukQM5VzHzVjS9+m34lP+
	 DanLD6P+ICV2oX1/OrdyiGVKe1W9wuQ/crJsdhz5m+xBeq0Zf+OhJuaGitV0dESQaZ
	 PzoZFVmf3FFUQ==
Date: Wed, 18 Dec 2024 19:16:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com, 
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: fix missing stop condition in single-master
 mode
Message-ID: <w3x46is2s463ektusvnyu5tt2rinz7eae2ekzyqw2urw5yh5ga@pfzrgzpxjc4y>
References: <20241216151829.74056-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216151829.74056-1-eichest@gmail.com>

Hi Stefan,

On Mon, Dec 16, 2024 at 04:16:40PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> A regression was introduced with the implementation of single-master
> mode, preventing proper stop conditions from being generated. Devices
> that require a valid stop condition, such as EEPROMs, fail to function
> correctly as a result.
> 
> The issue only affects devices with the single-master property enabled.
> 
> This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
> polling for single-master mode when generating a stop condition. The fix
> further ensures that the i2c_imx->stopped flag is cleared at the start
> of each transfer, allowing the stop condition to be correctly generated
> in i2c_imx_stop().
> 
> According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
> 5270), polling the IBB bit to determine if the bus is free is only
> necessary in multi-master mode. Consequently, the IBB bit is not polled
> for the start condition in single-master mode.
> 
> Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index f751d231ded8..cbf66a69e20b 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
>  {
>  	unsigned long orig_jiffies = jiffies;
>  	unsigned int temp;
> -
> -	if (!i2c_imx->multi_master)
> -		return 0;
> +	bool multi_master = i2c_imx->multi_master;

with this small adjustment, I have applied your patch to 
i2c/i2c-host-fixes.

The idea behind the change is that variables are sorted by 
length, forming a kind of reversed Christmas tree shape. It's 
not a strict rule—some communities enforce it, others don't, and 
some follow entirely different conventions.

Since it feels somewhat arbitrary to me, I don't enforce it 
strictly. However, I personally try to adhere to the reversed 
Christmas tree rule whenever possible.

Andi

>  
>  	while (1) {
>  		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>  
>  		/* check for arbitration lost */
> -		if (temp & I2SR_IAL) {
> +		if (multi_master && (temp & I2SR_IAL)) {
>  			i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
>  			return -EAGAIN;
>  		}
>  
> -		if (for_busy && (temp & I2SR_IBB)) {
> +		if (for_busy && (!multi_master || (temp & I2SR_IBB))) {
>  			i2c_imx->stopped = 0;
>  			break;
>  		}
> -- 
> 2.45.2
> 


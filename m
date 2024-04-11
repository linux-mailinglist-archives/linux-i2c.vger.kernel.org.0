Return-Path: <linux-i2c+bounces-2904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1028A1F01
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 20:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C4741C232A8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 18:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2970612E5D;
	Thu, 11 Apr 2024 18:59:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC56FCC;
	Thu, 11 Apr 2024 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712861956; cv=none; b=pL4mkfk9A5eJu18Hz4wnqaaoe8J+fuSwCtLGv1yvTDcXb6jFqQiXMSJHb396NLpVEmZzkfuimABct09EwT2Dvjgombv5tF9t0+VSofMKWiuSjto6t6E+6btyfhedaTrvtnkzDUde6HqGcL4B83a+FyXy1kqffo5CW1KPAYX+JUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712861956; c=relaxed/simple;
	bh=C9xbwfIr5SaS2JQtolG722xkhBo+5jZYSdeJKMjHRyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L0uQXFtT4tgVo/PeDGwf3TLMUUcBj1q8jbOKaPhcvUP0Z+b3O823PFutX5AspMmAUp2uY5KwBAApWlpNAduL51tYvF9qCQO9QPScwGbgrXMc5so60VmVUCejmDmW0v5/bA94kVBwMlUZeZ52LFD8+kq7TOOdNDIxWeMzSXf4q18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip-185-104-138-67.ptr.icomera.net ([185.104.138.67] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ruzdc-0002Dv-NV; Thu, 11 Apr 2024 20:59:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-i2c@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
Date: Thu, 11 Apr 2024 20:59:05 +0200
Message-ID: <46619727.fMDQidcC6G@phil>
In-Reply-To: <20240410112418.6400-33-wsa+renesas@sang-engineering.com>
References:
 <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-33-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 10. April 2024, 13:24:27 CEST schrieb Wolfram Sang:
> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The controller
> should just pass this information upwards. Remove the printout.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  drivers/i2c/busses/i2c-rk3x.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 086fdf262e7b..8c7367f289d3 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1106,9 +1106,6 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
>  		spin_lock_irqsave(&i2c->lock, flags);
>  
>  		if (timeout == 0) {
> -			dev_err(i2c->dev, "timeout, ipd: 0x%02x, state: %d\n",
> -				i2c_readl(i2c, REG_IPD), i2c->state);
> -
>  			/* Force a STOP condition without interrupt */
>  			i2c_writel(i2c, 0, REG_IEN);
>  			val = i2c_readl(i2c, REG_CON) & REG_CON_TUNING_MASK;
> 






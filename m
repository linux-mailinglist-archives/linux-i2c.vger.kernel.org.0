Return-Path: <linux-i2c+bounces-462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADE47F951D
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 20:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B44E3B20AF3
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 19:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605F212E50;
	Sun, 26 Nov 2023 19:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKeJOUwY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D4AD52A;
	Sun, 26 Nov 2023 19:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF77C433C7;
	Sun, 26 Nov 2023 19:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701027796;
	bh=MfPWdhI66tGlSElbZFqrJ4lp9k4RWE3b0eJdiDiyLj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UKeJOUwY97ffDjyVICQgaX2Wb8q6WilSKUPvkWm5tQ32pK8ViitXaPlaQDNR5XqTY
	 9AUAq8pm6KDmGj+9fSgOguHC1B11Tdh63ToL0rcDLq8mNRH4EGCuZT6a1oSdmeWHII
	 UH02ScCplG1irqAmbHxdsth04jTMO+3aqYl1CLbC7mqb/zWAZtlDtmyM8uZsgotvo8
	 hDz4hoVV8n3uWrdkVNB70iTq4VD9r7jPOA/4blIOdAcV8ZUG6k+bPvRPJqrmaqmmAR
	 vr0oOEN5PMsfaJVOmcqVjWW+/kPJLrG/DS6D7ii3lZBolWWuaEqqMs8IEqO9ZQ2j1B
	 DMd6HsND1+p5Q==
Date: Sun, 26 Nov 2023 20:43:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tim Lunn <tim@feathertop.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 3/9] i2c: rk3x: Adjust offset for i2c2 on rv1126
Message-ID: <20231126194311.jxkvz3kqgsbzfgek@zenone.zhora.eu>
References: <20231122122232.952696-1-tim@feathertop.org>
 <20231122122232.952696-4-tim@feathertop.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122122232.952696-4-tim@feathertop.org>

Hi Tim,

On Wed, Nov 22, 2023 at 11:22:26PM +1100, Tim Lunn wrote:
> Rockchip RV1126 has special case mask bits for i2c2.
> 
> i2c2 wasnt previously enabled in rv1126.dtsi, adding DT node alone
> is not sufficient to enable i2c2. This patch fixes the i2c2 bus.

If I don't have sufficient information about the hardware this
description is completely meaningless to me.

> Signed-off-by: Tim Lunn <tim@feathertop.org>
> ---
> 
> Changes in v2:
> - i2c: clarify commit message
> 
>  drivers/i2c/busses/i2c-rk3x.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index a044ca0c35a1..151927466d1d 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1288,8 +1288,11 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  			return -EINVAL;
>  		}
>  
> -		/* 27+i: write mask, 11+i: value */
> -		value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
> +		if (i2c->soc_data == &rv1126_soc_data && bus_nr == 2)
> +			value = BIT(20) | BIT(4);

Any chance to put a comment here as it is in the other
assignment?

Are the two assignment mutually exclusive?

Heiko, any chance to take a look here?

Thanks,
Andi

> +		else
> +			/* 27+i: write mask, 11+i: value */
> +			value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
>  
>  		ret = regmap_write(grf, i2c->soc_data->grf_offset, value);
>  		if (ret != 0) {
> -- 
> 2.40.1
> 


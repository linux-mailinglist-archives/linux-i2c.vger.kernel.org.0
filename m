Return-Path: <linux-i2c+bounces-200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD17EE7B8
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 20:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 922A6B20ADE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 19:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24EB495F9;
	Thu, 16 Nov 2023 19:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98387196;
	Thu, 16 Nov 2023 11:54:12 -0800 (PST)
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1r3iR9-0005Jj-CH; Thu, 16 Nov 2023 20:54:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Tim Lunn <tim@feathertop.org>
Cc: Jagan Teki <jagan@edgeble.ai>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tim Lunn <tim@feathertop.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/8] i2c: rk3x: Adjust grf offset for i2c2 on rv1126
Date: Thu, 16 Nov 2023 20:54:02 +0100
Message-ID: <4846724.GXAFRqVoOG@phil>
In-Reply-To: <20231113120705.1647498-4-tim@feathertop.org>
References:
 <20231113120705.1647498-1-tim@feathertop.org>
 <20231113120705.1647498-4-tim@feathertop.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Montag, 13. November 2023, 13:07:00 CET schrieb Tim Lunn:
> Rockchip RV1126 has a special case grf offset/mask for i2c2

This sounds misleading. When looking at the soc-data, the grf offset
seems to be the same for all busses of the rv1126, only the offset
seems to be different for i2c2.

Sadly I don't have (and didn't find any) rv1126 TRM, so couldn't verify.

Change itself looks nice. As it's only this one bus of one soc so far,
we likely won't need a more involved solution just now.


> Signed-off-by: Tim Lunn <tim@feathertop.org>
> ---
> 
>  drivers/i2c/busses/i2c-rk3x.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index a044ca0c35a1..83b7bf7b48a7 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1288,8 +1288,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  			return -EINVAL;
>  		}
>  
> -		/* 27+i: write mask, 11+i: value */
> -		value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
> +		if (i2c->soc_data == &rv1126_soc_data && bus_nr == 2)
> +			/* rv1126 i2c2 set pmugrf offset-0x118, bit-4 */

same here, comment could drop the offset reference I guess.

> +			value = BIT(20) | BIT(4);
> +		else
> +			/* 27+i: write mask, 11+i: value */
> +			value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
>  
>  		ret = regmap_write(grf, i2c->soc_data->grf_offset, value);
>  		if (ret != 0) {
> 


Heiko




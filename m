Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F23C55B3DF1
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Sep 2022 19:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiIIR2W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 13:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbiIIR2W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 13:28:22 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58B111B768;
        Fri,  9 Sep 2022 10:28:18 -0700 (PDT)
Received: from [213.70.33.226] (helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oWhnW-0006sv-JQ; Fri, 09 Sep 2022 19:28:10 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        Jagan Teki <jagan@edgeble.ai>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-i2c@vger.kernel.org,
        David Wu <david.wu@rock-chips.com>
Subject: Re: [PATCH v4 01/13] i2c: rk3x: Add rv1126 support
Date:   Fri, 09 Sep 2022 19:28:09 +0200
Message-ID: <6158946.mvXUDI8C0e@phil>
In-Reply-To: <20220907160207.3845791-2-jagan@edgeble.ai>
References: <20220907160207.3845791-1-jagan@edgeble.ai> <20220907160207.3845791-2-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jagan,

it looks like this is missing Wolfram Sang, the i2c maintainer?

Am Mittwoch, 7. September 2022, 18:01:55 CEST schrieb Jagan Teki:
> Add i2c support for Rockchip RV1126 SoC.
> 
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Heiko

> ---
> Changes for v4:
> - new patch
> 
>  drivers/i2c/busses/i2c-rk3x.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 2e98e7793bba..d1658ed76562 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1165,6 +1165,11 @@ static const struct rk3x_i2c_soc_data rv1108_soc_data = {
>  	.calc_timings = rk3x_i2c_v1_calc_timings,
>  };
>  
> +static const struct rk3x_i2c_soc_data rv1126_soc_data = {
> +	.grf_offset = 0x118,
> +	.calc_timings = rk3x_i2c_v1_calc_timings,
> +};
> +
>  static const struct rk3x_i2c_soc_data rk3066_soc_data = {
>  	.grf_offset = 0x154,
>  	.calc_timings = rk3x_i2c_v0_calc_timings,
> @@ -1195,6 +1200,10 @@ static const struct of_device_id rk3x_i2c_match[] = {
>  		.compatible = "rockchip,rv1108-i2c",
>  		.data = &rv1108_soc_data
>  	},
> +	{
> +		.compatible = "rockchip,rv1126-i2c",
> +		.data = &rv1126_soc_data
> +	},
>  	{
>  		.compatible = "rockchip,rk3066-i2c",
>  		.data = &rk3066_soc_data
> 





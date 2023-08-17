Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E4077FB6F
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 18:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353430AbjHQQCc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 12:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353451AbjHQQCI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 12:02:08 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EB430F3
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692288127; x=1723824127;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=2lbyBpPBLgN8o2TjOs9Dy7MEovnl4x5HKZO/5aIxQhs=;
  b=dhJujg3eZERs9r/PHMo309+bpjyc9hsVoVhfbSyqxA67toDST2/WrGKl
   iwsQVDEZbR12GjnOyZn/erk7idPjgSY6MkWW14aWveU2X1aSmIaUaNkEU
   FMOoZQO4gP16/YTN5YKI+uo6ThsGouSz7i6Zq86VK4WmP9wylN3/Phi2E
   mf57UwfGmBfN0EsxNKQWTJg62RJFYIqexFtIJU8eLQYDbjjrpDvi51/Kr
   3vPCeEIK7oX/wzouY94+H06DYIKvN5bfWD2Vg1ZDzfPfb++ujjxRVhLb3
   Vy833S3GZIXi8NSvGlMM2oz40Hqr3Dabxdop2navHOPufhOTqIqjPEqTy
   A==;
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="225926317"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Aug 2023 09:02:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 17 Aug 2023 09:02:04 -0700
Received: from [10.171.246.44] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 17 Aug 2023 09:02:00 -0700
Message-ID: <1098855e-37f4-43fb-5be5-77128d6907fa@microchip.com>
Date:   Thu, 17 Aug 2023 18:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next v2] I2C: Fix return value check for
 devm_pinctrl_get()
Content-Language: en-US, fr-FR
To:     Ruan Jinjie <ruanjinjie@huawei.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Yang Li <leoyang.li@nxp.com>
References: <20230817022018.3527570-1-ruanjinjie@huawei.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230817022018.3527570-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/08/2023 at 04:20, Ruan Jinjie wrote:
> The devm_pinctrl_get() function returns error pointers and never
> returns NULL. Update the checks accordingly.
> 
> Fixes: 543aa2c4da8b ("i2c: at91: Move to generic GPIO bus recovery")

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> Fixes: fd8961c5ba9e ("i2c: imx: make bus recovery through pinctrl optional")
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
> v2:
> - Remove NULL check instead of using IS_ERR_OR_NULL() to avoid leaving them behind.
> - Update the commit title and message.
> ---
>   drivers/i2c/busses/i2c-at91-master.c | 2 +-
>   drivers/i2c/busses/i2c-imx.c         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> index 94cff1cd527e..2bf1df5ef473 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -831,7 +831,7 @@ static int at91_init_twi_recovery_gpio(struct platform_device *pdev,
>          struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
> 
>          rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
> -       if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
> +       if (IS_ERR(rinfo->pinctrl)) {
>                  dev_info(dev->dev, "can't get pinctrl, bus recovery not supported\n");
>                  return PTR_ERR(rinfo->pinctrl);
>          }
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 10e89586ca72..05d55893f04e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1388,7 +1388,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
>          struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
> 
>          i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
> -       if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
> +       if (IS_ERR(i2c_imx->pinctrl)) {
>                  dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
>                  return PTR_ERR(i2c_imx->pinctrl);
>          }
> --
> 2.34.1
> 


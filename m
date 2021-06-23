Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACCF3B165C
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 11:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFWJCV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 05:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhFWJCU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Jun 2021 05:02:20 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AF4C061574
        for <linux-i2c@vger.kernel.org>; Wed, 23 Jun 2021 02:00:02 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id t3so2386053edc.7
        for <linux-i2c@vger.kernel.org>; Wed, 23 Jun 2021 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FP9EsChXCfC6ERvq/VEROgpzH3E542Er7LriVewZlDk=;
        b=ing6KloUgctO1neeEVoQc8Hzz8xmwpQNpZ//JACly27y5KT9cMPTveD95i1RTp1gp/
         I+HE2N+Jtnn9K4yjZZ7UBZX5hyp+Q71+XeSlpeFuQeKLsD51QBObLNuejbmv3FBo4bnc
         oNb71+HVe+3tVWsSylLHtllFwBaS0mdbzfkRkFgYLvCKx+pTIgY6GqkejrI9SKKFbSXK
         8wrpFoHcR4pAnOuhc2/T1ODyBTbpeuxQboqsQZtO+qWZ+e2FA2GugxlWtvNEUgJ0iM8Z
         015NX9+GIF/zt5SpdgVwWBE86MKRTFHCtsPDoDUpoPGkEKCqWLB5NC/dGsGgcvifzjxA
         5LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FP9EsChXCfC6ERvq/VEROgpzH3E542Er7LriVewZlDk=;
        b=efi6f+4STA9mH0rih+suO917xelWxFebpH1ZHA7wMp48f7jdSlxcik7aE+eQbOsQfz
         NYmYpsmFGF5GCeU6etXTA6KkXM7DQtchWc2vLOh3OL13omeKaMbTqjI81600p+UWV/Wi
         hs/rLtyDwDxpJHz1Twe94y/mgDjDhgrFErTzmTtlZ42y8LoZcUrkS1F51CEOG7C9MT57
         XUw/XMFl2UTgnEsC9mV8dBLYQKrJJkYVHne4Gkh3JSOOZcuKQMw2NdT3yKWU2r+Skx1R
         UEA5a98jaCTPPkDPxM+IBKECQFH8i0hsvV/WvSm9E5T+1rrmtojZe9+Nwn8QhIDTl1Hw
         30Lw==
X-Gm-Message-State: AOAM530EfeC3EgXy//+2wVAwwOnGwiNcEPHsgt2zN5oBjts2/gqq/liT
        eu9TtoaijYNpI1oTgPEj4HD8z9xcCwmENtN5xaT13w==
X-Google-Smtp-Source: ABdhPJxKvaPk7aofu67kpiTg2LdEBMmh3ykWTcvt5e3BKRfcI4oOVJvqm0yfYA7i2RbesRb6/jBFkhu9bV1OmDXetzs=
X-Received: by 2002:a05:6402:42cc:: with SMTP id i12mr6914846edc.88.1624438801003;
 Wed, 23 Jun 2021 02:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200902150643.14839-1-krzk@kernel.org> <20200902150643.14839-4-krzk@kernel.org>
In-Reply-To: <20200902150643.14839-4-krzk@kernel.org>
From:   Michal Simek <monstr@monstr.eu>
Date:   Wed, 23 Jun 2021 10:59:50 +0200
Message-ID: <CAHTX3dLT5FoOZ0Hi9UArYCoxy4b69r6cHLiLPo25DGX2_1B-xA@mail.gmail.com>
Subject: Re: [PATCH 4/9] i2c: cadence: Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

st 2. 9. 2020 v 17:10 odes=C3=ADlatel Krzysztof Kozlowski <krzk@kernel.org>=
 napsal:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/i2c/busses/i2c-cadence.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-ca=
dence.c
> index e4b7f2a951ad..eefde554c50c 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -1214,11 +1214,10 @@ static int cdns_i2c_probe(struct platform_device =
*pdev)
>                  "Cadence I2C at %08lx", (unsigned long)r_mem->start);
>
>         id->clk =3D devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(id->clk)) {
> -               if (PTR_ERR(id->clk) !=3D -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "input clock not found.\n");
> -               return PTR_ERR(id->clk);
> -       }
> +       if (IS_ERR(id->clk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(id->clk),
> +                                    "input clock not found.\n");
> +
>         ret =3D clk_prepare_enable(id->clk);
>         if (ret)
>                 dev_err(&pdev->dev, "Unable to enable clock.\n");
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Also this one is pending but still possible to apply without any conflict.

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

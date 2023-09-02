Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA23E790A48
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Sep 2023 01:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjIBXtv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 19:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjIBXtu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 19:49:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27590CDA;
        Sat,  2 Sep 2023 16:49:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3C1961268;
        Sat,  2 Sep 2023 23:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B78AC433C8;
        Sat,  2 Sep 2023 23:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693698587;
        bh=WLEg/L2hnbjXRMoDJB1stlTmgT1yeFxRUJokuo7n30I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FXDbWWilw3KNrXl/6piZouse9X1uKcko4VfRhRhqeBv1zyLyv2jT/ydm1ajUnEWqY
         D3tUy7Avam1IeaGbvliex9uUxtSFyUnWoDOvmRhA9TzT+OOT7DSUxJTjmzEQN4cFHD
         JuNnsxyhjOH5SvdPq+AyqW/MbVwRp9NMNgP4CnI9haiPQGZHJOw6T3iZBj9SmK/D23
         mOYWjVs45C6a3SonW/5TvSBj+kOv6W0jfAzDwyuc8KZ/tDfERGXtbD8LoHnO+fjcye
         +8v9Fo3IFvdR88okr98BoQhiqoGNq98tNYuxRRu8pKLx9JgEQsFvoT6FtomomOJiSm
         24puQNt/G1HpQ==
Date:   Sun, 3 Sep 2023 01:49:43 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: Re: [PATCH] i2c: mt65xx: allow optional pmic clock
Message-ID: <20230902234943.sua22ocjjviq2ymj@zenone.zhora.eu>
References: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

On Sun, Aug 27, 2023 at 03:13:30AM +0100, Daniel Golle wrote:
> Using the I2C host controller on the MT7981 SoC requires 4 clocks to
> be enabled. One of them, the pmic clk, is only enabled in case
> 'mediatek,have-pmic' is also set which has other consequences which
> are not desired in this case.
> 
> Allow defining a pmic clk even in case the 'mediatek,have-pmic' propterty
> is not present and the bus is not used to connect to a pmic, but may
> still require to enable the pmic clock.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 1a9b5a068ef1b..a8b5719c33729 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1442,15 +1442,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
>  		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
>  
> +	i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get_optional(&pdev->dev, "pmic");
> +	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
> +		dev_err(&pdev->dev, "cannot get pmic clock\n");
> +		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);

you could have used dev_err_probe() here, but on the other hand
it would be inconsistent because it's not used anywhere in this
driver... so that it looks good to me:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

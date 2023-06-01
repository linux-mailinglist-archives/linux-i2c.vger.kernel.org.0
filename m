Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 589357196A8
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 11:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbjFAJSc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 05:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbjFAJSc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 05:18:32 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7476E99;
        Thu,  1 Jun 2023 02:18:30 -0700 (PDT)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C05206606EBB;
        Thu,  1 Jun 2023 10:18:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1685611108;
        bh=B9cFiWKxbTrp3gF7lLhm/S4rmsB6wnq7isfJIy/mD4Q=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=d+IMj5PS+16b+EFlWbYBnrC1j65EtCwRvoVKhNyCWly/Aw+m4dSmAgnTqVeb2tsSM
         cUPP3lyzGaEa0h/NRD/u+wcW9ht7zlLP6LK9RF9RfarrH1ljbNjPNvFJqVqiUEOea4
         CdRZt0uXj8YHITAEwxUxbdEM852NSwdVYWsZUbAZWcEVJV8TcP8ED745YN0IOkQ6Ab
         Dpvy9G6j6IaSOZGs31qKyBJMTZ65Jm3AdR6JNS/njMkEADQoPqqtn/MLw6nZihfD8Z
         GzLZnlnH72fEomaYWSDr6OrrofMa4bzfUyU1NXTWkSki6cndBESoR4RFZt0i4elfgP
         qz9oL0emXJLmQ==
Message-ID: <053d4f6f-b43d-3a03-d193-437817321293@collabora.com>
Date:   Thu, 1 Jun 2023 11:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/2] i2c: mt65xx: add additional clocks
To:     Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>
Cc:     =?UTF-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
 <6632ce37e260f5f5cbdd0c6a5da8fe9679352aee.1685549360.git.daniel@makrotopia.org>
Content-Language: en-US
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6632ce37e260f5f5cbdd0c6a5da8fe9679352aee.1685549360.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 31/05/23 18:11, Daniel Golle ha scritto:
> On MT7981 additional clocks are required when accessing I2C registers.
> Add MCK and PCK optional clocks to i2c-mt65xx driver so we don't have
> to always have them enabled, but really only if I2C is used.
> 
> Fixes: f82fd1845d309 ("i2c: mediatek: add support for MT7981 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

PCK and MCK should really be P=PMIC and M=MEM as far as I understand, which
means that they should effectively be CLK_PMIC and CLK_ARB.

In that case, you don't need to add new clocks to the driver, as you're using
the very same ones that the driver supports.

Cheers,
Angelo

> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index a43c4d77739ab..cd28cbec2b96d 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -93,6 +93,8 @@
>    * @I2C_MT65XX_CLK_DMA:  DMA clock for i2c via DMA
>    * @I2C_MT65XX_CLK_PMIC: PMIC clock for i2c from PMIC
>    * @I2C_MT65XX_CLK_ARB:  Arbitrator clock for i2c
> + * @I2C_MT65XX_CLK_MCK:  MCK clock for i2c
> + * @I2C_MT65XX_CLK_PCK:  PCK clock for i2c
>    * @I2C_MT65XX_CLK_MAX:  Number of supported clocks
>    */
>   enum i2c_mt65xx_clks {
> @@ -100,11 +102,13 @@ enum i2c_mt65xx_clks {
>   	I2C_MT65XX_CLK_DMA,
>   	I2C_MT65XX_CLK_PMIC,
>   	I2C_MT65XX_CLK_ARB,
> +	I2C_MT65XX_CLK_MCK,
> +	I2C_MT65XX_CLK_PCK,
>   	I2C_MT65XX_CLK_MAX
>   };
>   
>   static const char * const i2c_mt65xx_clk_ids[I2C_MT65XX_CLK_MAX] = {
> -	"main", "dma", "pmic", "arb"
> +	"main", "dma", "pmic", "arb", "mck", "pck"
>   };
>   
>   enum DMA_REGS_OFFSET {
> @@ -1444,6 +1448,14 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
>   		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
>   
> +	i2c->clocks[I2C_MT65XX_CLK_MCK].clk = devm_clk_get_optional(&pdev->dev, "mck");
> +	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_MCK].clk))
> +		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_MCK].clk);
> +
> +	i2c->clocks[I2C_MT65XX_CLK_PCK].clk = devm_clk_get_optional(&pdev->dev, "pck");
> +	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PCK].clk))
> +		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PCK].clk);
> +
>   	if (i2c->have_pmic) {
>   		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get(&pdev->dev, "pmic");
>   		if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {


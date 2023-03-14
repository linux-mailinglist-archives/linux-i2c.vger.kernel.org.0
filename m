Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C704E6B8EAE
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 10:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjCNJ1D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 05:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjCNJ1C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 05:27:02 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4816889F15;
        Tue, 14 Mar 2023 02:27:01 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 817816603009;
        Tue, 14 Mar 2023 09:26:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678786020;
        bh=OeV9dWUuKMcE+RWaT+yQ3SgSvJdeE8qh9/3murEwb7w=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=TbMncgSImrKuZFx64fmPEjtJvdMamA4BmxUVGsH9Z/qU6orcBGPcR+NfLjkVbSjX/
         suGRXGeMZDCiP7O/j1aDPfhbCbI1tAYoZtl7w7ZiSJ9/975CL1WMdvUSBSuxg1KN92
         y+Q5Ui4Umg6d1o4jo2O5OeDYz9JUVuZFesDBsAgVi56aihLi9J2XcAV/HjASbmrn8F
         ISm5c0YUBq9jysXFNPOmJzFZlo2rmwVAaNYHxQMb6Krqp18DlMYsehcUtxSMfnxmzD
         SYLjnwrXEVYif53YgaNrGUA2MjGbhsP0DViFgH0DA9Bno5P2KzIXpHFX30/VSZL2JB
         IUomVV8ADZvVg==
Message-ID: <5f219379-cccb-d8ca-ed23-4106ca3ecf3a@collabora.com>
Date:   Tue, 14 Mar 2023 10:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] i2c: mediatek: add support for MT7981 SoC
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
References: <cover.1678756608.git.daniel@makrotopia.org>
 <fdbd18ab71693b2b0dcbe1094bcfd1060bf21200.1678756608.git.daniel@makrotopia.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <fdbd18ab71693b2b0dcbe1094bcfd1060bf21200.1678756608.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 14/03/23 02:18, Daniel Golle ha scritto:
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 43dd966d5ef5..54cabd366403 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -431,6 +431,18 @@ static const struct mtk_i2c_compatible mt8168_compat = {
>   	.max_dma_support = 33,
>   };
>   
> +static const struct mtk_i2c_compatible mt7981_compat = {
> +	.regs = mt_i2c_regs_v3,

I've found a downstream kernel saying that MT7981 uses `mt_i2c_regs_v2`,
hence the question:

Are you sure that this is supposed to be v3?

Regards,
Angelo

> +	.pmic_i2c = 0,
> +	.dcm = 0,
> +	.auto_restart = 1,
> +	.aux_len_reg = 1,
> +	.timing_adjust = 1,
> +	.dma_sync = 1,
> +	.ltiming_adjust = 1,
> +	.max_dma_support = 33
> +};
> +
>   static const struct mtk_i2c_compatible mt7986_compat = {
>   	.quirks = &mt7622_i2c_quirks,
>   	.regs = mt_i2c_regs_v1,
> @@ -516,6 +528,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
>   	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
>   	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
>   	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
> +	{ .compatible = "mediatek,mt7981-i2c", .data = &mt7981_compat },
>   	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },
>   	{ .compatible = "mediatek,mt8168-i2c", .data = &mt8168_compat },
>   	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },



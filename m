Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5608366DE19
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 13:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236827AbjAQMvU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 07:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236824AbjAQMuc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 07:50:32 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10FFC3A595;
        Tue, 17 Jan 2023 04:49:50 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D51126602D6D;
        Tue, 17 Jan 2023 12:49:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1673959788;
        bh=2f4/mH0AmuS+686ZhgQepdDKGjjvbP5co+SkciQwZ54=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fREZ3JJ9lELJEDVXlMRtWynjzQRr2cSZa0ufDIp6MWMx8eeAK2KZ50mD5cs0LkuDz
         GLgFa9JaukEKBjYibCrFl91X5+Bt+mCD3BskgiPHx1ChgYmpab+8ZuDuEPrQf5sKvs
         FdGiubXww7SzlAclSd/fFAEVujBXmFZXCAIgyFhmKJyvCYmjy6x6hhgwDs3P+tgKcO
         /rh5LR2CAKS/iXmSm3yPgDz1meuRil3K9XCRwYkXC6fRBdp6m2wK5fU3P8wCSQZAAU
         g42aoPD54UT8zWIXGMvbrfY0a7cGd2jU2Dn9qkXpttLXJZNpwcmDzvIsPREVndf2ip
         AO7Is0EoLOZ7A==
Message-ID: <7a6522ef-7cf7-808f-8be4-07cf5567d18a@collabora.com>
Date:   Tue, 17 Jan 2023 13:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/4] i2c: i2c-mt65xx: add MT8365 SoC support
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
 <20221122-mt8365-i2c-support-v1-4-4aeb7c54c67b@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-4-4aeb7c54c67b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 17/01/23 09:49, Alexandre Mergnat ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add support for I2C on MT8365 SoCs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index d80e59340d97..2c9dbb42861a 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -511,6 +511,19 @@ static const struct mtk_i2c_compatible mt8192_compat = {
>   	.max_dma_support = 36,
>   };
>   
> +static const struct mtk_i2c_compatible mt8365_compat = {

This is exactly the same as mt8168_compat... so you can avoid adding this one
and you can also avoid adding the compatible to this driver.

This means that you can get it working with a devicetree declaring

compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";

like you're already doing and without any addition to this driver at all.
So, you can drop this commit.

Regards,
Angelo



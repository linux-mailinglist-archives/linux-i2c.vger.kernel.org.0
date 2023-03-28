Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502116CBBDA
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Mar 2023 12:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbjC1KFR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Mar 2023 06:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232890AbjC1KFB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Mar 2023 06:05:01 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCC65BBD;
        Tue, 28 Mar 2023 03:05:00 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A867660313B;
        Tue, 28 Mar 2023 11:04:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679997899;
        bh=4iSxXbSBTVuKdjHaZLko5Y/yilWjU8OEvKfVGbRMxrg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kEksG60bjxqc7rREEJhdtoK7A+pgoEmjvU3lbUpuxhY9yFD0shUKBCam68l4fbp2/
         yT76hFXBY1lkn3Rq1Jz8X5OfNI68bIUfiwSOHNQxPpibaRjQ+OLJZ3bSylUB5kbnbq
         OYia2iAqDZ+EYbGEvwK3wP4go1v9i0+jR0btTI0Bx5ibEIs6672a+lKFDmnPAn3lVp
         Ov9HZ+jTOCiRR6f0rIfhKUoVmKMZaj5msoTKCDxpQYpr5gKc8honcBhIKCfTM8aZHd
         wHbK87uAHWtPf5SMUZl45w5NLDAteoV2oRd0ll57G1f5Q0QZOrTLgecqM6hbhCmmHK
         C/OqwQpJ+fgtg==
Message-ID: <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com>
Date:   Tue, 28 Mar 2023 12:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk
 board
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
 <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com>
Content-Language: en-US
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 28/03/23 11:04, Alexandre Mergnat ha scritto:
> Enable the I2C0 bus provides communication with:
> - The integrated RT9466 Switching Battery Charger.
> - The integrated MT6691 LP4X buck for VDDQ.
> - The integrated MT6691 LP4X buck for VDD2.
> - The pin header, to plug external I2C devices.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 4683704ea235..adc79ba14b33 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
>   	};
>   };
>   
> +&i2c0 {
> +	clock-frequency = <100000>;
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>   &pio {
>   	gpio_keys: gpio-keys-pins {
>   		pins {
> @@ -96,6 +103,14 @@ pins {
>   		};
>   	};
>   
> +	i2c0_pins: i2c0-pins {
> +		pins {
> +			bias-pull-up;

I prefer seeing pinmux first, any other properties last....
If Matthias can please fix that while applying...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



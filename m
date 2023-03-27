Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 296586C9E90
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbjC0IuR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbjC0Its (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:49:48 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BB0AF13;
        Mon, 27 Mar 2023 01:46:03 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A0C86601F5E;
        Mon, 27 Mar 2023 09:45:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906717;
        bh=nI/bv+FYvlvhbSwQ/rVx+2wqovQpOadhWJXyJqW4ADA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IFO/vaqNFG45fpRw/Gm9vcN3rzC+MHK5CV+YTcqpLeuWPnEaoZKqAlm2CRUITPd/S
         0RlWS8xKkhUTz/HYHiUKWMC8yweaKbZ2rn1QZ8TKIl7Peh5hjc1fc70Mc1Y+slXG2o
         9EgHkl82N3sz06AzWkMt10YmdOgjjOaPzIwIOJVLhiZq4Q/4VzgvYTJECH92bgOoHM
         iym+tSwEG7QTFji2jjwN5EZzeHUGslxRo2aSjDfvDHN5/WMBRc5KfBncN7xdpxwOQq
         xHHayRzCEJzLa0xu2/LkkmIwsUIbxoUqQ9hoBX/HNrH16JdhVJCDcahs2tR5tCMiR8
         iXWMBXOQKVyIw==
Message-ID: <2a1b1f66-970e-5adb-389e-b9c47a790712@collabora.com>
Date:   Mon, 27 Mar 2023 10:45:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk
 board
Content-Language: en-US
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
References: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
 <20221122-mt8365-i2c-support-v5-2-6e4f3b54937f@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v5-2-6e4f3b54937f@baylibre.com>
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

Il 27/03/23 10:27, Alexandre Mergnat ha scritto:
> Enable the I2C0 bus provides communication with:
> - The integrated RT9466 Switching Battery Charger.
> - The integrated MT6691 LP4X buck for VDDQ.
> - The integrated MT6691 LP4X buck for VDD2.
> - The pin header, to plug external I2C devices.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 4683704ea235..35cb142004a4 100644
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
> @@ -96,6 +103,15 @@ pins {
>   		};
>   	};
>   
> +	i2c0_pins: i2c0-pins {
> +		pins {
			pinmux = ...pins...
			bias-pull-up = <your-pull-up-adv-value>;
		};

...and please do *not* use the mediatek,pull-up-adv property: this is
supposed to be there only for older devicetrees and there's a replacement
for it.... unless you have any specific reason to do so (and if you do,
you should well explain that).

Besides, if you introduce the usage of that property in any 8365 devicetree,
the previously proposed 8365 pinctrl cleanup will become a bit harder to do.

Cheers,
Angelo



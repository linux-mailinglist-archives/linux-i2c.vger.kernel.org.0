Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7736ADACF
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Mar 2023 10:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjCGJrE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Mar 2023 04:47:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjCGJrD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Mar 2023 04:47:03 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7161193856;
        Tue,  7 Mar 2023 01:46:57 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 82CFC6602FE5;
        Tue,  7 Mar 2023 09:46:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678182416;
        bh=U1npgEe+e+W9htgrcGixuBdy62bSCDwzAojm85LZO/o=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JiTyZTo30a1wISkfV+5Gp2qvd0719QLSwoGav/k2Ora6GtaUmjyzIFb4nvIMXTdru
         J1biaUd+gU+Z2vpZvDGyKNsoz+JskgsEAz2J/LhWFAHbXmjjf/decE2qH6/ozPggSq
         6RA/bSdvMFSS8D6uqzagWXL+G5V0vJV6XlaMPquFWwhJNsghIVBd5Pwnb5Ibegt5H6
         Mhg39327OAs7vuDEAb/NBfYHgH+7zF0X8ZMqyDBLoV8G2Z5BJIESMyERdUY4XvUaI/
         FndEubmquYpVEaBFA1W7b6B7DkTtYObFWEDA2Y3BI44/swq5SNWKrbPYwQn7YK8fhO
         5dZranH5Uvi+A==
Message-ID: <26a93f91-7ffb-ef90-5c15-bfb1f979f819@collabora.com>
Date:   Tue, 7 Mar 2023 10:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk
 board
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-mediatek@lists.infradead.org
References: <20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com>
 <20221122-mt8365-i2c-support-v3-2-ad9bb1076d7f@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v3-2-ad9bb1076d7f@baylibre.com>
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

Il 06/03/23 14:47, Alexandre Mergnat ha scritto:
> Enable the I2C0 bus provides communication with:
> - The integrated RT9466 Switching Battery Charger.
> - The integrated MT6691 LP4X buck for VDDQ.
> - The integrated MT6691 LP4X buck for VDD2.
> - The pin header, to plug external I2C devices.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 4683704ea235..b68aee8f229f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -87,6 +87,15 @@ optee_reserved: optee@43200000 {
>   	};
>   };
>   
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;

Address and size cells are useless if there's no subnode of i2c0...
besides that, please keep the properties ordered by name.

clock-frequency
pinctrl-0
pinctrl-names
status

> +};
> +
>   &pio {
>   	gpio_keys: gpio-keys-pins {
>   		pins {
> @@ -96,6 +105,16 @@ pins {
>   		};
>   	};
>   
> +	i2c0_pins: i2c0-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
> +				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
> +			mediatek,pull-up-adv = <3>;
> +			mediatek,drive-strength-adv = <00>;

bias-pull-up;
mediatek,d...
mediatek,p....

Also, "00" is the same as "0", being this not a string... so write it as 0.

Thanks,
Angelo


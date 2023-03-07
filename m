Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 958D56ADAB9
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Mar 2023 10:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbjCGJoN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Mar 2023 04:44:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjCGJoI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Mar 2023 04:44:08 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807E04989C;
        Tue,  7 Mar 2023 01:43:58 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AA1826602FE6;
        Tue,  7 Mar 2023 09:43:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678182237;
        bh=DBT3ffnUomO4XpSs3uQJEKNgfx80plMtUGZEvV2r8tE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BT8Mu3NolapWoYEbgr83LNJXuN9DdogBZ5cSwFj+bjXKfQ8ahqFcsjKXYeqs2yXiZ
         GO0enFGX0WlNfKuElyrhP+WYsZaGS86XY3xorq3SNLweDQgrzhFq+3etbFzbDFXJP+
         P7zrhqzmFr6DhCjMBkw1u+E5K6IQFF4jYROFS2gk14FZLKSBTNymimQhiruxfRrjIq
         +KTAYj4xFCUjywHgSvPgcmKsrzm6aFjNyoeJr5OmxZz3irEV9Iah3VcrF5ppwBVqXn
         xuMP84kaq/AyfhYJanL8xNLuUUqUXp/LnIKBTovEUjoKWXJ8AiRZRhgnX1G+aIzPYV
         Aoo5OZwZa8RGQ==
Message-ID: <ff81cce8-9203-f90c-5a23-2d1c09fe4267@collabora.com>
Date:   Tue, 7 Mar 2023 10:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] arm64: dts: mediatek: add i2c support for mt8365
 SoC
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
 <20221122-mt8365-i2c-support-v3-1-ad9bb1076d7f@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v3-1-ad9bb1076d7f@baylibre.com>
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
> There are four I2C master channels in MT8365 with a same HW architecture.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 52 ++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 15ac4c1f0966..553c7516406a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -282,6 +282,45 @@ pwm: pwm@11006000 {
>   			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
>   		};
>   
> +		i2c0: i2c@11007000 {
> +			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
> +			reg = <0 0x11007000 0 0xa0>, <0 0x11000080 0 0x80>;
> +			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_LOW>;
> +			clock-div = <1>;
> +			clocks = <&infracfg CLK_IFR_I2C0_AXI>,
> +				 <&infracfg CLK_IFR_AP_DMA>;

You can compress the clocks to one single line, reaching 91 columns, on all of the
new i2c nodes that you're introducing. Please do that.

With that done:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo

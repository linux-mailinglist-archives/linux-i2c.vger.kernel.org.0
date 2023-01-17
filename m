Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDC0F66DE26
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 13:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236756AbjAQMxz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 07:53:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237029AbjAQMxI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 07:53:08 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E9722A2E;
        Tue, 17 Jan 2023 04:52:23 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 697AA6602D6D;
        Tue, 17 Jan 2023 12:52:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1673959942;
        bh=Zy6UIHFiddxESUTWxezTFwLYwuiwsUZyyuC6D0UK0o8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=K4PMSwd19uLLwMgu0BrDk7n+pFxWk/AWCpiWDlDle16J/mxjN+qsFZh/Va2PBcs63
         fot26hvufCnAGIqgmiEAnf+P2v6+TttXrHltMASaSockQlhka7zxqB17lcbw3ZwOTj
         kx7owuM6mnoto8I02BFS7MQTf4ITtxEH5zeqENDvvXmhz9fDi2x9go6lhtk4dx9Nwp
         yH6iFzsgX3nfCabV0PMH7Hy5NHx8zcAFTvpr1ISzD8ZehkpRv++XyGFanoaDtQ0ufZ
         HoELW7xY7Hj9Mf6r0mk0KnQp1Yq3e5kkCRU6We7/65kReOwqGJUVQ/m+xTdLxyQLUd
         JRJE97qs8niCQ==
Message-ID: <ddb81fcb-b353-ce7f-8b12-9cdcbfcacb8e@collabora.com>
Date:   Tue, 17 Jan 2023 13:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: add i2c support for mt8365 SoC
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
 <20221122-mt8365-i2c-support-v1-2-4aeb7c54c67b@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-2-4aeb7c54c67b@baylibre.com>
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
> There are four I2C master channels in MT8365 with a same HW architecture.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 60 ++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index a32f2b7507be..3c2819bd32af 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -282,6 +282,66 @@ pwm: pwm@11006000 {
>   			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
>   		};
>   
> +		i2c0: i2c@11007000 {
> +			compatible = "mediatek,mt8365-i2c",
> +				     "mediatek,mt8168-i2c";
> +			reg = <0 0x11007000 0 0xa0>,
> +			      <0 0x11000080 0 0x80>;

Compatibles fit in one line (83 columns is fine);
regs fit in one line, reaching 76 columns.

Same comments for the other nodes that you're adding.

Regards,
Angelo



Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D830C6B8EC0
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 10:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjCNJ3D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 05:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjCNJ24 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 05:28:56 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD90900AC;
        Tue, 14 Mar 2023 02:28:54 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 684CE6603009;
        Tue, 14 Mar 2023 09:28:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678786133;
        bh=v9BhgM8L7ZvTPqyhvRuVym/x3bUdSHAHAn69D/5mtsk=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=aZvcgC0mVOiGFmIA4WpCLgr6eGoppOECNiktqHjNxDzvbw/Z0/6gYfEStpJLAcM3I
         u/DREIW4A1Egy/cCXKAJaAR6ejll2q7sVDqZ+EYpQBV6JLg2JsmVt+cvqRVkqmUqTF
         Hp+QzUxtqV1A46gGcvd0IRZStjNNkddkbMQBACCA4YDOPjM7cDLaNdHhTmD0cPNHFE
         OK7pejrmimC9vdGsXg6hef4KOfvaWatLAVgeki9bgLWfRs8MYpPltcdrHUzv+nGY0n
         XKWs3nifzSUA8Dry2h/sTwcmW3Yjo3hV/JwiheWI4smw9u/6vPqU5dx4CnJLlql1ne
         lhN9wuLGUxm+g==
Message-ID: <5876ba49-3d0c-352f-8787-270e74f7ec32@collabora.com>
Date:   Tue, 14 Mar 2023 10:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] dt-bindings: i2c: i2c-mt65xx: add binding for MT7981
 SoC
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
References: <cover.1678756608.git.daniel@makrotopia.org>
 <f4c351b344113434987b4ffe22db9b51d82a27ae.1678756608.git.daniel@makrotopia.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <f4c351b344113434987b4ffe22db9b51d82a27ae.1678756608.git.daniel@makrotopia.org>
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
> Add binding documentation for the I2C controllers found in the
> MediaTek MT7981 SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 72ae2e01cf22..5ae6769483d7 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -23,6 +23,7 @@ properties:
>         - const: mediatek,mt6577-i2c
>         - const: mediatek,mt6589-i2c
>         - const: mediatek,mt7622-i2c
> +      - const: mediatek,mt7981-i2c

If MT7981 uses mt_i2c_regs_v2, the i2c compatible would be

compatible = "mediatek,mt7981-i2c", "mediatek,mt8183-i2c";

Regards,
Angelo

>         - const: mediatek,mt7986-i2c
>         - const: mediatek,mt8168-i2c
>         - const: mediatek,mt8173-i2c



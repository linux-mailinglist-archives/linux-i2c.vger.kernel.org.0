Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7291E569DC4
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 10:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbiGGIoP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 04:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbiGGIoN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 04:44:13 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA1E167D6;
        Thu,  7 Jul 2022 01:44:11 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 12DDA66019A9;
        Thu,  7 Jul 2022 09:44:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1657183449;
        bh=+zAEIKs7YroL5Yo+4bX4N+9I19+tgQa/D+6CA86qynI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Ml4Ir+94JlnK/EruXiDEM/GFJnSrvxp469kDuhEpl/+9d9P4QZTUqA6h+gcFJoOwv
         VYWMv0A9AyLEk4f67ymHwbG4s62Y6csu5W4u4kQ4id1Iym09gtw+e41wkSkOTA5pIj
         t143KcirWZSL7PMuj9+vfqg3rT3MfwefkFHGwf7qsRdf2F3HWoo3DSjaqnLeBe8Yzs
         Mr/qLVWaN0wCC4xzcnBAhILsjONTU3cGf2BrPGkfPc+k4ORoqJGUp2+cxLxmRpVkk9
         W5IejPtip4R3U/eg4fMag4XHXwAGw895tAnX+Pzd2nKNTTevmRbnKEOTq69+/xCHxD
         CaGBmYftv20ug==
Message-ID: <6fa9abc6-6ab8-9c47-c295-c413f119e608@collabora.com>
Date:   Thu, 7 Jul 2022 10:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V1 1/2] dt-bindings: i2c: update bindings for MT8188 SoC
Content-Language: en-US
To:     Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
        david-yh.chiu@mediatek.com, liju-clr.chen@mediatek.com
References: <20220707054617.13583-1-kewei.xu@mediatek.com>
 <20220707054617.13583-2-kewei.xu@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220707054617.13583-2-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 07/07/22 07:46, Kewei Xu ha scritto:
> Add a DT binding documentation for the MT8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 16a1a3118204..4e730fb7be56 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -27,6 +27,7 @@ properties:
>         - const: mediatek,mt8173-i2c
>         - const: mediatek,mt8183-i2c
>         - const: mediatek,mt8186-i2c
> +      - const: mediatek,mt8188-i2c
>         - const: mediatek,mt8192-i2c
>         - items:
>             - enum:

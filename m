Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9FD74CFC9F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 12:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241777AbiCGLXf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 06:23:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242020AbiCGLWw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 06:22:52 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D028B36318;
        Mon,  7 Mar 2022 02:49:22 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 93BCB1F439B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1646650161;
        bh=xcHrA688gBPqRiYshhBRs/w3XKYVKzPjdXoPUfWuwIE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=L13Iyh+MGBgvI0+tRh+GV1faYYieScGpgDewVXwECjJOGs0Be9EP46wJ9pTu2C+Vf
         jE2+08RPH668Jm6/nzpThsMw64DRj7rerCOm/d11db6g9CN+nQj5/osNf4gM7UcHGk
         IbjFT9Nikm0rMTBALl3aQuXam4cON5Zfu9R1U60H/rtTGR0gjx8mTb12WVe2y4sfN0
         wuKA3cctlK1YphfdNOiye9xiUMo+cxTci5x+4vaPURnX3OB8weYV90R84cT6iI/zTe
         TUXxFmRp96zvCBLJnIoI0bpGuuNG8Cblen2IMjDTUNt3V1u3n0tVF0no4rty11xpqd
         oGEmac2YETZaA==
Message-ID: <60248c8a-89a4-6f87-71f7-0732c3826e0b@collabora.com>
Date:   Mon, 7 Mar 2022 11:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: update bindings for MT8168 SoC
Content-Language: en-US
To:     Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-2-kewei.xu@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220307033649.11564-2-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 07/03/22 04:36, Kewei Xu ha scritto:
> Add a DT binding documentation for the MT8168 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

A conversion to dt-binding (yaml) would be very appreciated... however there
is nothing wrong with this addition, so:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 88f74a3c81ec..026985b8f61a 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -12,6 +12,7 @@ Required properties:
>         "mediatek,mt7622-i2c": for MediaTek MT7622
>         "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek MT7623
>         "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
> +      "mediatek,mt8168-i2c": for MediaTek MT8168
>         "mediatek,mt8173-i2c": for MediaTek MT8173
>         "mediatek,mt8183-i2c": for MediaTek MT8183
>         "mediatek,mt8186-i2c": for MediaTek MT8186



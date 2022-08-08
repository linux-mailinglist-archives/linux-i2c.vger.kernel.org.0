Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E192258C173
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 04:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243950AbiHHCIC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Aug 2022 22:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243731AbiHHCHr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Aug 2022 22:07:47 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32C813F4F;
        Sun,  7 Aug 2022 18:45:59 -0700 (PDT)
X-UUID: c56062a36b584b8388a020143d5e2296-20220808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/LV9X3K0473c6ImlEQLa2K80dlVlE+kCm+u2RLt7EbA=;
        b=VUQVrPNITSWK3FZXpkp1manvZyIBgf3h1hFVLeIWbt5rbvXujFgMOOQqhdHQA7qCxG5OcjsQRbIGj6oUhdPAl7X7azxkR/baMfcHVmkk2RgdJRVZO1lcWmQ5db4X8OxQrGli5ppy4H1OqGBusrcvvBnrs1AoNxhWJ+6Ey9rE7X8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a13da187-3f06-4279-a06b-25bdd4079267,OB:0,LO
        B:0,IP:0,URL:5,TC:0,Content:12,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:17
X-CID-META: VersionHash:0f94e32,CLOUDID:ad6d029c-da39-4e3b-a854-56c7d2111b46,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: c56062a36b584b8388a020143d5e2296-20220808
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 850141803; Mon, 08 Aug 2022 09:45:34 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 8 Aug 2022 09:45:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Aug 2022 09:45:32 +0800
Message-ID: <4e7fb6b799182d2dc088d94385faf1ec0b81b6bb.camel@mediatek.com>
Subject: Re: [PATCH v5 1/2] dt-bindngs: i2c: update bindings for mt8188 soc
From:   Qii Wang <qii.wang@mediatek.com>
To:     <kewei.xu@mediatek.com>, <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
        <housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
        <ryan-jh.yu@mediatek.com>, <david-yh.chiu@mediatek.com>
Date:   Mon, 8 Aug 2022 09:45:30 +0800
In-Reply-To: <20220806100249.12375-1-kewei.xu@mediatek.com>
References: <20220806100249.12375-1-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 2022-08-06 at 18:02 +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the mt8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
> v5: add Acked-by owner
> v4: resend patch
> v3: add reviewed-by owner
> v2: no changes
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 16a1a3118204..4e730fb7be56 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -27,6 +27,7 @@ properties:
>        - const: mediatek,mt8173-i2c
>        - const: mediatek,mt8183-i2c
>        - const: mediatek,mt8186-i2c
> +      - const: mediatek,mt8188-i2c
>        - const: mediatek,mt8192-i2c
>        - items:
>            - enum:


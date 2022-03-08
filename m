Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F03E4D0CFF
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Mar 2022 01:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241360AbiCHAts (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 19:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239014AbiCHAtr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 19:49:47 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5EC2BDE;
        Mon,  7 Mar 2022 16:48:48 -0800 (PST)
X-UUID: 86dc2c76fc1d4523a29abb31b9ace1f5-20220308
X-UUID: 86dc2c76fc1d4523a29abb31b9ace1f5-20220308
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 192907405; Tue, 08 Mar 2022 08:48:41 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 8 Mar 2022 08:48:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Mar 2022 08:48:38 +0800
Message-ID: <731cc7131849095bcbe50e7929b1b9d7e76c766e.camel@mediatek.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: update bindings for MT8168 SoC
From:   Qii Wang <qii.wang@mediatek.com>
To:     Kewei Xu <kewei.xu@mediatek.com>, <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
        <housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>
Date:   Tue, 8 Mar 2022 08:48:38 +0800
In-Reply-To: <20220307033649.11564-2-kewei.xu@mediatek.com>
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
         <20220307033649.11564-2-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2022-03-07 at 11:36 +0800, Kewei Xu wrote:
> Add a DT binding documentation for the MT8168 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 88f74a3c81ec..026985b8f61a 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -12,6 +12,7 @@ Required properties:
>        "mediatek,mt7622-i2c": for MediaTek MT7622
>        "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek
> MT7623
>        "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek
> MT7629
> +      "mediatek,mt8168-i2c": for MediaTek MT8168
>        "mediatek,mt8173-i2c": for MediaTek MT8173
>        "mediatek,mt8183-i2c": for MediaTek MT8183
>        "mediatek,mt8186-i2c": for MediaTek MT8186


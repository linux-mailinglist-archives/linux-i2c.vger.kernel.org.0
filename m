Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95CBC49B2E9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 12:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344906AbiAYL3R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 06:29:17 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:40150 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1380783AbiAYL1J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 06:27:09 -0500
X-UUID: 26aa45f1b6b8467cb5ad5038fb9430f1-20220125
X-UUID: 26aa45f1b6b8467cb5ad5038fb9430f1-20220125
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 201473731; Tue, 25 Jan 2022 19:26:42 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 25 Jan 2022 19:26:41 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 19:26:40 +0800
Message-ID: <2262446371d8cdbc1b9653325d6faa067f12b2ac.camel@mediatek.com>
Subject: Re: [v2 1/2] dt-bindings: i2c: update bindings for MT8186 SoC
From:   Qii Wang <qii.wang@mediatek.com>
To:     Kewei Xu <kewei.xu@mediatek.com>, <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
        <housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
        <ryan-jh.yu@mediatek.com>
Date:   Tue, 25 Jan 2022 19:26:40 +0800
In-Reply-To: <20220125110413.18988-2-kewei.xu@mediatek.com>
References: <20220125110413.18988-1-kewei.xu@mediatek.com>
         <20220125110413.18988-2-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2022-01-25 at 19:04 +0800, Kewei Xu wrote:
> Add a DT binding documentation for the MT8186 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 5ea216ae7084..88f74a3c81ec 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -14,6 +14,7 @@ Required properties:
>        "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek
> MT7629
>        "mediatek,mt8173-i2c": for MediaTek MT8173
>        "mediatek,mt8183-i2c": for MediaTek MT8183
> +      "mediatek,mt8186-i2c": for MediaTek MT8186
>        "mediatek,mt8192-i2c": for MediaTek MT8192
>        "mediatek,mt8195-i2c", "mediatek,mt8192-i2c": for MediaTek
> MT8195
>        "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek
> MT8516


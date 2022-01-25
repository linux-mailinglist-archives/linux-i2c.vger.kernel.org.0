Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0302449B2EB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 12:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349015AbiAYLaN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 06:30:13 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:43820 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1350038AbiAYL1x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 06:27:53 -0500
X-UUID: edf386d34c224deeb3ea1836fa8b3444-20220125
X-UUID: edf386d34c224deeb3ea1836fa8b3444-20220125
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2079363947; Tue, 25 Jan 2022 19:27:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 25 Jan 2022 19:27:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 19:27:44 +0800
Message-ID: <1d9b53a22e307ca90cafbd6fe08fbae3c4c58531.camel@mediatek.com>
Subject: Re: [v2 2/2] i2c: mediatek: Add i2c compatible for Mediatek MT8186
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
Date:   Tue, 25 Jan 2022 19:27:44 +0800
In-Reply-To: <20220125110413.18988-3-kewei.xu@mediatek.com>
References: <20220125110413.18988-1-kewei.xu@mediatek.com>
         <20220125110413.18988-3-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2022-01-25 at 19:04 +0800, Kewei Xu wrote:
> Add i2c compatible for MT8186. Compare to MT8192 i2c controller,
> MT8186 doesn't need handshake signal witch apdma.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c
> b/drivers/i2c/busses/i2c-mt65xx.c
> index 9ea427f53083..aa4d21838e14 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -397,6 +397,19 @@ static const struct mtk_i2c_compatible
> mt8183_compat = {
>  	.max_dma_support = 33,
>  };
>  
> +static const struct mtk_i2c_compatible mt8186_compat = {
> +	.regs = mt_i2c_regs_v2,
> +	.pmic_i2c = 0,
> +	.dcm = 0,
> +	.auto_restart = 1,
> +	.aux_len_reg = 1,
> +	.timing_adjust = 1,
> +	.dma_sync = 0,
> +	.ltiming_adjust = 1,
> +	.apdma_sync = 0,
> +	.max_dma_support = 36,
> +};
> +
>  static const struct mtk_i2c_compatible mt8192_compat = {
>  	.quirks = &mt8183_i2c_quirks,
>  	.regs = mt_i2c_regs_v2,
> @@ -418,6 +431,7 @@ static const struct of_device_id
> mtk_i2c_of_match[] = {
>  	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat
> },
>  	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat
> },
>  	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat
> },
> +	{ .compatible = "mediatek,mt8186-i2c", .data = &mt8186_compat
> },
>  	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat
> },
>  	{}
>  };


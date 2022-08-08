Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21F0858C170
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 04:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241912AbiHHCGd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Aug 2022 22:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244186AbiHHCF7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Aug 2022 22:05:59 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024FB23BEE;
        Sun,  7 Aug 2022 18:44:58 -0700 (PDT)
X-UUID: bae7f31d648c4ee5b78a8c5d3a6cbacf-20220808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=vLXRd+5n/C4jd/IFfhxdX0ToHitHv8rhm+XFVzvPlao=;
        b=MnzB011Tt83VgoeBwOmDn86m/g1T9GZsCf5Kde4QW2ieJm0CIiTKCfD1tHm0S1IgXUdxYtSVRn0afn/KlEfJV7GBZ5Olm1pU/oALDrhsiCgrNs/eEqc9lvziomxRJ2NQMZjs9Iih9Satuy4pb4YpupI9GIGWdDxsfAETA7HjQiA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:93888e7b-8df3-45d1-b952-2be5b409b5fb,OB:0,LO
        B:0,IP:0,URL:5,TC:0,Content:12,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
        TION:release,TS:62
X-CID-INFO: VERSION:1.1.8,REQID:93888e7b-8df3-45d1-b952-2be5b409b5fb,OB:0,LOB:
        0,IP:0,URL:5,TC:0,Content:12,EDM:0,RT:0,SF:45,FILE:0,RULE:Spam_GS981B3D,AC
        TION:quarantine,TS:62
X-CID-META: VersionHash:0f94e32,CLOUDID:7c65029c-da39-4e3b-a854-56c7d2111b46,C
        OID:42f2a629ea52,Recheck:0,SF:28|17|19|48,TC:nil,Content:3,EDM:-3,IP:nil,U
        RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: bae7f31d648c4ee5b78a8c5d3a6cbacf-20220808
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 947598297; Mon, 08 Aug 2022 09:44:27 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 8 Aug 2022 09:44:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Aug 2022 09:44:25 +0800
Message-ID: <1063819a7cf61e8654cf0f7f54dba115ec714209.camel@mediatek.com>
Subject: Re: [PATCH v5 2/2] i2c: mediatek: add i2c compatible for MT8188
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
Date:   Mon, 8 Aug 2022 09:44:24 +0800
In-Reply-To: <20220806100249.12375-2-kewei.xu@mediatek.com>
References: <20220806100249.12375-1-kewei.xu@mediatek.com>
         <20220806100249.12375-2-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,RDNS_NONE,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 2022-08-06 at 18:02 +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add i2c compatible for MT8188 and added mt_i2c_regs_v3[], since
> MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
> v5: modify the order of mt_i2c_regs_v3[] members and add Reviewed-by
> owner.
> v4: no changes
> V3: no changes
> V2: added mt_i2c_regs_v3[] to replace slave_addr_version.
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 43
> +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c
> b/drivers/i2c/busses/i2c-mt65xx.c
> index 8e6985354fd5..bd8abba3d1c9 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -229,6 +229,35 @@ static const u16 mt_i2c_regs_v2[] = {
>  	[OFFSET_DCM_EN] = 0xf88,
>  };
>  


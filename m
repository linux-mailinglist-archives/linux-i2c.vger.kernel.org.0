Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4C156B02D
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 03:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236922AbiGHBYy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 21:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235434AbiGHBYy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 21:24:54 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C14867588;
        Thu,  7 Jul 2022 18:24:46 -0700 (PDT)
X-UUID: 4232bf5c397840e4820673a0f342afdf-20220708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:06b3f4c4-c987-498f-84ea-64fa7a0b7927,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:9d7dda86-57f0-47ca-ba27-fe8c57fbf305,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: 4232bf5c397840e4820673a0f342afdf-20220708
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2034212625; Fri, 08 Jul 2022 09:24:40 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 09:24:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 09:24:38 +0800
Message-ID: <0fba8d4ecf11a471da9e3eadb8ce3b2029261c2c.camel@mediatek.com>
Subject: Re: [PATCH 2/2] i2c: mediatek: Add i2c compatible for Mediatek
 MT8188
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
        <yuhan.wei@mediatek.com>, <david-yh.chiu@mediatek.com>,
        <liju-clr.chen@mediatek.com>
Date:   Fri, 8 Jul 2022 09:24:38 +0800
In-Reply-To: <fae6c582-ec65-47d8-548f-934e8e829daf@collabora.com>
References: <20220707054617.13583-1-kewei.xu@mediatek.com>
         <20220707054617.13583-3-kewei.xu@mediatek.com>
         <fae6c582-ec65-47d8-548f-934e8e829daf@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2022-07-07 at 10:43 +0200, AngeloGioacchino Del Regno wrote:
> Il 07/07/22 07:46, Kewei Xu ha scritto:
> > Add i2c compatible for MT8188. Compare to MT8192 i2c controller,
> > The MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to
> > 0x94.
> > 
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> > ---
> >   drivers/i2c/busses/i2c-mt65xx.c | 41
> > +++++++++++++++++++++++++++++++--
> >   1 file changed, 39 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c
> > b/drivers/i2c/busses/i2c-mt65xx.c
> > index 8e6985354fd5..aa2e1cb87420 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -135,6 +135,7 @@ enum mtk_trans_op {
> >   enum I2C_REGS_OFFSET {
> >   	OFFSET_DATA_PORT,
> >   	OFFSET_SLAVE_ADDR,
> > +	OFFSET_SLAVE_ADDR1,
> >   	OFFSET_INTR_MASK,
> >   	OFFSET_INTR_STAT,
> >   	OFFSET_CONTROL,
> > @@ -203,6 +204,7 @@ static const u16 mt_i2c_regs_v1[] = {
> >   static const u16 mt_i2c_regs_v2[] = {
> >   	[OFFSET_DATA_PORT] = 0x0,
> >   	[OFFSET_SLAVE_ADDR] = 0x4,
> > +	[OFFSET_SLAVE_ADDR1] = 0x94,
> 
> Instead of adding a "slave addr version" entry... you can as well
> just define
> a new array here with an appropriate name.
> 
> static const u16 mt_i2c_regs_v3[] = {
> 
> .......
> 
> }
> 
> This way, you don't have to change all of the platform data entries
> and you
> also won't have to add checks in the do_transfer function, as that's
> one of
> the actual points of having these arrays of register offsets in here.
> 
> Regards,
> Angelo
> 

Hi Angelo,

Thank you very much for your suggestion, I will update the patch as
soon as possible.

Regards,
Kewei


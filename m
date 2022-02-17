Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485024BA01D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Feb 2022 13:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239548AbiBQM2s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Feb 2022 07:28:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbiBQM2r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Feb 2022 07:28:47 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8F015D399;
        Thu, 17 Feb 2022 04:28:32 -0800 (PST)
X-UUID: 71f432b6d828403b837e0811bef46801-20220217
X-UUID: 71f432b6d828403b837e0811bef46801-20220217
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1988982684; Thu, 17 Feb 2022 20:28:29 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 17 Feb 2022 20:28:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 20:28:27 +0800
Message-ID: <26a630dc3329f689dabe50361ffda8a0335b2653.camel@mediatek.com>
Subject: Re: [PATCH v9 1/1] i2c: mediatek: modify bus speed calculation
 formula
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
        <yuhan.wei@mediatek.com>, <ryan-jh.yu@mediatek.com>,
        <david-yh.chiu@mediatek.com>
Date:   Thu, 17 Feb 2022 20:28:26 +0800
In-Reply-To: <b22540e3-e8da-6878-64e3-04767c5327c2@collabora.com>
References: <1644400447-6215-1-git-send-email-kewei.xu@mediatek.com>
         <1644400447-6215-2-git-send-email-kewei.xu@mediatek.com>
         <b22540e3-e8da-6878-64e3-04767c5327c2@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2022-02-14 at 12:58 +0100, AngeloGioacchino Del Regno wrote:
> Il 09/02/22 10:54, Kewei Xu ha scritto:
> > When clock-div is 0 or greater than 1, the bus speed
> > calculated by the old speed calculation formula will be
> > larger than the target speed. So we update the formula.
> > 
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> > Change-Id: Ic0d9b8ab036bcf215d3a5066f2b91c7b8b128ba6
> 
> Please remove Change-Id tag, this is inappropriate and it's also
> irrelevant here.
> 
> After removing that tag:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
Hi,

Okay, I will remove the Change-Id tag in V10.
Thanks for your comment.

thanks
Kewei
> > ---
> >   drivers/i2c/busses/i2c-mt65xx.c | 51
> > +++++++++++++++++++++++++++++++++--------
> >   1 file changed, 41 insertions(+), 10 deletions(-)
> > 


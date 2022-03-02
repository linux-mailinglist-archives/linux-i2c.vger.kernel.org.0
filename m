Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A45B4CA3E1
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 12:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbiCBLhF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 06:37:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbiCBLhF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 06:37:05 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB60A9F6D1;
        Wed,  2 Mar 2022 03:36:17 -0800 (PST)
X-UUID: 0f3a01100a1b4e30b64a55122de259cc-20220302
X-UUID: 0f3a01100a1b4e30b64a55122de259cc-20220302
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1991867892; Wed, 02 Mar 2022 19:36:07 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 2 Mar 2022 19:36:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Mar
 2022 19:36:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Mar 2022 19:36:06 +0800
Message-ID: <0f4b304e8244310648543d0b1ea4788b2c760f3f.camel@mediatek.com>
Subject: Re: [PATCH] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
Date:   Wed, 2 Mar 2022 19:36:06 +0800
In-Reply-To: <Yh6T3RSfvcXCi4sb@ninjato>
References: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
         <8725a111-0ee2-8935-86b5-01c61774a628@collabora.com>
         <Yh6T3RSfvcXCi4sb@ninjato>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2022-03-01 at 22:45 +0100, Wolfram Sang wrote:
> On Mon, Feb 14, 2022 at 12:26:30PM +0100, AngeloGioacchino Del Regno
> wrote:
> > Il 18/01/22 14:33, AngeloGioacchino Del Regno ha scritto:
> > > Since depending on the SoC or specific bus functionality some
> > > clocks
> > > may be optional, we cannot get the benefit of using
> > > devm_clk_bulk_get()
> > > but, by migrating to clk-bulk, we are able to remove the custom
> > > functions
> > > mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing
> > > common
> > > APIs usage, hence (lightly) decreasing kernel footprint.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/i2c/busses/i2c-mt65xx.c | 127 +++++++++++++----------
> > > ---------
> > >   1 file changed, 51 insertions(+), 76 deletions(-)
> > > 
> > 
> > Hello,
> > this is a friendly ping to request review on this patch as to avoid
> > forgetting it.
> > 
> > Adding context, I have tested this patch on multiple (older/newer)
> > MediaTek
> > platforms.
> 
> Qii Wang, what do you think about this patch?
> 

Sorry for the late reply, I think it's ok.


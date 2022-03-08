Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA2B4D0D22
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Mar 2022 01:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243270AbiCHA7E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 19:59:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236142AbiCHA7E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 19:59:04 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC24921E17;
        Mon,  7 Mar 2022 16:58:08 -0800 (PST)
X-UUID: 96c3cc759b7a49578fd364f526b76411-20220308
X-UUID: 96c3cc759b7a49578fd364f526b76411-20220308
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1022482826; Tue, 08 Mar 2022 08:58:02 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 8 Mar 2022 08:58:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Mar 2022 08:58:00 +0800
Message-ID: <7cd27b814c67b32ca2d3eebfd81688612c93d886.camel@mediatek.com>
Subject: Re: [PATCH v1 2/2] i2c: mediatek: Add i2c compatible for Mediatek
 MT8168
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
Date:   Tue, 8 Mar 2022 08:58:00 +0800
In-Reply-To: <20220307033649.11564-3-kewei.xu@mediatek.com>
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
         <20220307033649.11564-3-kewei.xu@mediatek.com>
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

On Mon, 2022-03-07 at 11:36 +0800, Kewei Xu wrote:
> Add i2c compatible for MT8168. Compare to MT2712 i2c controller,
> MT8168 need to synchronize signal with dma.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> 


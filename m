Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D34EE534E18
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 13:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347115AbiEZLbN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 07:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbiEZLbN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 07:31:13 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A0C13E;
        Thu, 26 May 2022 04:31:10 -0700 (PDT)
X-UUID: 26b53d3b7a1f4518a0f63cdbff470c0a-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:2f6ca814-f091-4121-8f79-491224de18c3,OB:0,LO
        B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:56
X-CID-INFO: VERSION:1.1.5,REQID:2f6ca814-f091-4121-8f79-491224de18c3,OB:0,LOB:
        0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACTIO
        N:release,TS:56
X-CID-META: VersionHash:2a19b09,CLOUDID:3d6c9647-4fb1-496b-8f1d-39e733fed1ea,C
        OID:c7650db43784,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:1,File:nil,QS:0,BEC:nil
X-UUID: 26b53d3b7a1f4518a0f63cdbff470c0a-20220526
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1325560879; Thu, 26 May 2022 19:31:03 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 26 May 2022 19:31:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 26 May 2022 19:31:01 +0800
Message-ID: <016ea54b7474b71f2995e4c3a10fe2d3efc2b641.camel@mediatek.com>
Subject: Re: [PATCH] i2c: mediatek: Fix an error handling path in
 mtk_i2c_probe()
From:   Qii Wang <qii.wang@mediatek.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        <dan.carpenter@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Wolfram Sang <wsa@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Thu, 26 May 2022 19:31:01 +0800
In-Reply-To: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
References: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 2022-05-22 at 14:22 +0200, Christophe JAILLET wrote:
> The clsk are prepared, enabled, then disabled. So if an error occurs
> after
> the disable step, they are still prepared.
> 
> Add an error handling path to unprepare the clks in such a case, as
> already
> done in the .remove function.
> 
> Fixes: 8b4fc246c3ff ("i2c: mediatek: Optimize master_xfer() and avoid
> circular locking")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 



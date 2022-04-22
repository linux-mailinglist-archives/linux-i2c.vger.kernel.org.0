Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24D6850ACB9
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Apr 2022 02:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382407AbiDVAYQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Apr 2022 20:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiDVAYP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Apr 2022 20:24:15 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C08F4968A;
        Thu, 21 Apr 2022 17:21:19 -0700 (PDT)
X-UUID: 6bea87178aba4b2aa56d28a4144152af-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:735316ce-94ac-4ebd-b6e8-18a33047e259,OB:0,LO
        B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:8
X-CID-META: VersionHash:faefae9,CLOUDID:1a2087f0-da02-41b4-b6df-58f4ccd36682,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6bea87178aba4b2aa56d28a4144152af-20220422
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 325809546; Fri, 22 Apr 2022 08:21:11 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Apr 2022 08:21:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 08:21:10 +0800
Message-ID: <c8d6f77aac432e8df33372a95c6242fcdbb35090.camel@mediatek.com>
Subject: Re: [PATCH v2] i2c: mediatek: Optimize master_xfer() and avoid
 circular locking
From:   Qii Wang <qii.wang@mediatek.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <wsa@kernel.org>,
        <nfraprado@collabora.com>, <kernel@collabora.com>
Date:   Fri, 22 Apr 2022 08:21:09 +0800
In-Reply-To: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
References: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        SPF_HELO_NONE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2022-04-11 at 15:21 +0200, AngeloGioacchino Del Regno wrote:
> Especially (but not only) during probe, it may happen that multiple
> devices are communicating via i2c (or multiple i2c busses) and
> sometimes while others are probing asynchronously.
> For example, a Cr50 TPM may be filling entropy (or userspace may be
> reading random data) while the rt5682 (i2c) codec driver reads/sets
> some registers, like while getting/setting a clock's rate, which
> happens both during probe and during system operation.
> 
> In this driver, the mtk_i2c_transfer() function (which is the i2c
> .master_xfer() callback) was granularly managing the clocks by
> performing a clk_bulk_prepare_enable() to start them and its inverse.
> This is not only creating possible circular locking dependencies in
> the some cases (like former explanation), but it's also suboptimal,
> as clk_core prepare/unprepare operations are using mutex locking,
> which creates a bit of unwanted overhead (for example, i2c trackpads
> will call master_xfer() every few milliseconds!).
> 
> With this commit, we avoid both the circular locking and additional
> overhead by changing how we handle the clocks in this driver:
> - Prepare the clocks during probe (and PM resume)
> - Enable/disable clocks in mtk_i2c_transfer()
> - Unprepare the clocks only for driver removal (and PM suspend)
> 
> For the sake of providing a full explanation: during probe, the
> clocks are not only prepared but also enabled, as this is needed
> for some hardware initialization but, after that, we are disabling
> but not unpreparing them, leaving an expected state for the
> aforementioned clock handling strategy.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
> 
> v2: Fixed typos in commit description
> 
>  drivers/i2c/busses/i2c-mt65xx.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> 


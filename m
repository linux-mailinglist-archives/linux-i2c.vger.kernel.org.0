Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8634D4AEEB9
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 10:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbiBIJ4N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 04:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235574AbiBIJ4L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 04:56:11 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340A7C102FDB;
        Wed,  9 Feb 2022 01:56:03 -0800 (PST)
X-UUID: 0aca2ca46c6a481eab03ccf4ecd769e0-20220209
X-UUID: 0aca2ca46c6a481eab03ccf4ecd769e0-20220209
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1893974579; Wed, 09 Feb 2022 17:54:13 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 9 Feb 2022 17:54:12 +0800
Received: from localhost.localdomain (10.17.3.14) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Feb 2022 17:54:11 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
        <yuhan.wei@mediatek.com>, <kewei.xu@mediatek.com>,
        <ryan-jh.yu@mediatek.com>, <david-yh.chiu@mediatek.com>
Subject: [PATCH v9 0/1] Introducing an attribute to select the time setting
Date:   Wed, 9 Feb 2022 17:54:06 +0800
Message-ID: <1644400447-6215-1-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v9:
1. Base on for-next remove received patch
2. Update ac-timing calculation algorithm to make i2c ac-timing meet
specification and function normal.

v8:
Remove received patch

v7:
Resubmit the patch based on version 5.15-rc1

v6:
1. Add the judgment condition, clear the handshake signal between dma and
i2c when multiple msgs are transmitted.

v5:
1. Replace the previous variable name "default_timing_adjust" with
   "use-default-timing"
2. Added waiting for dma reset mechanism
3. Remove received patch(dt-bindings: i2c: update bindings for MT8195 SOC)

v4:
1. Remove the repeated assignment of the inter_clk_div parameter
2. Modify the wrong assignment of OFFSET_MULTI_DMA
3. Unify the log print format of the i2c_dump_register() and drop the extra
   outer parentheses
4. Place the fixes at the very least
5. Add fixed tags commit 25708278f810 ("i2c: mediatek: Add i2c support for
   MediaTek MT8183")
6. Add "i2c: mediatek: modify bus speed calculation formula"
7. Fix single line characters exceeding 80 characters
8. Combine two different series of patches.

v3:
1. Fix code errors caused by v2 modification

v2:
1. Add "dt-bindings: i2c: add attribute default-timing-adjust"
2. Split the fix into sepatate patch.

Kewei Xu (1):
  i2c: mediatek: modify bus speed calculation formula

 drivers/i2c/busses/i2c-mt65xx.c | 51 ++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 10 deletions(-)

--
2.18.0


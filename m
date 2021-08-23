Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 034C13F4B57
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 15:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237300AbhHWNGc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 09:06:32 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:53740 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235649AbhHWNGc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Aug 2021 09:06:32 -0400
X-UUID: 0802132c3032473ba51729c45abcab01-20210823
X-UUID: 0802132c3032473ba51729c45abcab01-20210823
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 392248089; Mon, 23 Aug 2021 21:05:42 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 21:05:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Aug 2021 21:05:39 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
        <yuhan.wei@mediatek.com>, <kewei.xu@mediatek.com>
Subject: [PATCH v5 0/7] Introducing an attribute to select the time setting
Date:   Mon, 23 Aug 2021 21:05:30 +0800
Message-ID: <1629723937-10839-1-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v5:
1. Replace the previous variable name "default_timing_adjust" with "use-default-timing"
2. Added waiting for dma reset mechanism
3. Remove received patch(dt-bindings: i2c: update bindings for MT8195 SOC)

v4:
1. Remove the repeated assignment of the inter_clk_div parameter
2. Modify the wrong assignment of OFFSET_MULTI_DMA
3. Unify the log print format of the i2c_dump_register() and drop the extra outer parentheses
4. Place the fixes at the very least
5. Add fixed tags 25708278f810 ("i2c: mediatek: Add i2c support for MediaTek MT8183")
6. Add "i2c: mediatek: modify bus speed calculation formula"
7. Fix single line characters exceeding 80 characters
8. Combine two different series of patches.

v3:
1. Fix code errors caused by v2 modification

v2:
1. Add "dt-bindings: i2c: add attribute default-timing-adjust"
2. Split the fix into sepatate patch.

Kewei Xu (7):
  i2c: mediatek: fixing the incorrect register offset
  i2c: mediatek: Reset the handshake signal between i2c and dma
  i2c: mediatek: Dump i2c/dma register when a timeout occurs
  dt-bindings: i2c: add attribute use-default-timing
  i2c: mediatek: Add OFFSET_EXT_CONF setting back
  i2c: mediatek: Isolate speed setting via dts for special devices
  i2c: mediatek: modify bus speed calculation formula

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |   2 +
 drivers/i2c/busses/i2c-mt65xx.c               | 207 ++++++++++++++++--
 2 files changed, 192 insertions(+), 17 deletions(-)

-- 
2.18.0

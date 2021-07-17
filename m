Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B003CC278
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Jul 2021 12:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbhGQKVI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Jul 2021 06:21:08 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50494 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233252AbhGQKVE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Jul 2021 06:21:04 -0400
X-UUID: 46a4e1a5780f4cc98c40c152ce3e15cc-20210717
X-UUID: 46a4e1a5780f4cc98c40c152ce3e15cc-20210717
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 69300753; Sat, 17 Jul 2021 18:18:04 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 18:18:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 18:18:02 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <yuhan.wei@mediatek.com>,
        <kewei.xu@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
        <liguo.zhang@mediatek.com>
Subject: [PATCH V4 0/8] Introduce an attribute to choose timing setting
Date:   Sat, 17 Jul 2021 18:17:51 +0800
Message-ID: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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

Kewei Xu (8):
  i2c: mediatek: fixing the incorrect register offset
  dt-bindings: i2c: update bindings for MT8195 SoC
  i2c: mediatek: Reset the handshake signal between i2c and dma
  i2c: mediatek: Dump i2c/dma register when a timeout occurs
  dt-bindings: i2c: add attribute default-timing-adjust
  i2c: mediatek: Add OFFSET_EXT_CONF setting back
  i2c: mediatek: Isolate speed setting via dts for special devices
  i2c: mediatek: modify bus speed calculation formula

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |   3 +
 drivers/i2c/busses/i2c-mt65xx.c               | 194 ++++++++++++++++--
 2 files changed, 180 insertions(+), 17 deletions(-)

-- 
2.18.0


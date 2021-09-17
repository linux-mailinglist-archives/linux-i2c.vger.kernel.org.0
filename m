Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF80640F59E
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Sep 2021 12:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241918AbhIQKPn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Sep 2021 06:15:43 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41172 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232479AbhIQKPn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Sep 2021 06:15:43 -0400
X-UUID: 86c4990198544c5b8d4c85d7e2477107-20210917
X-UUID: 86c4990198544c5b8d4c85d7e2477107-20210917
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 87401243; Fri, 17 Sep 2021 18:14:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 18:14:17 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Sep 2021 18:14:17 +0800
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
Subject: [PATCH v7 0/7] Introducing an attribute to select the time setting
Date:   Fri, 17 Sep 2021 18:14:09 +0800
Message-ID: <20210917101416.20760-1-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v6:
Add the judgment condition, clear the handshake signal between dma and
i2c when multiple msgs are transmitted.

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


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3DEE3CC283
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Jul 2021 12:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233511AbhGQKVO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Jul 2021 06:21:14 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:35752 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233264AbhGQKVF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Jul 2021 06:21:05 -0400
X-UUID: e2845684a2a441378e7f8b89f2549545-20210717
X-UUID: e2845684a2a441378e7f8b89f2549545-20210717
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1494468651; Sat, 17 Jul 2021 18:18:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 18:18:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 18:18:03 +0800
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
Subject: [PATCH v4 2/8] dt-bindings: i2c: update bindings for MT8195 SoC
Date:   Sat, 17 Jul 2021 18:17:53 +0800
Message-ID: <1626517079-9057-3-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a DT binding documentation for the MT8195 soc.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 7f0194fdd0cc..7c4915bc4439 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -15,6 +15,7 @@ Required properties:
       "mediatek,mt8173-i2c": for MediaTek MT8173
       "mediatek,mt8183-i2c": for MediaTek MT8183
       "mediatek,mt8192-i2c": for MediaTek MT8192
+      "mediatek,mt8195-i2c", "mediatek,mt8192-i2c": for MediaTek MT8195
       "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
   - reg: physical base address of the controller and dma base, length of memory
     mapped region.
-- 
2.18.0


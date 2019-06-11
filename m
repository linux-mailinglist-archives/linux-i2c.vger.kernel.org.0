Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 371F73C5AA
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 10:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404660AbfFKIM6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 04:12:58 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:62965 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404512AbfFKIM5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 04:12:57 -0400
X-UUID: 55954d84e960454bb1d0a693af0dfb87-20190611
X-UUID: 55954d84e960454bb1d0a693af0dfb87-20190611
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 561174206; Tue, 11 Jun 2019 16:12:49 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Jun 2019 16:12:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 16:12:47 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <matthias.bgg@gmail.com>,
        <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: i2c: Add MediaTek i2c AC timing binding
Date:   Tue, 11 Jun 2019 16:11:54 +0800
Message-ID: <1560240715-22595-2-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1560240715-22595-1-git-send-email-qii.wang@mediatek.com>
References: <1560240715-22595-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c AC timing binding to binding file. It can give the AC
timing parameters to meet I2C specification at different speed.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 68f6d73..0f92813 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -30,6 +30,7 @@ Optional properties:
   - mediatek,have-pmic: platform can control i2c form special pmic side.
     Only mt6589 and mt8135 support this feature.
   - mediatek,use-push-pull: IO config use push-pull mode.
+  - ac-timing: give some AC timing parameters to meet i2c spec fully.
 
 Example:
 
@@ -43,5 +44,15 @@ Example:
 			clock-div = <16>;
 			clocks = <&i2c0_ck>, <&ap_dma_ck>;
 			clock-names = "main", "dma";
+			ac-timing =  /bits/ 16 <
+				0x8001	/* 0:ext */
+				0x0005	/* 1:inter_clk_div */
+				0x0102	/* 2:scl_hl_ratio */
+				0x0102	/* 3:hs_scl_hl_ratio */
+				0x0002	/* 4:scl_mis_comp */
+				0x0002	/* 5:sta_stop */
+				0x0002	/* 6:hs_sta_stop */
+				0x0002	/* 7:sda_timing */
+			>;
 	};
 
-- 
1.7.9.5


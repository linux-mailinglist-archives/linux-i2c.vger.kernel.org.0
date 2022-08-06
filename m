Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0739258B4ED
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Aug 2022 12:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241821AbiHFKDQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Aug 2022 06:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241822AbiHFKDP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 6 Aug 2022 06:03:15 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888F012085;
        Sat,  6 Aug 2022 03:03:06 -0700 (PDT)
X-UUID: 05949a68c2a84d1d9015b508fcf76e9b-20220806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9XA/gsfa3bVWlGBTrX3L0wvV5sWXhFo0p+9okDM5jAo=;
        b=YtnFeZyBy7w/4sOG27OvHYFBGqkJ3suZ3YRXHbxVreGQ/yzqspmLmB3nilnfWUtuUJKsSDGTlBA3j+Xn3YHBQUFNHOk5m7QzNLOCFN7bEKwrqKKluULhwZpw0VMi8tKLcX08syEM+0RLN3Mj3THcT2t1AeSgSbsuzcVTlk6WURs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:0dd9b4c6-afbb-447c-8c3f-188047bc90ed,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:8a85ef9b-da39-4e3b-a854-56c7d2111b46,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: 05949a68c2a84d1d9015b508fcf76e9b-20220806
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 453748640; Sat, 06 Aug 2022 18:03:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 6 Aug 2022 18:02:58 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 6 Aug 2022 18:02:58 +0800
From:   <kewei.xu@mediatek.com>
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
Subject: [PATCH v5 1/2] dt-bindngs: i2c: update bindings for mt8188 soc
Date:   Sat, 6 Aug 2022 18:02:48 +0800
Message-ID: <20220806100249.12375-1-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_CSS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kewei Xu <kewei.xu@mediatek.com>

Add a DT binding documentation for the mt8188 soc.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v5: add Acked-by owner
v4: resend patch
v3: add reviewed-by owner
v2: no changes
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 16a1a3118204..4e730fb7be56 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -27,6 +27,7 @@ properties:
       - const: mediatek,mt8173-i2c
       - const: mediatek,mt8183-i2c
       - const: mediatek,mt8186-i2c
+      - const: mediatek,mt8188-i2c
       - const: mediatek,mt8192-i2c
       - items:
           - enum:
-- 
2.18.0


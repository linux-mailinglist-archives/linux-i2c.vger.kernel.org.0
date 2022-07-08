Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7BFC56B08A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 04:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237009AbiGHCSf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 22:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236583AbiGHCSc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 22:18:32 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9046621B2;
        Thu,  7 Jul 2022 19:18:29 -0700 (PDT)
X-UUID: 0f1691d2ad0544f1ba48d62be2ad3b14-20220708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:fec81cfc-186d-428c-b837-5a25633d812f,OB:10,L
        OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,A
        CTION:release,TS:100
X-CID-INFO: VERSION:1.1.8,REQID:fec81cfc-186d-428c-b837-5a25633d812f,OB:10,LOB
        :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,A
        CTION:quarantine,TS:100
X-CID-META: VersionHash:0f94e32,CLOUDID:b57cb963-0b3f-4b2c-b3a6-ed5c044366a0,C
        OID:0c34c6365664,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0f1691d2ad0544f1ba48d62be2ad3b14-20220708
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1184637001; Fri, 08 Jul 2022 10:18:22 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 10:18:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 10:18:20 +0800
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
        <david-yh.chiu@mediatek.com>, <liju-clr.chen@mediatek.com>
Subject: [PATCH V2 0/2] add i2c support for mt8188
Date:   Fri, 8 Jul 2022 10:18:16 +0800
Message-ID: <20220708021818.21400-1-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

---
Main changes compared to v1:
added mt_i2c_regs_v3[] to replace slave_addr_version.

Kewei Xu (2):
  dt-bindings: i2c: update bindings for MT8188 SoC
  i2c: mediatek: Add i2c compatible for Mediatek MT8188

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   |  1 +
 drivers/i2c/busses/i2c-mt65xx.c               | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)

-- 
2.18.0


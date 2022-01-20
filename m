Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F23495483
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 19:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243589AbiATS7B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 13:59:01 -0500
Received: from eu-shark1.inbox.eu ([195.216.236.81]:54546 "EHLO
        eu-shark1.inbox.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346851AbiATS7B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 13:59:01 -0500
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
        by eu-shark1-out.inbox.eu (Postfix) with ESMTP id C20D36C0049B;
        Thu, 20 Jan 2022 20:58:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
        t=1642705139; bh=Mp9kGuVBlC0Ago6NIpMWZJ/WkxFZQYYgpDvOpyIAg5E=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:X-ESPOL:
         from:date:to:cc;
        b=kOahGYNXe1hp47zHoxdJOaLh99tH16xgsH/a5Hs5F3BB3Ude1riRim5g3vKVkWMzU
         cnk0nd2+BIr0qVCEbCakwZ5WBrAQer7MFMpVYf7CbjAHzmYsU8lC2CfsS8VkVf/1oA
         wP9CfupCGVAtX9PctP24vpwhgH3iIOFRn2jC7Cgo=
Received: from localhost (localhost [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id B1E936C006AE;
        Thu, 20 Jan 2022 20:58:59 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
        by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
        with ESMTP id zrkmbK32Y5_z; Thu, 20 Jan 2022 20:58:59 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 5C4CA6C0049B;
        Thu, 20 Jan 2022 20:58:59 +0200 (EET)
From:   Boris Lysov <arzamas-16@mail.ee>
To:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     qii.wang@mediatek.com
Subject: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: remove mt6577 support
Date:   Thu, 20 Jan 2022 21:58:52 +0300
Message-Id: <20220120185853.24266-2-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220120185853.24266-1-arzamas-16@mail.ee>
References: <20220120185853.24266-1-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: +dBm1NUOBlzQh1+kSn3cDQIzqylVJY3o+OCk0Rhfgnn7NzCFekARMmO6mXAFPnHC3iM=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove mentions of mt6577 from the dt-binding doc because the existing driver
doesn't support this SoC. mt6577 was used in this driver as some sort of a
"generic" configuration and it is now replaced with mt2701.

Update the dt-binding example to replace mt6577 with mt6589, as the example
uses [1] register addresses of the latter SoC.

[1] https://marc.info/?l=devicetree&m=159949247901831&w=2

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 5ea216ae7084..d1d0c5d2b9e9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -4,13 +4,12 @@ The MediaTek's I2C controller is used to interface with I2C devices.
 
 Required properties:
   - compatible: value should be either of the following.
-      "mediatek,mt2701-i2c", "mediatek,mt6577-i2c": for MediaTek MT2701
+      "mediatek,mt2701-i2c": for MediaTek MT2701
       "mediatek,mt2712-i2c": for MediaTek MT2712
-      "mediatek,mt6577-i2c": for MediaTek MT6577
       "mediatek,mt6589-i2c": for MediaTek MT6589
-      "mediatek,mt6797-i2c", "mediatek,mt6577-i2c": for MediaTek MT6797
+      "mediatek,mt6797-i2c", "mediatek,mt2701-i2c": for MediaTek MT6797
       "mediatek,mt7622-i2c": for MediaTek MT7622
-      "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek MT7623
+      "mediatek,mt7623-i2c", "mediatek,mt2701-i2c": for MediaTek MT7623
       "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
       "mediatek,mt8173-i2c": for MediaTek MT8173
       "mediatek,mt8183-i2c": for MediaTek MT8183
@@ -38,7 +37,7 @@ Optional properties:
 Example:
 
 	i2c0: i2c@1100d000 {
-			compatible = "mediatek,mt6577-i2c";
+			compatible = "mediatek,mt6589-i2c";
 			reg = <0x1100d000 0x70>,
 			      <0x11000300 0x80>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
-- 
2.20.1


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E6421CD20
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 04:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgGMCVC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Jul 2020 22:21:02 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:55428 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726534AbgGMCVC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Jul 2020 22:21:02 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3835706|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0186492-0.00196135-0.979389;FP=10163385476113317275|1|1|4|0|-1|-1|-1;HT=e02c03267;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.I0sCU5a_1594606854;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.I0sCU5a_1594606854)
          by smtp.aliyun-inc.com(10.147.42.197);
          Mon, 13 Jul 2020 10:20:58 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     gregory.clement@bootlin.com, robh+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tiny.windzz@gmail.com,
        Frank Lee <frank@allwinnertech.com>
Subject: [PATCH v3 13/16] dt-bindings: i2c: mv64xxx: Add compatible for the A100 i2c node.
Date:   Mon, 13 Jul 2020 10:20:49 +0800
Message-Id: <20200713022049.22555-1-frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Allwinner A100 have a mv64xxx i2c interface available to be used.

Signed-off-by: Frank Lee <frank@allwinnertech.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 2ceb05b..5b5ae40 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -27,6 +27,9 @@ properties:
           - const: allwinner,sun50i-a64-i2c
           - const: allwinner,sun6i-a31-i2c
       - items:
+          - const: allwinner,sun50i-a100-i2c
+          - const: allwinner,sun6i-a31-i2c
+      - items:
           - const: allwinner,sun50i-h6-i2c
           - const: allwinner,sun6i-a31-i2c
 
-- 
1.9.1


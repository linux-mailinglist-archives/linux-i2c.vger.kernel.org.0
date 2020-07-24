Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FF022BEDA
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 09:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgGXHRp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 03:17:45 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:37911 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726437AbgGXHRp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jul 2020 03:17:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3730119|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00789351-0.00130981-0.990797;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16368;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.I6q9yS4_1595575057;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.I6q9yS4_1595575057)
          by smtp.aliyun-inc.com(10.147.44.118);
          Fri, 24 Jul 2020 15:17:42 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     tiny.windzz@gmail.com, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com, Yangtao Li <frank@allwinnertech.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 13/16] dt-bindings: i2c: mv64xxx: Add compatible for the A100 i2c node.
Date:   Fri, 24 Jul 2020 15:17:01 +0800
Message-Id: <a6393e8feec580e11dccd5df20417e66e8485cd0.1595572867.git.frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1595572867.git.frank@allwinnertech.com>
References: <cover.1595572867.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Yangtao Li <frank@allwinnertech.com>

Allwinner A100 have a mv64xxx i2c interface available to be used.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 2ceb05ba2df5..5b5ae402f97a 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -26,6 +26,9 @@ properties:
       - items:
           - const: allwinner,sun50i-a64-i2c
           - const: allwinner,sun6i-a31-i2c
+      - items:
+          - const: allwinner,sun50i-a100-i2c
+          - const: allwinner,sun6i-a31-i2c
       - items:
           - const: allwinner,sun50i-h6-i2c
           - const: allwinner,sun6i-a31-i2c
-- 
2.24.0


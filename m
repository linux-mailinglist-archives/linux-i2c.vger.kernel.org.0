Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510EC12266E
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 09:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfLQIPM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 03:15:12 -0500
Received: from out28-197.mail.aliyun.com ([115.124.28.197]:40810 "EHLO
        out28-197.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbfLQIPM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Dec 2019 03:15:12 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3640704|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.177133-0.0111704-0.811697;DS=CONTINUE|ham_regular_dialog|0.00419989-0.000140762-0.995659;FP=17287530803298377122|3|2|10|0|-1|-1|-1;HT=e02c03304;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GIuIYRX_1576570455;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GIuIYRX_1576570455)
          by smtp.aliyun-inc.com(10.147.40.44);
          Tue, 17 Dec 2019 16:14:31 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, mark.rutland@arm.com,
        paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 2374286503@qq.com
Subject: [PATCH v3 1/2] dt-bindings: I2C: Add X1000 bindings.
Date:   Tue, 17 Dec 2019 16:14:09 +0800
Message-Id: <1576570450-122556-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576570450-122556-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576570450-122556-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the I2C bindings for the X1000 Soc from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    No change.
    
    v2->v3:
    No change.

 Documentation/devicetree/bindings/i2c/i2c-jz4780.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-jz4780.txt b/Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
index 3738cfb..d229eff 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
@@ -1,7 +1,9 @@
 * Ingenic JZ4780 I2C Bus controller
 
 Required properties:
-- compatible: should be "ingenic,jz4780-i2c"
+- compatible: should be one of the following:
+  - "ingenic,jz4780-i2c" for the JZ4780
+  - "ingenic,x1000-i2c" for the X1000
 - reg: Should contain the address & size of the I2C controller registers.
 - interrupts: Should specify the interrupt provided by parent.
 - clocks: Should contain a single clock specifier for the JZ4780 I2C clock.
-- 
2.7.4


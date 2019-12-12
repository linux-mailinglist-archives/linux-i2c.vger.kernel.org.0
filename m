Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B776511D171
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2019 16:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbfLLPvL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Dec 2019 10:51:11 -0500
Received: from out28-125.mail.aliyun.com ([115.124.28.125]:52800 "EHLO
        out28-125.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbfLLPvK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Dec 2019 10:51:10 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3382297|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.177133-0.0111704-0.811697;DS=CONTINUE|ham_regular_dialog|0.00789308-0.000424075-0.991683;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03303;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.GFo2FEj_1576165852;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GFo2FEj_1576165852)
          by smtp.aliyun-inc.com(10.147.40.7);
          Thu, 12 Dec 2019 23:50:59 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, paul@crapouillou.net, paul.burton@mips.com,
        paulburton@kernel.org, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 1/2] dt-bindings: I2C: Add X1000 bindings.
Date:   Thu, 12 Dec 2019 23:50:49 +0800
Message-Id: <1576165850-20727-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576165850-20727-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576165850-20727-1-git-send-email-zhouyanjie@wanyeetech.com>
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


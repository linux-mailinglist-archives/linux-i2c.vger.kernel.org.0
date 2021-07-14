Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63ABE3C852B
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 15:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbhGNNXL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 09:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbhGNNXA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jul 2021 09:23:00 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23DFDC0613DF
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 06:20:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by xavier.telenet-ops.be with bizsmtp
        id V1L52500M1ccfby011L5pn; Wed, 14 Jul 2021 15:20:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eo1-00193x-Bl; Wed, 14 Jul 2021 15:20:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eo0-00Aaq8-U5; Wed, 14 Jul 2021 15:20:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/4] dt-bindings: i2c: renesas,riic: Make interrupt-names required
Date:   Wed, 14 Jul 2021 15:20:03 +0200
Message-Id: <da8d1973dcd419d8d9c8c662ee614952f3a6969e.1626267422.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626267422.git.geert+renesas@glider.be>
References: <cover.1626267422.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now the I2C device nodes in all DTS files have gained "interrupt-names"
properties, the "interrupt-names" property can be made required.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 70f998f006305c25..402fd125e0104a6a 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -62,6 +62,7 @@ required:
   - compatible
   - reg
   - interrupts
+  - interrupt-names
   - clocks
   - clock-frequency
   - power-domains
-- 
2.25.1


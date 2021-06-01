Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62E6397606
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 17:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbhFAPFm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 11:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233924AbhFAPFl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 11:05:41 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B46C06174A
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 08:03:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:555:bf00:6951:b6ab])
        by xavier.telenet-ops.be with bizsmtp
        id Br3w2500J35oben01r3wDl; Tue, 01 Jun 2021 17:03:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo5vw-00BuRD-Cw; Tue, 01 Jun 2021 17:03:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo5vv-000Ivy-TN; Tue, 01 Jun 2021 17:03:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Add linux-renesas-soc to the Renesas I2C entries
Date:   Tue,  1 Jun 2021 17:03:54 +0200
Message-Id: <0449ef7469a14d8ea25df6b06b3f230cc95ebd7d.1622559592.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The people on linux-renesas-soc are interested in changes to the Renesas
I2C drivers and their DT bindings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e5f02b1c284ca86..021e8b9093f1208a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15674,6 +15674,7 @@ F:	drivers/clk/renesas/
 
 RENESAS EMEV2 I2C DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
+L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
 F:	drivers/i2c/busses/i2c-emev2.c
@@ -15695,6 +15696,7 @@ F:	drivers/iio/adc/rcar-gyroadc.c
 
 RENESAS R-CAR I2C DRIVERS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
+L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
 F:	Documentation/devicetree/bindings/i2c/renesas,iic.txt
@@ -15712,6 +15714,7 @@ F:	drivers/thermal/rcar_thermal.c
 
 RENESAS RIIC DRIVER
 M:	Chris Brandt <chris.brandt@renesas.com>
+L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,riic.yaml
 F:	drivers/i2c/busses/i2c-riic.c
-- 
2.25.1


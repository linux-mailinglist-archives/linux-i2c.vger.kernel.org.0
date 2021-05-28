Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB3F3941A8
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 13:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234085AbhE1LMa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 07:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhE1LMa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 May 2021 07:12:30 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85549C061574
        for <linux-i2c@vger.kernel.org>; Fri, 28 May 2021 04:10:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
        by laurent.telenet-ops.be with bizsmtp
        id ABAs2500N20MPSF01BAs9r; Fri, 28 May 2021 13:10:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmaOC-00ADsJ-AW; Fri, 28 May 2021 13:10:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmaOB-007ZWS-Ts; Fri, 28 May 2021 13:10:51 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Rob Herring <robh+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] dt-bindings: i2c: i2c-mux: Remove reset-active-low from ssd1307fb examples
Date:   Fri, 28 May 2021 13:10:49 +0200
Message-Id: <20210528111049.1804800-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "reset-active-low" property was removed from the ssd1307fb bindings
in commit 519b4dba586198ee ("fbdev: ssd1307fb: Remove reset-active-low
from the DT binding document") and from the ssd1307fb binding examples
in commit 7d7e58d30e046d34 ("dt-bindings: display: ssd1307fb: Remove
reset-active-low from examples").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt  | 1 -
 Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
index 21da3ecbb3700c06..1bf267302251bb63 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
@@ -62,7 +62,6 @@ Example:
 				reg = <0x3c>;
 				pwms = <&pwm 4 3000>;
 				reset-gpios = <&gpio2 7 1>;
-				reset-active-low;
 			};
 		};
 
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
index 8b444b94e92fde83..51356fdf2becc3f6 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
@@ -80,7 +80,6 @@ Example:
 				reg = <0x3c>;
 				pwms = <&pwm 4 3000>;
 				reset-gpios = <&gpio2 7 1>;
-				reset-active-low;
 			};
 		};
 
-- 
2.25.1


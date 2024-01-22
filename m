Return-Path: <linux-i2c+bounces-1421-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3483751B
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 22:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96AB31C25F84
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 21:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D13447F71;
	Mon, 22 Jan 2024 21:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1T7fwc1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4AE47F57;
	Mon, 22 Jan 2024 21:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705958150; cv=none; b=X9tGT+OkIMgGrOVtcLZQez7FoCL6/Y0EIwRHD87V0MBh7TG5ghoBKrXYYkHRCm3rDuuHWHNlhn2i8wGOaEzf826IwGynadwiGKTHXlN+1Lanb0bMdJWjJIC7AStrIiNznY63xXvhdXPUa0jFoM2hfH8xzc/pLSA3/y4Frfz8+60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705958150; c=relaxed/simple;
	bh=+Sd1NCS7PJbxgZHkZkL/NbxvN4eZbz3phY9jzv/ht6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QXXGsw0cMb9RlQYCvHqRizUUShLy1QBAiQsXWYyqpN+22Wx7kAFCIK23uc9FksuOeu4vUMlV6FR8y5vHHdmm7i9PTnfPs/p6PZWJK44fB5ixF2a3FpX/tJ/MDmJOMPNPXJTESikUeKAEDVgH0ohmWy+j2OloExRzBLLiIEhvA6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1T7fwc1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495A2C433F1;
	Mon, 22 Jan 2024 21:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705958149;
	bh=+Sd1NCS7PJbxgZHkZkL/NbxvN4eZbz3phY9jzv/ht6M=;
	h=From:To:Cc:Subject:Date:From;
	b=o1T7fwc1V5q7RmfJRbstGjV5dsI6E/QdKShN042B+tXDRre9tnqA+ZuJfPs+J2SFm
	 iCGqUKlYAMnRYK2K2tD8qYZSSNlMkusWT109maWcxydt5c9Fef/9/7EsNmKeFlYK2X
	 AUleTEbReQs8WAhNUKP56QD7yNYehvF1OpvquuxBE5Hr6NSVmwPIlEypsYFaAoEpkT
	 3Vr7duejQVZY6IGbfDGEiN5gRTc3EzDOHIYoOTf/4dLrAQaE9fAkWt6+fyGpf2OftS
	 0Piu6niMK4yYNzDfs/n3s+kcGfRgAaL7oNg1aJIs3ofawGbH2iUyOQGWU2ocr+GCWK
	 o+p89ipoWno9g==
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Drop my "+dt" sub-address
Date: Mon, 22 Jan 2024 15:15:26 -0600
Message-ID: <20240122211528.1719994-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I never really implemented any filtering on the "+dt" sub-address, so
drop it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml       | 2 +-
 Documentation/devicetree/bindings/i2c/i2c-pxa.yaml          | 2 +-
 Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml       | 2 +-
 Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml | 2 +-
 MAINTAINERS                                                 | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
index 9cf6137dd524..65155bb701a9 100644
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
@@ -9,7 +9,7 @@ title: Marvell PXA GPIO controller
 maintainers:
   - Linus Walleij <linus.walleij@linaro.org>
   - Bartosz Golaszewski <bgolaszewski@baylibre.com>
-  - Rob Herring <robh+dt@kernel.org>
+  - Rob Herring <robh@kernel.org>
 
 allOf:
   - if:
diff --git a/Documentation/devicetree/bindings/i2c/i2c-pxa.yaml b/Documentation/devicetree/bindings/i2c/i2c-pxa.yaml
index 31386a8d7684..e89ee361741e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-pxa.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-pxa.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Marvell MMP I2C controller
 
 maintainers:
-  - Rob Herring <robh+dt@kernel.org>
+  - Rob Herring <robh@kernel.org>
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
diff --git a/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
index a16c355dcd11..fcf52d2cac9e 100644
--- a/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
@@ -12,7 +12,7 @@ allOf:
 maintainers:
   - Alessandro Zummo <a.zummo@towertech.it>
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
-  - Rob Herring <robh+dt@kernel.org>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml
index 1ee4aab695d3..fe6bc4173789 100644
--- a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml
@@ -9,7 +9,7 @@ title: Marvell MMP Timer
 maintainers:
   - Daniel Lezcano <daniel.lezcano@linaro.org>
   - Thomas Gleixner <tglx@linutronix.de>
-  - Rob Herring <robh+dt@kernel.org>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   $nodename:
diff --git a/MAINTAINERS b/MAINTAINERS
index eda745c0f92a..42b43337c266 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16358,7 +16358,7 @@ S:	Supported
 F:	drivers/infiniband/ulp/opa_vnic
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE
-M:	Rob Herring <robh+dt@kernel.org>
+M:	Rob Herring <robh@kernel.org>
 L:	devicetree@vger.kernel.org
 S:	Maintained
 W:	http://www.devicetree.org/
@@ -16374,7 +16374,7 @@ K:	of_overlay_fdt_apply
 K:	of_overlay_remove
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
-M:	Rob Herring <robh+dt@kernel.org>
+M:	Rob Herring <robh@kernel.org>
 M:	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
 M:	Conor Dooley <conor+dt@kernel.org>
 L:	devicetree@vger.kernel.org
-- 
2.43.0



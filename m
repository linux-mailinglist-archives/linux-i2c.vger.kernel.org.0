Return-Path: <linux-i2c+bounces-10685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D2AA487C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 12:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B479188B04B
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 10:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3EE248F44;
	Wed, 30 Apr 2025 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIA4Qqn0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FF92367A6;
	Wed, 30 Apr 2025 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009120; cv=none; b=OUGu3d1DUQTRYk0vWeMtGNA7idkhAVrD21C1ouhmgZQ3533NvSW/EFvF6KGi4OSSPZJiSuym+fyZMdto0P6AYA4/CnVUckdfPWv+mx+97EObAkSwe3gtxS5/p5tIdVzdPya7ek1Lke9RocSah6DotUH+aud13vDrCGIcfgmsYF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009120; c=relaxed/simple;
	bh=qxwCK+TKSFOdpqEKu97fiXM9g32n+PW28mqYHuBGsDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vh4omwHU6HnGN4/QOBqUTY74lny0709kF35N4SNfLbGa7xxE7Ur/0BAb2y4JzVo8AgfFgEswBV+5mPWfO4/RkQ5nKmFj2vKRs7xlU+yYXGdXZRvL+9/Sn2D9oXGVXAQcm/3DTJoUn0IN+GWfcjkzjb9Z6CQdtOV5SzH9y5YdJiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIA4Qqn0; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736a7e126c7so6513946b3a.3;
        Wed, 30 Apr 2025 03:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746009117; x=1746613917; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQrplKuznos3CKU7xsOCXM8cn9nAbF8UQ/A3fpprKKY=;
        b=GIA4Qqn0cTDIlVYWf2ck+vdbOU9GTEFN/wOkd5c3FpwfhzScUJFR1zqWzFHTMVdoZf
         tYLqfytw+n3s97bPkRALlZtVGvqpFM4jHysWr4rcdwhQL0OJxDYJ7Tte0+U6n/OGMjTQ
         dgvoZO6JGXsNuA+pLiFLUc5d4VimWZaE7YQevBWGWCSnds1qWJ21NvtqBuoN6VtKrLBE
         MM0M/sK17ahEoEt3gC67Av2NwoSWmcVaiS8AzhDeU2RqiqXGAN0H8ZkQqOKUL0K0ej23
         9068J1g79rqJt69pZi9Pm/caabXEPcLNTTEDvCddo1WhqLDF0asBZAkMqqUVv916KcP2
         nHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009117; x=1746613917;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQrplKuznos3CKU7xsOCXM8cn9nAbF8UQ/A3fpprKKY=;
        b=PEkvGRGeJo5yNr4UdaXzrlKXOKMmyk97eMn5qkbkpg9XrrsdP35pNLLilFZEtnmeXe
         ggr3mlWcDFImTaTioMRkzQ2xTSnIP2G6NDxl5+1PsUlq5aQeZzeHflP0dVhmgas0DO5X
         2oJ0Fw8SgrnhMp3tUDfxCnMv7fUnqNz8KJm4QUwSt9fg7BVHDElmcm+6RhCzNab0+7+p
         tyapPtSmLsls90YI68NDFtAqPYPIZyWiSrfKlSZ8nioluu3lj1g8OytnktZKXDl2oI7h
         5RAmnACUbgWAWwTmK3qwQBoR2vliw8YIEV1LfqBrFqlDPR48MZf/YsBPHGgoqP3iUDnY
         7TMA==
X-Forwarded-Encrypted: i=1; AJvYcCVKpmst3FFFXLuct1MxKchciTjwdDCw0KfH86xWmBiuG/sPlrr+pPsJFbL19522LKeTuqSQuXqBVDNP@vger.kernel.org, AJvYcCWBJMY56vhTiNNg5aOP3mduGjllj+p4VGnNencgjRKyaTdHqLA/rrQG0sOosvcODRpjQN9DSfF4Vdb2@vger.kernel.org, AJvYcCWIUj1sc+IRUMDQ5ajzjxNO56QVVyJ/vmcmomuk+eMytEaiDjOHcEZG724mdQi9IFJMgmNmGxTqrGO23Ynu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvb6akyrZfXXNVDNSGLz2CyB+L4K7ufQLaIHz9f6LVqJbqxiDh
	EXc9DAOaYz4kE5/CzilMMx0NuqBPb72IpuRx+miBfmsK/wLpsfl9
X-Gm-Gg: ASbGnct5aBOcdsepHV3KN/05jzU6/vjRTLUtLEpmYPf2ZjMwkkkDU6l09loDNX+h23u
	zh8v/FyMVy3TtYEzjU5ANci0iqTaXe8+fkPifc6BfMNfgxwPlZtUmcT0ACqnxWIW8MmR7me/T9d
	+aUTbpCRRfZQQpKs+4Cai1oiDvEtWf5VypUz05LdlhxRMTilFPaV0YQwkvBlycGZN/a8XJ0MB4w
	fjiAYVxJM6nIZLu+wGr4TfTSiKv6cnjwsHfEywVX9aLey+Twsz/tP+3/Nncn9cDW+1yQokyMxhJ
	z4ONEGvxSqti6pK4uQ05BTa3IzRiB6dZKsWvGoM/UTf4WtQyX0aB4McKpo34l2E=
X-Google-Smtp-Source: AGHT+IHZe0TXYslujCTYOtGtFjRpT6Y7Y076cq9NiJJvVsBDGspddr6Y2NW78t4g4qygnKEUxRNGQw==
X-Received: by 2002:a05:6a21:318b:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-20aa2be02c6mr3127615637.12.1746009117455;
        Wed, 30 Apr 2025 03:31:57 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f7fb7e54sm10432071a12.30.2025.04.30.03.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:31:57 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 30 Apr 2025 14:31:36 +0400
Subject: [PATCH v2] dt-bindings: i2c: i2c-wmt: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAf8EWgC/x3MQQqAIBBA0avErBsYNNG6SrTImmw2FhoRSHdPW
 r7F/wUyJ+EMQ1Mg8S1Zjlih2gaWfY6BUdZqUKQMdZrwvpwhQlELeomrxIDG6956Y0k7CzU8E2/
 y/NNxet8PM1//82QAAAA=
X-Change-ID: 20250430-vt8500-i2c-binding-5b397b570387
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746009111; l=3387;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=qxwCK+TKSFOdpqEKu97fiXM9g32n+PW28mqYHuBGsDs=;
 b=pMd9cRXEoGac6qEgsXthAvZ3Q+fu2//TgoRrNM2QN0jMYGlCBojb9PBLN0Fq/sqk95OLemU0U
 433B6Ghn4mEDtMrlVS0MABfIWYxWTQgeejr5T3U5ZvZsvcEDrC9NFQD
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the WonderMedia I2C controller
as YAML schema, and switch the filename to follow the compatible
string.

The controller only supports two bus speeds (100kHz and 400kHz)
so restrict clock-frequency values accordingly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Added Krzysztof's review tag (thanks Krzysztof)
- Dropped the update to MAINTAINERS for now to reduce merge conflicts
  across different trees
- Split out the i2c binding separately from the big series affecting
  multiple subsystems unnecessarily (thanks Rob)
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-1-f9af689cdfc2@gmail.com/
---
 Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 -----------
 .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-wmt.txt b/Documentation/devicetree/bindings/i2c/i2c-wmt.txt
deleted file mode 100644
index 94a425eaa6c78bc9e3136ae7055b51635baf16ca..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* Wondermedia I2C Controller
-
-Required properties :
-
- - compatible : should be "wm,wm8505-i2c"
- - reg : Offset and length of the register set for the device
- - interrupts : <IRQ> where IRQ is the interrupt number
- - clocks : phandle to the I2C clock source
-
-Optional properties :
-
- - clock-frequency : desired I2C bus clock frequency in Hz.
-	Valid values are 100000 and 400000.
-	Default to 100000 if not specified, or invalid value.
-
-Example :
-
-	i2c_0: i2c@d8280000 {
-		compatible = "wm,wm8505-i2c";
-		reg = <0xd8280000 0x1000>;
-		interrupts = <19>;
-		clocks = <&clki2c0>;
-		clock-frequency = <400000>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml b/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e498ce47b885203fcfe233b946f987abdac6784a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/wm,wm8505-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C Controller on WonderMedia WM8505 and related SoCs
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: wm,wm8505-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    enum: [100000, 400000]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c_0: i2c@d8280000 {
+        compatible = "wm,wm8505-i2c";
+        reg = <0xd8280000 0x1000>;
+        interrupts = <19>;
+        clocks = <&clki2c0>;
+        clock-frequency = <400000>;
+    };

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250430-vt8500-i2c-binding-5b397b570387

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>



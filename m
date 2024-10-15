Return-Path: <linux-i2c+bounces-7376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 852EB99DFB4
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 09:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E739FB22884
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 07:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8401B85CD;
	Tue, 15 Oct 2024 07:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duIoWzsS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA08218A6D9;
	Tue, 15 Oct 2024 07:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728978713; cv=none; b=naaUoeiiIPiCofEO0zJ5ZRiGThJf5Y5yuycm/tutieriB3NuvIoU9gtZqEeEQFAfpo93WKfJJgXCtyLx31RnzXmLRlWdXkjgM9/9K6otS/ThoFuwYjTnjUhY1YhlQRCLS71qi44qQQxNF1ESapNeFsUPJhwTgehSraqoQV0dfIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728978713; c=relaxed/simple;
	bh=OvUG8aM5Cx5Lu+8/LuHh7ebdLsyWwsimuSJoA1uB/q0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HmivR35Y60emgPYV0Wu0nVDYo8D9Py84I2bQF0nBPjBxphAZksbwcmLFlpmb7Of9oQyNoRfwfKfj0HjffUzchRsUWycqqZJJrDPq+hvW885R0x5TcWh3FXrmIsi3R8ccIX3iYi6MDWv3nOwqhHZZBdi74f8i9GUU2/9xNyotvkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duIoWzsS; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so2009408a12.1;
        Tue, 15 Oct 2024 00:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728978711; x=1729583511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjchN8ibWCkaffTyni5BBDsvjIpViEp6ziJMEf6HDJs=;
        b=duIoWzsSpmLvM+s5gzR5nJl6sbXL11xy/e26hNlu/bv/LmbhKfs4Bnq6dVrRVDzvCg
         wbaVVTH9DaR1LrAGBbanYLAK+G75XmH+PW8uo+Fd4PaTVrOaANHpsqJSfuWUmXf05X+F
         TaHjA7xIADrQ+v7KnFSx3Qq78J8csvsqlda/B0Ixw0ScFT2sE+i+X1v9S8EoqHPYHHfn
         R++R8ythgJ1l6wEVRimfp0ccEVxZ1FgQZzTrOkRTFGSWddGn0oFN4AK0eiYbmpSM0nDU
         zXRS+ACwXrNDJYFy5YleX+jJ5hp33So9vapvknIvRMG9hBf6SMD+M5noSSRomMdmtz76
         LG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728978711; x=1729583511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjchN8ibWCkaffTyni5BBDsvjIpViEp6ziJMEf6HDJs=;
        b=DRVPlmPqYG4xGVqmjxxVvw8++clk1Xyqoaa9L0WC/Uq+qi36yIeyFgaaVQfr9b+wfC
         E/YK25M1CGlQNJyw/jAuPkB5ck+TmawSwyaeRyDPOmCdNyxN26nJqC1fZcPvOwkDQLlR
         pxMI/Z5R1Tli66BuuLseWecHr3ynPX90j/PwWdZ32pwAcIongN24Zoz60gnagNn8NoE2
         RoBGVyWW+tQvubT1zp9yUwpG9QsG2X3ApdPutTDR7d5lyd09MsKelaGwRafB9bu7h0pj
         VwPgjOr/GOr+1mqva84ysyIJrh/CPf8H81msmNM36z3r8Ekxshty8N3iql9AZTnOcUV9
         R2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUGTksVrzJy2j4zi/7heTTrT8i911XAiQUgHLyW6xOvLTcyLQAmJWCpjezNlzrzUT92UOJ9a50RPgES@vger.kernel.org, AJvYcCW486qmcMhwjsqKekMtGAAxUI38TNBgHISm08yRSuS19XLSKET0hSneL55wvLZ0LMGoJwjOPLbSVgFMMWb/@vger.kernel.org, AJvYcCXH7uVpt67D4FD145Jg0NNbsSsoTrCXPNcRR9PZDUEsemCxnnRhwf4KGzHEHwRYLyhCKa/nB88n+R61@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9sKpAn0dOaQKuuseC52isk2xvsPVU9FrJHlwhIq0z39dvmvWH
	DAUamr+M0LCiVJcTMoB5TvQB0fMhqvOs0PCy3EqmSeM0ohhJjebB
X-Google-Smtp-Source: AGHT+IEa2gQ+i6rinXmsfFUEvvj4/xTeB7uj+vHnTwJmrQsTTFAIHSDku5ybizleE6AProTgryS/pA==
X-Received: by 2002:a05:6a21:393:b0:1d2:f00e:47bb with SMTP id adf61e73a8af0-1d8bcf3e69fmr20362261637.21.1728978710966;
        Tue, 15 Oct 2024 00:51:50 -0700 (PDT)
Received: from troy-WUJIE14-PRO.. ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774a4243sm682134b3a.131.2024.10.15.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 00:51:50 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Date: Tue, 15 Oct 2024 15:51:33 +0800
Message-Id: <20241015075134.1449458-2-TroyMitchell988@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
References: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
 .../bindings/i2c/spacemit,k1-i2c.yaml         | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 000000000000..c1460ec2b323
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C controller embedded in SpacemiT's K1 SoC
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k1-i2c
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
+    description:
+      Desired I2C bus clock frequency in Hz. As only fast and high-speed
+      modes are supported by hardware, possible values are 100000 and 400000.
+    enum: [100000, 400000]
+    default: 100000
+
+  fifo-disable:
+    type: boolean
+    description:
+      Whether to disable FIFO. If FIFO is turned on, it will be interrupted
+      only when the FIFO depth is reached, which can reduce the frequency
+      of interruption.
+    default: false
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    i2c0: i2c@d4010800 {
+        compatible = "spacemit,k1-i2c";
+        reg = <0x0 0xd4010800 0x0 0x38>;
+        interrupt-parent = <&plic>;
+        interrupts = <36>;
+        clocks = <&ccu 90>;
+        clock-frequency = <100000>;
+    };
+
+...
-- 
2.34.1



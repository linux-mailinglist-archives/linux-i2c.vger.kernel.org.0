Return-Path: <linux-i2c+bounces-8180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07C9D7BB7
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 07:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C56B28229E
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 06:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E962518859A;
	Mon, 25 Nov 2024 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACdNuhpS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB07186E56;
	Mon, 25 Nov 2024 06:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732517426; cv=none; b=MDfXBt5kNbiRM6+pWw0tkckdZ43ofPJqIajcvcMSIOJvJ+vo+fscFshC7CHwsL6sJORFgJIi0sIVDS8XyQFnBGomey0J7QZW1eDmBB6Ue6CQDeoKhY3V6SB9Rtm4ON0WguykxlsEF5CF8q4dTdb2lyxe0S1zU2YaeO1UhQXaViQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732517426; c=relaxed/simple;
	bh=e87esRmAoWNrtsi/aX7kSBiNFc1GTi0GoZ5x7YLN75c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9V6RhEvUEf+FW5rCMg02hjUH8wCSwX6yO0urTSUNup6AiJaMSmm7HQrIFsqSy5Io4ZRiWIKj4twWdf5HhrCjoQdvPXrY8kl7H1Q0Rw1n1/D+Ysyh4+ENck1d5fMDX6/NgzKLMK8Nv6JfcrEEJ1QXkmEH45jz+2mrBPdZ3VSNf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACdNuhpS; arc=none smtp.client-ip=209.85.167.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-3ea5120dd60so17366b6e.1;
        Sun, 24 Nov 2024 22:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732517424; x=1733122224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+kiw5et6X3OJrqRuFrC/N/QNK9E82D2UCKkpTvQsZc=;
        b=ACdNuhpSjW5KwK3xSTpkbmkF2+ox+kUxGQuZua0GHd+TUBQes6Ytz+JmkkF7IktBgV
         dFF/Hyf5SPTdiZmNUJZ9BuuiTQNAZojA1CQET+C44N3U1T/mAXDCx2knCz1ZHqCNMjTw
         c9d8riNoDpVzZOIRHdnoSGBfmgsZKYjuU9kZneSaBCp7o4shB8miFViEFBsF8LyUCHA1
         Da+lvfKmvtnEscNx3UMiMfBAfIT4jXV3R7yA0ZLq7yzMuiuZR+AO+GVF17F39W1QthLl
         wtDMdGTzhjlVMuf2RqKDVrROznsdJlC2QuVeyJFjg7kOGthfhxIeA9nnUTktmnBjcTen
         If1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732517424; x=1733122224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+kiw5et6X3OJrqRuFrC/N/QNK9E82D2UCKkpTvQsZc=;
        b=s1X2dW8kwkU8EyTu4X9UQiU26NlwJFCCNz7eitQWTMNxyVXRG/8z49btRl2oUds/N5
         D1AKN9GA0LEyuKvtLAWJcfG1YUb1KH7bdGYbk7Rt3ih7o3seJyYxTBe9Y8rCGlS+OAcG
         C22WlELlouHmR4qffyS8fwhxxTefJwZwmkLj3oaHojgGBawBYqP1BQaQLaKLuwAV4AdZ
         7kra9ZDSrDWJYwY+cx+a6DBcQ3YUnaAJh1DSoyLbwdevxggetxM9oiW9+sSuZ4V8RnS9
         jl46TGPDNxoRvUTQkVBM5mmjD0sbqdD/iHGIo3qYbpaRUSCQC4WT07bqcluDbohIOmDl
         W3mw==
X-Forwarded-Encrypted: i=1; AJvYcCW+z4E5jeNFcdA6CwEdRVbOXSK7JrPCADcmkdCjWt4slDMvDR+Dbs4m5yZwepp3t904AKqdWLBVQoq+TwXY@vger.kernel.org, AJvYcCXk9afdAW2sh+vlCRHsngUK/Q7i4grGRNAOqDEv57ndMicbT1MiOYfnbaP+qzgpNBesS1LEpqtGcrmB@vger.kernel.org, AJvYcCXqVn0WkBeX6SEyAY0ZpOCaMhaVMHwEfLZAn5O1YKKFpvgiH61Co4DtnvQ4vwz0SeBmVoNxyu3ecHiR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8MB/SX+lfUVDepZyM5lJlZDt3VrV24ovacs/TT7iMGdlpoZm9
	VrWrlnWWWAdiVE/k5V8nVmBYs6bgy6KIs3J92oZCWUDj3N2CNImm
X-Gm-Gg: ASbGncuoSha9lL5K/UY+EEDvWwPd1k9iOlZTaYisePhzZqvBr/cE414NErsIi8lIKDZ
	qAkEhQJO10XM6to23RK9tu5XtP038RLBvlzxhuIx+NnC+I56nbQijQxS+HP1g2avGGkJ/WzR859
	eAj9vLmxWugwANR4GWrLlHNuYe1mpD6T+0+l2tgDwYh3A7Gs8dKqbDN2aCAEejg7s9it0I6qe2C
	+BiK9fXj/F8hWURGFbKbdcfIf4FTr/jcK8kb5UWo/7SV33CFiIyA3gXPg==
X-Google-Smtp-Source: AGHT+IFEVtYNWuGd73SybeJmq8dEfY7cG1hR4q8ftrrbW4Zpz8Yz3pGDaUpXl7xQMBltjnN+vKhpVg==
X-Received: by 2002:a05:6808:2286:b0:3e5:c7dc:ac60 with SMTP id 5614622812f47-3e915a58bcfmr10516155b6e.43.1732517424045;
        Sun, 24 Nov 2024 22:50:24 -0800 (PST)
Received: from [127.0.1.1] ([106.114.39.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454b41sm5649602b3a.32.2024.11.24.22.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 22:50:23 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Date: Mon, 25 Nov 2024 14:49:53 +0800
Subject: [PATCH v4 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-k1-i2c-master-v4-1-0f3d5886336b@gmail.com>
References: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
In-Reply-To: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732517408; l=1763;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=JIuSz4oWKf67hQAMbb92x53roAkcEc4sGNGVD/6wgRE=;
 b=7AKnC3n/NXKIor0CDHlsIleNql0hJw+/Ns+b9KSuHQuK1+3QSdyJGtBWAtWi30moAUJUmYYl4
 7nGMO7/GdFfALIGz4PeEVqHmek19UCldsvMHBl2RjRCXS+lSJrwhJXe
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

From: Troy Mitchell <troymitchell988@gmail.com>

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 000000000000..e7cc62f39e28
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,53 @@
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
+    description: |
+      K1 support three different modes which running different frequencies
+      standard speed mode: up to 100000 (100Hz)
+      fast speed mode    : up to 400000 (400Hz)
+      high speed mode    : up to 3300000 (3.3Mhz)
+    default: 400000
+    maximum: 3300000
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
+    i2c@d4010800 {
+        compatible = "spacemit,k1-i2c";
+        reg = <0xd4010800 0x38>;
+        interrupt-parent = <&plic>;
+        interrupts = <36>;
+        clocks = <&ccu 90>;
+        clock-frequency = <100000>;
+    };
+
+...

-- 
2.34.1



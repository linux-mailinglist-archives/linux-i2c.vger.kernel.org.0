Return-Path: <linux-i2c+bounces-7611-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 117299B2444
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 06:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADDC5B2205B
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 05:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A89018D649;
	Mon, 28 Oct 2024 05:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LytCWwNY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965E018D63A;
	Mon, 28 Oct 2024 05:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730093560; cv=none; b=RLn/tNUs0nXcO4kzkDihIAfriiF9RlFqeF/2VS57tJoSJuSejvNkFc0Yp9h8/Ftytw86oqw1G4locFOMHuIMAxYQtzfJnUeYYN1Myv733zCACKt8Xl6SMyswwTa4PFvSZ4ML10CbJSlUqlt6WXJmE7FGfd267I8GS+mKyTSzW2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730093560; c=relaxed/simple;
	bh=9ODG9hyXhdmAAGRH9ua3WZ/J3tbFi/hoEZZb8ZSdZoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yd78JlO7L3gqR9XW1dkQyqdHorX/p2H8ezTl7oXv7rDcdTquPgMY2U37Z9Py+krV4HUd4rLgIENnPbq6CWaCOEewt62kIj1IPEYmqqRRkm5fZJ5wVscz00LJcmotoTeWeyiBE/IaMuRZnyRzYrzSgrbbVzVDDXXrT3gY/RKTfTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LytCWwNY; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-20cf6eea3c0so29869975ad.0;
        Sun, 27 Oct 2024 22:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730093558; x=1730698358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Rxzu8/nDrEhPkjYLwk7/lZitCFsLtWr9y8ItsfrPD0=;
        b=LytCWwNYDJ7JrOb61Ks3NUrTqz8Qd2zPzxgXasJMS2P1AdwSE4dGmRle/Cs9yJqplV
         AlIc0ALxRWxG/aCIh2JZX31O82cgcc72wWhXA/PkRIl4Px2zY73EL1nVBTxIXlf4le9w
         eHVpFZRg0eTpeFpqwA9aeGgA7k5dJMRBIXUlvpbwNORlWIFF57sO8PsZAPgYsMV7fIoR
         Vu64F7TT2lyeHUauJjT+eK5sh4Hrr+S4QIId6rs9gjGN1Gji5HLJNWtQ6Dbwcgg8yb+n
         osQb2be+BxBpC0O9t+ez6GDhgTnzJZ9Muzv508aiiNjuZD9hLIc2KY+g0lhLz5yiKTfj
         Q1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730093558; x=1730698358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rxzu8/nDrEhPkjYLwk7/lZitCFsLtWr9y8ItsfrPD0=;
        b=qBx46MWzNhq1si35OX3Rx1JVKdbo2252T3NIKZnZgTuxc9afkkhwVL/t0UexGp7wXl
         jigDMQ6Q/LC2kFTbUc6Wi0mIGy76svMGxHWjAeAgKf7yinG4Ciux6qK9VBgqLmiA/xNk
         6XWhvnTac4JFvHCxaAU6tzWT763H7xX7I4nfBhrTWQQ05klssXgGxlE2NOUWcTeK1Bns
         A07za949yFm58dIKWvJYnQz87xBmKEpy4ROjP+LL5izHdUrjtMPwBg4VZgP5cg8efW1i
         +u3QdW9H2IpP2DW5Svo3d6vEqC3aD+qJ2T0gnXV/6A9/WFxsdXhL+c+9P6wKoBtz80QN
         32dA==
X-Forwarded-Encrypted: i=1; AJvYcCVnOstgP7f/1NTHfgE5H1G1MT9Z4QrMvc1VfeacCNUDYW34PSC4XK6Ov7OXg4UCHa+q890gLZgYBfRiXbLp@vger.kernel.org, AJvYcCW7ZwlYB3oPtrEiN+QrIFWvCoDLFkGQeIaREp2zW3fZoubCEOBIHOjb4k8PyLFhX0guEvqKvBeMGRTR@vger.kernel.org, AJvYcCWSHIafo1ou/UM+27MknjodyylnbUKWBG+xlAAbzmnZRbaQifD6y4vc35U2K6BnkXJMiJ9M0qMxhA8z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/wnAv9qWJD7DP+19noQ/EA3U4QNh7RztDtPASdA6gh0H7OoQ1
	kdO7QSHV6/OqiZ1gKKrpj0uIqa7ehGW6bGNOMEX7xbJhZcYDua8F
X-Google-Smtp-Source: AGHT+IE617UFyReq24qO6TxPn5hfQbe0B4rWfputWH0r22erL33CcMpWVuxE+z7NOwutSFUjIDEE5A==
X-Received: by 2002:a17:903:11cd:b0:20c:f0dd:c408 with SMTP id d9443c01a7336-210c6897f24mr90859605ad.20.1730093557918;
        Sun, 27 Oct 2024 22:32:37 -0700 (PDT)
Received: from troy-WUJIE14-PRO.tailc1d423.ts.net ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e941sm43216475ad.204.2024.10.27.22.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 22:32:37 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Date: Mon, 28 Oct 2024 13:32:19 +0800
Message-Id: <20241028053220.346283-2-TroyMitchell988@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028053220.346283-1-TroyMitchell988@gmail.com>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
 .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 000000000000..57af66f494e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,51 @@
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
+    maxItems: 2
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



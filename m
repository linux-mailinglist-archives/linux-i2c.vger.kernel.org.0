Return-Path: <linux-i2c+bounces-10407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3251A8B384
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6DAB7A602F
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1322F238147;
	Wed, 16 Apr 2025 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGW8uqBL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215C42376FC;
	Wed, 16 Apr 2025 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791744; cv=none; b=FY55ivjoCFS6ljmXbyjtkGRW4flnOf0rqyTRkZq6MRturbIjHim+QuIbSDM7VX8vADzzAf+EWFskJ765ejoWRBxEce0f0o/L03S92rDnyuEdxhadw1PuLfoyfuPRmKivaEqPDpiARzzekFTFcsVGCK1duP38TBzpaZqY/zCyfic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791744; c=relaxed/simple;
	bh=NEgiFvWhcClrHUAyWpK+jPl/V0oOpyceciVeAKHrSJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aR4hYx2lw/pvon0OLUWlfid4dJUZxzDiiPbHrY8GeYiLcjRO7FJ9lWkpEB3Z9pehKfmw9Lnlxu7KILRT2c+AZ/vKAFVeruYlyRQB72tMDRrJsE+WDsXW+Ho9XuGwKOreH+uubcvUqEM254bZ7YcDNOvjomv8L4Iu7NqdZkAg1aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGW8uqBL; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3105ef2a071so37808891fa.1;
        Wed, 16 Apr 2025 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791741; x=1745396541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu8Ryw3YuNDxmBnJufDgGEqJYEKRQGz5OjjQfRZxK4A=;
        b=ZGW8uqBL+b7DZ4Y7+Wzkis5rjmX8/vWSF5Ix6vN9sFPhOfbEPuu+hTZxktyKTIWuE5
         9GmsoiQk6C5RYj5gdodPV9ioxGuRt8bDv5K1vQUi3OxyHEtoTUOI2gwj/+0RYDCaMmdk
         RHGdpFHhBYbMDes48jxzPmjBm7tJ/qbpkLJkJ+I7e/9vvdJ/xq6BcbpZngcHBtEzpyrp
         5+QNMcZqG/tGL0Pl4nqWBcDLVvHtfoAHpxe0t5BEfBv5rDl97Z8n1jXM6vxBr5arUmSt
         9r3DJ73mA2+rBc2E3T4EYonyQ53GO4bi2q5m25eeSy/nuRWyCa73Fjp6Xg78IjkfbEvk
         99/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791741; x=1745396541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tu8Ryw3YuNDxmBnJufDgGEqJYEKRQGz5OjjQfRZxK4A=;
        b=GyQykgrz5LeJ080v1UJR3Z49c8wMCQpPuEevDfqU9xdnLOKqHiTNaR3b1XzDdRsfvx
         vqqrQJlFsgtd4WYY6IxeEL4O4aCJyAXCMcqyyMlJ05uyM6zmiMEVWfqsA+LImIGV0B0U
         6200sfp+muqL0zCU4SiqH82tGtLk4ZJ5nntvv4oHJItLBhSPRsFszR/ivXegOnCeFt5U
         DARHPkiB9GZFiLlgRKHzIxgcR1yY9LSAWzP5rzjDicB818TjiqgCVJxZtRO9UZqObT1+
         PATatH7/n811FEdvsKClSfdBEJGxOdYY/TdCuMEbLxAsVC+7SN/OiR7HdBSa1xZSoXx4
         ZTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3zQzbZXgUODIlEwTmlg5mZXVJ71o6vzUVzYKXROJmrzIFjTvixgOaxst8WQyBfitZnOIBDYEqeSel@vger.kernel.org, AJvYcCUERTwmtpq0DuZY4RZaVz9QN7rzU1VwwZBWJWo3lCLCLNVZM5m0/imB4g99av4fkRCt9EiKq2Lf97RR@vger.kernel.org, AJvYcCVHaB/TGGmEzIW+ChZraJljqLCInwb++5PhsXP5r/rnZrxJqDfnLXztK9AaDMGfmL0o+MD0uea/hb7VsFaj@vger.kernel.org, AJvYcCWpTjaj8LkOIOROKgIz5dgBDBk+WW3DlH7MixTfkdBVVK/HGIz6uQNeqfCdkz8siWdM7RSE5gb0@vger.kernel.org, AJvYcCX+NeEOv+ozX6S3VMrCi76W4EB06DO5TC1tibtDC8FndKCgpSET+mo4Y1gjWZ0O4sWV5dYkmhhZLbWM@vger.kernel.org, AJvYcCXLt1fwAgqWRTr0Fv/jNmGcdD2Zi6q1T/S7/WkF9Rn69+7W4JuN5eLX24dcfybS/5wDT4BJfVvkOMef@vger.kernel.org
X-Gm-Message-State: AOJu0YwJK/KC7u6WnJ87IzS68Y8JaLgLFbHeRPBGgVRBMZKhb/tLOaj3
	RgihEtFMfcLMn0TQZZQoqTBJWEyXAvJG/dEN0MQw2dwBk4cDT+PO
X-Gm-Gg: ASbGncu341gNUGk48JaJoCMnMOPehWiffJQgfcImZ12t8EySMhNUJhFaANFLS7Fj+Bi
	OfDXhcKCuwDuy9pBvfm/vKpEDUxEYGKr3Z7Jt1OB5ldcpdoeNOURohmrIsbR3/FdGXWYMrgqQNC
	L83lmSAJH+Y53JvZ1An1ZsS4+EEVOsF/Rk37loi5uPz706Vguo1o0+jmsXPL90ERQEa9CLAV3rU
	nqGgxp6JL62evN+9UsLiaTnXa33KcaSAzhAblBL8NG/aQw6nputk7k83nLMiLRoWsSpawORWT5v
	rGBwAkce5WBf5XsmMJFqaIDGWFKy7Y/0W4tBmHEq5oqu/EzSNkPHID3ai9Z8w8k=
X-Google-Smtp-Source: AGHT+IHGUCCMTjiwduF1l16OGT1xgbCzTtLXTitsRrPiIhyWpHVe+nbbegT0AxyBsUBlbVMQdAVQtQ==
X-Received: by 2002:a05:651c:12c6:b0:30c:160b:c75f with SMTP id 38308e7fff4ca-3107f73ba71mr3073341fa.36.1744791741104;
        Wed, 16 Apr 2025 01:22:21 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:20 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:32 +0400
Subject: [PATCH 07/13] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=1573;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=NEgiFvWhcClrHUAyWpK+jPl/V0oOpyceciVeAKHrSJM=;
 b=/QDgTVjmq8k6FV9L7Bv/m+ASL1PEmLHj1+mDPOjiIIWKA2aWi0U9t1ipMVf6sPm16AepLyyra
 1X+QUaaPHSeB+YM2oEbhgh1MJ4kR1Zig+IqJq8gzkI6B3hN1MBbx5ob
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

APC Rock is a development board based on WonderMedia WM8950 SoC
released around 2013. Paper is the same as Rock but lacking a
VGA port and shipped with a recycled cardboard case.

While at that, put myself as the maintainer, given that Tony is
unavailable as of lately.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/arm/vt8500.yaml | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..1906a8843b0ceebe31eebc3b429560dd0d9cea6a 100644
--- a/Documentation/devicetree/bindings/arm/vt8500.yaml
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -7,19 +7,22 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: VIA/Wondermedia VT8500 Platforms
 
 maintainers:
-  - Tony Prisk <linux@prisktech.co.nz>
+  - Alexey Charkov <alchark@gmail.com>
 description: test
 
 properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - via,vt8500
-          - wm,wm8505
-          - wm,wm8650
-          - wm,wm8750
-          - wm,wm8850
+    oneOf:
+      - const: via,vt8500
+      - const: wm,wm8505
+      - const: wm,wm8650
+      - const: wm,wm8750
+      - const: wm,wm8850
+      - description: VIA APC Rock and Paper boards
+        items:
+          - const: via,apc-rock
+          - const: wm,wm8950
 
 additionalProperties: true

-- 
2.49.0



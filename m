Return-Path: <linux-i2c+bounces-11578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 219B8AE800B
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 12:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F987165F3D
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 10:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B912BF009;
	Wed, 25 Jun 2025 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+uY0j6d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A622D878E;
	Wed, 25 Jun 2025 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848339; cv=none; b=XzNTEFhJePI87N90JCuI2N2BN4gsdSux7pHQeXrHWtxDpxdasYa9CqCNN+MRDpffWuGtnspFMvTMHL5qhMxxz7QiCF7nDtCcY6Sf4ElGUjjXK9WrwQLWMnM9RwBjjOVi4IOB6sbwPJDP1tXVbiXp9y/lurVyZIiB9e7EpyUkhVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848339; c=relaxed/simple;
	bh=AMQMqGRLVFc3MWaZ9o+vWalE72Y2E0gYeWtoU8X5MHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tjk3HOMmqK6Yvms23U0rlOFn3Nm+8pp1Hmyd4Rswy5bLo1ThQXTV6UXr5zz/6zC2KgqZEKue00wUxWFjPQAHxPwFPqocJIqhFxgMwLNmq080i2T+BB0Eiqt71bjy093obKmDOkHIrLcCMqkrVB9mk/PPdEHfMAY4ZUIXi63QEys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+uY0j6d; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ce671a08so40819105e9.3;
        Wed, 25 Jun 2025 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750848336; x=1751453136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R8+bOTEWy5YxtYElYy2Zc7X/g0/YWMhUjq6/DyjCsc=;
        b=O+uY0j6dLvgY5xFlAuu5zAOwa6a3ueQumEMy7R1hvr/61xD46t03x5c3YG62jTh77k
         ao2+8dg46zk8KtmRahbuAWrRi1VxKH8WKmtaQEqz5Na7Uh0Z6u0i+IAA3ArhXs2lpWvn
         iu9QPap/uJ0/Pcwpa5i2mU0cwaTgIGBtkr9ssm/b3BfQRX67u3/HomBkyzsC+aYXihip
         YgBnUiIxtKCQ1ktN/X5uOMVeTD5S0Q2op/7nmt2mV4ZxtPyWJFltwlHvpD2nP0rWu5/5
         +dqt0GQff4AVclEJplzChNnv4E9DH7H5mZX0GX01emqAlR9ASmlfAD40IHh3XKV1LLBa
         w53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848336; x=1751453136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6R8+bOTEWy5YxtYElYy2Zc7X/g0/YWMhUjq6/DyjCsc=;
        b=paMVBcHO7CFdxsO7NYkdGa7/0JANrCUnPziNB/JwlboGvmxq3ebVI6zyukzREAmoev
         AdWFqGkB/N8cP+b8PgTllsGBvbIfcD93xd8s5iLiXwKExl0Ff38fxjBoeabbTnq9+8wU
         hT6BUO7SkiAEgGCwFz22UG9IJTyAbxybkQE8wrhLkWJx77XZfURAznqt7FYBRJqz6qKH
         cMPXfYJiDsnx7X5GRzch88bYnVBSSfTTqg2zEBYfaW596LQnXknnOKPWC0X3SWaCWN97
         W3XwESQyqb0kDvAnqhX9rRt3jUetPs2rRvCCcCSCi/hkKHgu6SkLJY/AXYcXlPVLfSLQ
         VL3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLao/+fn+JAW5+XwmImUBKsb2s7DFKQvOrxG3GAzRHHGQ8zgbhsjC/Ek8jr2izj8DvrQXGmqokR1vw@vger.kernel.org, AJvYcCW03eQWLobut6MLVwqpT2qu7Rb1ObFUFZnQCjf9U77V2eiaYEu6l30FyKo1ws9BJg+wdsLbXgGZIkOvC9y2@vger.kernel.org, AJvYcCWk57EJa5miW26fyUWDU8qip/SVdTTwWrq5EowIrKFt+bOhZL21iDJ3p6G/8xszGJF7L7CciAWCyzSt@vger.kernel.org
X-Gm-Message-State: AOJu0YzqBv8gdKRyBA7RkgwS4lLyK05MIo/Woy21e168xYwbE7My2JCz
	e5E+XImOJ+BKPm910Gdm8VAMJr/u/9Wi617Z6aw+jzbnHNMbr7i4kK0x
X-Gm-Gg: ASbGncuHDgIrREjSw+0An4gasVygGHZTChOiapoCRAJBZgOLbaxSDYO0N7M+KAZV/1I
	glqPwz3HvnhfkqnRikV4iovFCChj0YofK/5IDcxwqvP1H/JUq2faWX8un/x+ltFvcXz1rtSUKO8
	KVE2gWcf+U5J2tarVRDyVFWB/fqHRNY9pjFmVFM+m2ofkS2icRSCggzPJwIbHRi/4xHYP7yL2MH
	cjEUf1iejqSJ0si4iewNhu3ebM4Id7qP6z2+u1Nn2rGWp/AsjwwBgtmNZLa0tGe54BUTDyLNrmK
	GRzwRjrYwtTP+n3YIHSaL3OMw8am61Xn7rVCosyc24v2UHoQnwKi5cM64nsWxN+QXOq2XVkOioD
	gZjNGV3202qf6O8BQamy2sVvfRLMTO8M=
X-Google-Smtp-Source: AGHT+IHnh11KMF1ACJUkSNAiP6Pqn7sEq+GdxqFBcNnEYMr1D9nO2CW3Od7c0/VYjjfFJA/dql60yA==
X-Received: by 2002:a05:600c:a407:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-45382a1d307mr17640235e9.9.1750848336094;
        Wed, 25 Jun 2025 03:45:36 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm16036175e9.3.2025.06.25.03.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:45:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/5] dt-bindings: i2c: renesas,riic: Document RZ/T2H and RZ/N2H support
Date: Wed, 25 Jun 2025 11:45:23 +0100
Message-ID: <20250625104526.101004-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625104526.101004-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625104526.101004-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the I2C Bus Interface (RIIC) found on the Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.

The RIIC IP on these parts is similar to that on RZ/V2H(P) but supports
only four interrupts (including a combined error/event), lacks FM+ mode,
and does not require reset. Introduce a new compatible string
`renesas,riic-r9a09g077` for RZ/T2H and use it as a fallback for RZ/N2H.

Unlike earlier SoCs that use eight distinct interrupts, the RZ/T2H uses
only four. Update the binding schema to reflect this interrupt layout
and skip the `resets` property check, as it is not required on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- Squashed documenting RZ/N2H into same patch
- Updated commit messages
- Collected Reviewed-by tag from Geert
- Restored Ack and Reviews

v2->v3:
- Replaced Transmit Error -> `Transfer Error`
- Fixed the order of interrupts in the DT binding
  documentation to match the HW manual.

v1-> v2:
- Listed the interrupts in the order as mentioned in the
  HW manual.
- Renamed the interrupt names to match the HW manual.
- Added Acked-by and Reviewed-by tags.
---
 .../devicetree/bindings/i2c/renesas,riic.yaml | 75 ++++++++++++++-----
 1 file changed, 56 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index bfcc400655dc..6876eade431b 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -29,32 +29,50 @@ properties:
               - renesas,riic-r9a09g056   # RZ/V2N
           - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
-      - const: renesas,riic-r9a09g057   # RZ/V2H(P)
+      - enum:
+          - renesas,riic-r9a09g057   # RZ/V2H(P)
+          - renesas,riic-r9a09g077   # RZ/T2H
+
+      - items:
+          - const: renesas,riic-r9a09g087  # RZ/N2H
+          - const: renesas,riic-r9a09g077  # RZ/T2H
 
   reg:
     maxItems: 1
 
   interrupts:
-    items:
-      - description: Transmit End Interrupt
-      - description: Receive Data Full Interrupt
-      - description: Transmit Data Empty Interrupt
-      - description: Stop Condition Detection Interrupt
-      - description: Start Condition Detection Interrupt
-      - description: NACK Reception Interrupt
-      - description: Arbitration-Lost Interrupt
-      - description: Timeout Interrupt
+    oneOf:
+      - items:
+          - description: Transmit End Interrupt
+          - description: Receive Data Full Interrupt
+          - description: Transmit Data Empty Interrupt
+          - description: Stop Condition Detection Interrupt
+          - description: Start Condition Detection Interrupt
+          - description: NACK Reception Interrupt
+          - description: Arbitration-Lost Interrupt
+          - description: Timeout Interrupt
+      - items:
+          - description: Transfer Error Or Event Generation
+          - description: Receive Data Full Interrupt
+          - description: Transmit Data Empty Interrupt
+          - description: Transmit End Interrupt
 
   interrupt-names:
-    items:
-      - const: tei
-      - const: ri
-      - const: ti
-      - const: spi
-      - const: sti
-      - const: naki
-      - const: ali
-      - const: tmoi
+    oneOf:
+      - items:
+          - const: tei
+          - const: ri
+          - const: ti
+          - const: spi
+          - const: sti
+          - const: naki
+          - const: ali
+          - const: tmoi
+      - items:
+          - const: eei
+          - const: rxi
+          - const: txi
+          - const: tei
 
   clock-frequency:
     description:
@@ -84,6 +102,25 @@ required:
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,riic-r9a09g077
+    then:
+      properties:
+        interrupts:
+          maxItems: 4
+        interrupt-names:
+          maxItems: 4
+        resets: false
+    else:
+      properties:
+        interrupts:
+          minItems: 8
+        interrupt-names:
+          minItems: 8
+
   - if:
       properties:
         compatible:
-- 
2.49.0



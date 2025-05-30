Return-Path: <linux-i2c+bounces-11168-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B746AC9198
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA4551C0602C
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A571B23507E;
	Fri, 30 May 2025 14:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgqjkrFu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2C123504B;
	Fri, 30 May 2025 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615511; cv=none; b=WagKe3kF8Z54Wwbo+HFzjsFKWjDq5vnzgUBvJuE5X2YmhAoxLJhLW6bS9EtqA1QM9ImFc3ERY2cdTh4KqfFWvI5PWdJL01HwZl4A2Ust3+OhYDA4GESIlto3Oy6lcuTnAcApV2GlAedf7D8BF7rwi87S4ho4d3uHYNiCwzfOUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615511; c=relaxed/simple;
	bh=FIBm655bonEA44MC0awq+bzRqP7YKv0TIjt9in0A7Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeLs7cNsr8CrGUyXWSRtj/fbLuBe1hgXHGfkXe1hkXvCfOLU0rd6rE1oT2ZBARG4pla0asTyzvwRwpqwUBZaNlQJK0xYOnC4ER9ZGRtXFv5CIKvjeLVR/evz4LCIIXMpipWy+2NvYkr4CszMhDtVvRx5+kKK2tuQIzooK+IkG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgqjkrFu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450caff6336so12215665e9.3;
        Fri, 30 May 2025 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748615508; x=1749220308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcAtfLH2+z1vqUyH/31sbbgRod7wzNVVCnmje1nC+W4=;
        b=CgqjkrFuVR/ZIKuanbLz2HN7xQEcmT+L/Sl/1rGAL+WcyALxgQdnLVKC8lkc1gaqHn
         BrikP+c2D5B4iJtg6U9jFbZaQ90mP1LSgip1ve7+hpYNbSlmjxP75sUL3e8rAtKwBws4
         K8x0+svt56HFXdHaZelhM7TeerGhQnewBQMfiy3meC7OyaGiUdYQgo+JCQUiNEJTKJYQ
         t/ZyPQhPPHccQMUh5CUQaPoR8y2WzwWpFx/2fy1mGp3TYEsFYyuR+mzzuomcdwfvpMWq
         3hFHvvey5xzvnYHQ+bov4b3+HqPpng9ljUo5tMc/8MqIAvyzD69KgLaLC1hnZo3psM8M
         86EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615508; x=1749220308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcAtfLH2+z1vqUyH/31sbbgRod7wzNVVCnmje1nC+W4=;
        b=KameaZREAyvTm0x7VhPq9jwPG9swmBZv6mOft2TZ8txY64gzjH0Z6nqQygRwKu5YkZ
         pcn7ISH7+nZvR1zIzW9G8KGblQ9aAYLkpiodQnbCp0lRJ3rKHtm8jgZZAN6hyPKvOBJE
         4T37dkN9M19K94sw2IW8+eE7GvQgB3zRcnrSQjANR+0FgPalvhMpN8GB/y8rMgeFC/Od
         XIS5P26JUAGVHaBx6u3MaSZG9cCdz9ItdVifRxWap+LvzoXp+4UXimUh1sQ0xvn5yj/U
         BL0eEPEgo+sgCfQ3flAHk9ldMbxCxIJTHHNH1IzO8lrQfLJr5trPUotjqYi1IhGujgCS
         e4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJoY8DfozNhrkcXogGsLLpExMYPtcRLwBIPfxs/maX/MA8mrB/nEo2D76U4ns/IPLvsnB4MNJJoak7@vger.kernel.org, AJvYcCWT3rQvNrR4VTD9dlGRB+RPq3FpspubTTlvSzHdpv8REAY9eGOizej4SZZRii180dn+kqHAl5+O4hlJ@vger.kernel.org, AJvYcCXlu+mT9NOZUu3oN/Pai5/STRYBc45Hyjf8wFe1j7DGkoWK/bcCzc3enyypnLHo6CngXMFEOd/RxD/XPg91@vger.kernel.org
X-Gm-Message-State: AOJu0YwcIkitt5cYRES0Pn+6vkPpWIaPtxWR4KJ/AJtZgH5yvkmPQs9F
	pAT4/9OHq8FijuHTswY/UjZik9xMFvRPfLc7RrkC2+ctpHHYgxV+wJCG
X-Gm-Gg: ASbGnctysyHDcge5wWebQWgrqvZ3qo8nOkzaloca+d53hHA03w4cOvbNlICzJax/qk5
	mNXclZo1F5xtaliWthDntWVv8CJGNs81XWj2wPuPDuGvD7tRs3p7zB+AmycgEG54ICyQPq3tJOu
	p5pjFlrpOcScUK8D2WnAl8lTpWV1TE4X26TyuDypQvutSrKxaHoOERo+W92W1eK/RDhGradMf+i
	U7Hn9nkOW/Lw1ACTXq+5zMTRkX7LlWF3LP0hTLAAe4sZKhNeVo7Rvo+yfrh6t7GJ0v21iKGcMoO
	9EkohkmMrrviY+1Wnkb+fg9+jIapm1bkdumMDKp/o/6WHtDrwmXiQZCkCX5c/YS8Lx0dYREGiZd
	xlkDJtbqPhA==
X-Google-Smtp-Source: AGHT+IEScmuL/x8MMuNRmAQ8QJkXpvsDp5pW/KMN3MpDMD/fAR5IOsW6YPBqlGIXMTREdWLkD7EMyQ==
X-Received: by 2002:a05:600c:3e83:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-450d8846c1dmr31716415e9.10.1748615507623;
        Fri, 30 May 2025 07:31:47 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f194sm20107445e9.4.2025.05.30.07.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:31:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/6] dt-bindings: i2c: renesas,riic: Document RZ/T2H support
Date: Fri, 30 May 2025 15:31:31 +0100
Message-ID: <20250530143135.366417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the I2C Bus Interface (RIIC) found on the Renesas
RZ/T2H (R9A09G077) SoC. The RIIC IP on this SoC is similar to that on
the RZ/V2H(P) SoC but supports fewer interrupts, lacks FM+ support and
does not require resets. Due to these differences, add a new compatible
string `renesas,riic-r9a09g077` for the RZ/T2H SoC.

Unlike earlier SoCs that use eight distinct interrupts, the RZ/T2H uses
only four, including a combined error/event interrupt. Update the binding
schema to reflect this interrupt layout and skip the `resets` property
check, as it is not required on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/i2c/renesas,riic.yaml | 71 ++++++++++++++-----
 1 file changed, 52 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index bfcc400655dc..d2b11a702be0 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -29,32 +29,46 @@ properties:
               - renesas,riic-r9a09g056   # RZ/V2N
           - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
-      - const: renesas,riic-r9a09g057   # RZ/V2H(P)
+      - enum:
+          - renesas,riic-r9a09g057   # RZ/V2H(P)
+          - renesas,riic-r9a09g077   # RZ/T2H
 
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
+          - description: Transmit End Interrupt
+          - description: Receive Data Full Interrupt
+          - description: Transmit Data Empty Interrupt
+          - description: Transmit error or event Interrupt
 
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
+          - const: tei
+          - const: ri
+          - const: ti
+          - const: eei
 
   clock-frequency:
     description:
@@ -84,6 +98,25 @@ required:
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



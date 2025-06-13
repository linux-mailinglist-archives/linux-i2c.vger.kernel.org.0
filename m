Return-Path: <linux-i2c+bounces-11412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5EAAD8AB6
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5448174AB9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2722E173D;
	Fri, 13 Jun 2025 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSnPnqpH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947A02DECB1;
	Fri, 13 Jun 2025 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814833; cv=none; b=kRDXiBSn6FC8xX1lRJRAzZoZq1cFTxE2QsR1pIKyx3tIjfraNq3xRvQV3pcBnWiDPo9jC+KumKayy2xGrb5/UKjCDg163yXB3duHWk6Iw1aPN3awa1pHUopEbvmrHBAwYYpwoCg4tlOdrmjzSCeSmUPOWtTZPkQB3khWMSLM/P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814833; c=relaxed/simple;
	bh=E5/QJwFnkEDiKFskdYoUT11zuELjhYTmRUwtp9uipRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5v7G6T5XE41+Ytx6vNLXNi95BeYepezqIS5rRzf9lm7m+R8YvCOkpgQTHPdCADbaKLXJZOGvdfroc8iWBCExcEat1UYKyJgTA7ni0P20rL+L/LhWMk6TEVCZfRdN8aE/PVRHZBEAHdfQ2bZq0hxKZccDhY0cqzEH+9JidCLv+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSnPnqpH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a522224582so1151387f8f.3;
        Fri, 13 Jun 2025 04:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749814830; x=1750419630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt/VslxbJKBbGbKK2ghxo72WIHF9Jq0440XXFX31UdI=;
        b=LSnPnqpHMeDUG2xi7sYr6Xo222xYaYyi3deaniuY2OB7kkqwur74YT3SOsCZkOzqmD
         KAw0cDPfdetX8n9c/7mO3kRHled41klXPiyRnfInNsltn0ua9/U8oI/sDJEkVf9FwfL3
         kMs4pasQo2g/KhFOyUIQ5NDPv0dxBwMC22ONThOvFMzCMgoDLcdKrGITuBstdtyNJTvC
         2gUaoa2CLl5GiIGs5AUSuEq0S6GhPih/rJ/qabtR1Eg/ihKUBfpPujH9xXZl1j+f/prg
         SK2iJzzhexlFnHSz0pNJgLTh+eemVaNT16mLWEQqACgT+B5EqNk2Ev5qHne9yHIeSjbH
         v7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814830; x=1750419630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mt/VslxbJKBbGbKK2ghxo72WIHF9Jq0440XXFX31UdI=;
        b=PVn6sJzHNb/BzadA/KVsZmSpYLzHgXEnPG9Ly/5v/17wlouKCxI9UYFnDEBdZUxdlv
         qnUJf9uWWM5OrwJI/cJV+YKu50ukSmWqE4yFLEHGVrqNg1GMPBjSPFsX6NyZMLEpYDS3
         VtZofy9/DOXa/tDLOibegiYD8M2hQyxpTwn3nnVZqiRU945HgZn+bCaKFuL2u82myOOP
         MF1/thXai7r4+QZkYLkTJo5mOPtLd8WTNicFKKt5ugv8tQkQ7FaH8rMKsirPfEHalAzq
         gXqCMj3U6T09DHijqF72Aj3ttpTFhcgjwvv5z5dkymM40b5qJeqctWTBpe0mn7Brrg6g
         9Gaw==
X-Forwarded-Encrypted: i=1; AJvYcCV3WO0CAT1fBL/ZxxPc3Ijt/lUK6cAY8p64aAXZqiYzpJGJ/U3F50NAG9w91yT9080CPwWqH0/7v9NwHYtp@vger.kernel.org, AJvYcCVTjrWmyqWlT8Iib3psLlefOhwFO7uNaowUCADj0JZiu3aACQV7D5Nug9IikL/7mNSB86FO0Zfrv6Bc@vger.kernel.org, AJvYcCXu6GKKsOfB/VxzHbIc/f5E3XmVYDKaa61f7iN3Lm0NzORZnAKu5ecF2nDh71rKxrMFu9TOZnz1+f3O@vger.kernel.org
X-Gm-Message-State: AOJu0YzcrxixNpfGGtA5CJEnQglohTlYVhn9ny3XbVoo24OSNLhROf/l
	LZc5PVTBFruDS/otIQ782x21x747wJ2IJKKDh8wFRnTnR7wyjZSt2oTR
X-Gm-Gg: ASbGncu81xtYJ7zd1LeKkDVXHuzVE7UWDEwOtomJkuMEYlIyoD40Fb+57eFRSJ+ezXM
	mLEW5n5GJ7LU2TH24WyMCdsq1JeUVyAxCFKxyvWhBsoa75smevzZpcglZLCvMhHQe1ixUPg0qEi
	Yl/Oavf2+w6qV6vURI+HLxPiKVsGZQa9usmQ6UxbaY1qcie0mWC/+JLs0FH72EOlO7kG7U6QxGA
	XDODY/IgUut0UZrqWlNK5u6fTvlAmkd31YL0GIjNahcP1pJFmW0hhKyJzhPys4Mszp6IvqhBaXV
	Nf5jnmbGmLjhRygtAJh1alb6xVXXoJj4AL36kudynajFyPjUCwhMWygRZ3GgslgwHRcOziqzitj
	yore+2KxDSA==
X-Google-Smtp-Source: AGHT+IGo7U6163a7G6LWby7xykYX4Osxf37h9tnE2Fvkk1JFogBG2eVDSWkcuZX7dZP6vOuseEdIow==
X-Received: by 2002:a05:6000:4024:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3a56878040emr1692712f8f.50.1749814829710;
        Fri, 13 Jun 2025 04:40:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm2171519f8f.14.2025.06.13.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:40:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/6] dt-bindings: i2c: renesas,riic: Document RZ/T2H support
Date: Fri, 13 Jun 2025 12:38:35 +0100
Message-ID: <20250613113839.102994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
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
 .../devicetree/bindings/i2c/renesas,riic.yaml | 71 ++++++++++++++-----
 1 file changed, 52 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index bfcc400655dc..86d79e167547 100644
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



Return-Path: <linux-i2c+bounces-11312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E345EAD25E4
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 20:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0BF3B252E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 18:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9397821FF58;
	Mon,  9 Jun 2025 18:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKiryhKV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B5B21D5B6;
	Mon,  9 Jun 2025 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494488; cv=none; b=oTk3VqmcrGqSRKkexGE/cKtpWBq0NGbvcd7OB1w4oUoTfYyzSfYky9Y+7r2llN0ixhfNDzvEQDHPtinx2Gta38nsm/ZWXzsqDbwxj/sjfxvIsIpgD4eqT356sm55HAFiVvaRQ8RGtSRoktOxksZZZq3jBu0dUlVVHPvfM5ZkqcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494488; c=relaxed/simple;
	bh=PTGv1lYzXszMcxAdDcfsqhMRweW0m7q0+Syhwq4IGdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhdQsh90xAQn04I6m/KNJdXR7QbbzekGlGvSikWx3TtvPwe21+WuoG8zlu7sKQUF+tPkSzb851PaXXqoklT1w3Qggy1Z9kNKRYxeu9umf/qYtR3UwI0FiwrtFuRk6WUSKiOBEqhBNdmJjL6890+QMisqDkI561HPQqYEqTL7I2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKiryhKV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a361b8a664so3874878f8f.3;
        Mon, 09 Jun 2025 11:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494485; x=1750099285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/1Jz5FG5czyhh4N2SDMMAkce+pSpEoCK7eOXORETic=;
        b=aKiryhKVw+y/TXCZ3jbQzTerN5f6k0LLnLtA+8QeHhDG+66juL19qgG9o3m0eedw+f
         kCcnaZY+CDEIGJ69NG8CnyxSRnVQYZj/7J2eJLEU+hJM1lqlM4ASb3IT55oyewa+oj0O
         SdGFy2cnKfnGI3lhZ1Lrc8mlKY6rHrAE3YXvTeBpGtaiQTWj1fKXjIB2FCSnyWOEXhcY
         6nvMYKKh7Yd9/wK88NRJrTOXFHLjclLcY3EKh7DYVcmRTllnJxPZEPNN1FJPp/VE9qjN
         5shgpiYRlGk5Tdd6DZK82u2JM/cvX4iIo/6OWVjXWEJWSylchA05AYx1E27HQ6FeCQ3c
         A5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494485; x=1750099285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/1Jz5FG5czyhh4N2SDMMAkce+pSpEoCK7eOXORETic=;
        b=eAOx+vGMERV/DIDXF3/34CemA3TUKRjvpLtdbEFq0b0tKu3Nm2K86G2QcSwts7G7Bk
         Xmsi2BOWYvQG1o/79rHFp5OZuCB+NAD2Q3PScDZOfT+mWR1Oy3hybnY5qa+xdpttWFY1
         xohfP5Nz3HPPn1znPXJ5r6o7bzwjDaJ2DjXzLX/+9tK2z82E9Z+upjkjQCsntNDmv54m
         0jvSDCa7WLCsy8HseR4PtemPDheIBq6xb//8sTr4DcPicBNsXlyMMXsGIF+W+ddxT5OW
         ZrfjOSh8ijdjPmMzr2LlL3A4S6zzpqfZC7QZQqE0xi8OmSdwypBrXgGCokqJZApbTnX0
         8b+A==
X-Forwarded-Encrypted: i=1; AJvYcCUiKEe342HRVp6OkE5JyNI4JZfGXwQFYa+6OPIbp2JWIya33KFR7w7G4QSBWc4r+/7ncbLRh79Qsc+sTePx@vger.kernel.org, AJvYcCVBNGO6Q3w1DttE/asCUzdQrJomzWCPQBE+KoHKdAEG0J6cFjRPZ+PHnAQUxKlKPBO3AsMrYHp14l5X@vger.kernel.org, AJvYcCXNLIJAcYsDtWSRpWLfAt373DxX4dDwQmay/KhqmoGM1VMym3TNCSAlJZHQbpERYQHdoKCkpcdUHwvx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6cn5TT/Dsf/qzR2u+Il4L0JYe1+NmFHClspgMg+mTFphTSiRf
	h6HgGInJZKMEX+61YTElbVijJ8uL8dn6LkKtYdv0MuzHDFV4NSBerA6O
X-Gm-Gg: ASbGncsJ9vuiVrDfz3OBf22Ao40dRu1ARF7T4/u20/WgCrlrJRi/e8Z3loFmb3FU0tr
	xLufBut7UYrF1DbtjnYPdukjR1V3hGHE6jfAHUq5L7JpYe8wv8zRdbe8CHmvv5MqFzm8jHOPzhd
	I/To5Q9jMoIz1xOlsGhQuWiz9o3/DAWFqnGSpNv12SMjTCyW536msH+98iPNTfqXNBf0cb5toz6
	R6Kow1715bOh4LEPUVYJpALSOUIDP/iJOKx06ZLg46cGJuIxG3HxMVlXS8VnEHBpGEosqjFdamN
	6NOA5KDXIuogXNfdazuj2T9FzWAjOy9lMH5exHedNkc6k9q/dirZ0oEYY/n6QVcc/wj3ZrYGuu3
	d+ZBk4H1g
X-Google-Smtp-Source: AGHT+IFYDdlS6rCR0LP0FH2/FEJbntu8PzBKg4IvVEaEWPK+OXSASiTPM4IfSbcImuw71096OoNDPA==
X-Received: by 2002:a05:6000:1ac6:b0:3a4:e629:6518 with SMTP id ffacd0b85a97d-3a53188d673mr12334302f8f.7.1749494484694;
        Mon, 09 Jun 2025 11:41:24 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f04dsm10137865f8f.73.2025.06.09.11.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:41:24 -0700 (PDT)
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
Subject: [PATCH v2 2/6] dt-bindings: i2c: renesas,riic: Document RZ/T2H support
Date: Mon,  9 Jun 2025 19:41:10 +0100
Message-ID: <20250609184114.282732-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1-> v2:
- Listed the interrupts in the order as mentioned in the
  HW manual.
- Renamed the interrupt names to match the HW manual.
- Added Acked-by and Reviewed-by tags.
---
 .../devicetree/bindings/i2c/renesas,riic.yaml | 71 ++++++++++++++-----
 1 file changed, 52 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index bfcc400655dc..412eaa28b077 100644
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
+          - description: Transmit Error Or Event Generation
+          - description: Receive Data Full Interrupt
+          - description: Transmit End Interrupt
+          - description: Transmit Data Empty Interrupt
 
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



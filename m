Return-Path: <linux-i2c+bounces-2406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D60C87FEC2
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 14:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E1EBB25538
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 13:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699E380623;
	Tue, 19 Mar 2024 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcFTI5jU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA045A782;
	Tue, 19 Mar 2024 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854773; cv=none; b=bIbeOMfQoVSGAodXygZ2zKggbPZCkZISufZ/9+kks6PEb60Zq19Rs+isrG84qbyZ+i493i7ojaIJ6Om12lnMxOkIJKST7y+GZn4xKo+K9ov+4CtI8KMykRr3Yy8vlqJInof6yuVV3BUm2ZGsL0j83t49cz09Me2gVKxi5xA6OAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854773; c=relaxed/simple;
	bh=7e+/32ZGJRE3dD0F1XPww+hGuWAU1HS/0WccoYFvM/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pss3rhA/YkOMBNqvJ+BTm7+CsCBrxuNUF6/jtE+mD/+KKwM5nx9I4m025S8Q5GtXARxog7jw/nj+gmbnyCRkkGMZz9sWjbH2zzF418LG3U4XF3wnQ7bshZqRkb1o4jLskvsg/uQU3MSfgXsiDROmQBQlhXnakpV/uXtrWU2U8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcFTI5jU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33d90dfe73cso3123515f8f.0;
        Tue, 19 Mar 2024 06:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710854770; x=1711459570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkcNXtkyI+rBkLviZCF9m56pFBzFTJpY8CjzHj2Bkok=;
        b=ZcFTI5jUrNg0EgTP94HZjN8giYw5qysgEDNhD3dDpkWfGyfnSotN1DKEH+p/Hl/aMN
         6+YOb6hXqUi63t0l0X99rATdJR3atD93dUkbuD/9XpZV25DsYayouYsuGP6yQNq0DHt0
         BxehJwaHAR63sP4iQc5S9keZRgR0XpfrpLSWkkczhAXpzvBpxUxNvDh8b4u9/fwAQrY/
         RrFnORvseD9OamYJwIkjxvf/5DHZQmLhj6trAPI6n5QWQw6ifcPzU51DL7SNdmDCaiUn
         u2VplTnaxJLK/TrFXJXV9V/BcRBWlmGdfJ8WrQQ+rIYIv98/camUDKc/mAWc/MPdnmav
         ATdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854770; x=1711459570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkcNXtkyI+rBkLviZCF9m56pFBzFTJpY8CjzHj2Bkok=;
        b=vhna6yTnzebpL+DDgToxyE3pM5WL/tq2QDOBMy/K6nQHZrfsUOXhvHNHSf8BEFvLW+
         SEAdK/f8CsVYD75fd5c346C1cWFcBmJcb6yLeR9fddJisiQmxTuKk80pjJ/lAraDRBxC
         NEoOiGpmg0+bHZDeEu85nL/S9dlGPdBqnXU3lml/Cv8eRB3rkV2w4zwvuvYyxY2ze6SQ
         kxAXMvFjXi7SzilA1YdUhTgu3iNRD0Z0l0WYW/BsVwOBjSEfGPQhIyGB0q6lg/REumtd
         qbAGqNfXk9KydetECsrZzfXhvptIQdIz2kgPgFSI0JHSGZL2HxkOKh/ExD1+wa+VTH1J
         usOA==
X-Forwarded-Encrypted: i=1; AJvYcCVEuqF8LA1xUCUOfswO5BLr7jXFGJYKmaoC9euYXdpo6B1ZEb2NmcL/lx5n993vTA10+UMIgI8HSQYJI8pwgEf99o9cittjxRy73W7YbeWBSdwRmr3GcrzHorNqI72mmU7mOUPg4EapD9NBDVEl0uq6+9bF3hEGMR3zJNSVan7R6qOSKw==
X-Gm-Message-State: AOJu0Yy1m47t00ZyBfnjZJFB7Xh+LFEulycVdAvRGL/F+KdkgMJNezCv
	RymyoaeBcOCaHhcG+GKGjjiC2L/ILUM0e1sf9tTMaF4Hl0sbjwNb
X-Google-Smtp-Source: AGHT+IFDnBxiiHEGMW3NyZCKLBn1QZempbfU9J6p8Z/zwqhZ8ssIG6gBt+X+29f2ud2hwl0q2hvSzQ==
X-Received: by 2002:adf:edc3:0:b0:33e:ca1f:1401 with SMTP id v3-20020adfedc3000000b0033eca1f1401mr2842809wro.4.1710854769424;
        Tue, 19 Mar 2024 06:26:09 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c11:2c6f:3ba9:bab])
        by smtp.gmail.com with ESMTPSA id g4-20020adfe404000000b0033dd2a7167fsm12370020wrm.29.2024.03.19.06.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:26:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: i2c: renesas,riic: Document R9A09G057 support
Date: Tue, 19 Mar 2024 13:25:00 +0000
Message-Id: <20240319132503.80628-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319132503.80628-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240319132503.80628-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the I2C Bus Interface (RIIC) available in the
Renesas RZ/V2H(P) (R9A09G057) SoC.

The RIIC interface in the Renesas RZ/V2H(P) differs from RZ/A in a
couple of ways:
- Register offsets for the RZ/V2H(P) SoC differ from those of the
  RZ/A SoC.
- RZ/V2H register access is limited to 8-bit, whereas RZ/A supports
  8/16/32-bit.
- RZ/V2H has bit differences in the slave address register.

To accommodate these differences, a new compatible string
"renesas,riic-r9a09g057" is added.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
v2->v3
- Updated commit description

v1->v2
- Used a const for V2H SoC instead of enum in items list
---
 .../devicetree/bindings/i2c/renesas,riic.yaml | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 2291a7cd619b..91ecf17b7a81 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -15,14 +15,17 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,riic-r7s72100   # RZ/A1H
-          - renesas,riic-r7s9210    # RZ/A2M
-          - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
-          - renesas,riic-r9a07g044  # RZ/G2{L,LC}
-          - renesas,riic-r9a07g054  # RZ/V2L
-      - const: renesas,riic-rz      # RZ/A or RZ/G2L
+    oneOf:
+      - items:
+          - enum:
+              - renesas,riic-r7s72100   # RZ/A1H
+              - renesas,riic-r7s9210    # RZ/A2M
+              - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
+              - renesas,riic-r9a07g044  # RZ/G2{L,LC}
+              - renesas,riic-r9a07g054  # RZ/V2L
+          - const: renesas,riic-rz      # RZ/A or RZ/G2L
+
+      - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
   reg:
     maxItems: 1
-- 
2.34.1



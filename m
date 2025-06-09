Return-Path: <linux-i2c+bounces-11311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C52AD25D7
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 20:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A685F18919CA
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 18:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C620721FF29;
	Mon,  9 Jun 2025 18:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dql2ABbq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5CD21CFEC;
	Mon,  9 Jun 2025 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494487; cv=none; b=FZiOdCX0f91xK5qnhsgQMfOBc55D0uTch1mdc502gfHmmFkikhj3bfk1oEp2drH+Nn1BnFfYkzdPERVz09ZQU5TApuzj6zZoFvwFR7SBOdZRECpmtrbl+xuv5FJvIvrPxoq6oK24CLrlDldIy0XBwYjoe2pCOiiVKrvMhNmEjlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494487; c=relaxed/simple;
	bh=E5zjZXD3gaK/fFX3RgOU1hyN94YysSB0ZOqfO1X9TEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udKwg52m+DkXk+C9Vap6ekl4+IeFTJ58ibnhzH81fxqKfGP9BS1hpyEYnlhO5TDxqfIW75w/juuqMKQw++H40Q/F8JDdwT3fbw/jHbGTyHPnGnKd18Hr9qpypNi0jCdfze+eTum1oo5s5ISYRdz0NdynZJUlZC2GDX1M68Hd9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dql2ABbq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3835799f8f.3;
        Mon, 09 Jun 2025 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494484; x=1750099284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbuPHSMJxw6Lx/SNygNWNIrqNfQIAfH8+ia9+zyXNhE=;
        b=dql2ABbqBQtVssMDmt/j1q7ruTlNu3Hnze+H3cg6OcVGfmKmj7AYMGAc3rSUzfA32q
         /+HSZ/HNEK1TUbgo9YEKG/UaNq8uzN4QR2qPYzmA+S/hqMDj1mcHRqi3wsvUb7rh5S/3
         8+EgALFEXvz2wWl2okIDN/xrlTyxATJ6NEgPboOeJdoFoSetqRKjRz8aoyXmt/zzWCXy
         dO3xfnkw2OgEYIGVqMSleW6SDSN7K2NEJPJqs2xTjJco2Y1WFM80yb+nMn6sd1JagXDA
         zdeCmETl47aotvFYJjyIcnV/fdbQRrOsP/wJYFj3mXhg8h8wyPaSKzkg11/zkGiwc0cP
         Q3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494484; x=1750099284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbuPHSMJxw6Lx/SNygNWNIrqNfQIAfH8+ia9+zyXNhE=;
        b=V6esIUdqckmxlUrPnSpeYg5WNBXAwwZ0u4sv4UWd7RER4ChOZJC1OsyL2eKqlL/5hO
         L+0hFFtob7P0nm+ZGJyi9DEDXzjPNM4nseZfVGMnLUFIr5/rCyCkVPUXpNabMdgOA7AS
         9IDGCBDXYPkjY5p/kfDbjbqgF1mG3LXhxlOrFl3KO2ttvDz6NIunydBqI/XoDKcxyMLf
         v4DEIjkGXaB98Y+Ds7wIhHPfCWWzYm/H8Q6DF+pD4Tzu48GcNpF7/H6PY6z2hXfBx+W8
         EPHSToPtYX62aX2jYcVMWUj+eARZcTVLk3Hjx++CmmoCDusfOxbwOWa1bFN16gaxu4E0
         peYA==
X-Forwarded-Encrypted: i=1; AJvYcCWu4QKcV7XOpmUw2oTUd0QSOxEZgvBipJTtcYHAdbUheF52KZzZJds10TLQS5DistAIxTrawh6nVukaK0Yq@vger.kernel.org, AJvYcCX9dLwfYf28TChU21jxP5G5eC+t6iuN06lEUhZCw9I4t9nInUgRLLO/VSxXS3qNtVGDgmhTAiEhUfS9@vger.kernel.org, AJvYcCXu3+hdyKYh90J0/4g415gbaDSRVNe7hRVQ6S3h4BIhE3Wak3LoOGfW3ZgvjiBBT2lJ4QowUPnY0eS8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6NL0kA6TfCMte7NjApwcZD0wd/Jr3UDZZqaSd83hk7xOboWrm
	eIywhkP5wO6VIOGorq+v1eWzSsRpAjwF86zuAhhxmGWl5m+n+LvXI5WqIKGLd/Nt
X-Gm-Gg: ASbGncsURbxrILdLiWexFxYHnVy9N4+F7hgSL6AWSAnZaQ5fgpbVOXszUTEKFRy9Ygh
	Muw3ZdyvQwMAQu9OrfyTGvuiTTTDm70spDjpgT4kgXGBBd5jNfWg7DHgqM3CR/rgivpIqJpQF8f
	uEgWo7A9hH7PZUdtnb5rh3E2yzHkJ9IAkzXLK9Z/JU/F79efKS0F7gaoHNO2YiXwvisCGj/qBkL
	R7BvjfV42t0N1ljxHaEjWjJ73zETHuwcOs8BEEJX2NgmTXNqlJUi6RWwd8SS0oWwEZwVQogFSjP
	p9/334lNtbEuWkXkva/wRPAc3HJ0UyRUL9eWv4NexWk6nT6thYEZYwxvwOesSDj28V/mXvp6qxC
	r40hGDNsd
X-Google-Smtp-Source: AGHT+IEqo1sZ3Lxvz0pmnb63B6KCy3QIjgfs0UjuSI4wLbAHJgL4u9Lqb/cwD13nvB7iOvEPGwDY4A==
X-Received: by 2002:a05:6000:310e:b0:3a4:e480:b5df with SMTP id ffacd0b85a97d-3a531cdcf1bmr12409702f8f.44.1749494483569;
        Mon, 09 Jun 2025 11:41:23 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f04dsm10137865f8f.73.2025.06.09.11.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:41:23 -0700 (PDT)
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
Subject: [PATCH v2 1/6] dt-bindings: i2c: renesas,riic: Move ref for i2c-controller.yaml to the end
Date: Mon,  9 Jun 2025 19:41:09 +0100
Message-ID: <20250609184114.282732-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

In preparation for adding more validation checks, move the `$ref` for
'i2c-controller.yaml' to the end of the file. Also, relocate the
conditional check for 'resets' into the 'allOf' block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added Acked-by and Reviewed-by tags.
---
 .../devicetree/bindings/i2c/renesas,riic.yaml | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index cc39511a49d6..bfcc400655dc 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -10,9 +10,6 @@ maintainers:
   - Chris Brandt <chris.brandt@renesas.com>
   - Wolfram Sang <wsa+renesas@sang-engineering.com>
 
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -84,18 +81,21 @@ required:
   - '#address-cells'
   - '#size-cells'
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - renesas,riic-r9a07g043
-          - renesas,riic-r9a07g044
-          - renesas,riic-r9a07g054
-          - renesas,riic-r9a09g057
-then:
-  required:
-    - resets
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,riic-r9a07g043
+              - renesas,riic-r9a07g044
+              - renesas,riic-r9a07g054
+              - renesas,riic-r9a09g057
+    then:
+      required:
+        - resets
 
 unevaluatedProperties: false
 
-- 
2.49.0



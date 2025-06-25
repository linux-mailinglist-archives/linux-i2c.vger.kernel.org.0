Return-Path: <linux-i2c+bounces-11579-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C13AE8012
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 12:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D27E41BC6D6F
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 10:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421AB2D9EF5;
	Wed, 25 Jun 2025 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3zhRlMZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B492A2D8DBA;
	Wed, 25 Jun 2025 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848342; cv=none; b=QOIoSUe+z4ElVxb5ZAOWsVS5WkelMte7f+c9i476aL3oo687O/SgdD1J0LEBU19q/OHbwElrJuA9prejNSOiomdszGBe2zZkujF8BPJWeJgBke56OoFGAqP7F7es60Zj3YdDsFuqWeDrvcXW7fvjDkgQ3VNq0Dzk02N0QHhYnSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848342; c=relaxed/simple;
	bh=CPiL2Ydag5GiOeK27pBlh3/Q98eHEHfFj50P2TEXBNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3KSxb5p9qAV/h8EHtFWOADXytcscHXW9bfEKt0C0xXO/WGfOcoUBmiLHyfi6hUXcOf4yNchoV5I2X2mEkEZkUZ3PZKhq0f3Cl+9JB7ZNQ8z69brjixNOoo24SKO6cBViLIcjR8Z3N2DtOlX32CB0PdIiGuPLOGzEPP2IZegVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3zhRlMZ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a51481a598so3289751f8f.3;
        Wed, 25 Jun 2025 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750848335; x=1751453135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQBd+aMXFAiuZKl0sLq/+7utKAKHEV+qMUdjgWg9eZ8=;
        b=e3zhRlMZNFBJJuiqM68pKun/6ZpXGUZNc6xQCxPwjhaSRssbGzUZcFfqKCDvqlXVtn
         otfB0+hDSiOkyxGoRmYkCOz7mTCmnWTDf1EEV6tdPRoMdafLhwrW2xNRk4kKFvnN/3za
         PNvc7kcz2gp6qBVGImx12p0KIKzw0qs7dKmxFJ4a/tLduVmXm6XNBs1fk/7CriZKI+V3
         /AplZOBPn3Nr3PnlqbKr/tHe9yqL8BbrQT9+0Id28VswxG6TlFxHSqc3XK3QrXW85mNq
         TYw43LDecplBf5+LhE/UI98iBktswLardQijRIWAVOKIChbcmoXmgnr4RwePPAE7dujW
         piRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848335; x=1751453135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQBd+aMXFAiuZKl0sLq/+7utKAKHEV+qMUdjgWg9eZ8=;
        b=bxGK9OOprlmBVHiMq0y35No7X3e7noutQFMxNnS47YOjt+XqPqm3iBuyAizXVhsP70
         qlci9hkZfuCDCMOjnI/mKuRnnVPsU0Di/whqYOBzQiGk8lGDxV1oZHzwJdb/6cgA2Y00
         /lJasqUwvnogoKs+o8gtw95DWWq+dYeU8KbUM9lotEzt4J3KRMT9v2wai62QgDebhoLC
         w+dmnguGz1+Kf3Wn5MtJgmT683pwSsWe6qmedh0msYdBrwgl/MPQo8QDqGEqoHh3/kRa
         +rkZhJTqcPIsG/yUCdsHru39m0O/w1dL9QYAL6lxmTNqNuCRdQ4xHkbCbFGGxUsgoszm
         HGXg==
X-Forwarded-Encrypted: i=1; AJvYcCV4m7BYmSwK7l0kBZjjRgn295K7wsoMHo2fq3+1y3sei4aMlcUMkTOqmokKIWns8CaNvIDSNB3HXuMcluqp@vger.kernel.org, AJvYcCWnpwg+qP9OqCw2gcAa9phBsNi5xAWf0On4LZ4Hp3jPCXB0seqBXncRF7bgmSIH8xmKVft5FvPVliTY@vger.kernel.org, AJvYcCXMV0d0gQwRE2sWzlMoXP6A/9LdWvF2/fXrU2ebJMO61eNFDXknkrcFQAsvATzSy9HZXVF2/pltWUnP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Vi5Z9s8b89IWgHTNe+bZ2V+JyxM3xqtQs6sNkipxv9bWR5rS
	WIaV/EewIc/5FblMF0vVRiwLUprcxet50IngMYgUj+WGGGUsaDwMO8OV
X-Gm-Gg: ASbGncuPBoBApstMHCoWNO5moos0+iShzBctCY7gdsZQkLxjUUpPkxMhwa7m9GcK0el
	6f+VelByNb5Eiy4wUrNd6XYac6NdCLBzp0wAkxDVQk8auzZked53wx9VkCdrzCto9GGo1WCGBKr
	PPMNfGXzMM0rIJYuFKDLSWjGGjyAf1ZO5d8LsoJiyavnVjxSvwg3u25WvcHuEJbjNyqNlqLnhl/
	Dqsxq6HS5xzw+6gM4pACuEFyiPdOiZ1UjPK59LvfE1eXf8GoOY5q72omJNOdM7bCfSCVlXLJqiB
	2Tg+3JuEq8In2s/DZVRLeU0WQB1L4HJ7+rfzfDjN6Q3hUE21nTAL9HM+XQKB5hdTnXfREJsIldW
	ilzce95aNreWDG/FjxTW/
X-Google-Smtp-Source: AGHT+IHylSFEN2nJmKwqAyQdeNsQ4/wKP5fJhSSHEqgiO1Z5asmdQpjTTt9g1mEawSTpiwEI3vf00Q==
X-Received: by 2002:a05:6000:4b04:b0:3a6:e1bd:6102 with SMTP id ffacd0b85a97d-3a6ed6751fbmr1762661f8f.49.1750848334825;
        Wed, 25 Jun 2025 03:45:34 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm16036175e9.3.2025.06.25.03.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:45:34 -0700 (PDT)
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
Subject: [PATCH v4 1/5] dt-bindings: i2c: renesas,riic: Move ref for i2c-controller.yaml to the end
Date: Wed, 25 Jun 2025 11:45:22 +0100
Message-ID: <20250625104526.101004-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

In preparation for adding more validation checks, move the `$ref` for
'i2c-controller.yaml' to the end of the file. Also, relocate the
conditional check for 'resets' into the 'allOf' block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- No changes.

v2->v3:
- No changes.

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



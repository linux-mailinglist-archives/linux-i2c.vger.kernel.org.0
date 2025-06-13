Return-Path: <linux-i2c+bounces-11411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AEDAD8AB3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B03F63A9949
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09AE72E0B5B;
	Fri, 13 Jun 2025 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoNc5gHP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D702D5C78;
	Fri, 13 Jun 2025 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814832; cv=none; b=HmBNTfZZzHTguL/91dKL7Vtw3TAfKeB2EEUb+XmnV/kt0/Spxxf5R2onxV9ak2Co1vxRYzzS692Dvhz47eYTWpL3Hspvz0gGTlgqetO4m8np6xVAjVywnawGjuP+z8RyikkwdIKojufLYN/608ASbeOEdmExG0/OGp75WpStTkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814832; c=relaxed/simple;
	bh=tqV+8xgsDEX8iN9aeH5DXZ2PXKCyXPAnr9A5Q9Nv2mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bm0LdbBeR7ppTp6bdKPm4pUO5YamzwqW744qEmC/WzFEEIBG0kjt79yweu6BjdzJTmS87SA5PVwAH9Qs87WXdGxmjVPt6GOmH1KA9yBfNasFkWPc0daVOnJNLeHwPIn71ZXF3H7IxlRlINzkqSYaMI1G6QUoAEhg6U+js3ClWVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoNc5gHP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so15632605e9.0;
        Fri, 13 Jun 2025 04:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749814829; x=1750419629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ja3be2ds3MEs3gYDW1VP98t2AZczBn+r1D9XLm0EJSA=;
        b=LoNc5gHPddMuNix/YYo++anUMkTKqlbc7B+rwo9H5zc+Fi2DE0N2b3BqmZgZR7yYgO
         cNbJpaWF8hlCq/jDfIaQookvtrFn0s3ETVAAH26GrbYHEipQCtzSKrlV51ju62dGGavA
         uoF3UiHtUINeALHkMZtby2LXFuWcGJnVd3MM4sjzFbv4IUYjDkB2wGp6cu2CvSYNzjRC
         jT+54eUvv9p156UOxR2rCz8kpTbRLyWLKzh+oWGNTfcPNxizSDvZRMFvZwy86jiyY1sa
         ryt4IB71JaqKurojbpJvWtNwj0lYQ7igbpaiQfqBEJtT9mHBYFfopvilI2gv1uyzNOA2
         yLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814829; x=1750419629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ja3be2ds3MEs3gYDW1VP98t2AZczBn+r1D9XLm0EJSA=;
        b=Q0u34yq1yOwo9xcNbnMZtxMMPvHk5x+/I3u85SL9M7hr+plJl10RIhYQaKIIUglc5j
         w0m+G2lvMpZay25pHFLUJfDH1OpbsAyDf894Iiq0/09SrkV5+OibXrHZPly9iXn52LY+
         A50ElPWxetncPATNTaXNx/vCpYTIanAXmD7q40m4wQS65Ei1c8E9cftx5BBhFOfT3YkB
         ylNqmHeS+3zqBMZyfWAA7FBSUKz0nww/PqEx4hRdO1ZeX6zDqgaA3MH4UGMGlNxIuRF9
         RlToDNq1/OApYWChlya8atiW/hd4nIldP+kPAH77ufdd3cJbb2g9iUNesuItgrVcytnL
         iVqA==
X-Forwarded-Encrypted: i=1; AJvYcCVgRBe+HFYbc6r2VqRaxoBA7NJgbo3gPH0KdoB5kN+eJGBb4jD4IHDSrowPjiayIZPviGHqdUuU75oN@vger.kernel.org, AJvYcCX+YYZvNcFVh6GCQpKavfjt6pO3N8krsvRrk9xiRpoYldCehpuAojEYnxcydp22Qpm1WPz3skgxRH2m@vger.kernel.org, AJvYcCXeH3QQg2aFtlavxcjaPUUTgVO7TnGlYqlg4Vlw0qAvJlzwD2cs82Cy024xYuz6M1ZEiT1jJcWF56G/f6bT@vger.kernel.org
X-Gm-Message-State: AOJu0YxPtgD0eVNMWV6632313Fkarea7HjPKzRGAoB/dWBKt2axabm4F
	5bRxD36xltHzuZa6qseU2uKiIVq7apqi6MZ9OVAR00SJ5wK73b2BgeEP
X-Gm-Gg: ASbGnctbC8aJADyHh/NF0HGyhu7upkC3IcjDyEIP0HQSKyhIJyD+fEM4e6MPeXsU8xq
	Tu4DgBKSP40Cu4kTmlWTwUBbz93WI+iHItrnmKkiafwm9PzotHoq1tk97UjMZUT/WGC28micFsH
	fsAjRnAo0J1bygc9a3OWxQbqU0XgjNKIDVZTcsS7B1jGrf2799b5lt+/f8WJ4VpF0a793KgZ8yf
	H6cWsis22FlMNo7lpEKyducweLqzOqgZVGGJlz5lDrqGFNzXBmARvatq+uz1c9Flpr7c93Q2qw+
	POpJLoFoerimtTQEPnNszUOGMrKI1GvbvKNFCDqW/sCRPTF8GHPcxZ6a7JD7qWpB9cIU5ALbUIM
	vjANGLV2RPQ==
X-Google-Smtp-Source: AGHT+IHW3vuJl6J71S2XXnYOU3NvyfNau5WAD6DcjDZseDjzZvxctcfGE5wecCJfU7OursOEKGNhLw==
X-Received: by 2002:a05:6000:2f82:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a5686a7552mr2526943f8f.16.1749814828543;
        Fri, 13 Jun 2025 04:40:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm2171519f8f.14.2025.06.13.04.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:40:27 -0700 (PDT)
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
Subject: [PATCH v3 1/6] dt-bindings: i2c: renesas,riic: Move ref for i2c-controller.yaml to the end
Date: Fri, 13 Jun 2025 12:38:34 +0100
Message-ID: <20250613113839.102994-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

In preparation for adding more validation checks, move the `$ref` for
'i2c-controller.yaml' to the end of the file. Also, relocate the
conditional check for 'resets' into the 'allOf' block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
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



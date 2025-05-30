Return-Path: <linux-i2c+bounces-11167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 944A1AC918D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F50D504611
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7A9235057;
	Fri, 30 May 2025 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCq2cM4H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D618F230BE8;
	Fri, 30 May 2025 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615509; cv=none; b=hPYoexPcgE8//GJ82n7hOhVW75I8HoZ1dMKZQa/7Uk0FAx77JAdO3DT92Nnvmlt6vU+97pNSNQ278VJwISmVLFVq+4gOMKzWNwrZU38Vf7WzAfT56KIUlNr6OemM4Fv7c4o6mwym0b5WrTzxvKHr84Ye0uVXLwqixE/LFuv1Cyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615509; c=relaxed/simple;
	bh=P5KXUQ/KSpGX3sEBt2qYd3C3BWx6+ExoZZFMl0pDyrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiS8BBLt677wBpN+wCFq5gULF1lCkIi8qQ9gAc4MaRFspQZNuBEzscboSNkKNdOtAGvy1qLKGk2R+6Kdu3Yus2N/N0z+Jd6ySI/di8YIXZZtxNScAug+/jwE3OZ2+cp7bHeh/lrSA6ov2FXGA4mtyXOKKTbVCTu2TyhIYIQj16w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCq2cM4H; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45024721cbdso16253945e9.2;
        Fri, 30 May 2025 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748615506; x=1749220306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azOGa7FhiRrmRE1WJULldua11S8mURE+9iNKnUZ7lic=;
        b=FCq2cM4HMTa4ha9DS/wYWTsI2C3erA+l5izzLe+SEvzpLx15kbK0QEGEAQx+helI58
         wWbXyzIly1JDJSsK7yw5j1NK7sZlrbC5cpFpKbokxMFnWEqLtWGBhVJm6hmpMhPdHJcB
         RccZcS7nztQ+GScK+/KZ6MRdKN/lsnfPkvclb3u8D4jmgaWOvhFYOx3E1r2o0pHdwhQI
         tAc4vmjdT9yaQ1SMmbDFpoSsce3rkcUHaZfpT1i+4AbPAKUmEZgXqm3ybSdbFBsp0Iu1
         BzwAUaUETVYWfcoPWr+mILOooeurrSdZZvPR+VB0aCAeCyugF9W2bwe41wEBYHW6jfCi
         /dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615506; x=1749220306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azOGa7FhiRrmRE1WJULldua11S8mURE+9iNKnUZ7lic=;
        b=EkczHz+WTUQRPQ4picLc7EWM+g2Ki22RvbavMHQ0qaEoWQFJZwHBq1YgWMebdnxyVH
         DdhbraMP/1oGHNkByCFiV+ed8byDSqZzMhrICl0rLqFCVn66GqlbyHqCuu6dm87dVIFs
         VzEH9R/eMW1GrVrSYl/vknrOT2p/rk5WINqT87fV76MGo5Qs28cKKJWTaE1kqRU/zdKE
         V5JMM29FqvHOYSCreVLzLpETF7gogFCwDa7q5duJOJU0njwccCIuRpkhi7VyvRS6kt9j
         KfWNgTTcNccb08zLCSfRrsdjQQFJ+zn75ue1edwfj6Z9N/Yi+wuD3gR2bJV3dnrIzaEo
         2IFg==
X-Forwarded-Encrypted: i=1; AJvYcCUI57z+w2kzpQ300RLxkx7L3wwqiim1+2SyZ5JTii56w5Mb2tCcRr2s0x4/mslohCC+Y6eTQVaVlrR8@vger.kernel.org, AJvYcCUwvnScB6Fwni7ygXRE20bYiDoLebb0FDRDHpp9kC1idThmuzh6Gp4r/1qD9l3nb4o5wsPhQGSTZbLZXVAr@vger.kernel.org, AJvYcCVaKg49AiXubF1k1pwOA3HSDz/HMVLfrR+lEWGKpfjxZH0LLP6qUlaKvSbb1UEPaswF3S4trM3sVDnt@vger.kernel.org
X-Gm-Message-State: AOJu0YzX8A1NOC02gnfDEe45FvPpxJzNHUel5VdtK5bG8VygeykRCXvQ
	1Gu3/YOcsK9rsxlODFjLQEs2ZisEYD+VolXaesrVED5MCb+K5dJhvVN1
X-Gm-Gg: ASbGncuIL2F1O9asoB+kJ9HqW8TeKjixAubuQY4pxjsGZI8p86ste32k0dneqY8iuRd
	FmIRtxdn9UH8QtuT62SJhBimHjPLbcyLOhf+xxjQsSc+h1BCb82KiEGvtT7X/xh1fys22Nl5+sR
	nJ9LYTdxw0eMtMg/L1IjDeW+4mlTn9QYEyijJ2b1wBWdWGWQZKcUTb1AErUqGpM7u7fIFyERIow
	YW2pSWRkVZBOLyCPXMTK11UaVCTACMqjvHPQHxBfOp0nmAEMWTG6j78mVOf94m2ns5ybHr14DiZ
	UtMKOeEfSDg5cfmOJ6LdoWpYk5lNsq5Fu7otifeDGjnsEkDPWyXBd+iWbrEFfwW7RejVlaL3/cb
	GepxkLFPUNg==
X-Google-Smtp-Source: AGHT+IFpuydHILe6k5QUpTYAIBSCC1cY8YNsixskm6FXlZIMyXzjPagVmNp6OUXdQp1QWVqYMduIMA==
X-Received: by 2002:a05:600c:1d85:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-450d658f5b5mr24743245e9.28.1748615505679;
        Fri, 30 May 2025 07:31:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f194sm20107445e9.4.2025.05.30.07.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:31:42 -0700 (PDT)
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
Subject: [PATCH 1/6] dt-bindings: i2c: renesas,riic: Move ref for i2c-controller.yaml to the end
Date: Fri, 30 May 2025 15:31:30 +0100
Message-ID: <20250530143135.366417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

In preparation for adding more validation checks, move the `$ref` for
'i2c-controller.yaml' to the end of the file. Also, relocate the
conditional check for 'resets' into the 'allOf' block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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



Return-Path: <linux-i2c+bounces-8506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FC59F211A
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Dec 2024 23:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1E7418874C2
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Dec 2024 22:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9B01B4F1E;
	Sat, 14 Dec 2024 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNVKkV2+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620FE1B219E;
	Sat, 14 Dec 2024 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734213896; cv=none; b=NF85lc27560jJYOLRKEZfQXq8mxF7A/AtDHrfsykvc9opnhz1gtPOFY53bxFVzjPgR2vPjo+8ARasrDISogaPvMVVC6XILFYZWHdihP/DSdFHB9sUyqPJ6F49OMwMhXPAEfLWo1yIjDq0SawbmesAKLgqjOlQEaCVa1iFjFGKRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734213896; c=relaxed/simple;
	bh=rJuFwxjO7k2ZBfizTIWthfNlrY/yIq226A9yPv3UM80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrZMsFTbvUD3wySAJAlH98V1jMi9cz1GWovzBtTHXKoLTyBlMyFzlKFJ+gP/KAt5xWhjGNy73hVk4gNN0NNcHi7t6HZ8DdyDxlHjseSpx/JSCi7K+8qqevgbS16MlM7gxBx20naV82pIwvXNxW4I4se7Bx/bVD11kngtEv2sF3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNVKkV2+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361815b96cso18814985e9.1;
        Sat, 14 Dec 2024 14:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734213893; x=1734818693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4/Hq9oG1hCHZN6bpooRR8vHRpWTBHDd5vOt3uAQ3gY=;
        b=nNVKkV2+Ax4GmExYsw8qwI+/w88AIOZ9UP+c/62yaAy0rpudaseXoMu/BB/C1vVLOK
         XtkPEgdGuNfVCdSuXskeeYJVT6M9XFQTjTGeyVCpFoyMkEfy31Qeyglgaqj+xdv1FKAh
         BDtxd/pDEkb4/L/4iHzxgNz9ky6aVIhhtNc6IXFZHKo+3ADY0KjG6Rp/XZ/P9fHoaVIu
         rlm65l4YEMzt3e1jarIk9A/UEus9AV7ChnTXH+8B5SIspCOvaIhxdfhlOSUBhz9hiukM
         M/ZaM6TvLoP3kyUT80tIaw8FNc4fblIQmqh4O6DbSHKJWypQe/WlQR8RUGO9euey+DLP
         LMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734213893; x=1734818693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4/Hq9oG1hCHZN6bpooRR8vHRpWTBHDd5vOt3uAQ3gY=;
        b=IED0KGT8W0TkMj1EDlXgjwM1NiwsCBeocFe8Ncl/U7H8jSl6qSR8ozcDGuHB3fgovL
         CMJm8xevmZnotqAgdazvc3GRuVZNJ8iHJGP9GZN7wfruRZGsEaqPp7POIBqFSAoKgB+B
         +3iudg+Emuz1BEal/rBm/mQPaZjkE343U8X80FjzeukONreb+gT7QXjTryhl2ksC/RM6
         jAj13E5Hcah/Vie5Dq/HKlSz04+mQWUO17GGC1xmuHU85huXDyA8dv3Nhu0dWTv5fO4f
         oZ56uDe3JwxJ09RjuplT3fVnlLhKTfxbtX8Pl1ki4ULler9EdhOe6HDWDqunfsEOS8x8
         gzjg==
X-Forwarded-Encrypted: i=1; AJvYcCV1dBIixTZPszgVPRKPonBQtKAxMOBMkQO8XNl4AvA/saT/UisNM90S05QdpoI3vaB0eJwm5XEj4kfD@vger.kernel.org, AJvYcCV8ZBGxMynTc/jwRhQjffMI8CqcjSEJ2SsonDpQ46Nk64S/b/XyhHVVIiwMOE8dWjT771lS5Gf9MJFbnu4h@vger.kernel.org, AJvYcCXavREVqNvDYj1PPaKnAe0/l8/eCroDuwlN3uMAfORR+Qlidq6GKivsMcxyRigAnIXOO0AjZQBjSioyzAqZ3eAsUZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUKtZZXV71itbFGE4jvd2bOKxfEUEW07LnKd6tZ3tE0WyWOpt9
	W+MmT6tMCM+etlAB43T1gOYO82aVg8HG5JTe2XokRQRBQx2n9tHH
X-Gm-Gg: ASbGnctsRx/dqi4MqjTYzv25am39AgqVGqhXrAVUvVna8bs+BziwZgkJShiyxDTjDX/
	i5OrzIc84q+zdJWyehk7cSghGGWFAilY5hNIACsU9NRQDbIg6Ll/KtqvotBndwTt4hcWLzaf4jR
	3pnhAyqktucMpab/18y/UXk7nhv1KxzbFw7A+n/M6LCRuk7qUNHM0vtBWRLY6W81mSbt864w4Qt
	SB7mwxdB1wZm0AFpHa59ozRxv+6VjdcUTryiWWxZtBXVZ+DbT4ZrO0RoBx8Nz3TM268lVajdIxC
	+exmHgf7BvAWC1GWnPvB2eqxnpzV/h+U
X-Google-Smtp-Source: AGHT+IEZgL7+/oHEX5vhRmaBN/fBPq0CETkKB+H+95woCtbcul7ecn0vP85Z/48Wz2GhSZiyO6kbtQ==
X-Received: by 2002:a05:600c:3151:b0:434:fe4b:be18 with SMTP id 5b1f17b1804b1-4362aa3ffcdmr68162205e9.18.1734213892367;
        Sat, 14 Dec 2024 14:04:52 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ec75410sm104456185e9.1.2024.12.14.14.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 14:04:51 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
Date: Sun, 15 Dec 2024 00:04:18 +0200
Message-ID: <20241214220419.723100-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos8895-hsi2c dedicated compatible for representing
I2C of Exynos8895 SoC. Since there are I2C buses that aren't implemented
as a part of USIv1 blocks, they only require a single clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index cc8bba553..b029be88e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -25,6 +25,7 @@ properties:
           - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
           - samsung,exynos5260-hsi2c    # Exynos5260
           - samsung,exynos7-hsi2c       # Exynos7
+          - samsung,exynos8895-hsi2c
           - samsung,exynosautov9-hsi2c
       - items:
           - enum:
@@ -94,9 +95,28 @@ allOf:
         - clock-names
 
     else:
-      properties:
-        clocks:
-          maxItems: 1
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - samsung,exynos8895-hsi2c
+
+      then:
+        properties:
+          clocks:
+            maxItems: 2
+
+          clock-names:
+            maxItems: 2
+
+        required:
+          - clock-names
+
+      else:
+        properties:
+          clocks:
+            maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.43.0



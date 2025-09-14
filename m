Return-Path: <linux-i2c+bounces-12940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C09B0B5692F
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 15:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B352189BD0F
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 13:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4882B221FAE;
	Sun, 14 Sep 2025 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnLDNEpb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994AB242D80
	for <linux-i2c@vger.kernel.org>; Sun, 14 Sep 2025 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757855792; cv=none; b=icG7xtN7i0tgoXYK0bLymfYkvUrfjXw/DY8zoHVrlI3QN5VoJ6cMdSewD94OAhFe7sgZv4sEV1uY/ynRzGvMlDWgRr9V1/2Lscl00CNCmqBx6hKndIvacGQpIXfFDIWlYjvqW2m6Xrfnc8W8uVzkDdGwTnghtNB1+xpobILq1Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757855792; c=relaxed/simple;
	bh=HQfw+08pmHc2Pan7DP4bs8Xiq8bd38U1jE7h+zbEfAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icJDakgzslzkan+kbZIQk66Pibfn06iQ9qee8kTazep8D8ubQdMtUBD8JaqrGMC8mIG1XlMsXAd6S4VMGEKYFZsO/CRT02W00IAnn094lx9lCB1nQNx2byrLNYSRtVe+EYnYJSLyC1So3n96etKGcF/ORVQ5prq2wmfmriJ7grY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnLDNEpb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45f2a69d876so3066875e9.0
        for <linux-i2c@vger.kernel.org>; Sun, 14 Sep 2025 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757855788; x=1758460588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G1Q1wojRT+pPDpvbjQ6/3VZuSR/nnFa4c+/btLbdc58=;
        b=fnLDNEpb87wvqjUXHborj2OQdwukX/Td9Kk7zrswws1PcvgbFM/4M16PV/CLTOK0th
         5QVA5mOOeb7uhhGWU3HV6WnQ1orfYx5HbIwjHJKiPMveqkAXnPyoHm5EEVEcd20V+7WO
         RNdhB0gV1RrIjaoZjwPKGU3SHw6QcHzdMVJXb1Dd5H9hosix/9oh/wf6sjo7SMHPNCS5
         U42iRpU4hZkE0ZiHNqYbs92Z7STa4kwaH9e0Fsgw0BTb1cw3GKxnfk2SQ+JXsaq/fw5+
         N8O299NKFGKZvjOGaOp5bk+l+nQofNoMcVeXjwaoL/imlj6dNHsq75+/BMlntiqgwcuE
         8JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757855788; x=1758460588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1Q1wojRT+pPDpvbjQ6/3VZuSR/nnFa4c+/btLbdc58=;
        b=PyJXzNpNYf2sQcPV5zKTKfNTxZRvf8LPphtv7G0IcLOZR3HMtqyUytT/RdtQ83RVMe
         uh2MUpJ1TJfJhfe0CQD8mX3bntknhGBVHpqZGwx70yvkJKoa6L6gj9SU6PU6fRQNBL3k
         gIs7fb94vKpUbzkVAYxQtkHoL5CTWSsKsjd/treQmaT39PnjvBitT8xnfyDJpXGk6huT
         qWcUBwhAPYc0+o1pXhEewYGGC01NeHUwfoGpV9fhg/5KC6GGhlN2S2O3CQjRMh8SQU/H
         jIpzsh9R9e/dgKDcw5B+NV38xhZmRn3s/xsYu2YQQx8wNBTkEtI5h9QOUYuOAZLS1OkD
         GwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJK+2vlfmkfHiSbn0ZWF6oaLjp+eB/PQ4WAGZnOdzPAL2DLfCcY4jGXBoZlCoTafb7Cxk6mSCCN44=@vger.kernel.org
X-Gm-Message-State: AOJu0YztUDNuRm6T5/IJcGcJaxheSsu8zGVid255deweH04ujeBLh9mx
	5iqZkQaZ/7RxvyldJtz05/0NRC03yA37D6iUHVq9xIos1YbGAb+VzoFo
X-Gm-Gg: ASbGncs9S2cdaPpR0ph9DoXQb9LrzpEh7umBMnx3aMnayBvwMX6SaWLyfnh18JHaoEL
	rcVZ4xyKLnYtZHDN7M4tpJv6QZs5HkFaOIC2ZJXOEF5krOJ2M8GiEtEFf5qxSIgvZrt/dENP5U6
	GhWOH+1tqCrmRXLfkuG+TQZfkdnmVskLu4pfINdz+ScT6GDxVRE4CCDvQms64cvkqSXz+uCT6hp
	i4UJLGO2LROQjsw/Ul6sWTn95+AW86+HOVbFcg+h0m3n7sOG23onDFQsCbfzAij/dRpGochYxTW
	ASGQWpIoeCs4kQ1FBDHzDQSVFYgGHO79odsdVHAmOjEBfmcx0D6+ukq5e0AqKGhDzlWIHVWPhnE
	GPPkY9LyJHYBh5IbJ7Hmm7DswArljX/GDgeZn9YmV0i8FI5iZpLPCGHir0Du0iX9eLBqhXHdPOE
	rbdbnqBvPM
X-Google-Smtp-Source: AGHT+IHIQ6hL02vX6IP4GwQbuLCOZOqv85KBgOtJmDEVCj4YcKxCCJes3RvY9fUtp3IRzwzcuDbaqw==
X-Received: by 2002:a05:6000:2908:b0:3e3:5951:95ff with SMTP id ffacd0b85a97d-3e765a18d9emr7675234f8f.62.1757855787801;
        Sun, 14 Sep 2025 06:16:27 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd0a7sm13602468f8f.39.2025.09.14.06.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:16:27 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: i2c: exynos5: add samsung,exynos8890-hsi2c compatible
Date: Sun, 14 Sep 2025 16:16:20 +0300
Message-ID: <20250914131620.2622667-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos8890-hsi2c compatible, reusing the 8895 support
since it's compatible with exynos8890's i2c controllers.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 7ae8c7b1d..ead1818c7 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -33,6 +33,10 @@ properties:
               - samsung,exynos7870-hsi2c
               - tesla,fsd-hsi2c
           - const: samsung,exynos7-hsi2c
+      - items:
+          - enum:
+              - samsung,exynos8890-hsi2c
+          - const: samsung,exynos8895-hsi2c
       - items:
           - enum:
               - google,gs101-hsi2c
-- 
2.43.0



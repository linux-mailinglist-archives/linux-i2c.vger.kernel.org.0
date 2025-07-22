Return-Path: <linux-i2c+bounces-11991-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA56B0D922
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 14:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4ED757A572F
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 12:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703C82E92A2;
	Tue, 22 Jul 2025 12:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIl9xJNp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932EE2E4271;
	Tue, 22 Jul 2025 12:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186486; cv=none; b=pr3Mj0bJRqP6tHCyuyjIgVHMF2zZgfe8RQoqOkVF1V/X69QWQMr+EMT65j/WswJ8ibHnfb3IExsomQfHbsoPtxzGFIISIl1zR/xNSVyYal8xkC+Pgm4QC5Sd1PCz0CsxJHjN6MOdLAZXHDItz1XXkoXTV3MToMAsh+Fzh7XJeJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186486; c=relaxed/simple;
	bh=wYA+tGJ4iaNqAl71+ugrW7w5EiuR472bCCRturb1O7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DfJ1F/v4TenFBpqTogxiWBCraYeJ5NZrnrbdfbpZZRXDiM7fTZCe8BqYKI+sDTf09ACcQC/ebT4gWzdpI+ZlLr9HxOxhjt6gmDIXqLACtGx56iVWB7mSB5l9+1Q1+20GiZcAW/js8nhOklYyql7mhxQMK/u6uDxbDh/yIOEWizw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIl9xJNp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae9be1697easo1177243366b.1;
        Tue, 22 Jul 2025 05:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186482; x=1753791282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqDzbvTFUCnNJAo/5cnzfm9fwZI1Vw0IZkVaSkNbQRY=;
        b=cIl9xJNpZcrcQn3MvMScCsN+0dm3SQ2sW6PzPcuStTqIZOnmbaqC0Wzn+aivcUBI76
         Z3lllVx45kSX0UOFXOYVT0MH2Lk2fIan94h1hpPOAppPXrWiJBA5lLnoPnzrAx+7PjKY
         T4bOOXXaUpeNnF3s6e6zMAygZhDM8hiasPRk7LbFjJwQjXgq6Jq3tP6JIWGWsyY6n2hP
         3+5Q4AllAPVRuvovyYH2AgvZw/HzIiwgJFib9x+hgBl3+gIqumBJG9hcgn4ct4/KtqhS
         pXpKOft4g4d5UDYDQHQ9sBKtMSqfsxrnC8VavMXdYSauVLcyzjrGoE6GJhKYi+YV57wQ
         36gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186482; x=1753791282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqDzbvTFUCnNJAo/5cnzfm9fwZI1Vw0IZkVaSkNbQRY=;
        b=b/THhDU8vC9s+17Yp9rJPvlhGDfJ6GD+KGStAUPTv1W6bgh26eBCW62UGZ/8SCizE5
         T5KfKFbGJZYmITaMT55GNfr068A8+SGjXcelvwL1rL0RQnMbWefgZR6pZh19swoc8pFP
         kUENuXUJZPqYcnACnRtoOpZjmzJPx/7sMZgR82Yl33PegjEQ/VEiyltl4GRe7NTw+54s
         hmO9NDmMWa+Ppd/qKPt1ONme4wCmvVYaNOv6R+h5k4cJUPSUzSGjQYNPnK4DQg6mseeI
         GDT7i+guYjFJQV9b2pA/2XU0kWrq6jX/a8jAsTnTyHFQPU10Dj4J0DcJ8ri3qVm/acdN
         Ocgw==
X-Forwarded-Encrypted: i=1; AJvYcCV+I3ywFZ6TNGUqKRjWAZmj1ZRoK1UtvJa+hugKueEKgqnEg/1dRXavARALou7rLVYbqFyo/bWpH5uH@vger.kernel.org, AJvYcCWaEbn75qfPxFlsA/WX6ue6RJGTFmb+HKJ+38bkjnixBeQxCw40ZqQu3viVwO7V5bRI6P/GTbSc1PiUUjK9@vger.kernel.org, AJvYcCXkBptNbMYpFZ167JJzcc3E+w7qv7VDQJ1Mpj3166enZnEd/LYrolhK8ym04Xo6riqf41FZNRgBY521nBuBa4NGhcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVicLkQejCqHNgn8TIQzJQUBFbjVwt2bsE8DYsbLB7yLn3VnxL
	GPeO4Mj4kYyUSeCnTIp/5mtBNyCE9DG06kqv7DRtaENcMoIT/P6PPosI
X-Gm-Gg: ASbGncvA56dCER0TaCOJHmsCjbmpPACggmBDzOJrBGGBSq1hGrs7UdfToq2SaIN4o8C
	Y+KcLXBWikH7H9ch1gPQQLNRWqK3slueFN5CbpI390KekJ7lEKrUZ13WXMVchtSG3ac/sZsYKWU
	9H09/VDmgXAOPBxn6XLEU8QASGidxaxP0P0ygXMCHw6qqJc26ygJO+TEqZfGCII62GrJklFTnR6
	gorLzTSzdoFqGhB/s+Nzu9SRu9ffyfHVNbTqiDkz/AJn4wquZ/pnEL7huqAEJDSjcQFkiw1mV5K
	gmbdSmmxQj6OLGhBdhYNwCxSl9Iulq9iLOKN8OQauZpELOJblBcjOt+PT9rwXJV7Dq56YV33fuN
	S7+LzIEZD3gmrN5yS5aGKG6MGspLCYUgFhl3C1xJVuG6qBDpIdadg0hoJpk3XtUvhYNzi6MHBwQ
	==
X-Google-Smtp-Source: AGHT+IEJeLyW+u4ycTMqgYxs6NJLL3r5OO1XqbswJb79Eo8rI5BTivFIQk7F1kvNyi4zz8SC00zzcA==
X-Received: by 2002:a17:907:7f18:b0:ae9:cc51:40d6 with SMTP id a640c23a62f3a-af15433635amr357787766b.28.1753186481641;
        Tue, 22 Jul 2025 05:14:41 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2eb90sm858660266b.90.2025.07.22.05.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:14:41 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: i2c: exynos5: add samsung,exynos2200-hsi2c compatible
Date: Tue, 22 Jul 2025 15:14:34 +0300
Message-ID: <20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos2200-hsi2c compatible, reusing the autov9 support
since it's compatible with exynos2200's i2c controllers.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 8d47b290b..7ae8c7b1d 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -36,6 +36,7 @@ properties:
       - items:
           - enum:
               - google,gs101-hsi2c
+              - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
-- 
2.43.0



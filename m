Return-Path: <linux-i2c+bounces-12731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8195BB48067
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 23:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE1DC1891C9C
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 21:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3E32BE639;
	Sun,  7 Sep 2025 21:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtPAoRtK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BAF29D272;
	Sun,  7 Sep 2025 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757280859; cv=none; b=EGOlkNDUcOsFW/4BlDq1hc4B477XBpY/0Nl+EOTRMfFXbNGriz5sR+S1c9m92gWOmielP2Cw/c6xpNNciYkTX4+MKVo7bovaeOoChrCmA8MXtbcE+zw/69qw1Gv5nk5oJWDGfRUDnq2JNMbBW9SBFwO6mjNx+GE+CveVT8r7Ut4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757280859; c=relaxed/simple;
	bh=sk6UDVI+7Kd9lIW0AsYOL2i9ElBbm6Hbh+uzwTLnIrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYh+1ULTygE7v50AAX65XZObyMxIaw8GiXSJ6qbhNlf85F/p0fLV7aiNr3pIB2KoZqVXETiOVmT0rZVtyWFl24BAzeAJHTH/BkOcfKd6gJ2Q9AjiTjqlwbcShgleoS7UPVm+Gt2341pDrPG6fDLVRfDorDhugjq4f9jUHiy/DZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtPAoRtK; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-805a1931a15so416786385a.1;
        Sun, 07 Sep 2025 14:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280856; x=1757885656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=XtPAoRtK71eEP3tpgKd8Xt0mi3Dmnq83DxsPa+zGhQ5m7SoooqS9Ecq6Ih8652gMXt
         pKuBWNXzpmdiafhdM0c1K7HnVUYPg7OKku0hPK7t1DQV1a0fJNsPUtbx7bRk94xuw0IQ
         8IbKT8DcT+bglc2fbGbNk5CSsVkQLeZrnmYlY7Q1xYXCWd1lx4NRlYOT24dG10dH2zMJ
         gfKdOr/m+lgBzJm746mJWFRSDmcdFusTO7EIu+p+8wl15GvsYEiZvlRBAgGnXrh/zqQZ
         Q4pF7rAcHqmXXuKBBU7YXnn5oLUiROqQrx4m37OOmPSNTkuxW9qiU+BZTWKUypzaxfqB
         buxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280856; x=1757885656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=WhXBTWy3Codti1Q8qtDXoLDeOmsaQ1RvgEmipNkHurvgyRBEWA0yc/Mn9XmYXj66PU
         zpDw2COjZ50kuSm/RqAwQEE/45dEEcOUDyRZgM6sdJXHJp06OeuR0kzbCCWKWVVHeiio
         fs6zEtS67T+iIhpGM03OkeZ1EjRpGLeqILkcDFFi5xUR6PkLejAQrcttkKCit2zbYYjK
         fQa7K7LvZDF2y67aKSIufF9c7f0x5Wbm4hLa1/HaPVtHtTG3iAowd6BccQP3HM9C2t8C
         WIrrrpeT66YmMmeOcjjAIgUwpaifJ3u/gBhfBCa+5K20gP+frjnXoHX+5OdWK7NDsBHM
         ShrA==
X-Forwarded-Encrypted: i=1; AJvYcCU+9jaDGWkCPd7z/zGoLZWfNltcXtfRWou4jNDt/672CSo9F8RO8U09vCbU79Tn8pcHvpHF3q0lKIOfc3/W@vger.kernel.org, AJvYcCUXupMiRzgyqL0FlvMgXSQWfgF8f/gVH1urRhAZB3XODm4hPBKKLDn4n88gsIAho3pyfEoMKEUHh6I=@vger.kernel.org, AJvYcCV+VK39ubqY8vJ0djjCDHniXyIggsiMFIccx0W/zGs7gnFqq8yVnbH4duicBWJzqDuWimp+hIhhwzQgGqFK@vger.kernel.org, AJvYcCX72NBLYzH3PZMFaebWbkNUmN9XwWlQH/KQuKgr3vebJC56pnleAVzUQMmckem8m+MVpZt3ZgkxsXXLFmqX2HBWobM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yeVIhL00oxOoqmPRVF90ICP239kRpyCfPuqUdBJlAL/a8xi/
	iGW6B95EBjqX+SJ/JvBUlCvAJ0A+Pg6wmnmgUWbWVNoY6Qy/6Z7C01IlkrTVmJSQ
X-Gm-Gg: ASbGncteyvfOfHnaDJfC13W4p1ZFOi8geTXCJnOGJnJIhf+UNaibN7lWODrdykApy7l
	d59ejpIArWrJqWvVUM+dyWNiSaJNGa8IOaMgqTIYyfi0/cvOqUuPAKf/CcqxGrpXbO/H09/MkrM
	aL1rDpalb8V6Y6MfdgqiPfjNkur5VWFo1BLVzUcgPgRIRjkr62kdju2tYnIOHpiqLHrSG+gn75P
	iewYdQkdC1VyvYLUssptFL7OCSbv/sz6AwTrUDlDwtrQEJpPBx71/kTslODFx8G/fUir4+fov94
	ra+wSXhEdepKsvzWsBkrTi2IEyjRsRao+Eli9gAcGGVLJIi8Gjo7oXXiAy85eX4bC26YEN2UveO
	OM6tkRj+Gb4xuTqqOYElFiI/qS+Sz9ko=
X-Google-Smtp-Source: AGHT+IG3tc4UqZLIbUYa3u+dAbhQ/QbeVf+fBuoOSlSOV1ihSac0zzoGAZh6p6WqsS9+p8G55Xq4zQ==
X-Received: by 2002:a05:6214:f63:b0:70e:d82:703c with SMTP id 6a1803df08f44-73941de3724mr65632216d6.49.1757280856560;
        Sun, 07 Sep 2025 14:34:16 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:34:03 +0000
Subject: [PATCH 7/8] dt-bindings: i2c: exynos5: Add exynos990-hsi2c
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-7-ae7600491a7f@gmail.com>
References: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=1022;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=sk6UDVI+7Kd9lIW0AsYOL2i9ElBbm6Hbh+uzwTLnIrc=;
 b=lOkob6UkHu75G4OJw7lY4gfQQdi1+T2mj57bPrVeHI/W2Kin6I+t/lTg8KuAD+XDVDOrTx/9l
 nwsgyXEjPP7AmO3jtshytlqEjkzHrz+oxO6KHJhvSJj58jYNEhcvha8
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add samsung,exynos990-hsi2c dedicated compatible for
representing I2C of Exynos990 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 7ae8c7b1d0067e7e7a73a58e8bcb4aac71e87dd8..6fc03281a8f8440ba64df569f6c83ba2d9f6915e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -38,6 +38,7 @@ properties:
               - google,gs101-hsi2c
               - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynos990-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true

-- 
2.50.1



Return-Path: <linux-i2c+bounces-10306-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFF8A87471
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BF6A3AE526
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CBD199FB0;
	Sun, 13 Apr 2025 22:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hb7WdEP7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0B8199385;
	Sun, 13 Apr 2025 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583777; cv=none; b=d5/dpmJueBsAHejJf8ZVm8UbuW1rTtrfcgJVNsKQn+b3jB17RELMUNT2hak+XvW7QQCScD3hLll+UhQxDmeCOzW6iBdVDVueK5nm4WWqkTylPwOCl3Y9rV36gi+gswIfhxu6bLWYP1zfvzBaJ65NbZ8l2E0Zyq1YCV18fqXLsCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583777; c=relaxed/simple;
	bh=RFFraQV++/mEmJeBPIAey/Nmbb6tNuLRy7ftXsabnfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqzmmK6Jr7+o6ijnyG0ydeQYwsM6z9Ftc+lOMZD5FMsVyBR5xTkYOxodnYNYeIwp1sN1CBOwCrsQctvRqSJyIqXdDUIkZ2MqlyXzOIg/9eavutIHxsqeQYCIuBgRfbJ0YG1TcWJqYwXO6coe1g5IfoC8YVU7tKzU63mABnSakh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hb7WdEP7; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so46296676d6.3;
        Sun, 13 Apr 2025 15:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583774; x=1745188574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQtb0pSGVQGTtXkIrJkeCkQBuvZKt/sx/lVi2mJE3r4=;
        b=hb7WdEP7PIurVOwPPy91E4FsVXY3NJuVs5+oFWk3vvKPuzOjbIheMnKIZxQqr0/3MY
         /LVwSH5qoZm2fPfevzdePr/hQl2nHrn3vHBWC2SQOHVxdT0vsfWRIBO/RqGqgxmdPwm5
         jo9NLUWPnoQY/MccPkOz5ILm2dXGn5kuiSS4dhOzn1pDLs9OWs3GsOU4BB19k2jU8xFl
         GXJ06QAwCuRQWSgztdTTdDi8z657L/f773FRxiVtqSTATuZvP/2bVnZxZJW+4G5+KZS8
         e02mhJFno/eAfBnbygKXmqcNRA//fV05o11+J89xDzsyhic5MAeW2UyUEvE4m2r8m4qk
         cFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583774; x=1745188574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQtb0pSGVQGTtXkIrJkeCkQBuvZKt/sx/lVi2mJE3r4=;
        b=NkFtbUFkEN/Fel7uhKVf0HAkq2xtEnVKjkpjZxYa44TY/hMyNV6RdsBdECsVAKRyoM
         +Vv4tnayAh4ZYhm/A/IeGjtqtKzquFexTGY9SP0mX2yD9sZ92Mj2bzRlNV7vtTo96DOz
         WzSXg1UNu0GflJnf6c9IEhqTvt9kysSFIMrNWkXGWEMt5F61TjcqApRfgNn9FeLjgscV
         m0s7nQj3Og/u6Tj+8jFR2fxCE6fQBUyAC19N2UHeev6aJCbJrVVK1taNYksfqwwGv0Ce
         2pfhz4ToTwPsumrDV+hIpnibqysSrcBwVAHuKAfgTbKqsnnChqeBeW55nhsNgkUw9n0q
         Wq0w==
X-Forwarded-Encrypted: i=1; AJvYcCUisxRVCDxCU1gDyChG03QqTbAH/QDDoTsT/tWRhOwTL12heVbHCpGum531ciCxeAJEzPhU4zBUUwjq@vger.kernel.org, AJvYcCW4Q4308/LW8GDpG8FYFs/3vT1CdcbeqkUytTp0WN4r3+Sjdadi9llQhnC0qVbb1DH9S0fKTQ7racNv@vger.kernel.org, AJvYcCX5WDHLByJWJG292NOAxW29P2RjGo460URoEXMiP1WBBSwIW4hpXzhZaiMY6Pr6Z/g3UBbq7tzAXLOq44i+@vger.kernel.org, AJvYcCXEW+NIYllc1STFNed9+WslH74IRUSZZxjjXEqjFnnrZ0zsE1LNY2miWpZNr5FfxE8IE4A+Cx8ChBQ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3i7T6MLwmQSR4cJuMdqwWF8UeJUKMD6Cw4a9ME6JWoBmf/izx
	JnCllQHyceMYy9Hqkjdxz/HQMU764UJEc0ErP+bQ08UtsZYMaCa2
X-Gm-Gg: ASbGncuAhqKPiHkHoxlrl1b414l+Bi1Uj+yeuDgG3paqwbrdSEHVyOCgNX7G13CNYUd
	tOgRe7BTNSfiMehyyY0+vF4GdtKw3UVMWjBj4mtt8IdN/7Lm0Vq//CBtrr/BcIRLnRxNm/CsL5I
	eQ6SCkvS1jzhPV6BCWL7pGzlME/6MnTeVJa2fyUlos5MDbcW1O5ksgdqxkbdnExzr0OrhymqyUe
	yssPDb+yq11wfcXSo+BdomEM38UZSbwp1hFatyXOybsJvFaPhLZvBvex7lc+fKlmkESS0FXxDPZ
	0iOmjNeDTgq6b0do
X-Google-Smtp-Source: AGHT+IHcbYzXgxBWScH80KwGFOQiw4xCi7hWgB9/z1qenwglZbRcB30OmSj5yMnaB0Bpc9VZ1St78g==
X-Received: by 2002:a05:6214:e85:b0:6e8:fbd9:169a with SMTP id 6a1803df08f44-6f230d000cdmr144479206d6.11.1744583773712;
        Sun, 13 Apr 2025 15:36:13 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de95f7bdsm71938186d6.23.2025.04.13.15.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:13 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 07/10] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
Date: Mon, 14 Apr 2025 06:35:01 +0800
Message-ID: <20250413223507.46480-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdhci IP of SG2044 is similar to it of SG2042. They
share the same clock and controller configuration.

Add compatible string for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index e6e604072d3c..5fb347167004 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -19,6 +19,9 @@ properties:
               - rockchip,rk3562-dwcmshc
               - rockchip,rk3576-dwcmshc
           - const: rockchip,rk3588-dwcmshc
+      - items:
+          - const: sophgo,sg2044-dwcmshc
+          - const: sophgo,sg2042-dwcmshc
       - enum:
           - rockchip,rk3568-dwcmshc
           - rockchip,rk3588-dwcmshc
-- 
2.49.0



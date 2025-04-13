Return-Path: <linux-i2c+bounces-10300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B58A8744C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 658007A711A
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C354519885F;
	Sun, 13 Apr 2025 22:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cW19O6R0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1399C198E75;
	Sun, 13 Apr 2025 22:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583756; cv=none; b=SQrUZvyl3qOcDyyZNT29HQiLGKJDbkWNt13Hp+w1TjRCsFQk99+VaQjigMs5fh6lF4lJ7FkVSqvG8/SmIsqbXoucvc5my7NnpkR5CtYI/zaMbO1lBZw5YduO+CIrpu/55nwNUEF8DmP0WJCD3aH6vqJHSg8ANw77EBWP8fo56Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583756; c=relaxed/simple;
	bh=KgWPOmCTDfESrFc3oAhBJr9hYSyrIkSb6k+czQLd2Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rwr2ShRAzE0DrM91dRhR7HsLwnj7mm4yWxDDDVBb5CsaBWhniUQ7hWTzLIw1hzNJ7cWlEm8tbZkgLRiSUEFGHIUwKCfbDetXLK1Lexz5vbCS3kUlHwZ7RCVbBQv7vH5+wHiF38bsJOthykdNXMHZFR4fTqdxg1/cqtpQZZsCdAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cW19O6R0; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8f254b875so35551526d6.1;
        Sun, 13 Apr 2025 15:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583754; x=1745188554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lZgrCqn4zngJRfX+93MR+1Yhh+ysY9LollV+OpmUio=;
        b=cW19O6R0vShGb/aHK/A36QQxGAyrEt8hoJMtoA7/1PnVQq3b/QrZziPzlXH8FYt7Ve
         3IcoV5eSBAvvsSfh61SxRXaxB3WDhuN9KOHW+1F7pOBcbSjwpU6cjU+gulrzIdqjesTX
         Es/saeZeXbJylsuNO5Rc8OJOfiFDG9Pxz1NORB+b6Eazvz4HvJoui2RWbBiwwMGt7But
         5C6iFPtziuveQOS4bphiNt5y9jvlJFUBBxiz4AND1UYkKMCGS4VgWDZ9fm+DG1Nra8rP
         Iewgyy6cjpMvYVk7jjqpE0K6WBz+bwEwmj76LAgQdFDJsENpK4NAVfceAQ276gPajnCT
         ihaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583754; x=1745188554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lZgrCqn4zngJRfX+93MR+1Yhh+ysY9LollV+OpmUio=;
        b=dQTCa3rdGesCLDaRS6nRXDyGknV/jdnpxD0m3I8rPFD2UwMcmjKBgQlz8yp3zFTYAI
         VnGWSTBbE6rPhHVawl6jnPpguUatXJk/FUsvmmBVKk0fD1oUE2PF0bszJc7pz6/4mVjg
         lpCCNsi5KUGUT6R6I1nw8knXsYDxcmcD2OVTeJw239uidv2Z0FwOE1V0Hea5TGQsqfVk
         DpunsOx1hpdptHibE3W4zLN2Qh6C/hvCSmoermjNT1Tzd8gY/Q6jPF4F0PUv1j8p0bzE
         nRE4Hchp5/NntNgbU1OzPht72CzWt4LfptIDRvUSzqMOR5cwdmJa7U3KiaWO4PTyjiMv
         JDNA==
X-Forwarded-Encrypted: i=1; AJvYcCUkgZuXI7xkZLfeegMR0BuwAPDvRVzIxbcx6UuVthzWzb6Ljz46NL1ncYKPdRnsQe5k37Dd8Pmq7cI6@vger.kernel.org, AJvYcCV3wxGgQgNlD8dymwOuV1wGcwRn0SPsjiNXRRAEyOUmj/xgFq3ZFlGrVlfsYDTu5gv1XiMcL4W09sbo@vger.kernel.org, AJvYcCX7eCIy9eXR6aqRF4f+KlB2IddcNNZf5lba5YnaMb8bPTPqsCW/4Mphh7+PC4g3dE1EmlU8I9OhndOQ@vger.kernel.org, AJvYcCXO08W9GWYRtrNribR3KaTBZj2MEEyBZ5GdLdOwheTAq3qVvTOogPuUCFrCfQ9ph07imChyQsPhAjEVGI0t@vger.kernel.org
X-Gm-Message-State: AOJu0YwIwxaR4bEpkT5aian5/MM+TVQIsinvWBioIxleJyYSHAEAMfql
	308II8/jewLTLvF6ebENE/7Rvn8XU3vAMxBfBgs/bcUJhzIlhSpG
X-Gm-Gg: ASbGncsvv2dUvb2cWMBOkQrm6FxRn2DRPHpZV7y8nROgz1n1+3t5zLo1CqxQZgGKGMF
	B+QUWG6Qy3+IZHj4jP4+zHXxS+gEld16xzX1kzg5T8cV5umQm5GQBWvrc8mrhSmDVt4EtDPUNuZ
	cqJGg5saPkufvlajdH6bvVVnxWaouZbBMZRiiLoZuqeGkA2Zv3PybkVXzVw6prXdH/1nTB2t2q2
	8o9u6G7B0ylbaDNpthMXJ6wmHc9jycCADKsKfvTHAAn4zAp9mCOd+Ckc2kp0JVA0EWWPLEyG9tp
	ViY5lpf6GtZzwAon
X-Google-Smtp-Source: AGHT+IG8shp+cdQMktaiCiqRlTfz3GoUb3+xi/ND48l0w/3Coj1X/4luu+R/cZPmG6Hdy/95WINopQ==
X-Received: by 2002:a05:6214:e4a:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f23f15b763mr155629336d6.38.1744583753719;
        Sun, 13 Apr 2025 15:35:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de837f9dsm71293886d6.0.2025.04.13.15.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:35:53 -0700 (PDT)
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
Subject: [PATCH v2 01/10] dt-bindings: i2c: dw: merge duplicate compatible entry.
Date: Mon, 14 Apr 2025 06:34:55 +0800
Message-ID: <20250413223507.46480-2-inochiama@gmail.com>
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

Each vendor have an items entry of its own compatible, It is needless
and some can be merged as it share the same base "snps,designware-i2c"
compatible.

Merge the duplicate compatible entry into one item entry.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml  | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index bc5d0fb5abfe..98567dc791c3 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -32,15 +32,12 @@ properties:
           - const: renesas,r9a06g032-i2c  # RZ/N1D
           - const: renesas,rzn1-i2c       # RZ/N1
           - const: snps,designware-i2c
-      - description: Microsemi Ocelot SoCs I2C controller
-        items:
-          - const: mscc,ocelot-i2c
-          - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
-      - description: T-HEAD TH1520 SoCs I2C controller
-        items:
-          - const: thead,th1520-i2c
+      - items:
+          - enum:
+              - mscc,ocelot-i2c
+              - thead,th1520-i2c
           - const: snps,designware-i2c
 
   reg:
-- 
2.49.0



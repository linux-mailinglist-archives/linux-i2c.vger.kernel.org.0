Return-Path: <linux-i2c+bounces-14883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A3CEA09D
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 16:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EDD1305CA09
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 15:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA01131A041;
	Tue, 30 Dec 2025 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROTN94r2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405E0469D
	for <linux-i2c@vger.kernel.org>; Tue, 30 Dec 2025 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767107352; cv=none; b=bZaFqZ3Iy0MiJ0uCAxsJKHA5A9JlQzSzm5ev8kEXcUYOw438TYd50pDzfUukGH4kyehkhDxJ8jkEXw1TdtH1EsonqTzp5klZkaki2AfEoQCVKRWXLXc4HNv9Ak6uPJ/hz7yHOVxrLIKiaHt9HH153QSGx4ZYF5lil2siNj3EC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767107352; c=relaxed/simple;
	bh=Afh3am6siKW4cCqJDlIzBWE4lL+ZW45I5RRhdhsEDpo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lemoi+1UB58/uDT53ecF4RdKCJK1/Rd7xV8tYDGA9FPlkcwOmd4fSClEBkiOIaKwby45D00y7l8z7yqBB4TKyLakcH4+g6RXIZOYGlmeXnwTpPgfGJl/gwjZjDrCtU/Tczlk6HIezRIWddD6SojoE3OMf+1mdeUvpbXbp2wp8q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROTN94r2; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-803474aaa8bso3578340b3a.0
        for <linux-i2c@vger.kernel.org>; Tue, 30 Dec 2025 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767107347; x=1767712147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQyulCdMEn71nJJi5suWbUyY4Ki6WEPbytXA1NTokyU=;
        b=ROTN94r2HnfEq3USVWfprDdxc6Yr8FoKluzRTepWOaJByaoTQGjVDj7nPZyJzwtVSa
         645XHWoaZSCsLvXmHZN8raQDoBL4soIVq5OzBaArrKd7Obo/HSOuUWJ/Swq+euFiWl52
         BvfheRyGH+pvxlkO8VS0X4G8kp7Mf3VNoKmhdoVD1ohg/TzMaA7pd+fhBPQthwsTjM7D
         B/6eLX0zkuI/acgbbjHWu+cj1Up7zonKmpZ5cCh7Iz1ryOBp6gan9QFc+Egt3/CULIja
         4w0KfM9UVMmArJLArM4XZCvYFRoZowzhGaII71QT8hMh0HJyaf+0s5AWiFCqFDridV/n
         YbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107347; x=1767712147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iQyulCdMEn71nJJi5suWbUyY4Ki6WEPbytXA1NTokyU=;
        b=PApKBq4KXLpjEQbVr3CT5o6JUt/IkbZHg8S3YX28uNgCC3wibtwGlujtuqJIDcfZJi
         g4TYv8FTrJdEzTjqbdeOoIrdhTvqTxw3EaVwQrAFvVjNFHbPLXEM/6GsygppfRpui1Xy
         ujiktCJBeaclHSON9lVbmuHWvuj+A/kbi9FuUkbWomR+Fpmaqo5SFnBaRpqVePsgMX57
         BOPlpj8ECEe5P269uu2+SPekk+a50Elwe6OaBeOxCftrC4FLcMPvZO2I5cSbHTLorvS+
         gMy4KkqexBa5TLILzVEJOaWrV099Zq6rXGG6tZ8wcKNcCs9JoAHLFtdUQpYF4CwTWln2
         7jqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwHWw4k1g9obTUo/E6fG//nuTn63oVXnZrMbcTEstlUXGmP1/Y7W+c3qMeLx8dxY04tv5LmZYLR/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Lt1QJ148vCFqGAGP6k9BbwBfQ2xoLFNw9MBFrXopVd/t2i5G
	wxY4RrSifeZhQLVCn3FhKR59JJX+slgZCpNPyNsiqSKEYDJiNODYFdVf
X-Gm-Gg: AY/fxX6S9hSi5WbY3RzVr2SL1/Nno/ILspRonNZSlgC8O/gzs+wC1N2cQRs/JfDLLS4
	pdoaa5ZNHi69prCM+LPlDoGcq02giFdhF35M4xv83O0FWvlJHA+VvKkStnlKHkylmcUX9/U6nY2
	0ViG58AcwLutPBQLWClf6B4mLLvq3iWwRpvLCCE7mQoXi2KEbWrncM29VRBoTfK6nFRf23iwdnW
	7NW9HBT/lYaeq8yb8vlvsceaX3Mn8NimcqLHc6vlJSg3oFPaBDAvQGr1ePM4dFSoGfcROeufOgT
	3KgxtAPOVj4/XRYW8w24mkfdA5Z3hEMSSj8xrbLC/kxdGl9zngyin8VyU5CL6FEpWaBH8RE+CAy
	8wkJfIMmHNYZgqLY+X6erSifYk4PLZXaju74pNGgRmdigD9A5huNJcfT+2O0PAjJePbdS1V0vjC
	kx5G5d
X-Google-Smtp-Source: AGHT+IF60EB1pg13UduiDmMbSYai3+Ff4fdDR7O5w/Nphtaxj7bPzVcEc8NOzQFNo0ngkbP5FlHkEw==
X-Received: by 2002:a05:6a00:3404:b0:7f6:faf4:d7e5 with SMTP id d2e1a72fcca58-7ff54beaa48mr30331057b3a.23.1767107346590;
        Tue, 30 Dec 2025 07:09:06 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f3d7sm32981085b3a.51.2025.12.30.07.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:09:06 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: [PATCH 3/3] riscv: dts: spacemit: add reset property
Date: Tue, 30 Dec 2025 23:06:53 +0800
Message-Id: <20251230150653.42097-3-jyc0019@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230150653.42097-1-jyc0019@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add resets property to K1 I2C node.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6..085987643638 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -367,6 +367,7 @@ i2c0: i2c@d4010800 {
 				 <&syscon_apbc CLK_TWSI0_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI0>;
 			interrupts = <36>;
 			status = "disabled";
 		};
@@ -380,6 +381,7 @@ i2c1: i2c@d4011000 {
 				 <&syscon_apbc CLK_TWSI1_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI1>;
 			interrupts = <37>;
 			status = "disabled";
 		};
@@ -393,6 +395,7 @@ i2c2: i2c@d4012000 {
 				 <&syscon_apbc CLK_TWSI2_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI2>;
 			interrupts = <38>;
 			status = "disabled";
 		};
@@ -406,6 +409,7 @@ i2c4: i2c@d4012800 {
 				 <&syscon_apbc CLK_TWSI4_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI4>;
 			interrupts = <40>;
 			status = "disabled";
 		};
@@ -419,6 +423,7 @@ i2c5: i2c@d4013800 {
 				 <&syscon_apbc CLK_TWSI5_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI5>;
 			interrupts = <41>;
 			status = "disabled";
 		};
@@ -443,6 +448,7 @@ i2c6: i2c@d4018800 {
 				 <&syscon_apbc CLK_TWSI6_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI6>;
 			interrupts = <70>;
 			status = "disabled";
 		};
@@ -546,6 +552,7 @@ i2c7: i2c@d401d000 {
 				 <&syscon_apbc CLK_TWSI7_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI7>;
 			interrupts = <18>;
 			status = "disabled";
 		};
@@ -559,6 +566,7 @@ i2c8: i2c@d401d800 {
 				 <&syscon_apbc CLK_TWSI8_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI8>;
 			interrupts = <19>;
 			status = "disabled";
 		};
-- 
2.25.1



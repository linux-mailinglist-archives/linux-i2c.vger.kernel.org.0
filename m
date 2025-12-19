Return-Path: <linux-i2c+bounces-14653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06235CCED27
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 08:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89D4E3080692
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 07:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE4D2DCF43;
	Fri, 19 Dec 2025 07:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9HstaxN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB072DC77F
	for <linux-i2c@vger.kernel.org>; Fri, 19 Dec 2025 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130175; cv=none; b=pe8+OaK9sT+kMi9RVtQ2GI8m6m8BqmGiyXC7Gd3FTnhEfzP4Fk0lx5s+CZn8qaUufhPUy/Cr6QQIFCCKP+vVIMqtzqwL7Dmbh2oBdYzUhTJG2BF5wBajn+hm2PRJ1v8UFzAcj/AfW8dA8SvplFzLFjcyabGBGxHFXrDinh2k6Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130175; c=relaxed/simple;
	bh=G72T+WZDY27E2UhxRAm4MPRhTxWqCOs6OHY4x2Qdsqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mho6TOSxShTppb37l6bLlUg9SsebpCCZsPbjNtdEv7bwZo2oH1X8xjly/h9TwpmsDlaICcTKfzzGRtVjDpxQUYUCumrNasAZiSpZrKvCeQ5yrHC8+rl4QVOuY16g0QvOtgtpoYKhX2Ho/LX0crrOpqZB9uo2L69D7X4YoIf1dDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9HstaxN; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7f1243792f2so1039875b3a.1
        for <linux-i2c@vger.kernel.org>; Thu, 18 Dec 2025 23:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130173; x=1766734973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGEKEdhZlzAvNRxCMFTpppZuD5Cxzoe0sAFMX5gPBGU=;
        b=F9HstaxNsayJBFVe84kWAqJWyBRcCfMFHPwi6OLyCeWv0YICuYBuMtmmpl+6q9jY7W
         PzkO9WzJJuV9r3ctKQQfPuhQfDxiGJv3r4PWoKj/mQhbNwSbh7jG+B9Orny9EsQHqURi
         yfEXpI8R4sEQGkT0waVd4v2HpYmYoRmH6AlClxl9tgNL9YSGx00Hd8kRYaO7uotRBWjY
         0SNVNU895P13Bm1iU4XsK8PyTfMHwIWoyhx3yNowdCuyMzoSiqDEFij8atvXHl2rlPp1
         N6cExtSTdaRp24L2aF8qpqhdzmYBpsTX/Xz7HXLlY3lj6/sgGZJllx1XaswFqL2SEgdA
         oxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130173; x=1766734973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GGEKEdhZlzAvNRxCMFTpppZuD5Cxzoe0sAFMX5gPBGU=;
        b=TXFU2jjiDtF1yqW1z1BelNz30cvXGQfhdx7OKMERvOKJMfXqDfaxMUe/SbIAPiz7MZ
         oFv03ecTwHyaBy0WvIugk9RtvbkPZqh3kfke8t88NgXGleHfga8tdpyVIeMRm18s/Bpo
         +hgfTiWexRPbvgO2orP8zaCBNIAtcboq45e/c18bOKvLVcLZwdgb/1bv1EiOh4HdeG7i
         cLjJJNewy85evBDmvrIkVTxoQpiXccp+aGGTwVQQxAJd8JxtpRufSd8beONGJi2GjE79
         pnZlHvJx1ADlhnqp2EdrvJntSDHSMRPl3pKSWcy6Im0FV5k0TaMPLyN1564Lh0Gg0tM+
         P3KA==
X-Forwarded-Encrypted: i=1; AJvYcCWYTWZhjbsgvHZQFILhzTCYlzLVepEqZhkTGLRo4YRgB4Mbsf1tRhbwemOsRcbsiinAKZs9O7eJvJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2V79/j0VFgvpuqfc10CU/6Q0tXexLfGY6l4i0imEz9jVqTXji
	w+s9/GlulgzuA01OoB30WW3tRDWyxGEwn+7oAcqKIKTOC68do8N013V2
X-Gm-Gg: AY/fxX6UUwTdMehBJ065AWPLykm1lWruobAXDdq6PVhODVTQBu4nHYYpLoXDjO+SEK9
	nVPxuKIDZxCXFpToBKd30c9TOjhkCKEFWe+fnNETmUdq8HwHZUKj/8tAjatxwqiglVn+dToA+HM
	RIMGB+C5gePAKKyc5HCDbHGWFf8xzic+xmYnMQlJ70bzit1/cNySK+eis6ty2kXAHH0eqc46pG/
	HxYttr1tB3TONcxNsM6idUn0ZNDscjwQZIbfPZJKcNUw5lSJWFW8UrL9hYSyLUe4peHyYQu7mz6
	NC7lywJPne5OUHgoxaNdt17jL2vrnMuEtYJNGMH4S7f7PT2KQVEPPv5Z/BFQVGY/lz/9o9bCx2/
	E6waQJzh68LsikYInr48a12n5lqbdHCgzW6AkH0yV798DbTy53+t8
X-Google-Smtp-Source: AGHT+IEOHBbwLfzOsV5D+3VGSzAKq+pDw6xwaXIZis6jWHwmpPR8IDpm4tyhNORstF0bxJlGHlff0w==
X-Received: by 2002:a05:6a00:600e:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-7ff66d5fca3mr1889071b3a.37.1766130172539;
        Thu, 18 Dec 2025 23:42:52 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm1490499b3a.50.2025.12.18.23.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:52 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Fri, 19 Dec 2025 15:42:22 +0800
Subject: [PATCH v2 3/3] riscv: dts: spacemit: add reset property
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-i2c-reset-v2-3-ad201a602e74@gmail.com>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
In-Reply-To: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=2324;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=G72T+WZDY27E2UhxRAm4MPRhTxWqCOs6OHY4x2Qdsqw=;
 b=HD0df5Haj/AFbxGbKco41n1PvKa6CLMqswLAGzmIzGdRjAEs0GfnJLJj92IFCCKm3Vernga+E
 iBGpVisLTtKBV2nM7Bgx3FZe9xadiIx0GzOForjakC0eN69GVHirVw5
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

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



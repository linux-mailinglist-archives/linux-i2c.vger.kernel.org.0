Return-Path: <linux-i2c+bounces-11294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41264AD2186
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 16:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E95916CE8B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 14:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6971DC9B8;
	Mon,  9 Jun 2025 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAHCndmL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE81C1D5CDE;
	Mon,  9 Jun 2025 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481113; cv=none; b=adFOrYFVIMVfzzYj4TJaaMU0jowtlk1X4Keqw2NeJEgekRH7WA+FvqkJcy3jp+XA6MrSrNOLcTscAIKP5VAbb9Zig3PzU5Rz7MrK4V9avAON6EAqkv/yVarEHeKX/ApQWG8C1alLk+/7KUxq/AX1RNOsDmDb+MtNzu+Jg9OIVgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481113; c=relaxed/simple;
	bh=SytD8kgCuxXBBFx++xxWqqIK35ejAFIEBKHMJoFT9+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CyJl9bs7xSJp0gtlxIuVeSgnUOsMJ7uwV8v2Bnw4r9iXboyqaeAi69LLgOs0TfgRurH3XqvaWSV61vpYv3rodf40Tw2mmhuww7jPw8dCZvWfLEOKTObWjWPwAJhqYjPLZ8W2OO/Bye10oTtobMLM6xGjvBj6eLWAJ71DmjIMfYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAHCndmL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235ea292956so42592255ad.1;
        Mon, 09 Jun 2025 07:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481111; x=1750085911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=hAHCndmLP+8hUU+hKVOSThPdjh8T9C+cuhdw2XpabHciLqkNMFaDrrH65Pte5wou8V
         QTQE1Vawar6lNDMuyVY/yyYcPjY6F03zuXvK445YWOx1XayvrDvOxdgRYlTBOGMgZ02b
         mzod99Ko4HN1TMKr2Bv//huHTaVoYpPlz6uJV81uRJOTNIJnE2kwxLPMEKQGAAIrzRTs
         BdFHO5LCoAnWG5t+h5nq20QUAlwjeghKjKmhCKXrBcjfr89X3dFHNc9BkhjyPrWgpB/B
         poEYZO3xWxAyjagyz9MIJpHAJJa7y5DRnEKENmrk1PnWxWEx7btgFqntbF28Z6LElT3S
         HsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481111; x=1750085911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=B5+c6Q74ZKqbFSw2mXANdnSIYlQqmsTGJgYHARvbJ1RY2QQIv0j8SIt25HMf8dQKur
         5uLrVLAlg13vguzmne2IB+wYrG5/4jlMpTqpexZqciyKjJpBMEK5L9I4ceJQhV6z2y7E
         7gg+MVH6LSvWGGOFkMN28ugmoejsLX6ZYRtxEkx8oMnJG+uer7bUWkemobxL2ElBTfgG
         Ibah5GF/rdz5PKkvqaR/UbHRDDBdSaiPE6SZ1/A0tlQMA7ctAZihELef62Crlxhxt9B/
         dBfXFLiOGxv6sPPYNrmjs8rc0RryWxsSrAWTxoIEiKM1zTTsx9QCPt5EV8TT6sZ2CtBJ
         pVlg==
X-Forwarded-Encrypted: i=1; AJvYcCW/HIRWYMEJMM+PlwbM7hmY4nTS/p0f6yzFp1BZLX1wnkwHMcXgdTV/+uQQ2FhL0C0HnEDNGJAzDxPXxMP4@vger.kernel.org, AJvYcCW0ur+Z15EKxPDHLgX8Syuf+nLr9n3PhgnAgVQttF0BmYXX0iJMm6DwjYTXj5s8WRiR05BCVJbKfJP3@vger.kernel.org, AJvYcCWMH/62JkPWARXNOEkviA83paEt616AP963mMOGbVZkeirBaSsONo7Z4MjTvYv+LODfij9c+rVP+MD0@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJzDzGQeT8VtL8KCkMQ+0J0NGGx10zwFVPY2CF3NhHmXtywP4
	+Uni59it58PWwV5Iq5J8g4MKKncHamf0LHIFg/P5ODAwhHcPi2aTkhzT
X-Gm-Gg: ASbGncsQj38hVUCjqW2OO/CbIRwYW60k6PgGzvZz2ZIwTCjUFeFoG6DWX+PbmXuuRQ8
	f64CXPf2bNyRURdqfsD9KEyqlRASam7vIyRktqy5nf518+NYf2AtHmSJIUP7y63+wODDFPmB9+s
	cur8agjYRt18UBWPBAnTUarwuxZnIkQQ9/GqkhN/2qp63m/BPLHYnHBwUXtdvOTICLfCEiO8Dx8
	1lsNOC2v/gRY5lcvX2LTdzbMCnhzppXXf9onHVcu5j5vx2DpFW7Ggmc6RgDMKxW4ZNqvLu93Bm5
	oh+ck52DPezx87kFgRk/IsHuaj0tuKEq+ftVpL+EpSC/jY8E8UrVaJft9NX1eJ/K
X-Google-Smtp-Source: AGHT+IHudanz/AzLe3suzWuVi9ir1ppPYX5nivs9d5/PLR8B0J0O/ktF/FMnClKF8ITjSwmoanaI4g==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr218896905ad.38.1749481111240;
        Mon, 09 Jun 2025 07:58:31 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:30 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:19 +0800
Subject: [PATCH 2/8] arm64: dts: apple: t7000: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-2-789c4693106f@gmail.com>
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
In-Reply-To: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2998; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=SytD8kgCuxXBBFx++xxWqqIK35ejAFIEBKHMJoFT9+Q=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaN2qKaij/1msQFpC8wl1rbodNpvJi4tqcsQ
 XcEw1C/niiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JDRaEACkXyzwdAoycqbt0sX7Vkmt+pta8E5FIvMUQez4KGhtDcZkBCEMb2RPYMKDi8kiMho+OtX
 BST4Jmo0b4lGxRZWlcPAQKnMcV4XNPHkk850aIWUyk+1s33ez33PnhD26tBRDqdLAdj65k4QX19
 r+gBYjAwLXrQptR0q5XxCFqSrSezk9FrfexrAoZw3WLEOV4Mmj9JPXj6CGj7JiSwUb4tq/MYAAy
 Hpga6eGvU4o9P8m0qAqqUnb/3mk0qpAOOuzWtdrB0ZIqjSSGoIsq8a83lMAi7NoAHgHnlEWj9Pa
 DjmeB+Vcb9utiAC9mSR/MmgHQEToSs2rgUOc/Fx2pI0LGdyGrcyAv1T2VHoNqvEnmr5I2ialY1+
 cUPYEIwdE9wDpVWgpQPpgxb9brNotf6QNZusDiKAkw2N6fU6xV/vaD4Bw8Mnor0GtpZhLYwCj48
 E+ct4NWgjJrSxRRf5bFcWft3jNuGJcAZrSQ7sA81f6TFDS9N7zZYJnTQfWdunWEmH9rxsA3JSHC
 i3iyvkXbwyyJL5RZ3fWnGdh9Xj6KktKvYClAdYpWr0NKUnxsQRodARauQLzP8ivLNhkU67P71qk
 PY0cJ+U7ifJqL40d6VSszxB0w9YkCCLbpPLAnE+D6kzNk8iEIzi+zC7XdTO5jCA3t5KWbslRycY
 g/bw2gFRY64nRKw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 52edc8d776a936ca5ba58537d4d68e153023f536..0342455d344474d34f7924a089bf5f5915e68d55 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -144,6 +144,62 @@ serial6: serial@20a0d8000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 174 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 175 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 176 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 177 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,t7000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -195,6 +251,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 66 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 67 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 68 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(97, 1)>,
+					 <APPLE_PINMUX(96, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(139, 1)>,
+					 <APPLE_PINMUX(138, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(65, 1)>,
+					 <APPLE_PINMUX(64, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(87, 1)>,
+					 <APPLE_PINMUX(86, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0



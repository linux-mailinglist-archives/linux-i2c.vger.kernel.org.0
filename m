Return-Path: <linux-i2c+bounces-11339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CF3AD39D0
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 15:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 828CF7A8E53
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 13:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F03A2BF3F8;
	Tue, 10 Jun 2025 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zb/qyCQN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DC12BEC2B;
	Tue, 10 Jun 2025 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563166; cv=none; b=FWZvjp6nTTQamQ54OZqcaJYpRWJKB4/3KfYbTXwfE9WI/tYgtH3NpzuPL7Dx7D7Hezxvpx4RNwWuIzuniRSNDrYxEO/Rv0WNNyW7hCv9zqcsl16WS+A5TiYP2wDtACFuh/Ng6TmsHedSTWEG0wsbyK6l6g0lK5snt3IzwnM5ruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563166; c=relaxed/simple;
	bh=SytD8kgCuxXBBFx++xxWqqIK35ejAFIEBKHMJoFT9+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpSnccNPOZDzUUs0959eWcMT6NHA4C1GqdocsmnDiGEVlisISmyQ8jzALmo8mNavHKHo3KwjWE1wai6lPHJuoWbGhYqT0L3MscS1f6JcRkMyyDSbooDxWiPXwvF1d0QLthxuisnm5bockRcWpbNQ+gWUQPOUQiRZ8CHW/Ghbps0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zb/qyCQN; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311d27eb8bdso3368466a91.0;
        Tue, 10 Jun 2025 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563164; x=1750167964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=Zb/qyCQNQcBWaq4cZtJ1wwVBcZZfJW1+G4meBvh87e1I8aMdZo39r6SqbbdOuaH+0D
         C4JiFj6ZrLdXTGN4z6FDUOWOsL8rPUzJrYO1P00BBIJM6jfm8EDx+WYcMZfflkPwsOg2
         hVZ6sKarF6Dnq2pcEihZy5nnb+jgVAQc5Pbx/8Lcll6GQl13FWmzzGfaKvrj6qjukQ65
         4RLJ+Zg2tincTlLKoXcKWZy5nEIOGgBjoLXPJwDV2i6rhvwx+xoe+KEWNhPZiziQsKz4
         RI7M0Uns1c+ogiHk/9BE8y99aOx7au+tYqQQ2L2epKU1jFxe1NJ9+gLWFm3Kv4iL9qk1
         q8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563164; x=1750167964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=JgQP9XEWmjHH9yppBZVpwf5glTJervZJbM8wOGWdIHVzi2ru8AmdYde1yLQo0t5g6w
         CsghQdFgWTEHD/N/bX9+z0rnFObSrGSCfXjDxmqHznemq4THSJO+557dStQVPpBTODqv
         FvTzBs0AePDBzs9IqJ2JsaINuMWkcVVXoCnOaGzs3tBphqZaNsRy/naabJgV/++jietX
         v2IdEbNYZlfEKFJL/6H6ZgdQYjM2Mqstgf+AcgmheAbQd+s9tjKbToCXdgn2Vqzb55ka
         aIpoDsHei31LK//lv9lGDtUnOw4OEE0q1lxUF4m1vxDmgNvScWcLzLAPCvGeW2dyfLm3
         bgiA==
X-Forwarded-Encrypted: i=1; AJvYcCVpAUmUVaT4iNJGVaJ7tC1NrLf/kbQqZzepM3ucPbcjCsaxaA8hzmLxViGPlf2DKlpInHFFDim/Kb8eF33x@vger.kernel.org, AJvYcCVvWJjQuYtint1pgX1IcbOpvbWXDnOURJ6C2ben+gwHNqvnD2j6OolMTQ+xI/ZFdR289NqccoBf9HYV@vger.kernel.org, AJvYcCWBqYs7rIffoYN8djGkKpOyPbPUWfsT8ouEepgIqO8yEhS3f7iZyi2r4few2kAyXuPD29d5Ha0H2BUq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84mW6fuKICk8hajH9swS0PEKVf9eFCdfeHxZ6b5ZSKEKSB+rs
	dmI1RJP+SiuqVnevfPgPjGlrZH9ecPlNLC4kCFEBFi4vMWrnG3KZo+7w
X-Gm-Gg: ASbGncvHRSyC+ZhEvr+As5aF4935FDA58OqUYblWJKVcaDDAFoNxIEJBCM4H/o951EC
	Z4iHm7LYnX9VA78oiOLd6ieUs5M/7f3S+7MAjQLOiPEKXQGFnWxLBv3cbo3cKNdwff+nl4TGcwV
	sO6gwET1nzT8rGgtkgeZjRk5zed5x3Lsk/RE/6P0O3YgTvUOEJLBXqHPgwXC5UIhD7RWT3/LdPq
	EbCw0pyaxuFVzyLeH0BdqjqmUdGnmEkhHB4L8cXoB+Q+WIqCFkJAJP+HH4Bhmd9OTb2VKv3XB/2
	IorzfzPi/6c7tL4t/p8DCDDNKC/kkYn6WLPTYUdA47d54yRvxxA1+FBeVQAKVtDd6Y0Nh54LGS8
	=
X-Google-Smtp-Source: AGHT+IFwMzsCYgWMT+CFDgevF6YB6l29l/wNFrIVqtpMe/DF3xOkCJ0luh7tYQ0NXpZxazDWxZ/x2A==
X-Received: by 2002:a17:90a:dfc5:b0:311:b0d3:85d with SMTP id 98e67ed59e1d1-313a155c54dmr3919205a91.2.1749563163919;
        Tue, 10 Jun 2025 06:46:03 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:22 +0800
Subject: [PATCH v2 3/9] arm64: dts: apple: t7000: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-3-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLe1rL4B1JFrm9RkyAgKXRWPFtMJrW8tM7O
 MExXyABjfuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JHcaD/4gnlucLyaM5enMPneKiFJG69Dk2MBczinSUzhxA9dPstTau2WigFdNG3O9Pn+gmLBlWd6
 hy9JF8XSapJ0lPUPw/tr+0CCiYrDSgKCK/xOGnx0/Tr+1Ja78stzi3IiE6wfnEwhZloRsPzzv1U
 D0i1ALLQPfboCG5Ozs8shcOY7yakn9Yr+45FRBAUZOA+YNOfjJAqb+Cm+yd4Zajy3EIaZ4lvhZ/
 ckdtWVV1j3QCKPe5vCcdbY6pNjRYnQwimfz68Cxko0KQMRTJJsG7CtqnXGNc8LMXi3IwNYHkeaI
 feK6nYhYOrJEUhlvvGWpCYyvK+DG1TcHUcD13L9gB0hW9Lp+KvIGnTbMQevtA+PxKWNtniDryMq
 YtkmsSum2xzBTnw5fUG0vRW8HV/ANeXCQmmIPtFFZaEgwE5u2Ml2fNhoY71nT4FkSOt9s0z9HoH
 KhNo2reB3Lp89XvbCDN1jG6awjhWUTBd5UbMZ8RKwu2E0J3080MkxEKpamIPKm7T0sxe67wZmHR
 krWnhiLRVYgo29SE3N3cYcV915uEaqlFJsdiR85Wm6J0p1XyB0LuRLc/PVznIjs6GfVENGCsYhT
 lozHRfibRaFR1RWOluCdZ1PPvpwS1FqUW4JieYjC/3pDeb3Vz9CIWP7iI8GNfrfqY6OG/OqC1Rs
 C+O/+TfkQCufZLw==
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



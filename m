Return-Path: <linux-i2c+bounces-11345-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D18A1AD39EF
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 15:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FB981889373
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 13:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97292D3A77;
	Tue, 10 Jun 2025 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dH8jjE9F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1736729B8DB;
	Tue, 10 Jun 2025 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563184; cv=none; b=KVMlp18ia47mCzm1Ip2sjCo1HqE+MPbQrKprddOoNdF0MrNcpaxyMsXk45pJMs8YZsB9qGM6E/ZLwH5JwntrD7FdM5nvVaaE0iOVARhlYM7tWbuAct1JbK67vmB4bM+GWEvwajKRmEGHz6ZGECug2CIoXwTmaDZI64OYK+o62dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563184; c=relaxed/simple;
	bh=onusbAGTeKZDibm8BvV42Zc7VsUIDMtHO+9C2/7TIY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkKQKkc84/BzkOIb5ODp8KlXLYuJgGVJQT0AsOJPoEPNAsZ9rurtPOgFuURzr/2mcvUutcSAcF+iu0nNagXwgTFf38N+WJn4BRezRVEm+/q5sUXZ8O7hq4zoH62A+aCxwu7E66gUj8AFCOags2uxqVdTcuLRs5OEmd34Mcm+To8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dH8jjE9F; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2f62bbb5d6so2769296a12.0;
        Tue, 10 Jun 2025 06:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563182; x=1750167982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=dH8jjE9FwQTxD7oiMV46IsxwcxbfBqzxtloBEa+m6GPC7y0EYpHEAgKn/F/1ZStLRO
         UX7Bhoj5Fae0HCthrpVUCfrFDcABnw/xw06RNMbhQjETasoRqcZcn9H+KUdi1ixQ3vaq
         7uJLlxgG7Yf1x1iI5wP996VZisy0D82qnLZ/m5oXeA2ao4NyDhQ6mBRdIC9bGIfVgUIt
         GeomClfGmfVG9p5hKODldOkeil4gO9OVVZBZNr9+G50ZW8VfBxe47aRLupktPWXUa9q4
         kES+5aqIqhXA/OkcrMQQPVRqDCw5pWfl7TjlGzLG3YZ+imKDb5op5+HjrT7BFAyxHMwK
         gwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563182; x=1750167982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=Ig3gCUTOEcG4gqSRtleSoc9gDuM9EMprGf6KIBjJoL59BWjcgKWtQwaxAUlCkg3jip
         IpU2UyDa/ymPd8LqNGuWBNAeeVvcofGmTNXwB+hZGmFpXzzztdwNOtvjqwpYrki7Sz1+
         dgWCHoxZBTBBMIM48KDyZZXcl72Fjb5/6xqJy1RIzTptHCdk1ZTnW8J+an9lbbxIzxM2
         3Fy2XDM1sDyfA7RxuKGm1S5QRvYzIkSo7z4ez0qzrYQVB6xODzC+hNJqa243mUpUCisf
         3qmMjgWa9QDlOsQPAjFrBPgQftsfQKcPyeyPtd+UBkTHsMvb6oGadeSIsy5PanIKTOn9
         sYSg==
X-Forwarded-Encrypted: i=1; AJvYcCUnXp3Ttehq/QMPG06BgHNPfSqPSwY5VQ9rv7c5OOGbPBEa2BPC6Ao8AiOu3lGknba/J4Et05QYPB5t@vger.kernel.org, AJvYcCVG9f85RAsINPgt5BkHI2I2eiJyUWxsMmQy4wvE81ZvnVFiZnanaPWB2e5MfYJtaCnbm3/jgiQ9zXIojKSS@vger.kernel.org, AJvYcCWazmA6qPu/XywT9FwvHXtAJlFNOZWkk/qg2qbB5r/wwaME3zEJYFsQ7zGaML6HU5hEAHZYF+cA4X7d@vger.kernel.org
X-Gm-Message-State: AOJu0YzMyfKXqBcsWtGKuVVB5NRv02b2MiAI3swpL7sOf0Eb/G1glKjd
	7AwZw9lyk9U+KxNdeBptKeT4WKSSfkDBdbWuCmkTulQGf0wt9YBul8uv
X-Gm-Gg: ASbGncsgTtKuMddVriIcJ7noCutRkPTRYxrOXthtghIxF0DIG4Upl9uUdehNuIfjq0d
	xB96ZIm4KuVAopTOdJZClRvSEjUns80mx7/YwyHGR07C4wAvKOIUCCrPWZBGww58rab1ZzPn30G
	ExLgD3VBlkfu1cchHr6TiK3czOvfjKzQhSq9jl3coQq5zn6Pp76rxxa3RX5XMQOb7ybaqr627kv
	dE/EgVAfdEO07nHQd8ewMIlP+ifpBdRva9z8jrmu9J1p+sAnGk+z2nZDAQHrgwsDss/Fk73QlR4
	GNTz6Cs/G32bzXDZYowjYqzl8pzTjFaKbKK+EH6t/DBilRhrt9AKc6huIEPoWjqU
X-Google-Smtp-Source: AGHT+IFnBfu22zv3Ouu8/mJ9OqridU9aBWmKTkj+xaTICPJRqJSyMf3R+DvVjf3tmKBM0nKTvRSwLQ==
X-Received: by 2002:a17:90b:3c84:b0:312:e744:5b76 with SMTP id 98e67ed59e1d1-31347695306mr25071825a91.33.1749563182238;
        Tue, 10 Jun 2025 06:46:22 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:21 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:28 +0800
Subject: [PATCH v2 9/9] arm64: dts: apple: t8015: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-9-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=onusbAGTeKZDibm8BvV42Zc7VsUIDMtHO+9C2/7TIY4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMfQB3E9FUiFPW5MawR4g4G1LbR7F8Nl1PM
 MDN9xnbL2SJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JKJ6D/4rPbodonMfukKOY2SD9RCuDnOe3XuP5GF8nzTJHzCP92+5tU6SCrGWa5TcqVVJv9mRFoh
 +Ycv00c9BGxiIA+SgwwnvQye5fPMd6X13C8yrvms11oZlXjtx017SagHToOn0PDDa5Xh2l+30zq
 EP0npSyXzbfTfznBR8JBgrOreDdHhYKUMzDmdhkAeBvSx/4iUOrM2R5u1HRB7lXwurw7hXLVIsp
 7xUbfRN4KC9BOK+iuj1QVWKAUp0Zim52gdpLW+D0F4paR41WZ6fnEG5nmbIMV9V0dHZEfud9o0b
 o0u+4F9hb/Uc/nO7oXP5spiFP/0s+MvNhp/nInshMGqN5ntO2zJ0ug/TIGIJgIA1Vie4jHM70bF
 MUYTbV/WTXvwEFZqwqHdaCDyB8HScYxYZFYfy19G7S5HqkjNtGZZO5mJDSLteuhZ82cywO0RDby
 qgP/MjAr9vo9ZJCzD182C6qK2IA2e8lgfqhCZxEiWccYyMqRT3qcMRJmh3+Loy9Ab2aHRWyvpps
 qxCQszZIMSA1V3kBQbK1VVpJA03oi+kXo+B8ZZTrbKAXX3C68bHqlxkpKm8+CUPRS7r6a6u4p4x
 kPB59aDz6oSUFjE/Ws5z87RkYQulDA90++2JjacdJYB4fD6TeA2XHvOAJt6fyV4qBIxsI6oBR6Y
 14RtP6csmMrWLpQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..e002ecee339013194537910db2168c143ab3d00a 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -265,6 +265,62 @@ cpufreq_p: performance-controller@208ea0000 {
 			#performance-domain-cells = <0>;
 		};
 
+		i2c0: i2c@22e200000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e200000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@22e204000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e204000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@22e208000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e208000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@22e20c000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e20c000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		serial0: serial@22e600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x2e600000 0x0 0x4000>;
@@ -321,6 +377,26 @@ pinctrl_ap: pinctrl@233100000 {
 				     <AIC_IRQ 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 55 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 56 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(73, 1)>,
+					 <APPLE_PINMUX(72, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(182, 1)>,
+					 <APPLE_PINMUX(181, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(4, 1)>,
+					 <APPLE_PINMUX(3, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(184, 1)>,
+					 <APPLE_PINMUX(183, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2340f0000 {

-- 
2.49.0



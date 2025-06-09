Return-Path: <linux-i2c+bounces-11293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE6AD2184
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 16:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3907D16C55C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 14:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2711A257D;
	Mon,  9 Jun 2025 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPLzWUx1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E07C1A2541;
	Mon,  9 Jun 2025 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481110; cv=none; b=WHErPS7jXY9BKQS7PmpWY4sVmmkPXvEcKTwBacKaO9skJmxbTwpgK4XFWwCzrFbfMQeB5ieIt6X78dg3ZbuF2nAQSQLY/UVxUaY0pGOoBJBDdHUxfol8YiQLqF+5Z/OLh+V0wOS4nVKxCLk3UagBx0lHOr3M/yRcUJjtHOJpQ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481110; c=relaxed/simple;
	bh=UtUXsBApERv0HSkBqesHqqsf4hnDJMVAjhLKU618wUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhRkKCWGmxdpZ3ph/HhBm34PC5lvGnT3nBi9fNsrTS+M0Xn1tnTDfELs00eYmEo1QKmKvhjOFt42yOKc7CM7iPuZl0FvZqH+149JaJYIigNxCTArAdeuxUc3AFG8RV+4P9HMSpQwCOp4wwd7I0koc7Gp3tKQsp4ZW9p4L9RBQu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPLzWUx1; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so4047384a12.0;
        Mon, 09 Jun 2025 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481108; x=1750085908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=;
        b=NPLzWUx19eEZwHjX6b2PpxitC9mB51t2chJQjg54XcrLGV/SJrRP9cYA0u1zL3EO8Y
         uwNI30wo9rTFulIeIl073znwRAp1qrUZVqC64JmFYAA1+te1HlJtu8NdZSF6dbD29eEi
         1me6xLqJ9qY4PjNXM5bEnfNaPRMjzAIyQZiFf+2ttKFc2Gcr/o+EtDe1bsqn93Hl13ht
         Cix+/I7Wmyu7Q4dEQh+0BQXCgJ/ffzgKrfXyl7+Op25m8097cyVUgOyFENBB05qhqOxH
         PEahXpQoonXLOm/GELlUJZuQdqOTZFmR6X7mL35jZummQHlQ2+Hi5ZBN6ot2KFpyTGev
         SoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481108; x=1750085908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=;
        b=IVT6VSRjJbyVJ+vxhOBrWYZaobTELW08qLo3ZY+a9ULz3h5aNrsiX+m0l20BhXnVCG
         mDnU/wB1FrlNmm7laCpobX2shMPqmx6P3aR7s8yp/PaGsEwAL6DFNV+PCfKw0DyonX/V
         YmDERdzZwwGBAVXjmtsOb8g/c59/mGWLOwOhmhfHno6R5vGjRePkUYW8W4ZttEiz/ARf
         A5h+B6Y7dRD+gkFlydfdE91NEzDWFmAhnmURiF+euD9+q1a7WbXTTB11kztlkTZB5zRw
         I3tSbdR44uKxeFoEsa2pR7jtLNdy83qxWr7gyvZZWwsd8lFEVaQr1dpSEtmr728jhvFc
         oQww==
X-Forwarded-Encrypted: i=1; AJvYcCWRg9RLchS8iYp+Ip9USEMpNulRwUo4h2Kn0r7KGsfBr7cwTFdvKuAUk1TllXE8EkWNgYlrZO9ZJVgk@vger.kernel.org, AJvYcCWyCcS2TLEN2ahXGEeAS2T/GMWgWadC1OES9KdpqCUNuL6kDcUujersucp8ssmhcd2eQ/p2GDTAZQWL@vger.kernel.org, AJvYcCXS+l69ofsYkqgjacA2PV9dGgh35iEDCQedGIBdEvMdl5vNXmaGNGCDW0cSzMHAt4gs6lPTc9jm2XxkzqH+@vger.kernel.org
X-Gm-Message-State: AOJu0YzqHhWAqF7Co2GW/LwfgQEpWEetH7Dnfu6HCX458V988e1e7Mf3
	o55evHinIQm4g9pAsc4Ie4NKlrp+XOegx/g70PuoMIudkdDFLIKhgnho
X-Gm-Gg: ASbGncvJpYfpBSS2bz/pSVzGKd4Wn6JYuLOx44G1iIDVI4E6zFIH7r4JcJelNo9aEDj
	pFkrlPgWq0Th7rJvTkmqt8gH/jE+J9wSx+zr00fV8SpIN//Zay7iGWtkBexr0zR5iu1yfl2KG7f
	D/05QPFnOSKuLJTSIH9yvHp1joFt4iJOsBvkHGzLdygFxY2UbHHNJIUo71Gat2WxrLzEYTI+SvN
	RT6PCbDfQvLdRayQtmy4It4wXMy5/wffjHR6aVOPOY6hwm5PLxfiAmlrPHpTiIRoN7xEJRgQxe6
	msuMeMKPfMqb5rFVpv/HG5UGTB3EHXHlCgV8r9LVu1++L131Man+zA==
X-Google-Smtp-Source: AGHT+IHlBqNiRN/VzjCmH+GccWEqdp0qoeYXb4Bn1Al96nJIn7YSkT+omzOCGqLdFgbUeF7GTn8deg==
X-Received: by 2002:a05:6a21:a43:b0:1f5:9d5d:bcdd with SMTP id adf61e73a8af0-21ee6851aeamr18131835637.1.1749481108259;
        Mon, 09 Jun 2025 07:58:28 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:27 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:18 +0800
Subject: [PATCH 1/8] arm64: dts: apple: s5l8960x: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-1-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=UtUXsBApERv0HSkBqesHqqsf4hnDJMVAjhLKU618wUk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaMq1tbvO1pHM4ifn1yfNOZ+7YnNCeDkJchC
 OWw3fzANbuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jAAKCRABygi3psUI
 JKZyD/9GgjSg0Tw4TSvf4ue2tv+yyhIWjc6Xj3LpbN2mHLSWgl6xkpys6vomEF//9NaCKiWvq3e
 9uaJSGdvP3PZQsVYpd+riUXwsdKndS/xPI/82j8e0pEdQ7+XXggqjWjQ4b8Mp+qHSv4FAWNOLGz
 WOsHsU/r8U4077WjWetPAcEInMUgG7VGFIaOKgwEbpaKOtQyDi8wx2UgVft0wO7AMjiuP9xQZCl
 TOmVfQXOTlSqTmQKcI7qMo3brDohSbJumG896goKofidmw22/s7YUR28T/b3eRS/7GqCwuws70n
 qICo4AXPr1b+tYRW1aerQzxlxkL/oK3/pWCwZ5z4eI7DqigTAhe8G64/aJ6rWdU7SWK+kH43n3G
 T8Deu3zhl7/zq7xAOo8DA8AwvaOD42Lsppun4fPdzxVf1Alr4G3j1mC1pTasv44ZQGPGDbaTmF8
 CMvu34V8tmzN7SSw/9M3Ll3JC4HEYzrcn4n143IqZnA8tpQ7pUkw7vjyumvkqAjmOV36YwN3g7A
 ZHusSectPWalpWiQQh008rvE4PnwOoeQx/hS2R3uBvF+YFTiih9vVFbKeggQdDtnQ2unMFj2FpI
 Mw4/ztyz6RwQLM7o8qmFy13YRdHmeiEeIzUzUsrk3TRgRWzI+p2Kv9NWxFucsdm9sXdKtSifiCn
 9TtI+4Dmdcyl7FA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 5b5175d6978c45052ded495fc0d18ee3a8fbfdcb..462ffdd348fc893d8e1d597b11d063dc5f88bdf3 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -89,6 +89,62 @@ serial0: serial@20a0a0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 154 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 155 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 156 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 157 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,s5l8960x-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -140,6 +196,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 112 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(81, 1)>,
+					 <APPLE_PINMUX(80, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(83, 1)>,
+					 <APPLE_PINMUX(82, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(101, 1)>,
+					 <APPLE_PINMUX(100, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(172, 1)>,
+					 <APPLE_PINMUX(171, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0



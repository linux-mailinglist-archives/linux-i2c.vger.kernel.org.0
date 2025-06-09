Return-Path: <linux-i2c+bounces-11297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D93AD218E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 16:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A5B516D48E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 14:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2C820A5C4;
	Mon,  9 Jun 2025 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuJFyGoi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315CD204680;
	Mon,  9 Jun 2025 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481122; cv=none; b=il1CddRzHXz+6E58SbFncNQwXlNjagAN4V1cM2IlN9LGmrfBqwjqkrGGhFkG2tg2jdmwQiMftfKP79Ii6DnDCuoyAkmN3xj2GPfK3y/O+0M+m8BHQZthLCNYwnxoA+pR/tvgpbRzBGHJRGBgCMSKhPf7HcoPpnUHY5aEi7y7cq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481122; c=relaxed/simple;
	bh=9566gmKhrX9N7D4Gci4+NELLJwjkHJyrdvGevl4Fe5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeFYSzvELCiOpW9h9v+6KzYfp6HG6oQfiBPt2l+ugCdEkLEdBBaSB6QNJ0rVTNAgmlbC1PH+IkuGj34dBikcpT6fUAUsnw9ZL3OY/dnR+xzMSRv0FAI8plr6AXpCHYaEMnK8Q5RXCDaOVMtDImaq+nYz/POB3pwgfCJ5T2eoLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuJFyGoi; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7482377b086so2094450b3a.1;
        Mon, 09 Jun 2025 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481120; x=1750085920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=PuJFyGoiDV9df6qNowiNL04UOTq54QvXeGpgnwywbeRZGhraoXF26Tuj8s59s980pq
         g+HLCigzRHLsyQSfmcE5hCSRtyByBASijn7/ijGJIjUCKHJoLiQfjbOYfLKc9WlqnObI
         jgqgb7mOh9ciKKeM2TlC09DhO2hc/ZjM7TOoRSOfq0LRVWxDMDDjs2XWdHlkZ5fuuvjz
         dNxs9Gz9J1WNKRddip2W1NEEX6pKJLZOoB77M4TYJZDtm2wU5vSOfBUhJxR+cT8oR7HA
         nqjCzvs4zm204jwIDAfBCxPkltFk2KNUCqG4a8+Xjz6mhb1oXTq6xZWPQGhRGoDb0mWt
         5tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481120; x=1750085920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=J41Leww802ikE66qx1UEeRnjDFTLLYyI8e+xeUQqNTLwp6TviuREZljeMpwA8pNJ2n
         IpKVL+XEZ6ThUIyi7TWRbG54ZP5IZEXqIbijbBxEVBDd+81QoesF8wIfgIXQEPS2t5UY
         zOXkdDQXKo403teGnFHOBdarFfbIhlVSoCpAvki2fsVZuQJty7YygAiZ1uwOemHDRJE4
         hvwM9mdN+zdayCaWUDEZLV6bE+IClrdXkPRdEi+RW6/LkB6+igbS6SA/D+i6P1ISNtz/
         ZR1oTnalSFJLdWA8pmGpnQbwCIMsOuUeW7ZoS77RuE+07zTkf2xxkY61GkPvihJsjKr7
         cV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+4NYY36/ZVvAtJYL+a0UqOUUCfgVIWB1zoy1e3EYzptvKFG9wuUW0P/JPG/Xhqs4Q3+jfNVqsFa91@vger.kernel.org, AJvYcCU/a7JcZt6HSKEdwii6PLgfpsd7EhvhN+3JITKwv0uL0ECeCoswq1sZvdtR52W67rTYd54MrJdn8cxO@vger.kernel.org, AJvYcCVslyeqiu61HIDuAKA1sydsx/hfjQly3CbRNLCsgoWEvPlTLab/JQLnU25bdiUo1Z19O8NjjMrosbHvz/gI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4E1wVovCWE1OUJPKHZ2AysPjZqR/eCiLve8rWx9ghgJc1bRQz
	lNAkCQILs2imoaea2OSbZgkCtqcqL7VCnzPw0Nebpax4d3YOMgELExCvZpwc9w==
X-Gm-Gg: ASbGncswk3LwYqUR4U+IMXzQn5C3o0ZtOxA3NibHu2XmiyBnfLcFnld6KhHid755owx
	LIV4vRFFWH3hzjp0Lzp2EfFZCksFEr/RB8LbqSjXNXGti6ZyJAphpClLu36NJMnhMPBUP2Uw21l
	SybkuMuLGQlwjqyL5ixZUe3+/6YCoi9nvnl4FPToSS0RqTTa4uQ3LsFkMfEB3M9F+WEMv47E+NQ
	DCRogdus7W6bTDUXbzxEQI1ojdo19RxMpcgrBbumVsiFRT2OpW9KYBZPL2gNH5F8mv9NysjJ1PS
	8ibc9Y/Z/XlXvaAzafGifuEZtLCnZzAyHrP7e0XBZSzhX0BNnaIvwNgQ+lr1Lcg8v2Op0rrPe1A
	=
X-Google-Smtp-Source: AGHT+IFw8IvMKNIWd5gWkVBoQRrM5vUVEUtBsHNh2RGRc9tiIamDx3Fd6bbvQwFp4qtR7pf7qpf45g==
X-Received: by 2002:a05:6a20:2586:b0:1ee:a914:1d67 with SMTP id adf61e73a8af0-21ee24cbe0emr22088573637.2.1749481120337;
        Mon, 09 Jun 2025 07:58:40 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:39 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:22 +0800
Subject: [PATCH 5/8] arm64: dts: apple: s8001: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-5-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9566gmKhrX9N7D4Gci4+NELLJwjkHJyrdvGevl4Fe5k=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNxfcAbW3TYkOeYhxAMfsIgBzRWfGSZbef7
 23Ix15IJ4CJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JEAcD/9ErpqdBthzHsKIUK+k175hpDjDyj+anU1uwYkwJjtMAL9LwY43R05KWoiTW/n8S6oPVE2
 lzfDtL6xXQhdryBbbWF1sLB/OwB55cdFCE5at1rFudqKmns1IVdHjMVm3Vb+mtFbOUb9aEAXVRS
 x1NItqPe00vqoGsJBd7mzon+SFIH+8DquEzjt7Qp8RLJkdW+2EI6QzXVqldnVGrcCNsmlS5VAF/
 J9t7/YVXPAs5/y/+6U7lp/Q4/2DAOOu+oWCLLKFCdRA175DeKn/s/BxPRScookg+SY6u7gB8riF
 46pDcoPJtOXP38FCHM44uR5nospwFG3OU6GJp6pZ6UcYv6pxHhJdSU0rpPIsxvSd6Q9PJbuVJYC
 5huGMTnsw66AhStMhDDgQH1EazsbVAaggLG9h2yDfPX8P1bfLiMyHSGBgnqOxGNQ1tLuOzDB4Fq
 i9M/p2tNaeMGXJM3sZfMHvh5XHJm6Hu2ITsF18tgf7x6JZBzM9QcHs0zUW8KTRoaT1g66Gc+9gu
 5A76TnGMK1eZMbEhLOlB9zqfdluhiPsnR6pogyYBMJS6kgiGhBsGeHBktOOGM8GbCkw/Dvu1lgY
 LNr/vdwnNG6iPnrE1gep30gil7258s+kMQuM7W2CQ0cibx8oVUNpdKCJWQcgce67/1jPxZ0LJG8
 20q2BXSQ5Iwm3tw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index fee3507658948a9b4db6a185665fdff9f5acc446..b5b00dca6ffa4caa1d504860693da001a8ced80e 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -137,6 +137,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 232 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 233 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 234 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 235 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -173,6 +229,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(165, 1)>,
+					 <APPLE_PINMUX(164, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(178, 1)>,
+					 <APPLE_PINMUX(177, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(132, 1)>,
+					 <APPLE_PINMUX(131, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(115, 1)>,
+					 <APPLE_PINMUX(114, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0



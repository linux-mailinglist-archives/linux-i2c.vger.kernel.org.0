Return-Path: <linux-i2c+bounces-12630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA45EB43E23
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A67017AD468
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7561E3090D2;
	Thu,  4 Sep 2025 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFN2t3q7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4530307AD3;
	Thu,  4 Sep 2025 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994840; cv=none; b=t27TVchEmmScbdKHtPrClwWiTK87/0ecdu00IB3UOdu4GOOE8g3kRja4AjHU5AxwIyrVz/9KVeUOAJlyvQ6krGB442cKQrat1JurTHwZTeMOV4CL50Kjz1OVM0blSvZx5JSkb3UCnJWlQFRji88ZPiQi6TdUJgmcTyDEoIO/rhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994840; c=relaxed/simple;
	bh=2QadQ6p8DLVRx/cTe7HdT6hSMdg6XZNjMfLKvG2yQww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0C56E8i/H+Sp9RKYQFuWUkqjqthGXTW5ci4skZ8Kp9rPpCP0YtStRgHJisFRYFY+OqsotYxeUcf/3Rq2sJo7EG8Pipyj6ZhRlLzYq1taNruQdnQ1LrLMXVC8gvly5iNW46hNvHAbkNYou9EanLmsHFVyen1Ph82FZ76tKiqdng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFN2t3q7; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-80a6937c99bso113822585a.2;
        Thu, 04 Sep 2025 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994837; x=1757599637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQbUui2bkGKG7EBeLpHjxdTepdI99tueiIT2G5JOAB0=;
        b=JFN2t3q7xvpap1qRJyCsV4n8YgHvMBVieJeRBr2WpmoF0Ywjsy5LdD/cO72AjmA/wB
         RY+mbEshnPKQr6/n6bm4JnczASsOTYzu7ZwWN/YX75Rg5+oD+Rfyy2UUwoAuMpyoNj8F
         G4VfDLKIBRXADO3zQUf86teRTanDeCSZM3rGEEXz6jyJX3xwxDtYD6crYSxTg7d350kp
         +x83VbvpZ7U3uslIEVY6Cw2dxMI6Ino0sXuxde7RX0/DQzp2xpKor7pI2zvIDzr2uwLg
         RWxCAr6w22kuvCZmXiskisBn8exjLYWWOXul+8YVcHSiqoVV9Jdx0TjYARTWZCP5lfXe
         dnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994837; x=1757599637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQbUui2bkGKG7EBeLpHjxdTepdI99tueiIT2G5JOAB0=;
        b=bLSbaHwOmFMCzzM//d+7EtUjfMET8jXcXLwGMISXXOhDUcriyz6UOPYk0xpduA11ag
         4Xd19We4DMI1SRk9uIcSoFXJU4nMT9RNIkFMwcJULA1pWEHLBuh4XpzLvNE9ddmyA/+q
         cw09LNuG5E6Ql2aCoVb+MuW5Te5irAAwNqrGjye6y/fHhgaZ2XvyrtvLxEEWK/OqiQUW
         12RTcerlZBaQySL0ojq2WRiRtQAay2CwEQKT8W/dxrB8aC/8X70CEwSngCge4DTTTkUl
         zFEX+QwlWO8lsaF6X+o7ZyBKuw/69As2Wlmb4+rJ9A/d8C0k0ls1wPJcfxTi7/ioefat
         +2Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUPMNl71VcCsxR53wk5SSURETBb2Dv/vwneemKNYDQ+KleDY04AWlgpR6Iu+jeMaoAidB64cJoTdPqV@vger.kernel.org, AJvYcCWLtMbOOyfp2Pldcfe+Bp69Ag7fGzdiijnnCdbWiuHtgDjpa/dwwys4fGOrPIxcMt45OLgUf7ZvBVhSw9fE@vger.kernel.org, AJvYcCWnwE6ww7VTvllsUdaJNaFbHjPAFJrQq2KW1zMSMvVHrDxUbF7HnZYnQuZuenZj6bu67YV2hUBHUsyS@vger.kernel.org, AJvYcCX/kUg1gc0WLoTho1bmuhXRHR/W3D0hnAsZaCe+1FL2zognGlZpM1XKyaCkVNWzT3JCEoD9qxaD6Pb9@vger.kernel.org
X-Gm-Message-State: AOJu0YxEtUqOT752+9ssUaT9k/ZgZOCwDxcEeVOSkGcFn1d8qeb7fFz1
	m2MmrKfXHYxrRWcQnNHInp5Fdv1D9HiF9748l/MfvR0UPemdU9UJUXs9uhx+863I
X-Gm-Gg: ASbGnctL+Xd0UuGC76iJXZljf7pZD0H/T43Kg88LHKY7feS5SX9trbrhyh9Ug1PdXOc
	fHg8T6VYBcvU9kyn9prC9ksMczIrRrV/ZtxvyPOZWXlfrf9oVJliYott/vBUdJYzC4QXDsZ3I3A
	BYuUKxFF5rh/XKrIuh/ATcsdkU9Y1SaZb0oeHbqRp83yIhDSnI+ZDcl6MLmJK0/Oa8BXHPaHIWS
	JDaWI77NZlhof4F8+5AEK4ZQNVZNGFZSclkNanoa58VBPKWogV0l8j1KcfEH4PBIcyuN0RnvSg3
	8hADAxD0sMmj3qiDTFL7mcTG86/vJQikBXGDxxI68KFqECq30B40E3BdfUNmTfxHlz76f1U2cJW
	ucAFyfDy3MuUyd/B1BJpNjWvjTi1EiSvZALVdETYSCaMUNV/DqA==
X-Google-Smtp-Source: AGHT+IHq/xxFdWJlU+2WryWLfgdKbagbPMPj9QUjM/EX0bmWcPN2dNhctsEDsJoaBCr6UBfUzIFnyg==
X-Received: by 2002:a05:620a:4621:b0:809:e8aa:aa89 with SMTP id af79cd13be357-809e8aaab57mr909452685a.14.1756994836809;
        Thu, 04 Sep 2025 07:07:16 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80bdedfeaedsm212280285a.70.2025.09.04.07.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:07:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 04 Sep 2025 14:07:14 +0000
Subject: [PATCH v3 4/4] arm64: dts: exynos990: Enable PERIC0 and PERIC1
 clock controllers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-perics-usi-v3-4-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
In-Reply-To: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756994833; l=1581;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=2QadQ6p8DLVRx/cTe7HdT6hSMdg6XZNjMfLKvG2yQww=;
 b=lhQ28jDDQdtdqkS4uzcvkeiUDTYYHpnSRGBbH3JSREg1X9aSx2b7oxOVidB1+ag+Id/8EocOy
 SdDO4lDJsJnBk0iZx1BQW2zDy23X5do+OlT4DHo+XBt+zMPTK8f3W3R
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add clock controller nodes for PERIC0 and PERIC1 blocks for USI nodes.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index dd7f99f51a75412f5c3b91c3425a63652546fa5e..418fc59fd9e9122f3059482276d3388920fab382 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -225,12 +225,34 @@ gic: interrupt-controller@10101000 {
 			#size-cells = <1>;
 		};
 
+		cmu_peric0: clock-controller@10400000 {
+			compatible = "samsung,exynos990-cmu-peric0";
+			reg = <0x10400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		pinctrl_peric0: pinctrl@10430000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10430000 0x1000>;
 			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric1: clock-controller@10700000 {
+			compatible = "samsung,exynos990-cmu-peric1";
+			reg = <0x10700000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;

-- 
2.50.1



Return-Path: <linux-i2c+bounces-15238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92337D31FD3
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 14:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 357BA3023E9E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 13:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFFE286405;
	Fri, 16 Jan 2026 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Zp0nU2+W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6742877FA
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570748; cv=none; b=MZVbNKAHfT0shqfwd+6iSqFuT2Nl4Ap9b31270FqH6o9/RbKgtYOuPKXyAW5hsSKNbVh2YoELFq0IjKlDIXdsX2LAsWziusqZdB1xmyxtoqUH9Iwlgq6xUilZyimNI4TZC/pSDUQ807tmN/8BLskmipvSO3+WHT3MdYW0UYraqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570748; c=relaxed/simple;
	bh=WtTP4Q+pd0r2GTIiE/rKycdBfVnflluT14Fgkgdo+hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vj6yueSCRflQph5Q70zH8iIVz0vNpw2pM0QYpp1FjSsDPAZwVKR50FcF1bDF7Zumk5rBP8Gsd9looUhrRMvwGw3isiMUFfCd1Jn3WvKct4VkppP3rVyIb7sNVj86r2cari/SZ8DquViyVkI7shnazq7bBMtVnMyQnwLfWwkXk3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Zp0nU2+W; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6505d3b84bcso3144969a12.3
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 05:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768570743; x=1769175543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4iZQThVl/1y89JJfcylszV4UE/kUt8KV2BoTPAif84=;
        b=Zp0nU2+WHNWeWn0jPZqyl4s7FFj2S1DvQld4vE++8ePJpSTwqTDTa+EhqSuXYN6bQq
         o4q/PobBxrdLuFRrR/Rk4/3z2+0X2zxAF8s+QGTsjldE3ahKbFPtJvj753RwA/003eFb
         IuwWUJZOTr+sLnNT/0s8+wcdzOwsDqFpb3D1ZCza2tcI3KcIlnMEDKTIlyqHjRq7kJxD
         6LhWr0Ro9a51NZILVMISk21Js/1eO5zEXJqGkAXBzFfnBYNEEA1upitzYbjB4Fm17MJM
         6TuHuNcuI4h4xQI755DzZMhDadGgSubFNHZzdg7MOjL9EnRwGpp4CgW4uTgWpP1SdWP2
         SQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570743; x=1769175543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H4iZQThVl/1y89JJfcylszV4UE/kUt8KV2BoTPAif84=;
        b=UKUcysoaSib3fa5SiZlRNnOQchAVj1Ck/8Mdwsbu7zRCY/dS8EUqJVn2QWv6iBUcx1
         ZMdfXQkh1SVa0J55alakplFvPTwgM4t/x45bZhN6PFSZq4kXY7T0dysUv/lEpmTK2E+c
         Wc0TmF/Cg/xudMzIZapiOk63uSM6nwkTTOGmnQzWuWJKJ9c9YJR94r0usXWJB28jDGva
         RzJgDuVnKKzDXLUIcUx5fsWnPViGJJjIyGkkaQQ8h/sPfgmyTfy6fbwr0PSuDMWC/4fA
         0f7N9qgi59UisFgEM6FHsdwiiugy11CCP6maYYT8NSa2H3z9mte7ZZWzbG0XKolfEEK/
         ulYA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Z03+JU4I+RBJDnHzZ/jRCcfoQ70nLq9or4NVwXlhLwTjf1GSL5xT3zrqOYI2Ib2ooQidOmDX+DM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYcAr+sV0dyx0VO0v/7dzIFtcU8aN9C80i3wW+PDf4LDicCQxU
	gRqMcOdBEHJReUEkktvTv8T3SKhmzVSVidJUPAkwvAKQbRijgis4PX3sBe4jgsYwFyo=
X-Gm-Gg: AY/fxX6g5+SjK3ztpLSeLyE0CD/TvbjI8HIl2TbAd/T2H/87PwrOdwuObGh+iyqcUaH
	gOFb386YhvCjECCrwQA8Mdz6Y3rlHc/XsNtENsmW8FkYkd9t+9tEW1NBRq/xF3qQFqaipSAY8CF
	lJl3Dpm83rXPQcdGvOLCDh1sO5h3vfw6llGzH2IG6Qympnw38EV//Tmr0FoyNjGyLXWGNH4cpKI
	rI3Uc985jOqR4GOiIg9F35ue22ynPsYZ1w7ueeKuWogZyVp6wwN2ZakOkubSCW/LLcF625+GKkj
	jWHMUBBnjcwcUqPyK+S7nJ1DjBjYy2nX8xGKNtFThOwgfvJguLZ7SDuadG/mZq2jEjSJxInuZpi
	IBVgR2tAM2JHtKtjH3xSQaMyeGXLY1/BlBNmt+LjfsEYXh5HhYRlQeC2nVsRFLKaTzSPnJ68HtW
	pPwitfQCGJPoJ9BRUOwrbAz6XHqbTboQWnO1i5cu6av/rCZQzdPvV9QlwQ7hhvUuwn
X-Received: by 2002:a05:6402:430c:b0:649:5bb4:59e5 with SMTP id 4fb4d7f45d1cf-65452ce39famr2213004a12.30.1768570743300;
        Fri, 16 Jan 2026 05:39:03 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8b7fsm2495528a12.27.2026.01.16.05.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:39:02 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:38:58 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
In-Reply-To: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768570739; l=1663;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WtTP4Q+pd0r2GTIiE/rKycdBfVnflluT14Fgkgdo+hg=;
 b=Tlm9u6xt3xaLwM3g0YMIG/P0gmiBgjT0e3aiXa0JdE+oJH4t25lUsvfkeLG18t+EgT3l2SNcH
 PcEmJt/N5cADoY7oz/lCZC+XYi3k6OjJi+w/AD6dm/jT8cEHEfhCvRR
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the CCI I2C busses and add nodes for the EEPROMs found on the
camera that are connected there.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 7629ceddde2a..c4a706e945ba 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -529,6 +529,56 @@ vreg_l11f: ldo11 {
 	};
 };
 
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* Main cam: Sony IMX896 @ 0x1a */
+
+	eeprom@50 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x50>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+
+	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
+};
+
+
+&cci0_i2c1 {
+	/* Awinic AW86017 VCM @ 0x0c */
+	/* UW cam: OmniVision OV13B10 @ 0x36 */
+
+	eeprom@52 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x52>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
+&cci1 {
+	/* cci1_i2c0 is not used for CCI */
+	pinctrl-0 = <&cci1_1_default>;
+	pinctrl-1 = <&cci1_1_sleep>;
+
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	/* Awinic AW86016 VCM @ 0x0c */
+	/* Front cam: Samsung S5KKD1 @ 0x3d */
+
+	eeprom@51 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x51>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
 			   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,

-- 
2.52.0



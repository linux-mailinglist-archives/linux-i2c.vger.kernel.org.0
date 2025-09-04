Return-Path: <linux-i2c+bounces-12633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BDBB43EDC
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2724B163C8D
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D4230CD9A;
	Thu,  4 Sep 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJkMUK+9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2B530CD87;
	Thu,  4 Sep 2025 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996292; cv=none; b=KAILQF7CVqZZm3+mf9SbEeaTC5qSzw8QUDoISPEutYmNoiAzpMcL3Y8tMORofCDk95VzTwz+UkkweOLSLs+dLfScz19CwWeP/1GhEAMLpoDEdio+F4jmdTN6viT43AFttCJKo1XnSJ+b01tiEQBm46op00uU3AWa1bjD51f07nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996292; c=relaxed/simple;
	bh=iksx8PUQfiuwmD8CdUdvoNW6nuYCyEtsAWPXEBR+z8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J4Kd5GxTZmwuGkpi9a9hPEAW1PAwjOcZFhKugmVI/wcWadESf0AJveEXqiH1LVFCBWrJS5lZEFlP3wPRoqPPiI4sHo0sVmoQS7iVAJOIvApyuGxemR1aVrWGkb9qrV/hd60tuvyQoZiJNIVmnJ3AngNG5dwvzncVM02yF72DtLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJkMUK+9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A46C4CEF1;
	Thu,  4 Sep 2025 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996292;
	bh=iksx8PUQfiuwmD8CdUdvoNW6nuYCyEtsAWPXEBR+z8I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hJkMUK+9GMJnl0bSlsXtF+rt7p26ZrWXxRJltCYUBGfmovUm06w88q5XLNBpCihH8
	 o/KnOQqpcT0vLdPl/Frmp3FEN013iQ+VMsUiwmWl9pQY6TOoMSja62PfkByzqnFFnN
	 PKqMuJ9T8cthii85/A8mPX0JQ5+tGIYwWOki39lrkD46dtefZGdUOABpvcFMrwaz+O
	 DaBM2zRgraQVRdyynIzY/f1gFDI3ZPUoyvjIBrXTb65ow4M8IC1CraFsdvxFc6tN01
	 vXwdv3PulCFKe2lk/Z6Cs0a820YoDag7VlPsTYrn3Z+Aaer0+0fvQd1uYTkX1/MA2N
	 mucytd3LwjZRA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 04 Sep 2025 16:31:20 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: sc8280xp: Fix CCI3 interrupt
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-topic-cci_updates-v1-1-d38559692703@oss.qualcomm.com>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
In-Reply-To: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756996284; l=1021;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=n6oILZSJgSYg8kPWee79+SwLLdbG2n116e+YMKfn3+g=;
 b=ePjBofrdxpcTUHpZ01kswVQ7eurRMb8hHvDzjkCHQFfN0exoZlq2ybDXX3wtLMIhJKZ5uXjmB
 luSR+UCFSlJBO5snutg5G2pMWoyT2qsPPFxcBQ/iagqJZ1G6X/zQR+0
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This was evidently wrong, as exemplified by the core failing to reset
at probe (which would be completed by the IRQ firing).

Fix it.

Fixes: 7cfa2e758bf4 ("arm64: dts: qcom: sc8280xp: camss: Add CCI definitions")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 225233a37a4fd9f3d65735915c0338a993a322d1..18b5cb441f955f7a91204376e05536b203f3e28b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4292,7 +4292,7 @@ cci3: cci@ac4d000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4d000 0 0x1000>;
 
-			interrupts = <GIC_SPI 650 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>;
 
 			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
 				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,

-- 
2.51.0



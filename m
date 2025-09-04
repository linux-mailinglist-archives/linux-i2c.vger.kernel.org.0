Return-Path: <linux-i2c+bounces-12640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86778B43EF9
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 203CB7B0C2E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F028D321458;
	Thu,  4 Sep 2025 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C02U6Ifz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BC3337686;
	Thu,  4 Sep 2025 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996308; cv=none; b=FXs/a1FDAFwhwpszMVRI2Kp8Eiy9L08obsy3MoCCdzqyVMFPQqGOcrU5i2ycIdyRotsrzCQAKH11/KXf2tPM5yU6opVT6FlsdDGJPDNxGkkl8nuvDoyG9A3vqzNos1O8KhR3/k0gIa60x0qoLmKuzn9wdM/FefQI1N7qH4u6S2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996308; c=relaxed/simple;
	bh=zrXW+Azg1ybj1TP3cpfO/sfkOo2o+dZsnZjYmLh/LK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rpErtZlkU2h1VczCFgABIR0rB3HMrMoEYqo9hxhld8oF61UJzo125S0+pBWFfv1DG1SY3/M34+71ru21+TBMGVQLzmHmVlo7opYrEPOOJchLCkNbBDIVt88gkOs2DmB7jFD2yyde1pOIjBNPQJfuN55l3xFvrxt3zb+6CVKk5mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C02U6Ifz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8F8C4CEF0;
	Thu,  4 Sep 2025 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996308;
	bh=zrXW+Azg1ybj1TP3cpfO/sfkOo2o+dZsnZjYmLh/LK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C02U6IfzCnjPntWkpqfN55JYi+7tR1UyxDv2EQdPD5QKrddYeU6thbFlveMQMiZhz
	 ETaW9jJ5wOR3oGI/1nw0RBNOlg7rSr7+ye9hlOIobPvP/M2Q4JiwM4EtOcYxjpTE8t
	 xtOtcJk1pFzU3v3KDfNUJA2Kec6dpefNVU0cl7TXq5TeptIaX1JTiEwg5l42oaM3mV
	 9dHjPg/lWCDBpkdEmRpWaR6TVSDjBXubLoZY1A1U/rR432Sk8EKKcJTXHmHoALmRGp
	 o3qVa8wg5oqV4lzYDjZVq8V/W9swLAZQLlayaXKAhquiRkdOlTdgSn7XHWJhfT4MOh
	 6jkkhdQn0raLw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 04 Sep 2025 16:31:24 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: sc8280xp: Add OPP table for CCI
 hosts
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-topic-cci_updates-v1-5-d38559692703@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756996284; l=1943;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=s0obim0MuDOlL4+p0Nk62B+LrJ+2kyEd8cmm4PAWtK8=;
 b=P8CmCRAIy6ipK3s7L7LsmaixnjgqhLcOehR6tKYWKSMguFg9xxmQpO8hqbbYYpglR5C5yzqSV
 1l4LC8ILpdyAsn/Z7oQUi1WqP3niXbvTVRyCQs5eBoYl+Hn23uuMIfj
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The CCI hosts have both frequency and voltage requirements (which
happen to be common across instances on a given SoC, at least so far).

Express them by introducing an OPP table and linking it to the hosts.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 18b5cb441f955f7a91204376e05536b203f3e28b..c396186317d49f411d7162771a358563329a02a4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -391,6 +391,15 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	cci_opp_table: opp-table-cci {
+		compatible = "operating-points-v2";
+
+		opp-37500000 {
+			opp-hz = /bits/ 64 <37500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+	};
+
 	cpu0_opp_table: opp-table-cpu0 {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -4181,6 +4190,7 @@ cci0: cci@ac4a000 {
 				      "cpas_ahb",
 				      "cci";
 
+			operating-points-v2 = <&cci_opp_table>;
 			power-domains = <&camcc TITAN_TOP_GDSC>;
 
 			pinctrl-0 = <&cci0_default>;
@@ -4222,6 +4232,7 @@ cci1: cci@ac4b000 {
 				      "cpas_ahb",
 				      "cci";
 
+			operating-points-v2 = <&cci_opp_table>;
 			power-domains = <&camcc TITAN_TOP_GDSC>;
 
 			pinctrl-0 = <&cci1_default>;
@@ -4262,6 +4273,8 @@ cci2: cci@ac4c000 {
 				      "slow_ahb_src",
 				      "cpas_ahb",
 				      "cci";
+
+			operating-points-v2 = <&cci_opp_table>;
 			power-domains = <&camcc TITAN_TOP_GDSC>;
 
 			pinctrl-0 = <&cci2_default>;
@@ -4303,6 +4316,7 @@ cci3: cci@ac4d000 {
 				      "cpas_ahb",
 				      "cci";
 
+			operating-points-v2 = <&cci_opp_table>;
 			power-domains = <&camcc TITAN_TOP_GDSC>;
 
 			pinctrl-0 = <&cci3_default>;

-- 
2.51.0



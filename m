Return-Path: <linux-i2c+bounces-14667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DC274CD5207
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 09:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E5F93001E11
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 08:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD99130FC03;
	Mon, 22 Dec 2025 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrygBmRj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddovn/vb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC5B3101D8
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393081; cv=none; b=O4r7xjvmqL9K+y3m3jmyVH56Ih5fzq4i+DqGQAAfrf9iuxnFH5SLaRPHkhO9WLE09qLCrsDM9HAnTg+uJ4aO87FjZKvU4PvccEBbqOPnqul0ZNFAM9NVUYmwHNqC+HfOhnkXVM1PAScwPLIzB6Rw8lclqotKimNWRH7mbRLD3QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393081; c=relaxed/simple;
	bh=HfL/wUgTKDglf3uflVWp56CXovorE8XBCiTxn77wjqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OCjOndoa85rpSRpu8UIZn9oxfBd/bXFha9qRfAKfTqtCkU8jsNd0se3UUgeh5tpiwmN5b61Nh7RADVLQir23PM/xYwHav0DKXOzYE9KGaNV8Yve2sUPLhnwCT2u7ZVw9HNO69rGsp8fYrHW6ZIwADK2QfONxCqK2OPA4Ep/CmJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrygBmRj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddovn/vb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5CYvC1783581
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 08:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSpPyGHzRAaU011OLpKMebrhd6wERzecLAMZJXn86bE=; b=RrygBmRjj83DjAhW
	Cw3lfcjdr9ht8tB0WuNIGRCNZTV4nQ5CFTqE8r5bJWDah4ktg58TWHGBlqOgfN83
	FLbr24MS6RCALSlpN90uOzTdbVXJ84W+iBmFdbr44xFosaK6uncbMFInyrFuSYgs
	lw15gTxky1HAsy65fhjGjG/L0soZI+HvCjNKgLit/fMhae11dGMH3Eg8PulZPhyA
	SXB9h6ra4th0jx7J/zU7vSz+PQmA8jLgyD5Ac6jk0fjoQnvX3qQTrjOl03EaIwlq
	NtsYSPdLypySh+6p4YddIBoVNOED786VHUP2JlIG0YrE6SJWEsU5WdJ7wUANJi43
	NLOXzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqmch5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 08:44:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22ab98226so1293972985a.2
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766393075; x=1766997875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSpPyGHzRAaU011OLpKMebrhd6wERzecLAMZJXn86bE=;
        b=ddovn/vb8ecKqV7xuAhQzKkZ1sNaCgvRr/1k6Uerf0k/Eh+S6CFni+uKbA6gXFwfvD
         HUDlGB+cKwcbp4WOeLtRyBsw3bmqq5lnvpBWzDuVyWCTGDLwJf9ZWSYMPfF5MXY94pZg
         M7WaUlnqjAxB/epfx2y51edlarKIlgMhx4PpYrjvD66w8VhZY6VnmG+EsUfWVQwb+mjq
         P7+DAYHSzX7XBz0nFR0zgOjBtjqeJNL0PCTS7qPUQTYpeNi9Vq3akBjGAh3AyS9pyhkR
         5l7jjvURgstFBeBXx2VFlelen/vt3cDV0KCQ4Yo+Z5k2WNSINtT7/hWZTRDpKaWMW5wf
         I3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393075; x=1766997875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wSpPyGHzRAaU011OLpKMebrhd6wERzecLAMZJXn86bE=;
        b=BopnFjtrKp5otPb30tXtwJMh9e0zZSyX2EdTpUvr+B/HQ8WqOdOp0cd3Ec4L9CPvud
         LYxPuqGmB2n8MSVlq71qu8ycKYFbGXCu9vfIajOiKgmiWNrhHTOtJ8IkHTaLzbZ/bWL5
         ds3MMfQmmOFBHVhUfSPgasYffjwi1OaFvJKXHfCUOCez6rfus4+/B4+MhZLnqpEeYrLb
         19xaonuvruWwL2hicz8Bzrn8okyrVecvD9YQD/bOWCMURAcNtQMNtRHw2AZgIT4Q7HZK
         RR8lHpAD4SDRhm3NVblIPqYFkarOAAiyVWuUnprk++MX0kv2HVw5A6yp1X8BqsNuNWy7
         2zwA==
X-Forwarded-Encrypted: i=1; AJvYcCUHk2Hentbr7+c0SIpuWuuug8LsWAJnfUo6IV3PtMxPUdmxxRigdVObcXdL9H/joWoU59EpCUVVgeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztswI2lpGgtCBxFv7CXGZJuRB5ROGgczwDLK1owA3WjQ3ufSlE
	zbLreHni0LNHGGWmUwcHleik97AJRt6aoUaDFhDQpxPqtrwOOB0u2WAsK+aaRbYIlKxdf2ET6J9
	4cfMLu0+6rctIbcoF+qSdxsIj11T2hJpp39YBkCitbnQ/IZwksiTao0/IHWajlsU=
X-Gm-Gg: AY/fxX6LYhNoona/2obM6Jss0bm7HhgvBhquN5300jIjUc05o8O3Gtq3+juSKGwo9G1
	ZT2fBk09yhVJIOsKx2H7++/F1STwJNlvc8gaD9hj6ddGUBPxKBedqrGXtgk21iLt6k6JZbPjeV+
	Fb7sMs8HpkEXXpQqu11nPZRFxmZFo2DLUeYoe4xcZYM9VMPRKa6rYRsSNnUkl0Ov7phL1kJBf5z
	uXtDfACcautbT4ldgAzbq5Qd2RV3RNeLAUQGlcrjC00Z8foZxvkA9ejDSeCR/E9McaJa971GDg7
	BypPVcMoD9NHPNMniu3vSGIaos84QeMiQD8P4zq7pFKi61XO+eKEeDQTZTUs1QDnv5W45eARtMq
	z+rhfYUXq2faMxWfNdJneZs8eNDAY+UXNtL2Gj+HZYCoSxKXb0FX9DP0TL12YI0MIPJBypUUei/
	pY
X-Received: by 2002:a05:620a:454d:b0:8a1:21a6:e040 with SMTP id af79cd13be357-8c08fd1848amr1659563985a.77.1766393074848;
        Mon, 22 Dec 2025 00:44:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEizRpp+mrtp5hnMVcZyZ4Qx6OuxOwJGL0sIfb3UxsnVaeLyYU4VXPT19wl2BixO5QQcBke1Q==
X-Received: by 2002:a05:620a:454d:b0:8a1:21a6:e040 with SMTP id af79cd13be357-8c08fd1848amr1659562885a.77.1766393074453;
        Mon, 22 Dec 2025 00:44:34 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ec0f0sm782975385a.50.2025.12.22.00.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:44:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:44:15 +0800
Subject: [PATCH 2/3] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-sm6150_evk-v1-2-4d260a31c00d@oss.qualcomm.com>
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
In-Reply-To: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766393057; l=2695;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=HfL/wUgTKDglf3uflVWp56CXovorE8XBCiTxn77wjqQ=;
 b=9oGbgznAQW+rVLTTxOhhd6VvyN+B70opOr5UQsRd9OddBwJWbed7cr8JIbAp9Pk0eeG2cgn2o
 g8ba0o/5r/TBXI8wuEtfcnnzuzoG+iG3To3IgAO4+X41bb7YHK5LKrV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: PHRFh5pMkSEiT7P-IXt-5zoI26PrHn58
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=694904f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aTPIHvGNz_4l9C3dtW8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PHRFh5pMkSEiT7P-IXt-5zoI26PrHn58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OCBTYWx0ZWRfX2/B+d/zU7A9j
 J0LA7RZltTMEtK+NfPtZrESUr/dxY+mjRWkY4ljpWdMetY2IOqzZStsu94s4Ky8ZiRmMvWpcwwm
 nFwDefvXNIkHKjLsSbd8WqmU1Gf8vPonF9p66jUa/L6T744iPs4JhmjHJqwy+fQVi1oIP2xKb9R
 F0uWliHMB+toUGJU7JBNH55Y+wT0GldjVGfEE3LKi/DxRhvaKW1v8HpYFvOfcDCUoNBBUI+S2+x
 RW+B1iv4GJo+ljouvuVIDHitwgF22MZeW/2QMQLwzZSDUyg8pEtwGiPMm/QNu7EGyaAOsn3gCtJ
 Z2IIkYmq36bwVDQytv/6vPLbs1UfqDpk7nFGCDAUDwpFNI3IDNEV2r+pHIBPaw0B1U5zYvdKUfH
 D5QY7UcxOgpNbOMmV2tyqIpc6osvgbM8r//xNn4WpaBb4AZT8E+D8x02ruFuayqwg4IHrDTT7bk
 1eg2V3Gp0h1wWsgS78A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220078

Qualcomm Talos SoC contains 1 Camera Control Interface controllers.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 2e2fa9dc11aed6e8413488302710bc219ca9b64d..ebb1807f0222c075d4207163ed4359a55616d903 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1550,6 +1550,46 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_default: cci0-default-state {
+				cci_i2c0_default: cci-i2c0-default-pins {
+					/* SDA, SCL */
+					pins = "gpio32", "gpio33";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				cci_i2c1_default: cci-i2c1-default-pins {
+					/* SDA, SCL */
+					pins = "gpio34", "gpio35";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			cci_sleep: cci-sleep-state {
+				cci_i2c0_sleep: cci-i2c0-sleep-state {
+					/* SDA, SCL */
+					pins = "gpio32", "gpio33";
+					function = "cci_i2c";
+
+					bias-pull-down;
+					drive-strength = <2>;
+				};
+
+				cci_i2c1_sleep: cci-i2c1-sleep-state {
+					/* SDA, SCL */
+					pins = "gpio34", "gpio35";
+					function = "cci_i2c";
+
+					bias-pull-down;
+					drive-strength = <2>;
+				};
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3786,6 +3826,42 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000  0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_default>;
+			pinctrl-1 = <&cci_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1



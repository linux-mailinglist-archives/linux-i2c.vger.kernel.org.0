Return-Path: <linux-i2c+bounces-12657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB0DB4433E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1EA188407E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FD931A571;
	Thu,  4 Sep 2025 16:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKYTjy4D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D3731A562
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003999; cv=none; b=gLqO3awgLKE0bmLRj7jEJERJTfciGGrLVthGqkQsFV1UPHO2n+e6T7KFTJDMAWMDfzkpqMScxCsvZ66AXd96GnOn5VzY8wvcPAGIHermn7jTdytYE82yJH7YAWr8XShDeQ0pEo27ZkrQtxZYyNd/dTQFhdLi0NDlh/Rg55BQGfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003999; c=relaxed/simple;
	bh=fDkqRvGyaFinSWWq2t1lwFf0RsUH7vJwveAVvT94bTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BLdToNgDv8jNQu3trMtqAAcqWC4P3WlKVJLR5gNpLz2zvtUg4bPaeuFQQ+9dZIuj3Fc3idtc+zj/W/AEy1ii9OwmIjNHkACDYB0Y25fTORZ/64ZY07qXMRDhpWzaOKiSVvmgIOTMLydIE+OA80jGEw7zrQOxOZpe6cwgmjXbe3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKYTjy4D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7o9032155
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xas60C8ijwiTmwJqhI40fQNiOoeLXxnVG1r0X3sdz6I=; b=oKYTjy4D0n4qQ0o1
	XQq56dMB//2ozU06P8HYW51yWWdR1d0EXY2FQKUzl2vzzv0CkUF6l6oVZRJMuO5X
	NSkDxELMXfhTTGvR5rgDBZ8DJv9AcdTyr49KR8fNRG5DIEnRC+Ny52nIJNkilRa6
	hbLqsOYCfmuUcJthhMlRqVKy2E5Cm2VyqxLV/b3LnVIXUI4SKlV4krmiUHoV4QYL
	AFmN+LmbvmzLVFr5a1qzTdthMcGQvwu2X+8szW9N9ebLv44Z+Gwl6+wMPyUc+PJJ
	5jEXAokkG75hMqPlJuCOPwwWyIuIORwCA+zn+RXV6lNarfJWOLgEeKvwrfx8ylct
	d3kOMw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpgby6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:39:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77250c660d3so1392989b3a.0
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003995; x=1757608795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xas60C8ijwiTmwJqhI40fQNiOoeLXxnVG1r0X3sdz6I=;
        b=HYYVRbnXvY5u9gpmF4aVwJ/0uk7Qsa+ZL4AR83bVT8JuUWRqHMHaanGjjLEZ+pLYcw
         iJmq3WxmsuyiSANgCYsAUV0dN/pAEAfkfYd3xHdM+JftX/pDFp2TGGih7WADdzek2gW9
         z1QzEPaziIqZrIq3PpGocN5CXAOoWnn5fLZsoaD6zsNoszqlU0NeBY0HV7jCkrTdERWr
         rSKBwBby1v4yUuNxf9kuiS1i2lPOxyTzTvUEgDMIKZxb7gxOn8lxIi64M0tHKbLlOX80
         hEF/psScfMnjLgVMwyp4u/kZRzPcwVx0UsmHConlnIyhXubz26nuNNR3oH/vqhQxXOPK
         KZ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWMWJh+dSeELb1Pvg9o2qqRN9MPc6aJIgmG3tuICemGemWS+V+JzM6DzaYlWiqqYm1/4MGF4PpqQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdwAvic6LruxC5Z2aPQfF9Y34BeuddGSzSzOWKwFG8RaItGQ5A
	imkw/KxEgMfK5gHgd9HBK34q+PaEjwsNQl9ypaJM3PQmhn3z1QA6IUSZbyu1cgEdbIU9iCKoy4k
	ZpPLABP3Zi8gemUm7WtEQT/OsIzLjXp8Ix7FVjXPodCdaVa2booUwOe7HhaIlCnccrJ6FoTg=
X-Gm-Gg: ASbGnctg4xfjGotkf4S8pui+AQVzVJSJFMizyPE24gQXFJ4nJ1crfvXSP2sUgmOmAvK
	mRvKBD5UkfXGH6+huiySkoh18DVKnheT3irozNHKGmjILdQZn9ljTLEShd9KMzx8h5i6j9FPm4S
	YLaX+j8XhdBHOpDIavUVknJuXcBlJrMN9tYCk5FxUAtF6GnBpkBhgcE6qvoGiazohJCxjRaTOUy
	MvJ8ETiE41Yd9Bcl1QxYWNaMP6bOTXmwhFQeeNz9PXAf8jZNK73+udQ6Bhk73c4E553s81kdnsx
	o5bNqXHWJrtYRdKw90L1iyVBItNYb87DhHLCaGJsIfQ/dwR/5vtchNz+tAu2JZzlNh/c
X-Received: by 2002:a05:6a21:33aa:b0:248:ace6:755a with SMTP id adf61e73a8af0-248ace67795mr8575140637.11.1757003994892;
        Thu, 04 Sep 2025 09:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP41A3JzklvhNIPpcnoxxSAwwOYtQAUUMNoQYKRhiAy8Q6cGA9PJGa1zZ+GFCUFRtnpQ4phQ==
X-Received: by 2002:a05:6a21:33aa:b0:248:ace6:755a with SMTP id adf61e73a8af0-248ace67795mr8575090637.11.1757003994387;
        Thu, 04 Sep 2025 09:39:54 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:54 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:03 +0530
Subject: [PATCH v3 07/14] arm64: dts: qcom: lemans-evk: Enable PCIe support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-7-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=2445;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=AqtBG6UZAsfussB7MJK1QEtygnY7f30ULmObk2D0omU=;
 b=LEmcR/9fffgUDa8DhLlIj6NBanm8EP60HW1h8I+sRyX/OaSOwSy0qGZsrE57ArTE2Ic6mhyiL
 9jxjR8kYUdpBn0n4CQzixqhXnmOgh+c+/RAJSw6eY4mThbrMSmUG2mK
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: 1vD3og2CHzGfkfWoXvi99Wejb5bcSeag
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b9c0dc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=RIgN3AgQjrtB0c6oJ0UA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1vD3og2CHzGfkfWoXvi99Wejb5bcSeag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX31DoIzFau/7W
 ff9VK/uM41O5WMQ+5Am3hzy4J4M/m7SfQy1O9AvBkKOydRrpy9eVkkRQY8f2UKuAROJkGjR1u9C
 druvpAFaswDeXpluwPm9KNtnEovUsoN99sq0jmLpXhtLUOw39hMUbLEgrsgk1mBp6+sKB3WYPde
 IiMmrGB93CTOV779K9nUfa/MHz2WgyyXyFNA5SWIqlxTMApufQ7u+kntuRpAD3l9pGjJFW8zfGo
 5c8sp4KiOWtiSes7S54bDAQzav0GvUcwrWDIM+uPxkKtbQGEWKofdkUnOTVpta4T+25wNImeTaR
 voJ+qhUSej9GMuuxiS63BfwfXGeFySfgChJE2t1jU4T6V6bKsQhJqukWuI2z384JS1W6CZEmpjX
 YEUFGSBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>

Enable PCIe0 and PCIe1 along with the respective phy-nodes.

PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
attaches while PCIe1 routes to a standard PCIe x4 expansion slot.

Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 82 +++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 30c3e5bead07..17ba3ee99494 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -379,6 +379,40 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&pcie0 {
+	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -395,6 +429,54 @@ &sleep_clk {
 	clock-frequency = <32768>;
 };
 
+&tlmm {
+	pcie0_default_state: pcie0-default-state {
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		clkreq-pins {
+			pins = "gpio3";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio4";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-pins {
+			pins = "gpio5";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;

-- 
2.51.0



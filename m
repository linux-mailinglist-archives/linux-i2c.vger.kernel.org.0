Return-Path: <linux-i2c+bounces-12746-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 889C3B48693
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1BCB17FD4D
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 08:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F0F2ED16B;
	Mon,  8 Sep 2025 08:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dp2bUuWz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6C92EAB65
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319629; cv=none; b=n/asitflSDQwsjmQWjT0sc7QSDWQF0/6FHGTWOadNzvicS+2VTwxRXC1mZkGVDKPihjKwYrq6GvFr7EkzImUDKfR8ENiBcxmPRf2OM3xA50t+CFzpxXbx2aBMri68x/h9+zKVf50JO4alQ6acHgkqQXJLJyPBW25BKA+t8bPrfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319629; c=relaxed/simple;
	bh=gBYL50YC1XDuPqvactY/HGpJkmgy7jZJJarlpKpBrwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZ0Mv12jAr3UXhLF/XfAoIqU88vyFKyCGfjnBO8/JjnyE5/LMrfDa4RFHheBl6hm7JvOo9wnO8SBlTD/84CZbqbK6ist8wkwoXGMZZge0KdlPp5zjtHx9WvIVL3syYssvLSd4MifP9TzWMMDa/a32sEH0/AfioUaZVhyvMoLqHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dp2bUuWz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LsCk5013497
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 08:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rF2ixXvd+CAVz8mNHLTt0wOko08EhUec7UB+gMTdRyM=; b=dp2bUuWzeLYrMdh3
	xBGmajAhoW0wE4g8Na55zjrnR0MxuhNvRtVBKb7HT60GyeWypyzIXqWzCETHwNJP
	LQTrd+8rpAXv0xWsVDtj9rHhGtrkjObQ+nXR68gRQkPCqtW7imJJZm2wH7/ZYZfH
	ZLJWoBW5UH6vsMawubGjxvbWrP9Y0zflvY4zcM+LPldfP4hxm7pQweAfJAkhZ7dp
	UYv+ixev0xAf+gkgdSiVy5HtxYh2/HOwfmLVk8qgahhPqwteYy9vZXNGzOlHcTBJ
	WVIkS4xFy3mBQ3klei3zIhNDK061p2RPCjoPgfJq3QS+hmrYBEx1hsq3ew02rcld
	1dftYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ktbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 08:20:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24b2336e513so64540225ad.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 01:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319625; x=1757924425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rF2ixXvd+CAVz8mNHLTt0wOko08EhUec7UB+gMTdRyM=;
        b=sdD9/ZJc+fMDL+7LinfCi2bzRhB+WL51LYM2+t87Rm5ALSPFc0rbE9hzwYdHUNOiGk
         1UkSANzEBs7hGHh7+5aTxWMJ7EodXd0s10s+nTl+O6f6/A7vOwCF4HiZdkKvhUsTQzIT
         qXvWH5Kn0Ctmb/sb9/43JiaS/FXMGYMPIMGKm8mripB58zr3bX5sc1nrfKl4prsOJFVU
         lwXiY4dOvb+krOUZOBxwon1SE+rJtTu6ByKoIbksROwkDOA+ivvXYwByCaVAjJj+iQTB
         XBtL7PlvhCriqnD3SW1ej3uO5ruw/cYUDSpAFtC6p8//B3wXwAAn7eZozYmYLF2aej+9
         aF1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgxy4Tcb8KQ6be+rpdC1Wx8oLCMwFb81B1+1UCzpwXuR1IAerXdIUssSCh+da4Ldc7JwytPsYKEbk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoj+39ZLyfK4AhAlpMViPYOHWboFRueOzgipOJOFcOVSAjMa/A
	6aMl0vjx3zJVu7boS80yXOdwIjiF2VVMHg0yY0O3iU0AEFyj2jU7SPhASiB61TfycqkbUGvH2MD
	u/ZVZ0MKU8wLOtlCmAFylAzOLBSPTzh5AInAN12IV9cBc9tkuxN7hTof5SYszAIo=
X-Gm-Gg: ASbGnctenrkkex+/gqCltzi8MrrXPgR2iOEzX8hSxRUsDCRZyjqOXdGOa70qmO+/PGD
	Cn9QTvpUSJ/OQfUJxY43yvqNwI+x695DkY4bt3uW7wybsFvpXdsjKX22pkh3aHDgGF91wsG0Jxd
	n6fj04ZEmswr3sUqTHApQaBSOI6qcSuCM8gAz8LnyqhlJwf34uky6jwKV33EwHUunx0IZOOf3Su
	/xOQeXchRmnFHLxzbh7Szear39rFYXU5BDtiirMF0IrX3E5azMWH/691SErFB8Zn0kS0mtFVQlR
	5X5HQJCt01Dv4vRG0JUj8lxRsBw9L5C20ng1/DBpnNBsjNBZS8BNB84RlMx+066a/nai
X-Received: by 2002:a17:902:ec8a:b0:24b:74da:627a with SMTP id d9443c01a7336-2516f050096mr115464935ad.11.1757319625021;
        Mon, 08 Sep 2025 01:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4jVT7W/OifKwAmzHX3E8eS5lp8cqvuFI63Bk1zsxQR6CJi6eIpk7aZvqHkSYv1XuC0Cg1Gg==
X-Received: by 2002:a17:902:ec8a:b0:24b:74da:627a with SMTP id d9443c01a7336-2516f050096mr115464595ad.11.1757319624524;
        Mon, 08 Sep 2025 01:20:24 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:24 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:53 +0530
Subject: [PATCH v4 03/14] arm64: dts: qcom: lemans-evk: Enable GPI DMA and
 QUPv3 controllers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-3-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
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
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=1269;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=X+CejMSc/iURyNBdtIHd2b0fknWkLUOZo2knn9rM+7I=;
 b=69UvAQaEZdQB4XITcnpWuh+ii9MjUlEFC6sUkQg/714wq+9n+m5oVmf3MHBWmDuQcPwQo4Fth
 if7W+CtGUV3ARrm2yusKZrv0XAub0o85QCtRf1dtyki0QStCLYQAh07
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: 8XExEcPXGvLqB8qp1g5m4kLQHUCDEXci
X-Proofpoint-GUID: 8XExEcPXGvLqB8qp1g5m4kLQHUCDEXci
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX4q9AHyWrgBRg
 4r3vbldlpcrm0TBo8gKm+/be3SNNH9qYDI65oC2cmbqyIOncRmyy5eQP7T7gz51At/QIvlAnLG8
 Eq1KTEscsTZatM6sUZc3lnDtaI+SScT+xUkt/QdGm5+uRkm+DMVJCAaz1hAzO9QRnHz93LOUG91
 gSUTmoB6/9eaC/P0Hvs5rg/qVdf8T6QSvHR7/kb2gbI/qQInLWXim2evBSHY//4R/wZ85fZI2GC
 9J7jNOJ0C/D/Lb3mNs8uuseFD7hrzwECncFf/OYWD9mflG6Nqt9fMlrl10ZpHimTMHmAYOaq+3Z
 LqEtbPhEs4/2H2/24z/sevwykUzaZslbvrTyT7nh3zztruc98WzFwuUfxYdOeMlCyZoxk95uvKs
 2rw20SbZ
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be91ca cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hGGMonP7TOO80wKNN9QA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
DMA and peripheral communication on the Lemans EVK platform.

qupv3_id_0 provides access to I2C/SPI/UART instances 0-5.
qupv3_id_2 provides access to I2C/SPI/UART instances 14-20.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 9e415012140b..56aaad39bb59 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -277,6 +277,18 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };
@@ -323,10 +335,18 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };

-- 
2.51.0



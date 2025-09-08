Return-Path: <linux-i2c+bounces-12751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EFFB486B3
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9BB53407A4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 08:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4965A2F7444;
	Mon,  8 Sep 2025 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhNtNLzA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB972F60A2
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319653; cv=none; b=T/IOI5QtPYDOnykQbL76zD0zj3t0+gLXHcYWWs42bXhlYQZUjMl5Jbw+hpDPFgAER4bLBng23cXUj2vHzDw6XhKjOi+1+7k2tHxy55g097rQo/ChpApDR3YveatenC9S9Ve7Lz+Q56Qx678XgxzGU1OEPS83NAEvR3NVvn09A/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319653; c=relaxed/simple;
	bh=Z17R4uxUgU+bBwcNXl4EOOFcTTKHC04Ru6ei0RAupaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WpP9XWJpOnsrm7Xv6fcIGkPYsbzX6jTs6iai0b2rfWxfk98C19mQtF6WIsndT9LLMgNYTXds2G24xQA9srdgXgwscbKzROIZCdqcfAO9Of1EOC9Gu9UaSPtz6d69yD4d02VGHhejyrQoDI5PuZMNMcv2hFOVmXFbQMsaI6/D++Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhNtNLzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5883kpWE012579
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 08:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykjIJ/h7cv7PVigxcwlijPGxTqDBl4Xmlevg1Vg/7XY=; b=AhNtNLzA2BfKtu6u
	6yocinb1pPo+t4NunV33zYBVHtpgafUSmR+Z2fGoe1Muow4f4SUXY+CWzSLo4ptz
	eHpP8HmxMGQlfE1zAQXMCxVg0e9nuRiRmEGN49+z2Xtu/HI9qUNxISZMm8ezsTFJ
	kky//FSKLcx6qm1GsDq0fXWvD/AqHQeArLWrQvefwcFZkqXQf5dRyqeq5aAlEpxz
	Bd3Wlcw62F+Rea3x0bujz1hOCr1mfjXtCDflOAvgegQvanaNNwr3krcrW+5gn6eH
	/BzrMaKl2WE5ZVjGBfGa4h38qRcAJiEge/IpIuaJxRawhr9lggZLwzBBfq4gzTip
	qoeL3g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdrmmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 08:20:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4fb25c2e56so3448485a12.3
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 01:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319650; x=1757924450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykjIJ/h7cv7PVigxcwlijPGxTqDBl4Xmlevg1Vg/7XY=;
        b=xOzsZ9dNjZNRJg6JbWtA5v6uFy3gLvISLaHKpS+w7RB28fMpzXkQIwuRjR0geGCio4
         Z7G1NXUYwUN3/K3j8qiEMgKG4ntl+oZ/1qDN4371QwRiF+9svni8acJlLaRl/vZno/xB
         rfvraYYBhueZoeLVSbXXHa//BJbcwouYsOXzpUKIsUEk9AczJEqlLDMLrqd+O3apGUaK
         bYDFOQzghSSOkg9nCmfZIgS1HTgSHRYvfSuO+VWHqjy8QoOvq7A18hduBDf4KlDNm+UV
         AkR6t4AsoVdeqYyvEkfGMLp3E4meBGMbAD3g6qHbgAwrQhMrcYLnvgTlKXh1pFE7sdHS
         hh+A==
X-Forwarded-Encrypted: i=1; AJvYcCXbxIJxE+gYSlq8BRQ0dyGm7D0YnEDMveJC27eMzyuEHAiITuKY0eJA+KlIUT9pZaR6R5kZfHBl2gc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX/XnWLqPkfyslpE5k8/0xfoLS86pL/+e7HelCWlxf9RY6cAjR
	fopc0zbfcLVZNHqq98su1hs2qng1JT7kZX2M4d7zqhuCpmHib66JBKHLmAe5m4z2AK62V2lAYQC
	IG9Qn0wHasSYTcbCTBZoyaQzWUCQIbU2l81n2JbTwukIRviIgaLaZxWvdtkOiWaE=
X-Gm-Gg: ASbGncvrOMS1rC7xgKB3o7GtRDCWIMClLSuglKYFYjJw1mccLJcKii14pR5+4JvjUqh
	okH4dvd75C4pnZoEBHHW0ILnMh8BQFdzt91nM+e16bSu8ovHvAS6nV3b8VI9dBDPq1uxBZZZqJz
	St6na/huP0UdsWXCh8a1G7cFf9bCuP0mdjQw0qjWKObdSDjP3RLqT1XyJO9Ftg41Jqt4ixS7Dmh
	u6eVlY9TrgXJMcOmdntIcZ9r6gTeQE4/ZtOtrZAbKc8zgFWmqIaGPyv/B1d11Vh2ilf5fU/aqpE
	9X3PmgeyWOextjz1Z2dxoCeRsmABgW0K/iBf1AW6q9jXDxnd3KIbV6BCJ29m74/6G7J+
X-Received: by 2002:a17:903:4b50:b0:24a:ab0f:e87e with SMTP id d9443c01a7336-2517301ce3cmr88103465ad.55.1757319649964;
        Mon, 08 Sep 2025 01:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZrdo5xjhycVutw6GQ52ITtWgmshTdAXB4TsZXe/wwIb/gpks+7hZaULtdFlwOFTMBebuQoQ==
X-Received: by 2002:a17:903:4b50:b0:24a:ab0f:e87e with SMTP id d9443c01a7336-2517301ce3cmr88103275ad.55.1757319649432;
        Mon, 08 Sep 2025 01:20:49 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:48 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:58 +0530
Subject: [PATCH v4 08/14] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-8-5c319c696a7d@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=1181;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=Z17R4uxUgU+bBwcNXl4EOOFcTTKHC04Ru6ei0RAupaI=;
 b=AAUNN9zBr2X9i1EJ1D3Eje//aVUURrkPMOH1CL5ctvoVFi3wCa+/lrGJC3NJ1RYJZU5yzNG2Q
 sdA5G+fjPhoA5JZ1k5Ooo5M7NIEEUTgQXNZTRsk5NfuudglLmfGuZxd
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: 94RTWcTM4sHzQ9MBhGmAS5VQ-xqvl6v3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX4uwDYBk7jJcY
 +7xRg/5MzYtWGBfJFqZlcjpLmEk1aJh5j26UtA0rgavJYDEpAT+15f58vlxCgixgTv0Mprrk7Vf
 b6o7GhbNfVelLt+37COZnk+cNsPY/ufL/sD5Ej1Nuop7zaFqNt/2mo+iUl7cJ0hB9AkNIF38c25
 8+xMusX+uYkX5mvMTggBY4p9w/ejLKpmSuMALH/fNWYbxBwZPgC6I3IDUuk8RwBaQDX/1sqLjDr
 UHvESlBJifnTPq6m4wkavxEoarwfb08WypuRz/JTvjNKs3k0qWfuEe3AAxATwvCIMLpNVUpc3uo
 o/GnvhB4k1WFSvu4oDTEEwrEASum+iKIipUICHIQTfG1ij1EycMhBcQxZG0mBXihL6IqVIz2bWO
 Rb/k3N/o
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68be91e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=08pr6S3s0jzPFaFj3AwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 94RTWcTM4sHzQ9MBhGmAS5VQ-xqvl6v3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

Enable remoteproc subsystems for supported DSPs such as Audio DSP,
Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
firmware.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 17ba3ee99494..1ae3a2a0f6d9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -425,6 +425,36 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };

-- 
2.51.0



Return-Path: <linux-i2c+bounces-12660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB17EB44351
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8168D3ABB3C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F14632A82A;
	Thu,  4 Sep 2025 16:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCx7V6rg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5EC30AAAD
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004016; cv=none; b=mMsHL7tbjwE8SY4/U3yRsUlU9g6k8vZhkmo7sQteMiqTx+p90BZz1jgyn4FXZgG5Sv3mRM1ueHasLT/ZTfW01ae1tXXjlyytRzNjIdU3/qVEDEil7wSDqpIbGwNleCtAKY5cBHINJdp3ofCkTjkfR04aLztl3WQnT7HYf2xLPRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004016; c=relaxed/simple;
	bh=EsjGsugzkFOlqzSq2/WF00KrTeKmgk9inDCb0jMdM24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFHI14e9bdgfO2h0mf13HVQgV2wWWxS/lkgbFN6We/RYuirNaMAQXTxTd1X+2Y9Xqb40Oqn+KGBy72fgU7bg5hH1PHFbgn6VNR7Tx5/dLDYTg7dnQ985KVhUsNVqLQAgrp7pHpPAPQAhFOGtLyfbPG03XzQswJyE5Oaw4RwP+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCx7V6rg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XB0D013642
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4jUPc7Dj/QW/Q1xVXbfjBdmzCMyLfsRaqR2VFgydzk=; b=TCx7V6rgR/YDf4Nz
	4p2/pkgm38LUAZBv4JqAixInOh7h29aBMD/l2bm5Sc8vO4/UliOZtBTyvplLeKMu
	5mPtFvt3eL0QuQWvBMn4AmKD2i8g4W5gLu6VLhVTN6ve5jxvf+1vRdQwQ85DKIau
	jvGOHi16IShP20YLAAPe66EjAbz9gk/t81X2VOgy9Go7FVbKQwdWRVSFrZqEMTYR
	8qYJM95Qb08Jvzcc6cZ0yGdzZ27gp7wC+TGiCL2qblLB5gi7GiffPTMqvvfM0vA8
	eDZkhOdtOeuW/4gnmqkNK0YG5vHvt4YJYGvMaN4bvBFPU6WLKcDmjHeVl7qljUdL
	My5E2w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyc4n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:40:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7722ef6c864so1186710b3a.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004013; x=1757608813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4jUPc7Dj/QW/Q1xVXbfjBdmzCMyLfsRaqR2VFgydzk=;
        b=Ls1n6nc4hsC3jZLOvyDmrCfe9wyv7koh4/ei4POWTsSwyRdVSIOTPyTJfh4tifpgl5
         TVqAeQnqR8xx3vs3VDalAVAPZJF69MdCVnBms1kdBh5HM8S7PbE349959hn5O7oKWXiR
         gCXC5B7G+35tpGt/twFkpmAsNrjJGia9P2SLXtlXIl7cSgspfbqsVWNuDByBJ1Qmyu4Q
         2kSOUlKyeap0zEN5ma3zQmi9dyzMnJHIpYZLZdrqjVg7u3vahkyGO49RnbPpaG+mhOUS
         WbozWMAsuO84lzkjhCk5zVoRzoHUTki4rk6igLgUMovzIMnQDuFynIuIfq+PCW0pcXnr
         yk3g==
X-Forwarded-Encrypted: i=1; AJvYcCWhBff4xsnwS1GXehs29xMicMHbeinUZj2ljmrv+9kEF6IppmWnNLeJk9lx9AsIfuAR4kTfGxOpoRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/oU49iZFlOSQL/Tp9pQGfhxQH+RCj0xZJ5ekUS9Ku5jt/FhN+
	HX/ut9406odp7jqVIKaY3+tAwF+OnEpB76SiTW/Pnz9TKGij5H8prSkOlGWUpSKwEeUD9rjsmYS
	g7forh7B/SAwlqZ5P58BvxjcQ8+Wzz6U53cn3kSxg93qe7ji+PUABWBUZUzMLOb1gYa7LRxM=
X-Gm-Gg: ASbGncutaTy13ylbWHtpGKL7rtl9O5mfynQDRJVDj2Iznumi8+0OZ22FyJZzbsZYCqR
	qaEYQZTtZmqYT+1bNh+3YNe72dNXTsU64uXYA12S+HiZpcetBkCTH4VgEmDsM2okrQofmuoLwIW
	pQszYVnTMw8bHGv9wCcNMKRxOZ5Tblu6O1BSbqx9wmsNtKRFlVl6mTnoZzQP2gjcTSWhPrUlsd8
	4BoN6VQi3rx3ZH3GKkK4W5z8Q+4SfngfvH81BK2eGXE/RXgxL6xM5WnAv8A7vvNfXfppyO5TFB1
	uIF4f6GRbI00a0L3QOqpbjHweOve8y09GKOsNhC9GsJFwR0xkQ65wVUOHAQ/l2DZfu40
X-Received: by 2002:a05:6a20:7491:b0:24b:1a6d:298b with SMTP id adf61e73a8af0-24b1a6d2b96mr5045657637.34.1757004012726;
        Thu, 04 Sep 2025 09:40:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmaVrqqvWvNCJ18FSo86iVsdvqCApjzOy7HSZ7MVp/HHNY25R6gM8RCj1Eh+eB9N6zP6fXQg==
X-Received: by 2002:a05:6a20:7491:b0:24b:1a6d:298b with SMTP id adf61e73a8af0-24b1a6d2b96mr5045604637.34.1757004012076;
        Thu, 04 Sep 2025 09:40:12 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:40:09 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:06 +0530
Subject: [PATCH v3 10/14] arm64: dts: qcom: lemans-evk: Enable first USB
 controller in device mode
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-10-8bbaac1f25e8@oss.qualcomm.com>
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
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=2112;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=uSP54TRbiqMtyGBnTmkQIYSdloVjaATg9VZzmh4edWo=;
 b=2gaDsexzwkO3wVXtaZNzsIWQ7hE1pPRzXTqZO4o/Cv4gMlTBQ5p9KeqXcvvrcsFGZYrm2pyEu
 EKWL8466lJwAIi8iSrGvDceB7WoNgyLW6PuolhfO24fTdhnHgLFfsNr
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9c0ee cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Nk2SLWWF8xhsZ517u1EA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: DZjP0JvezBKzd7KJc50RLuIpuUsEUYOz
X-Proofpoint-ORIG-GUID: DZjP0JvezBKzd7KJc50RLuIpuUsEUYOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX8ssgiiFXmBRe
 Ke690l+IX9WCIJqSusb6ngeWjvZtOzTVea8w9Ub3xQr0Xw2bya/40WAoxpqIeGmceoZyJ6AzD9+
 bL2hdSPYLj2g6xeM98FjdKyUHeObm+kv/y0XKD9kwTkQc8X6cjH5iMt4bJWi7c42zX36z0rnA1w
 n8MWwSDf5iAmdj9qOSb2XjCOrVkfNX/tRVApxqORwQZWfq2RLBYOEJljd7Kh9/pURXexDhsb/oF
 Gc6L6pX2vGBFl4axE65Xq40NJeRM9s3z4gmF6RN+KnPkCaV3M6kfS48ICkqwIK8VTqp06aKX/zp
 pf1l5bqKVSKgwkl0/0M3d0hsGFLBTUVSAlnjcgXcCbRrqwCGUuRfKgz3ZNw6BLcu6zydEWBhCKe
 NSjCwEvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Enable the first USB controller in device mode on the Lemans EVK
board and configure the associated LDO regulators to power
the PHYs accordingly.

The USB port is a Type-C port controlled by HD3SS3320 port controller.
The role switch notifications would need to be routed to glue driver by
adding an appropriate usb-c-connector node in DT. However in the design,
the vbus supply that is to be provided to connected peripherals when
port is configured as an DFP, is controlled by a GPIO.

There is also one ID line going from Port controller chip to GPIO-50 of
the SoC. As per the datasheet of HD3SS3320:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID
pin low. This is done to enforce Type-C requirement that VBUS must be
at VSafe0V before re-enabling VBUS."

The current HD3SS3220 driver doesn't have this functionality present. So,
putting the first USB controller in device mode for now. Once the vbus
control based on ID pin is implemented in hd3ss3220.c, the
usb-c-connector will be implemented and dr mode would be made OTG.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index d065528404c0..6ec6f9ed1ec9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -538,6 +538,29 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_0_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };

-- 
2.51.0



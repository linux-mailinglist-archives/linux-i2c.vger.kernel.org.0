Return-Path: <linux-i2c+bounces-11012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC1FABBA3D
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 11:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D36863BC87E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 09:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DCA26FDAA;
	Mon, 19 May 2025 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kp+1KP2r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A415226FA77
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648074; cv=none; b=gpsI80b2KSO5/IYYFiCSM5oyJIAdmAM//u4jBD2O4BUFpf1eok0fKiJfEB+M4E1yadzZd0q6bSRSyh9zrxfFYSghrsVKYvl3IzYvTZEI2+FOA3ke0jzPIL4Yac6258v1gdHIXsMiDl5t6slKGGGBUhaO8BvH8A5EvM5OoCOctEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648074; c=relaxed/simple;
	bh=a96bmT80QtXSYOLT3zKaY6fcq7QnaWqhJty6rn6JofQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PdYnVaLS+b5IhjNhfawwEvLYWcZPxqWW2jofpcmNuJCmABoIYUPqnpW4Qhc/2GvDrx8CZUQmj8spBKMDtFqBRJcssl+hF1f3nToEVgXn+fMwy7Hvgl0HXFmEUQPtIpbog5B/qZT31qnZ8FCcR/lhS/ArltQCLxqvTF9Le/KbyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kp+1KP2r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9j0K2022874
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 09:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0WRudAwmmMs
	l02GAkXYXzq4ndFHKqsSnSM+L7qTqUyI=; b=Kp+1KP2rOukVQkH8HedcRSsPvN8
	jmBqB27ND5rIhbzKdTcSqg2OxaHKVcYgahyPREkMxi9KuTUhShKMpu83ID6CwF3s
	MCrVBoEu5phnWWQpJKy2dg13c204NuK+ykYD9lNBM2SIqmS+Iu7JZtBdmraO1Ju4
	ouCOqm0lH1+ki3H0YK5RIXjuMQVqzET75lzjztiQhf7Q2VyqwHOhPT0ZZrDjOLN+
	zun+vonT8JN5UQNbB1qJyiI0OPdEerUMFOeKzgLMu7IVBsUgTcxawiFaijX28F20
	mw1rIKdXAP1lohIBNazRroWxCZfPhfudo2qeoB6uR9t12GtmHKGSd16iO3g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d008u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 09:47:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c2ad9cf2so40891466d6.3
        for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 02:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648070; x=1748252870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WRudAwmmMsl02GAkXYXzq4ndFHKqsSnSM+L7qTqUyI=;
        b=gzoG9oq4OPC9I7YPq38oq4XAWk9lqJUUxUHuYUTysK8TVZkkXxQClxso+1qR54HBtN
         Ajct2nMgzI5xIGUMkvK1j8GspfO+CXJ3seEO+BdZI+7FdK3ZdffC3zL1ljEKvP72fBqJ
         f2qC46bm3AeG3JpDKgLI0QK/80M+rJaWEHeEo4TquNP8KKtTaiyOtx+11yPeF+ucjYtg
         sB7cb5y//2nUSf/7kxmOHmh39wPBsKUmcSqGwhIA3sLRGAEKzj2CCNjGwI5GBC2oJ5f6
         d51qSGCw3myG/x+RtU8sAWKzHnmFeDE2ESc8uBnqS4wNGU5/AzZJwRv9FQRWTuHvRjFY
         pbnA==
X-Gm-Message-State: AOJu0YwbMHSs1WybBI03fQLzC6BGekzkFVNLnL/fMLX6haqV6JbDKRN3
	1nNYTEIVyP9vwdVit9YMRq3vHsE7a+sXeyfUv+5ANnKtimS90CUNWSRtqESdd/qAH6fy9JlZBKH
	6OWuNraoUMPBxRgtV6MvHplF2idJIcFEGiaNm2nry/iBgVlsrOjWA+TSctoRX9k0SicVUnqI=
X-Gm-Gg: ASbGnct3m+FggLdKF3NnDeT9GT8zAJVMCndUhsiDOTWRq3Ti5KP4uNy3HoMDfYM3Wg+
	Kkx4TP3tMLz0NTqKlGB08jr2UlhBmLlxugziq8ggxj6UKhefC8zAcZHzq1VAwxeUcp1KYtf8nbd
	dEuo8XmlXxj+lZa8mef9+/mp8g95wQ7Mc1YFvg0yamMPFyRGw5QUMEoa6FaD6sScQuMlkZFRVfg
	3XABKv1ailNkhtuLfPpiQf6jlI4bUOLlX87Yo8ALD2fhvTd9jGaCoLtmCsxaCIY9SiigGmJej46
	A/KwZj0cz4Nuoa0I+toYIeu8AIks62mvSDj+hAgDLcREy1I=
X-Received: by 2002:a05:6214:2a8e:b0:6f8:afad:4fde with SMTP id 6a1803df08f44-6f8b2cec4a0mr191846556d6.11.1747648070202;
        Mon, 19 May 2025 02:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLZoUxsANdEB+0ZxJYwV9m08myqwvGWnpXO8PdRlFSf8plMNTGJr3z9ya1r69eEz8QoSCleg==
X-Received: by 2002:a05:6214:2a8e:b0:6f8:afad:4fde with SMTP id 6a1803df08f44-6f8b2cec4a0mr191846306d6.11.1747648069859;
        Mon, 19 May 2025 02:47:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:e5bc:5c94:e4b3:3c4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498d05sm572185166b.149.2025.05.19.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:47:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: rfoss@kernel.org, andi.shyti@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 2/2] arm64: dts: qcom: qcm2290: Add CCI node
Date: Mon, 19 May 2025 11:47:45 +0200
Message-Id: <20250519094745.32511-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519094745.32511-1-loic.poulain@oss.qualcomm.com>
References: <20250519094745.32511-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MiBTYWx0ZWRfX8IeB2xxWRTc0
 gmJUQbNRjWhelpvH5vZN2mSKkkM+z2yIPpMKBURIdj0Xaw27XSUaZgAWKyTNMzXXAeiN84vBoZ9
 vRPDHwl7KN8TDsuYCYAP00FixxsWAXF/zavpq+Msq6SO0UjOiYNZfF4ICNXlirSDuXfoHHbz0zG
 3gJWVGwdtaf0wuP/yO03QsB+qE51ES8aXzRvjZcTqjL5PEDMIgJE3WpC9FfeNYypGC94OHatum3
 2YyYIEBbV7+/cFkc0ZDmrMHoOUqCsHdp1GCCnDbD8nDQ9yX8e+VgaVH8K6BBZkkcArEnqZgZ9J5
 +3L5ak66ldvp0PnO+djc4PYm0t+t6synydrqGgsVHvQLvPpfB6SRyC6KeKf48UoOciT9E0MWLtT
 wTQLPWmsJG96GvXOGZAgpgZ1SgAkGjZQPba4X8hfVYvthLiUMP8PqHulilMjfI6uPsEASo+I
X-Proofpoint-GUID: 3j8p0S3iblgfixD1W5AxjoS-xrII_I8g
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682afe47 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=7004nz7suiqLHAzt4fYA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 3j8p0S3iblgfixD1W5AxjoS-xrII_I8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190092

Add Camera Control Interface (CCI), supporting two I2C masters.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 v2: Reorder commits; Update dts properties order and style
 v3: No change for this patch
 v4: change AHB clock name from camss_top_ahb to ahb
 v5: No change; Resent with missing recipients

 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594..f2db036ca8e5 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -557,6 +557,20 @@ qup_uart4_default: qup-uart4-default-state {
 				bias-disable;
 			};
 
+			cci0_default: cci0-default-state {
+				pins = "gpio22", "gpio23";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio29", "gpio30";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -1579,6 +1593,42 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		cci: cci@5c1b000 {
+			compatible = "qcom,qcm2290-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x5c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>, <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_0_CLK>;
+			assigned-clock-rates = <37500000>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1



Return-Path: <linux-i2c+bounces-15179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 66209D23DD6
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 11:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89B993026D90
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 10:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADBC3587CF;
	Thu, 15 Jan 2026 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaN9SmJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOrJpyMy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B83E36167F
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472005; cv=none; b=ADhm4VMafOtN2OXklBQ+Df9beaoDHRPJEEk2qPf5j0y2rMCgG272vegkK/VtPrd4pysXYbCWOFY4XlQ351kdA79G0BI2IJUSV5S+iiwod3I/MLZvzcv94gwHbA9lcmsF7TGyxX1vP1iD55JFZ7Y+zUVukdntnMCdwVWFFFHREvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472005; c=relaxed/simple;
	bh=M5+8O8yCjRisazGnwCs6jTZ5OFgWEq0sYZmbzH3kaMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwDTTKaMnZQ7ULmFLPtjCa4fIlaAVZ/CSO5bcI9AXYC6bEpX5lqBJX4ZsLrIifTARubvL4tOCOOZ+W9hJc6uizqMNAbIyiGtVQl0wBW8PMjtzUV1D5MYFnuPzNBlOC1jlmjQFQHO2/uoQC6kK6VAHJNho/Fkt41BhdvjCqSNsCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OaN9SmJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOrJpyMy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fl6d1850927
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=; b=OaN9SmJ/H3lNT0zQ
	yhAHmML/R7Yq/CEZIqgCDd6z9zQU69N7vXY4n0mPIz4gmCKrmFRIYlDS0okxda0h
	A1i3HKy1N94em79UsG5l0/jye9qOWs4fTun2HmFdk2HzL3FwrbMVvFTxQpSx5YbR
	hpY/fIMQHGH1hktqqzkR+zENDMFa319bxJiSEPMiR+lFRysxbKznYPKnkfRRMow0
	bbDDHtlTlIPD+i+AwdA7yXBOhr4r38laM+b2M4Qch9m2BJsJV3UpceAyHavcjBgG
	KOi3kD8iHnSSzIOTu0Yiptr9DBCN7TMV0BIRgXoLDLdaR9gsJ6v7aNp6BuW+2xOa
	9nAISA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej12ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5013be25d41so23096881cf.1
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 02:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472000; x=1769076800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=;
        b=jOrJpyMyLGehTnEUv6iXGxag2+dh3kGRGTliZjEpS/vcfasctGAKIkrObxF/6aQX64
         iK/vyOITC6VqLbIyUYyzb0yiYm3n4mlHHw1W77t67i9cbglFnV5GPko3ZHg4PuEk9e4f
         RFvTRKINBhapCJ1ZwvXasszsrFKoH0mHMq2iLXI/xvzJVcQUYDbkI/y/E/ze0X98J+3p
         4Yg7QQiXYtNpr3S7z3y0ngVIs+phaErUzJzBBVbaIMttYhiQW0sQVTdcqEyj3XDc7Boq
         /ZBBtn8Z0Sb+UzH7iOAZHiy5jKfsdNAzqcgFajuO4RetYSBczF5BPmVkmTn2aQjo/vui
         c04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472000; x=1769076800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=;
        b=jdwWO/498bs3NkvcQEqbhKFYyFIs0ANwwRjnc22wJvrNO0eM2ySnejCoGD+eBJ7pm7
         iqt098kmECDP49OVKDk5+5bw6/8Ui4VOmUeMsAwnuDHEzlhfRQ5OaPtPdxrERgDSRSAY
         vDKbr3DZTpz6MC1uEzdp2n2GTGyCylr99O7Vwee++HAFzN+R/xCMOvqT/DYsq8DbZ6EV
         0Ol0cR6knOF0n1JJwpA5bXVGDad+XNh3qsdSJz0BClrDxIJ2sxzA/+IDjSdh0kLl2btj
         W1wLkxjKiC6JbcctT4jNU52RrR7EcS+j3JjDrQSIsRHOR9Zu8fcFMXzhKnCuhWz6nkHW
         RncA==
X-Gm-Message-State: AOJu0YzElkoKByCi2nOwveZGLMNMSDn1O/dSbKPE2gaouIlcaQ/ZDGL4
	nAlOb6PLt8EVgpP8aMKi+EipXxc8ZcJK3BsLdcG7MAvT0m+U2DhipkhuP4Op6wmgo20tvO+kuR+
	5K2oZ70DSrdTOm4l0eIpHNN1Z5SHMDw/8wnrV+VrJkYzvMhFbPCT69/LoZ0sETjs=
X-Gm-Gg: AY/fxX5W3Qtn0BERdk7zQccjuH+jy/32lIVT9qaavDbzw68FLmIY8GkbS/6IGd+Tc1R
	+grVR3rZLWyuMbgSXDJ9XZZJVMMN5xQGfCPT7QEvkkzEblSWVzODoSq3xnK2l1B+PJ+B4huRzEv
	aWW84Z0iAUEkPHQ0qSGI6HkhbVULqUog8xDZLPrcG7dsaVUvof3Ct1i+Oogl1PHClz+RnBkU9Xj
	qehrf8kdV6SKSsSgZJHb3VR3RwTHMql7LPrFGQts1NQt/YPonp2nMLO1+KdxdiYzBaF0HfLjQU6
	7BCNxF8n6d3iu8OX2nN+CTFs7FG07tU9eZT6L4fBNPqq2BkCbY/o1El1MPi9A7Tfx8fQRx+EdHS
	KmJ0C/xvh5cEDGMwxOJYxu/PdmXPOMx2bEe9JJmTvilAUSY86bcursCE3FjdOptU4JQS8oVwS3C
	fU
X-Received: by 2002:a05:622a:53c4:b0:4ff:c0da:5a06 with SMTP id d75a77b69052e-5014a91902fmr72422971cf.20.1768472000273;
        Thu, 15 Jan 2026 02:13:20 -0800 (PST)
X-Received: by 2002:a05:622a:53c4:b0:4ff:c0da:5a06 with SMTP id d75a77b69052e-5014a91902fmr72422511cf.20.1768471999685;
        Thu, 15 Jan 2026 02:13:19 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:38 +0800
Subject: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=1602;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=M5+8O8yCjRisazGnwCs6jTZ5OFgWEq0sYZmbzH3kaMA=;
 b=mcgnYzGzT8fjH70t6p9m5FammsN5vwFrN1bKnlE1VUTzkmRGRIeI71ZRJ0Wmbd6DwFqy10lqm
 byH7WP7ANBsDw1LBOx5pl0N8vq8ioDboHxN1RFC+BWUikx2yvoJRpdj
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX5DkBuQbvclhS
 gmv3Y/s8axG40q42U9BOVWHszBLX3HEJZFgGRpyXLNSX67LhEIFIzRzurOZW1hYntTAyVHeMyAR
 6bVSFG0+w3L1Yt9h5Usble4RcijUlS+lOAKC9exgLAT716F++qaQ/sBh/3dkbzi8fiVr2wW7YCO
 Ao1SMLssmFfQaaIJj53WIzkGRx1GdcI1Wvk5Qt58ada3RbsFnrprNjk+gsQZPOnksZ8DJTwjWmz
 M7OR/Xcz/1JATqcPE6DJ9IoWsd40Q+0T2bTOjsxCEO3j0y2vqm4m52ahkXp/tlkgNeKNUO/KO5S
 1A+yOPB4YVRCMK9jFpSA4zyLCQ7AscP1040rdj8pevNITi4Jv3bBiEu+NxqFuUZH+dvY1Hk+5CX
 6xc1FZI4j/BOqEkJE5Eszws71ozRbGnBtzCyuUVtmXYGCdXU8HTVvAsxnoFZtMnW4cc6VxPXB76
 3wkSnb52lqI8t695xHw==
X-Proofpoint-ORIG-GUID: pvsYCEwoFtF5rwON-dMxWgrP789VLTuc
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6968bdc1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=E-b4n2RehmlEprTZI_0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pvsYCEwoFtF5rwON-dMxWgrP789VLTuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

Add the sm6150 CCI device string compatible.

SM6150 include three clock:
bus: Bus clock responsible for data transfer.
iface: Interface clock responsible for register read and write.
cci: Clock for CCI core operations.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3afc68ff437c0435b69a7 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -263,6 +264,23 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6150-cci
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: bus
+            - const: iface
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.34.1



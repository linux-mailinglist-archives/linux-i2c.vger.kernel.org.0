Return-Path: <linux-i2c+bounces-14666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB31CD5231
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 09:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC0503012CC3
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 08:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177D03101B4;
	Mon, 22 Dec 2025 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKprWWYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/JmuVkp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94A2FF16C
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393075; cv=none; b=ZSksSCdW/Zqe8U/REQj2A6srMOUXSP4rwTJojGnG5yq6/qpJ6wKvCS6AiEJNyZpV5lE3z1ocgJCFdSDrF7SX3dQYFIZVitdbfORpuKy9eBkKguteWF+GgAXjw2gv65V7NuWbacH6AMLhf8IFA54SN1x8OmJd5LWX8/rSUeVQayE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393075; c=relaxed/simple;
	bh=zSk1APnfdThvvuoMQXB5XRjhqPJzasZhcJEjPa9ow14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQhnW85l+s3h7o2nj8g8UlxVPPL5dfGrzhlGBNpM6UOjgaW6F8NFOezBy2uF7tTMZS7lz4VBg61GjT+3LKYfDYU4BYFaVUokDvxzAz27su3CxEtmH9q7VVKkgrCpkXZcg09ASWGLA0jNyaaRP66zkME0hH9Qnx8+v4d84w0qAN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKprWWYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/JmuVkp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8QHcZ090252
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 08:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=; b=UKprWWYa4lODTSEd
	bsRn9jqDfdzK5G2Nh4D+VPU5k3LzGOE9g050/Wah+yBG8Q8NfS9LsFn6wIuas2Db
	kHFa8NkedXHvDIpaXBY4/2k2Pm/BdBnrjgRAlxulZA1H2oTRinC+X8vWe4YNUdfl
	KKp/CMcu8gxdJiiC4gdQXvF0Y/dcVqeoC6BdwFlkZpo2CvhdDHoYanK3bczqFWHl
	eCRcEsIA24K1O+V9xGPB/6HYkG3kyuLsHzY4lPN51oJc4C4will6t6XetFewk2h9
	AHRUZY57F5u28aVHkZT9tz6dJPLGLaXM2+4oJYvZh8vdb4ScW7snZNfmZeMt5pWQ
	UM6kEw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mracbe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 08:44:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b8738fb141so1215031685a.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 00:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766393069; x=1766997869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=;
        b=P/JmuVkpFAAEF1K1focd3dzy9YZ4o3lvNntIUiv9mwl7Dzr0A00maXcN44AyhrPpp0
         ZTagw4DVZDHi3Xhseiyfdx96xy1eTok+4Yc2VCe0x+xq6VY56DKfJ8BD4p71m+MYkEII
         dgDU1uatkcfEOgi9rKnbN1m0JQ7bnLRS32hu9AxX//6J4ZOhZq1owVQHw7ky/CcZxlyX
         nUuzJxnjhWWvXE1XtfpTDrQvi8SoZcfaXE/TjsmVUnchdH7thEXmdzDPIYS63aYDP7z/
         NSy82ztuk9VBBvJ23AQYKRkTQnvRhns3R1hOhZHMGVAB7lOA4+uCUzWdhjfj3UjOsRu+
         5rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393069; x=1766997869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=;
        b=qeFAEQeBNX/q+ZYkMztSapeH2yCqOpE3uI/f371CYuvUBp0DgsEP9sl6MmKgqVeAue
         YymEVTcd2tGLeW7F/hVW+VBfnMyzzPR+ZhLRPohmgP4Q2x+nBxfe4YI3LS5CY+dZOpJh
         qKJm/jMfSCGj5Y85O1HMaWHwXgER5fjA53C0rl65AHx2YPAY4wg42+mft7RnfXFRYpIv
         JS2OKVF/9DgRd/f3PTE75tHz690xSvkLiDMAzYAcRlkxQpj+Zw+FDmK7izsmM/MS6T7B
         wK1j2Adyd4YZ16M4bWF6l8Io8uSGFL/ZyURPf8BUcBvkwGRvx+gSbWniT/5/RlvNXTTC
         J5eg==
X-Forwarded-Encrypted: i=1; AJvYcCVu8oqkHgjLVV1Tj7Dw3kYZEpqGmO/PBsiqNvA9r+vZ5D7yNX7m6ov20Qbl/rgx3I/tCdPIZaEZ8r8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGtySYEEUHPxT3rHy3o9xKSFTFHa/DC0+e0kBB0HHTu32X8Pw6
	Y3sspOOzI18ZAIdE3IdqbMEKHVweHe4gz+MhqVJ8EdDuYsPETzqpI8OXiHYlHhzGESE0YB57/DY
	y2WoTxrpNNg/z5LuWVWwecBIeegaAlBZzSAIaNxLSe9AW5ZS+2PTaRNNSw2cGEDsBV1/Q2Tw=
X-Gm-Gg: AY/fxX5x8BjgbKvXqXYMGDMFTZhDtgVBztrH8BisBeMh5NsaxbX9afHCKmyGdbCD8C/
	1AoUsaDphffjfz9nfAYQeyBeuaL/jEq1wGa5n6WgoCNVGqjNKARfajZudGYwteR0n6pPxOLvtRI
	mXq8gfszr/aIJt3gZDcX0Mut1MR03Sdf3DHtmkgKKphqxg74v/MKB6Y2e2F+WajY7p2tnsWr1tV
	gsvHg/AH0Cf2YHVJaDpYsYQ60n1mAFhp+cZ6s8N60cHNyzHuVj6iG6hcFSqradz+FB8B2ja7D+y
	HptN4EGr4JcY1okLLBq6NDH9qYdh/9duro9nNyrB60EeeFdxT/WRJo5kC/V1cg1qhLSiUuy88bv
	attX/+YTvim63g3Fe3KNMsU6wtuXcoe3XMN3Ic/1AT8odazUR/YqpF3wRqnUvwiaMYdhYXLMZ9+
	8b
X-Received: by 2002:a05:620a:f0b:b0:89d:b480:309f with SMTP id af79cd13be357-8bee670c1demr1936299685a.7.1766393069432;
        Mon, 22 Dec 2025 00:44:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtSAW5O8kGqUPF9NIJZUVX0wZTq+jme5tk9Jrv/kUAmOaT7yNWWWH91HXSeLnD+nJs9vQ+2w==
X-Received: by 2002:a05:620a:f0b:b0:89d:b480:309f with SMTP id af79cd13be357-8bee670c1demr1936298285a.7.1766393068964;
        Mon, 22 Dec 2025 00:44:28 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ec0f0sm782975385a.50.2025.12.22.00.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:44:28 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:44:14 +0800
Subject: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document sm6150 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-sm6150_evk-v1-1-4d260a31c00d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766393057; l=1364;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=zSk1APnfdThvvuoMQXB5XRjhqPJzasZhcJEjPa9ow14=;
 b=iueo5qdWUFws6kd/i82zmqVqSzTsqmFHLMdodf1Qcmfnh+XN2WS8KJy6Ysil43muPl33CvmiL
 FvRDaKIOjZRB5aDrImvXE3+on91V3jDDX4NXpHKGyZnO36aWnGrMdF1
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 6lWIXzt3tanxVjqHE598dA72ahIm56lh
X-Proofpoint-GUID: 6lWIXzt3tanxVjqHE598dA72ahIm56lh
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=694904ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gOhJHmANR_8o__jqBkAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OCBTYWx0ZWRfX8rHuqeRE+51Q
 6FU2tXMRVhBIkouDmC8gXPZ+S2MwmEKq1V6u0qJbfyJ68xL1g7Vpt+b9lYFW/P4QIS/izla0tkq
 NZWZ6MNsUlSPA6wI5M0Vc1akWFLDBvGZKp0LdJwbfX+xztfVboFBIb2zHQXbq44oTc4ZopghPAz
 Pl1p03DvZLI9RuhFUzQVU12Js/Mlivw8tDU4Sm+x4tI+28fEKSInjBH+tHam0UQMWRwjv63popv
 hwu8x36O4+vLEf1DFIblOb9RwCorjvJ9POkrFQFtH0iLEVoGtmchLKWBMvx9dXDk9jMGjyAbmLo
 XA8NKQd98d4JtDWc5fUNqO750Hob96gN0B23Eq14QTcJjxR/3WyJv0tCeVyQtIMXgFN2GINfWww
 QOd8obdpYXg97MvaW0c6OtLpYHHLANQ21ZAVagVqb7hBZdn1h8nFGyS9eePB0hu5usd2yKXUeZO
 iaeMUdOPZCVdICLeq8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220078

Add the sm6150 CCI device string compatible.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
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
+            - const: soc_ahb
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.34.1



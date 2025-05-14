Return-Path: <linux-i2c+bounces-10973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97341AB60D2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 04:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 413EA465B02
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 02:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E251F4281;
	Wed, 14 May 2025 02:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DR/4sdpu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6C1F4187;
	Wed, 14 May 2025 02:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190442; cv=none; b=J74ITFPbw//vXlGJMKqA+zAhPCCxShSEgnUf6RXrFSpX5R15fi01WypEfAX0+tYXC52tVFWqRd6w+GALL+vIICd6tkZ0hXTiJHvAoz5LUv2q22vuzaTE3gLSUsayQfhJQftQm33TCkREWNp1lKMGGJW9A3z1g3BZOoFpKfuxVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190442; c=relaxed/simple;
	bh=BI/vDxSUOSrIR4B6KudITGkeht3nNhmCg0ku7MS1oNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=G6PaphmLAx7+1CN8fhcLGrPeqyJMiI1Xesc+yR55WcTa8PTN9zwqbKxAObHZITHueAqiAGbUZu9ioBGssoP/Rzmr8vrWVUP/eyApU9NeJOY6Ktmj62ObE5z9w8gABECdOaSUNTedFPSVFX7WciJlea4c4g9hPpnmemrvz4jHkPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DR/4sdpu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E1ksY9025953;
	Wed, 14 May 2025 02:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GjM4ekKHZ7SZ4RgAW+uvrWmHES7TSdcR8lMxiEFOTtQ=; b=DR/4sdpuW37cwVH+
	aapog3sG6lMh25M88lY8o4rQk5L9hloIesIgP3Tp64bd1Cp3dmjrg66WEJrvVlj+
	AkdSCXRb2ss/jBqSr5OibOs0kOy+36DvRFNMhjFvueFIjzTz85XLE5fROOnLU4yb
	dvaFgJxOdkuNQpX6hbutaKKowZYyiaQJz6TkBP0xGClIJdqPLkojDPRhPIzOn8Zi
	FMxRf/JHgqmqzFd8UH5xlxC9MP/NsHq7L/14pyV6SmFbmG4gDH3xj8oLNvCM0lI6
	Zlcpq+eaaoy8Wd6YovqGSQ12n7OSXfqu+vLMVcCls2zk11IYU1BekCQzWCVWybKi
	BO2XJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew13d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 02:40:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E2eZVJ018307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 02:40:35 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 19:40:31 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Wed, 14 May 2025 10:40:06 +0800
Subject: [PATCH 2/4] dt-bindings: media: Add sa8775p cci dt binding
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250514-rb8_camera-v1-2-bf4a39e304e9@quicinc.com>
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
In-Reply-To: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747190420; l=1026;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=BI/vDxSUOSrIR4B6KudITGkeht3nNhmCg0ku7MS1oNU=;
 b=A0fvSBSN+YMw7N4rtEjuTSk2evOvKOp7NYocMEdsRjkEvbnKvYDX6deDQG7fKWE0jgmqPwDEn
 1IBON/oTnevBiJmg2z12XSG+0XTfoA6vFevuJhkU0c//wrD8rj7DSas
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1SA-Z9RNAwcX2YJDLvMVGY3_EiVXLw-H
X-Proofpoint-ORIG-GUID: 1SA-Z9RNAwcX2YJDLvMVGY3_EiVXLw-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyMSBTYWx0ZWRfXxYym+nnvjm4q
 93KdDTcWf4raqdZAZZ0jYuDccvlLyWyZyi+uIoCcdbpMLhm5c8X9mjNyM/p3oYbQEq44xVZWXLT
 1qCwPbcuCYCtxM8zxL+75NHoMqJQ5UhRkvHSD7lAUcSk+V46cL6/tP+GbmLA41H8WhtY49LOLdc
 nmgnu8/tOwKW6PCWQga/rvF9DYmJ7EjAxWROp5Pm0mgb1ay/OIi6Df8v5KkwKcJZe34wDgZvXfa
 i13oYIc+bStlYKeYKWuqWBxfG66gmkH8mCCatgAgfk6L+2CXJ3Aj83u94GrOhj/bRV25Waev6q3
 2ZM0zOGOL3uTacVyTScA0582KuW0wQJHiL3kOeJA7levsJ8MrDMBZt+wu8SqJTXS1Gb+22eR6n6
 mmVHgDuIVOOfYS8BWhSNSiQg6F16MhwgWLMU6Au9+5ON4Rr88asZQTzq3F19IRO0vb7X9n/E
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=682402a4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=j9zjN4cs5acD8dv8RPMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=808 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140021

Add sa8775p cci i2c support in dt-binding documentation.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b24e574bfc6bd7d8908f2f3895e087..117e9db86d0e1b3cf7c5366860fb56e8e72a4059 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sa8775p-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -184,6 +185,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sa8775p-cci
               - qcom,sc7280-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci

-- 
2.34.1



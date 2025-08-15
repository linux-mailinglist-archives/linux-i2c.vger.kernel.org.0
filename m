Return-Path: <linux-i2c+bounces-12301-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC0BB279DB
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 09:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A404602EED
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 07:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2E52D8DC5;
	Fri, 15 Aug 2025 07:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jOMex/8E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F83C2D1308;
	Fri, 15 Aug 2025 07:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241675; cv=none; b=MLQNNZLQWYh4yhhnFeuosSW6YImBVvXTAnDokmooDJfojgUuT6IXVjvB0LiM5BL5LlP2XaMpcmzov7+FtxS27rB+k4UAqjIEJio3r7lVh+72Kzau/BG/AibVOO1KAIYmo/zWfilQF8DdHl5zB50A1YOv4Nkt9VUxoSdKN48Ut68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241675; c=relaxed/simple;
	bh=1rBLFt/o3l+119jTHyLS81c1LLFB4KrnS4rEVrrZGAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QIkU7VLoeXnN060LQpPrRfgGL8MBfpVgzvjJmbNFLHhA/yNbnveP9LzH/mTLjmLwSay8YllaGR4ukvLCO1xVvn00J7Z8/ndSqrvzb4MI9CxGSzA00NKIzFWuxc7tPMRA1N4tQ/XnTHppkGfIdbOLD0HBePSXcl6GwkODq5/SAMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jOMex/8E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHO1Nu020573;
	Fri, 15 Aug 2025 07:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vlwn0Qrd7i8NzivMoOV+Vfx68aDUPj8SoMKdCOEHxog=; b=jOMex/8ELdcvLVn2
	eM+kg/oi2wgUj4mHICSn8rI6DgUI/yPFcD9DjGeI/1zxwhOT5kNqlZhGxn81sIzg
	YoPYtPl65ezbbMyvANPYaST0VJgonEvC7/2RQJQcVsxz1xv3qxh7mcXJE2fm+3co
	ESjIz2QfjXL6ufAmSJgAhbeHcsvstiF6aQcHwu7VUsTkaqpQfDHYgxliC6UluVfg
	+R/100SEsAdeotaw36GIOF1unXt4lnVmIX2qVytj9chdyYGow3h0ZC6Off4gi3vu
	+gfeU1XNiR8xgPDVo86QfcfpwygIRa1y55qpM54f/za24AA+3KOp77pBLrMMP1xl
	gjbVTQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmj7w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 07:07:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57F77n1v016970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 07:07:49 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 15 Aug 2025 00:07:44 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Fri, 15 Aug 2025 15:07:17 +0800
Subject: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document sa8775p
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250815-rb8_camera-v2-1-6806242913ed@quicinc.com>
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
In-Reply-To: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
	<rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <vladimir.zapolskiy@linaro.org>, <todor.too@gmail.com>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Wenmeng Liu
	<quic_wenmliu@quicinc.com>, <linux-media@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755241658; l=1017;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=1rBLFt/o3l+119jTHyLS81c1LLFB4KrnS4rEVrrZGAM=;
 b=W97WdfXpfGLlw8to6iOXtW5usnIe4wMj6DVb+HbD6xrLHyqw71h5Qnu+/jykvaJalesUDJsF/
 XpBQ/r+X4/nB+DNTkp+OPMCfu76qIWa5IZdLH1u54asQsi5mZ5G6NOC
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfXxdJ88TWheqHi
 EZk/4Qe074l3dzEBpJ+NLr6uQJFDn/CVUvR25Nulus27eOWRY+uYT250smjpumtmXBYT+C52e32
 kpZQ1SV1WYmk3fbvHvN4w0RnYorJ53KzbjgyMSXDy33rt7r/UxNVE9OYNcFZfsxYQbldk7Mlu8D
 1CwziFGwpyYMytuo+giNV1LKaVj756iwubwBKKvCI1OrfFFsJXIYNqT3maF+8jEWJMhItlmTUIT
 dC6HaWyB2P2oNSDfq1KACjCKMEjYLoofSHoeoX8tJ8SpuzyjppuNqruSU7QysEmQgt1FdB3G0ku
 /lfrChsVZXO4mfkRCStEcqnNvFoSZfUMy46JDMfpvqffRA8/mNaQy2g8YPHQAjp9lpCMycn3Iu/
 a1yV8ahD
X-Proofpoint-GUID: mX4F8Cziit1BUcXNvSauRcijHobPCfVm
X-Proofpoint-ORIG-GUID: mX4F8Cziit1BUcXNvSauRcijHobPCfVm
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689edcc6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=j9zjN4cs5acD8dv8RPMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

Add the sa8775p CCI device string compatible.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b24e574bfc6bd7d8908f2f3895e087..54441a638da2b7feb44741264810d7a0de319858 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sa8775p-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -223,6 +224,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sa8775p-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1



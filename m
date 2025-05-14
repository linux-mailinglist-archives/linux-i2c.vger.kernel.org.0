Return-Path: <linux-i2c+bounces-10972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD302AB60CF
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 04:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 948AC863A90
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 02:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2AD1F2C45;
	Wed, 14 May 2025 02:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hNbcbcI8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90051F09B4;
	Wed, 14 May 2025 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190438; cv=none; b=ERr6XwbH7MQ6QNVyfaIvgPCGIvInuNSb8gPcFJWryx8yjVMy/svFtjFIK9ZBah6TDJoiCI+aYVxjkwlxOGiQrW4tjwKiCUrZbnZw1qdv13mnAp3jsJTwofAVUGPFgq7dY2QGbIB3GiomXDx27w6ZrM60JKugeA/gA1+IKtY6odE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190438; c=relaxed/simple;
	bh=WGzxwlleSpMtXa4TjPt7tQ2fMUHfHnh6IWrBrG53wvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bagY8SQszIX49V23I233WnOAd7uMSJwGKgLOT7T3TNDQP1N7PjQfWmkPsDxBAX7RTguHeiDc43+cBcO2xkaBloaLUlB8pXjfIuJ0wLsH8tTy+8aKE0lmqC4H+OD0ltzBqylMbqOHQIoCWZH4hIKuPQ8IKTwyJbQkpM/+d2jg5v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hNbcbcI8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E2TKSl029280;
	Wed, 14 May 2025 02:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qq6pGqs1db+G2HaZNmGH0Y/39ZN2n7lBeg52tvvvXUA=; b=hNbcbcI8U/S0hk7/
	s1FZcDXmRZF2WeNudIF2moJB4YMDwYWPSz4tUAF7s0ljcnx7DHKaNSG1PP4F9afj
	vbQExbqMmjJ7N0773CGeh0X1LDzOIcu2I6EHxWTRMZVjl67AD70o6VeIfzD3MsIT
	v3oASBIoh1eNYiPEMGbTl8VXEgJ4NeoOxfALvV0NWdsrGYp/z0SnpAGmNddoRVGL
	teR3iA/A/9WJfHLbuUSFx6ZT6T7WbuWpHOZtp2p0GdgMj7s3C+nS9OrgK+yeACY9
	l5mk1TIlVClkt/RfX9OfMtn+t+5k6hNUTvo9ZkL+DlMKeFfHqhjTu+hJuUnIBEbA
	wHLcow==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnh3cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 02:40:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E2eVlp017871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 02:40:31 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 19:40:26 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Wed, 14 May 2025 10:40:05 +0800
Subject: [PATCH 1/4] dt-bindings: media: camss: Add supplies for
 qcom,sa8775p-camss binding
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250514-rb8_camera-v1-1-bf4a39e304e9@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747190420; l=1477;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=WGzxwlleSpMtXa4TjPt7tQ2fMUHfHnh6IWrBrG53wvA=;
 b=SmrEnHcgoC8oXaBFEY/NwfC4/pK7J8i9VpbdNicNpNkwpFRMHNaf4vkY3eh7kzONFzlK+/JSX
 7zbhTpFS1jEBr81QHV6iazvyTLYfSk6EetVnTbYBN3CMgO3fjAGsSlf
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EdNG56kVDG5AUYMNtjnwj2h82-LQuDuH
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=682402a0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=DWEDUMGyp3iBkMlHoF4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EdNG56kVDG5AUYMNtjnwj2h82-LQuDuH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyMSBTYWx0ZWRfXxWnit9/Ja0rJ
 Il379+KwumQz8HozIjQ+8HpOnnbg6C0TQNgmBseT8yVSVDtMIPD/TE8DaZ9eMe9W/eVuDbtp/Zh
 skNxa9tSd6TMOFxmXaA1DKDAzRChx/4PUYRgaXpiLX62ywJSFB+ddcL0n/uJikF+PeKxDilvk4U
 L69PwlT8EuW4Pdh1A3swZz9HIuSk7zv3qQNvzPDmas4SpjISabKQcmStl6ZwXXj8L6GWLXFn/y5
 woTPn8OObwyKfhdGTpnxxVUY4+ishg5VbSr5HysQ14IS1VGdF0I9m7gAMKNf1DXriN2Hh9indiW
 M/lE5rNIsj5HfSqbQq2Jk3n1CyUy3Kn8hpEVL+d5pSKxj3UDmFOHKZgjuuG+xuD88gbCIZVOCJn
 bZUzk8xQ6b7oFgCb64XTlWlZDyYPVdvWsWGwHdQZU+oWtXbwpbpQmvU1SGn6ULZAWH/c9BZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140021

Add supplies bindings for qcom,sa8775p-camss.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 .../devicetree/bindings/media/qcom,sa8775p-camss.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 083e1193c474265edb445dd30717360de57ff986..aba46c0bc11faa062199f563602494bd2f62367c 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -125,6 +125,14 @@ properties:
     items:
       - const: top
 
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -164,6 +172,8 @@ required:
   - iommus
   - power-domains
   - power-domain-names
+  - vdda-phy-supply
+  - vdda-pll-supply
 
 additionalProperties: false
 
@@ -343,6 +353,9 @@ examples:
             power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
             power-domain-names = "top";
 
+            vdda-phy-supply = <&vreg_l4a_0p88>;
+            vdda-pll-supply = <&vreg_l1c_1p2>;
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

-- 
2.34.1



Return-Path: <linux-i2c+bounces-5905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5D1963FE9
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7696C1F239DC
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5ED18D622;
	Thu, 29 Aug 2024 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kP6wH/9D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4F315AD95;
	Thu, 29 Aug 2024 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923564; cv=none; b=NB7ggBToNFBU/fZY8rTWWZ0lU4rTkA9U1on+CX8Xt7ZLSngx8di1RiL9UtErW7F2K16hbxBibx8f7jXheQhYH0IVc0ErwXYLpjplRTfxq1TKHqzP/EwOkF4LBHybOgpGQT4KOSgO62kUI+E4KngSVsHpjRs8U6REY/w/gwPorFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923564; c=relaxed/simple;
	bh=CBQIHkPzJ4F44epoWM+CpzgXbtOAfD3mj6lHqqH/rGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XVXEtEpPkTQ2PLyuusAuviWuBm8/WE3gGp3UjSr/L5p4abDPriaOrHU0w3Oc93HlICWA91zhofAe1LEzQt1zOc2DTDZV1d2M6nPsdRGFLB6fzOR0HXiGI+drKx0eqJ4XmOTR58UCP2MeShz1ZaNLb72VpUqLkZaBK7hoYvgMs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kP6wH/9D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8swTD010746;
	Thu, 29 Aug 2024 09:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WYXJAZpo3jZ
	ZZ+drIG82WaiBgNhIJ1u2LrtITFuOKYA=; b=kP6wH/9DtF71n/DZjaTKdVj55K6
	I1LIYqFnQ7H4HZtvAtz+73KhGd76KhaBjToroSxi7vrngDXNAp3jVpiYmut+7kqO
	ArOgDWt22oMYfqEh8SveSO+tjOWb5MkuuVk+ibWFGclnb2eAoZjhMg7qUBZ+NG/f
	UqSVZI7IJ7sh75P/FLPF+laLJ1PCrmBnjCiV9A73v8BSlGforXM8nwhoTWDeP0Ej
	C4JLCYzyHhQCBOF4vs0kLoWREiM8q0svyF+tR29ntXgAo1zSJmG02xSrZ2nUHh7g
	TH9XAPkOvtSkW/9PdIlmTXoN5fJkrtzJDV/hF7OZPQKTTHfD7ah61+trIUQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0cnpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:25:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 47T9PuG3018853;
	Thu, 29 Aug 2024 09:25:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4178kmcghx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:25:56 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47T9PtaI018847;
	Thu, 29 Aug 2024 09:25:55 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47T9PtF9018844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:25:55 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 7D412242FD; Thu, 29 Aug 2024 14:55:54 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
Date: Thu, 29 Aug 2024 14:54:15 +0530
Message-Id: <20240829092418.2863659-2-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FuJOg8x8BfqWFpfCyHDGYV8lhStyWk4n
X-Proofpoint-ORIG-GUID: FuJOg8x8BfqWFpfCyHDGYV8lhStyWk4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290069

Adds qcom,shared-se flag usage. Use this when particular I2C serial
controller needs to be shared between two subsystems.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 9f66a3bb1f80..ae423127f736 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -60,6 +60,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  qcom,shared-se:
+    description: True if I2C needs to be shared between two or more subsystems.
+    type: boolean
+
   reg:
     maxItems: 1
 
-- 
2.25.1



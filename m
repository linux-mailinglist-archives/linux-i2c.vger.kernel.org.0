Return-Path: <linux-i2c+bounces-6073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47AB96AB35
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D78CF1C2325E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB1B1DA2E6;
	Tue,  3 Sep 2024 22:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RryLYapS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B38A1D3195;
	Tue,  3 Sep 2024 22:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401020; cv=none; b=kJjBQ8ytdT92G1O9QVV2gkXdzTm5cJeJYQr2BhFo/iOWMa6EVx+54xzLqFgL2nxU9dLzbAlZuqERdguUl2o7kZApE2n6q0jVTcUXJb0jGPozMDQPKNmMMbG/5FU3VU8SLt/V+CImFK2Dk3UbEjq0mOHM/zYAHUHQFHIahpAC+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401020; c=relaxed/simple;
	bh=7okqX8lCJBS28uWuLx9SMn4ZB7weDnq5be9eUoFQLdY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TNtaXMc2Zs279Pvhkh32vPmGLjAqYVptn6XDR9A1b6kBkIfsdzVRWs1kAAnoKCxpZOS+BUQV2tNZvE9SoA3mzndg7dZZmGGa4TT0wJCYNfc3YJW66g9I4FyCH5TU0Qx20itbbamrk32EZoC1b248OAUUa8xWaEl2EPpHR03IOs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RryLYapS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483D9ita014377;
	Tue, 3 Sep 2024 22:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KapmiVuK6V1ZcxtQrClKRJXq7/7PV8kLnrk/tH7HnHY=; b=RryLYapS49iYswUm
	zz7mKb/BCx3YYlxikijKE4HrlWM2jz3g5tofk+balkMcBXX5RaFXeSJisP1heuoD
	bp6sNJE0szGY1C1IethddEGGSVgLGjkbEzH0JxUIY8U+bwe1JCfl66ZFkf6osQp3
	3PIq4vLTmkjYeEVyqZh7ncyK67ptdACk8rm22X28ARAFadOjPYwHKFTMUxSYcHMM
	ITr6kApqFNhvKHkq2xsU8eWoTUyFKrU29eqVie0eTomcilKUDLzX0/rk1+ROEGpT
	d1444Uz98e83kpDjzia0ghMXQoT2F5NIQvrYZBwzgjpsFSHABm46RNoPtxR9X+mk
	9G/nDw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dt69aygw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 22:03:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483M36t7002527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 22:03:06 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 15:03:01 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <quic_nkela@quicinc.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/21] dt-bindings: interrupt-controller: qcom-pdc: document support for SA8255p
Date: Tue, 3 Sep 2024 15:02:27 -0700
Message-ID: <20240903220240.2594102-9-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903220240.2594102-1-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3ZU0tzvB331VJlrmYgrnl0Qms_L9giVt
X-Proofpoint-ORIG-GUID: 3ZU0tzvB331VJlrmYgrnl0Qms_L9giVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030177

Add compatible for pdc interrupt controller representing support on
SA8255p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 985fa10abb99..b1ea08a41bb0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -27,6 +27,7 @@ properties:
     items:
       - enum:
           - qcom,qdu1000-pdc
+          - qcom,sa8255p-pdc
           - qcom,sa8775p-pdc
           - qcom,sc7180-pdc
           - qcom,sc7280-pdc
-- 
2.34.1



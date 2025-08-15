Return-Path: <linux-i2c+bounces-12300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD3B279BF
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 09:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 392D51CC0D27
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 07:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2702D063C;
	Fri, 15 Aug 2025 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PmvH2tbs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323602BE030;
	Fri, 15 Aug 2025 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241671; cv=none; b=czoW0HbPXqbWfy3QFOsehNSRijWL+DJNg/WJmhKZEADZ0jIhPdAUd5l6dhf6LQ6cbH1DTbtnZo9t8bEc8K5wd7KJ+0SFsTlwNUt7o+QBgdIaMhSbG1PXvrqmNrGNbFwTsVjAoZoCcfqC4DWR89j/Vh5YLL77ohIxSzLd3wxZEoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241671; c=relaxed/simple;
	bh=8z9gNAQPOCOGg9llxKiaSqdbeOZ5p/PpyiAKn1+7bKE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=qQtsaDd6Y3PK90wR7uEEVfKqixRyqbFwkb6iZxfSgD+yywlggMinJZdLhgKxHk8RIXo3KyXfMnSBwHHExoQXB2cYbiw0/cJV/0B02LkgFFhzUCd3ErUMITBx+H8B1dot1rIXeUlitpCj9EV4A+koRK2okymysuvo1+iDzt90Ofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PmvH2tbs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F6Un2p002766;
	Fri, 15 Aug 2025 07:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ctRs0FyFpKqQcnKOjLGhIX
	I4tGrV+8gL6x9+MxqQcsE=; b=PmvH2tbsGOM7PlC1I9Dzz5a+q6IXH3+9sFbuDV
	Z2lNb0qcLBiGExaxHxletcuTuLQFN6Yax2TNfO9CEdZWIbD7tIyhVayWq9t2+euW
	nlxUD/nLOBxuf7iGvKjYvXQcCSyQKT+PtA/73c/2cZsWGBhzetC8J/AvZjkK/Njv
	UgSRtDg0wGgLIaLrWUgQNoVa1FrstsCGNjrfAzayBE6d9KN8Q9nIdxin/FU/i0z0
	/svwaX9sgVzwD+m6ieeuPY5J+SbON46HM6Z2gZmJWcnArMOeuJnrE7C+vvepkey0
	yElG5FM+GQwgRv7h9bWlUP23lARbGlQZfQor/yz6JyQd34YQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdva8qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 07:07:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57F77iBn019025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 07:07:44 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 15 Aug 2025 00:07:39 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [PATCH v2 0/3] Add CCI and imx577 sensor support for lemans evk
Date: Fri, 15 Aug 2025 15:07:16 +0800
Message-ID: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXcnmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDC0NT3aIki/jkxNzUokRdC3NzU0PzZBNTYwsLJaCGgqLUtMwKsGHRsbW
 1AM4/yk5cAAAA
X-Change-ID: 20250815-rb8_camera-877517c45388
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755241658; l=1945;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=8z9gNAQPOCOGg9llxKiaSqdbeOZ5p/PpyiAKn1+7bKE=;
 b=ngy/keYU0mK3ZaDBu5ybrBo4zExrhy3knC8caCEFci/VjyfUctuDAj67Izarfaxi2j/WeFUJF
 W6+LdfXhoIWBT47/xR/m7j5AxAng3/Dl+0HsoCM1vedOlyywxiKEtwA
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689edcc1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=qaHc40WDI1yFc38059wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aMwhDN7Ok_76CxBf6vd0Y7YYd3v1vH_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX07A0OW/I0XaH
 wHSDLiK9pPoZ1BbDqTnXwwn10pDqZJ5v56q7g+gEEb3OO3V5RSR5I0Fci0ibmyLGJ/lgOLR1AAz
 //nwCMvsIMzYjiCrSe4xQpUMM7HpYxhFPMXmiAEp7Hj6VbKFLDok3IFD64erFc5niRKattI181p
 sd88BAePLJ9CXkSbCVi4M8oS1sl7HzoUwy8eZ1VfBsFXSlyA+RN0aHq/Stz+KM0E1au4+oepq9s
 FqZirEUcHyau0a1bZQJe73BZWz2RlTpsym2Rd6otMh4rLkpZJ8WdTkSNSaq2J5GIYU+G1/cE6aE
 JvincRIbSlfZNQg2g1sBIB5T9JHe4ePnm1GsQsIsyxPEU1qUYN2cLN3I9ugZj6IZyE97e2HxAkw
 YqBQoIzI
X-Proofpoint-GUID: aMwhDN7Ok_76CxBf6vd0Y7YYd3v1vH_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

This series adds cci definition and imx577 sensor enablement
via cci1 on lemans evk.

An example media-ctl pipeline for the imx577 is:

media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -V '"imx577 0-001a":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Changes in V2:
- Remove the patch that adds PHY supply documentation in the sa8775p CAMSS 
  bindings. This change should be submitted together with the sa8775p bindings patch.
- Fix the string ordering in the DTS file.
- Remove the source clock from the CCI node.
- Move the sensor enable configuration from lemans-evk.dts to lemans-evk-camera.dtso.
- Remove the definitions for CCI and regulators that are not enabled.
- Link to v1:
  https://lore.kernel.org/all/20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com/

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
Wenmeng Liu (3):
      dt-bindings: i2c: qcom-cci: Document sa8775p compatible
      arm64: dts: qcom: sa8775p: Add CCI definitions
      arm64: dts: qcom: lemans-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    | 105 ++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 268 +++++++++++++++++++++
 4 files changed, 379 insertions(+)
---
base-commit: f0d48d68b1e7323d253068c5d4f7b470c5e927de
change-id: 20250815-rb8_camera-877517c45388

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>



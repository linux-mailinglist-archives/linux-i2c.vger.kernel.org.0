Return-Path: <linux-i2c+bounces-12860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E97CB53179
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EC1D5825DF
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 11:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E1F31D361;
	Thu, 11 Sep 2025 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEFPD565"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA772DE71A;
	Thu, 11 Sep 2025 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757591806; cv=none; b=DwAvngk7eAJvMrbJonTh2Ap97gBkrd5vmZ0o9yVhXjPEn2k0g6L0w1saTs4cxF6aLO/2NXVPhL0KbaF/nPVuJFokh7u263D+QKxPu8/06I1wub+/U8B+z0y2Rq+DVZJnVvW1OCYy499r8dZAzsshTZRXRpYOZb6F9h0tsMLHkJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757591806; c=relaxed/simple;
	bh=dDQq2m0NIF9q5v/AH91n3Y/qTj3HHABR4CMry7q6hog=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=iG7O8lJJmHvz7xqyRAmOS8kd86u9RfwFGGC+kVo4QAuNHtBdM8ZzRYJ2TPfR+izh81wDRSsoO15wkXCe2D4u1N35yLipXM8HoQS6bkBXSnaL228lOuf4c25QMcs1pMarbz3SczxQdj3vZmawySJ55klCPM5icIT5Y88lFGBhs+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEFPD565; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB8qd0006957;
	Thu, 11 Sep 2025 11:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xprvwue5tYEduPTgGdX13d
	g+jCFuRqN6XzUwTUOoRjw=; b=JEFPD565gSV6pJMwyldCFYEWvoWiBOgQho7I1K
	/vWlIE1dNaiLwDv81Np/6BYHUmC6foIzFhfjhVxIOKMaAxCt25rN1d42wwoiqGV3
	AqeLwvHgtsX5317+B38ichKZZW9TxZ//Hm1pnknmq+2qfbiOuZjelnhe8ta6F5Mw
	VHm0D+I0K5BKV2eXK3a3D7tLaFKTzKmmFp++biJE5FyWBd10g9EGy6c6vZwGpHE/
	4WPfa8rmjwLZUiXdhXjvLXUwRXCQQ0wh+HwYJHs3P9vrDA9WQZLVlvN6oIX8YhJP
	lv8sQMwXCaCwrcqMOKG2sOJ63xthjJoJFZLc/EVmZu3f3pwg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8afesd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 11:56:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58BBudfJ004952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 11:56:39 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 11 Sep 2025 04:56:34 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Subject: [PATCH v5 0/3] Add CCI and imx577 sensor support for LeMans EVK
Date: Thu, 11 Sep 2025 19:55:13 +0800
Message-ID: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKO4wmgC/23M0Q6CIBTG8VdxXIdDgTx01Xu01hAh2VKKU6zmf
 PfQKy+8Odv/7NtvImijt0hOxUSiTR59GHPIQ0FMr8e7pb7LTWpWS6aYokYPiLfYAu0axY/MNa6
 SQPL+Ga3z39W6XHP3Ht8h/lY68eW7pyROGTWNgc5xkE7pc0AsXx/9MGEYynzIgiWxASq2BUQGa
 nBC2AqAtbADzPP8B1Bxtc/qAAAA
X-Change-ID: 20250909-camss_rb8-d79360f7f158
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
	<konradybcio@kernel.org>,
        <vladimir.zapolskiy@linaro.org>, <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757591793; l=2719;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=dDQq2m0NIF9q5v/AH91n3Y/qTj3HHABR4CMry7q6hog=;
 b=ArczBPTonlDn70EKvTiOEHjO5Jb5mAjyj2UeimJ0bnzavCwteqn9FOlS/NM9trr2Oertfg56C
 yKOD/yKOJmBCfnnKBLXmTAdb5j3jwI2Z0cucvKqmlgFZqgKY0wBjr/8
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c2b8f8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=_y94VVro8kQIZxOYGiEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vIp1v7fpco9wlONeK0NocrEQnQgTY9wH
X-Proofpoint-ORIG-GUID: vIp1v7fpco9wlONeK0NocrEQnQgTY9wH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX/ltSJF7kaWaR
 /lFcQkl0ZEhmYY7BmsaCUivCa25r4FfdlfUALShuYsxdgqlqObd0yLfXQwAbxbbTt2wgeU41VWG
 m4cAHNin2sqAoIAPDvCljG97KTv+/JlcHsXLwI7/Cbd7PSgeE4g2N+KiDKSXuyyOHcmkmDjagpI
 7uANxSVAPBK/OUjVzhe4KegPGsbOlUnb8Gm/5soSZJLakMlUOxnYkelNq3PWmm7PSG54RRUgIUF
 Ue5lJD/Ctu0nDkWG3WOJQRY5Pnq0Z9OPHc7LN+s+2PJj0nH4poomP3Ht9Ww4OxYUk1jre7cpcqg
 b94kx/4Efj1I/INMJHJQWp1F2dyU92y44XbIwa0nYycesrjijvaL1ti8sXEqwn3SmUlKoQl/Fok
 rd0Mb59V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

This series adds cci definition and imx577 sensor enablement
via cci1 on LeMans EVK.

An example media-ctl pipeline for the imx577 is:

media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -V '"imx577 0-001a":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Changes in v5:
- Update the commit message to add a description for the newly added file.
- Standardize the naming of the regulator.
- Remove the comment declarations from the file.
- Change to yearless copyright.
- Link to v4: https://lore.kernel.org/r/20250910-camss_rb8-v4-0-28f44e1880b8@oss.qualcomm.com

Changes in v4:
- Correct the formatting issue by replacing the spaces with tabs.
- Link to v3: https://lore.kernel.org/r/20250909-camss_rb8-v3-0-c7c8df385f9a@oss.qualcomm.com

Changes in v3:
- Revise the annotations according to Konrad's suggestions.
- Remove the enable of camcc, camcc default to being enabled.
- Link to v2:
  https://lore.kernel.org/r/20250815-rb8_camera-v2-0-6806242913ed@quicinc.com/

Changes in v2:
- Remove the patch that adds PHY supply documentation in the sa8775p CAMSS
  bindings. This change should be submitted together with the sa8775p bindings patch.
- Fix the string ordering in the DTS file.
- Remove the source clock from the CCI node.
- Move the sensor enable configuration from lemans-evk.dts to lemans-evk-camera.dtso.
- Remove the definitions for CCI and regulators that are not enabled.
- Link to v1:
  https://lore.kernel.org/all/20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com/

Dependencies:
https://lore.kernel.org/all/20250814101615.1102795-1-quic_vikramsa@quicinc.com/

---
Wenmeng Liu (3):
      dt-bindings: i2c: qcom-cci: Document sa8775p compatible
      arm64: dts: qcom: sa8775p: Add CCI definitions
      arm64: dts: qcom: lemans-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    |  97 ++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 268 +++++++++++++++++++++
 4 files changed, 371 insertions(+)
---
base-commit: 0292e5668a417d680b48901c0185bc191693c05c
change-id: 20250909-camss_rb8-d79360f7f158

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>



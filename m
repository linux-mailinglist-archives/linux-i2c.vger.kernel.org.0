Return-Path: <linux-i2c+bounces-12800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5606B4AA66
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 12:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1627F1882E3E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 10:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8A9308F38;
	Tue,  9 Sep 2025 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSrdNOfU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750CB256C7E;
	Tue,  9 Sep 2025 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413358; cv=none; b=lG0eTFinkajioFZRBBa2kzoCpWVds/cDX+hSPjlwE0/RreZRFSUb5bvE2NUYHIa172UYPAQ552GNa4m1kbGdD9lxU69Jdxz7hOZXMBPASZeIjhha1w3qnFhYtjAe4W9WCrPSU+qEHbZCWMWPwWEibCNuZSEL09BS/d8T81KIvfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413358; c=relaxed/simple;
	bh=eD6wq/3madOW8/kwVp2CH+4+jWHPF3U4a1TdJ9DICuQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=l0+j71B9OaekQmj4Qi6SDUhGck4sCy9qXeq9pW9bH5J5CbUNQxfemdi+Q7hDcXQFuqxgBb+2qg5chWvD/kHdWG5YS1ayzqv6h8xon+/gfGE8x5KZ2Og/p9FlhRnSUXDWxy3UYketIW/J0OXUebSa3qGungxgcTJTchd3TjmCiv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSrdNOfU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LU8i031528;
	Tue, 9 Sep 2025 10:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wiM7d5PIg3kCa7myi/zzPS
	D126ph+RF+nbLFILaiTVM=; b=GSrdNOfUR0YQ2gGr1B7nmex1FLsTAaBsC7ZTHO
	dhgDwrJWsRaWV9k2ScZeHZFZIHifG+Dod3K3VdEJsOx592NH4Mj1pIp7oL4Gk5Xw
	TRRRzS7bVRtaC/fonuA5lkHFdHzS4poqLj4WuzMsXWqWwFWQRVNV/0b2zJhrUyOw
	K9ZiZr+tgsxHBqGYwjf6PL3+SzlIEpk78yuvdf41SAItyDbDgSjP/bSgIpT7H0R1
	YV2ElCiwj99Yk72MFxFmHHRrQJwW6uKUMrHMxtP5cr7JdODiSd0h7wW3eWJk4Yvg
	JFZ1j5mSHx0cDXaHVCLdOOZqzsgMe+5bZBoEK9+Vf1ro1RbA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws7yrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 10:22:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589AMVic019496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 10:22:31 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 03:22:26 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Subject: [PATCH v3 0/3] Add CCI and imx577 sensor support for lemans evk
Date: Tue, 9 Sep 2025 18:21:55 +0800
Message-ID: <20250909-camss_rb8-v3-0-c7c8df385f9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMT/v2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNL3eTE3OLi+KIkC90Uc0tjM4M08zRDUwsloPqCotS0zAqwWdGxtbU
 AwiiFwlsAAAA=
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
	<konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <todor.too@gmail.com>, <vladimir.zapolskiy@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757413345; l=2235;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=eD6wq/3madOW8/kwVp2CH+4+jWHPF3U4a1TdJ9DICuQ=;
 b=3o7KBVePebJcGn8fw+0R4pHPQCNPzIC4nePsD4/8TAyXeQeVwS6ers/OWXeMR9sxKszd9Njf8
 dsZa/QDE34JCoEB92sRZRaXhRQRQEZAAfLhdFYbbyrHUz6XZ8jj+9o7
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sIZ8FWfYh_SPPmaQ2AfGsV-HxOC4Qgb7
X-Proofpoint-GUID: sIZ8FWfYh_SPPmaQ2AfGsV-HxOC4Qgb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX6DSZpb+LTu7D
 0tXLONyAIuuXx/rCcWRLIvS3u7siax4f8Mw5F9niijOlWqwM/BQ3q/f6p6ux+EpoG/Af92rSm8D
 N9A9ko/lMrh63+Fi1BgVuMUoBLPSuBA7WndnPdpxyjcrVxnU1f8AFa6GlGdkdtR3pfIur7+El6X
 lZ97w4EZ+a9jZc7O00x/fn+pDQFqKs1Uy4bnlLA/aHab96ynyWOng5K9i9xiiqPgSaOti0afaSk
 S9zBgdw60v/vWqBgbyma4WWeF4VpfL0LLJysq4qP/LVGvWkqOy6lBLUL0flj2qQCQ+97spjTFsL
 toxKlVCKV+qAKyt/xmZAnSJmFb0OI4M2xWnpDThXkqm/Zkd8l6KvNhQeYm9SVrFzWxCFo4tcpX7
 E0rhM1iH
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bfffe8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=L1m54Ubpix6UO_NYMN8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

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

Changes in v3:
- Revise the annotations according to Konrad's suggestions.
- Remove the enable of camcc, camcc default to being enabled.
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250815-rb8_camera-v2-0-6806242913ed@quicinc.com/

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
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    | 101 ++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 268 +++++++++++++++++++++
 4 files changed, 375 insertions(+)
---
base-commit: 0292e5668a417d680b48901c0185bc191693c05c
change-id: 20250909-camss_rb8-d79360f7f158

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>



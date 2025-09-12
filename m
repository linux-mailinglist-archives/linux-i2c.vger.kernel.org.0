Return-Path: <linux-i2c+bounces-12922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 329D7B55317
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 17:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA9305C3A4B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 15:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADCA1F8724;
	Fri, 12 Sep 2025 15:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fwReBDT3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76617155A4E;
	Fri, 12 Sep 2025 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690445; cv=none; b=OO8gSy/VJ4NfqnS4xj0uYAZ0waA3cC/Q4TPBIpz4MAZFw4b+hHtuMIaR4zjsKvPpMOU+s4akRyQgqeJsakL3p87TXNN8WTWWlf7yaqPo+JHt+57ItX/rEoBhjt28zBxtp09qno3cXKRvXROTo/2OX8hjFQCh2hKb5LmOcoOMisE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690445; c=relaxed/simple;
	bh=xZzYJkY5+BPu8nhsq2Vxr8JsTXsHcdiu4vz2GCkN4is=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=SqGUAO5LQuRjyjyPvlFLyOXYnS9Z42+yiqKm2607AZXq3qq6FsnokfLfsLDpxq8CHfOC87awvn1MBj5dxC47xC1cpUCIawV6MKtMSQfOYvnWcNkK5AT585J/AwNVSE9VuiFocw6yTYAYnuJKGjh4W/kj1j/v8eNkxjzpsMrO69Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fwReBDT3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fK26009098;
	Fri, 12 Sep 2025 15:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sHKPPnSvH1F6TrTCK+xv/K
	7fVY8XrcbcHghJwh4o31I=; b=fwReBDT3jTkYtn4P30zTdCIGGSDIzefhdwb/p+
	X2HrqDGV8EdcoeNuJh21+No8Ao+AgGqDgPBD4tFgCCjPN8kpp/3Xm+oAppvzGnpa
	zv9Z+cJOcO+qbqIutsEXk4M+oioroTt7WcZ+VhrJqs+HM8bxxtCLyNaiL6s2qn8H
	T870m22L5XuLHNWE9evHVGyaJPMFpS9t+x8ZlIVRPZZQczPBqvvgHdCUPgJ504C3
	lwup0K5QleNEjZPIprO5zufA8rutUncYwfLGu7HsQTzn17pKVn1ULb44ZGe7kaaU
	NqIyIGOwssedcDg2WeplpcNswU+4vyD40jNEZle6eIYd25Fw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj140eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 15:20:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CFKcTY026177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 15:20:38 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 08:20:33 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [PATCH v6 0/3] Add CCI and imx577 sensor support for LeMans EVK
Date: Fri, 12 Sep 2025 23:19:24 +0800
Message-ID: <20250912-camss_rb8-v6-0-c9a6c3d67392@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP05xGgC/3XO0Q6CIBSA4VdxXIcDBD101Xu01hQh2VIKitWc7
 x56xYXdnO0/O/t2ZhS0tzqgYzEjr6MN1k0p6kOB1NBON41tnxoxwgSRRGLVjiFcfQe4b2RVE9M
 YKgCl+4fXxn4263xJPdjwcv670bFat3tKrDDBqlHQmwqEke3JhVA+3+1duXEs00ArFnkGUJIDP
 AEMDOeaApAO/gAiB2gOiPUD0oDmmrFe0h1gWZYfhM4swCsBAAA=
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
	<konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757690432; l=2891;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=xZzYJkY5+BPu8nhsq2Vxr8JsTXsHcdiu4vz2GCkN4is=;
 b=M32M4vEJdNfNDjWK6XRcxOwMjXpJXWTEX4Au+5JSgJ9HmTJuHtE6cEiFJ2TutrcjcAtLd44kN
 RHZOM5pdbSMAWnCwESpVrKR+15LFGCCFnp5adJAb9cOuXGa2/0p/DeH
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iyoXx6VxzO9tlra2WgF-jCdDgQh-qbiX
X-Proofpoint-GUID: iyoXx6VxzO9tlra2WgF-jCdDgQh-qbiX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX06/YUA0IWe3U
 IZzth2vis6cLA+rqnWPz6wYAgVfJ67AJquVGGBcRsGGjP0nnP0tB8t5znZ4F3PKQ30n0x5ijLG8
 atPbHlJZjcCq1CjutNrTdEgVlP9LVlN0Bqy0VJTxtZ7sS0HSmiZ853/PR1hZqQVlTEhfZOC4Z+a
 UnuhFWKN7gQuoya2hBJMu6WC17GUa0IYSAGQCAkJ/R2DUcHQljK+LVzTXaJz9GW0rvQ1mAZUM8p
 JMS135Rnz1j8cBvjBGEP9e3pPxCh7BkpjZgwt0JuyIpFViu0LHyDXSpqEJ/5WKB2dIsIPGnoX/j
 skBGfteZCIfKxZRw6vln40lDqTh0o5jtv/dHoF7+/GJJqZnRyK48sdZg52Bu7LVqm5eOIw2Uevo
 YQEoa2P/
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c43a47 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=_y94VVro8kQIZxOYGiEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

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

Changes in v6:
- Modify the DTSO name to make its meaning more explicit.
- Link to v5: https://lore.kernel.org/r/20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com

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
 .../dts/qcom/lemans-evk-camera-csi1-imx577.dtso    |  97 ++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 268 +++++++++++++++++++++
 4 files changed, 371 insertions(+)
---
base-commit: 0292e5668a417d680b48901c0185bc191693c05c
change-id: 20250909-camss_rb8-d79360f7f158

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>



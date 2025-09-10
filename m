Return-Path: <linux-i2c+bounces-12821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCEAB514F1
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A09B47BD9F0
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 11:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F11317707;
	Wed, 10 Sep 2025 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGeaF/GH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B608331064B;
	Wed, 10 Sep 2025 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502415; cv=none; b=Y/6oKixbeGj7ZfGch+WMi2vnXf3rFHZGa8YE/s+/I/MYDClo2BaKQHVTMFbfaBbwXuakm5tJtJ9yrJe0ogSZLJ1QLIVKBcfVU49cJYVwnnsz8VHqYe48D0TTiiFeoan/5HcvOepH0oJUEV2xJglZfpJDyVNgLFb/Mal5A2yP0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502415; c=relaxed/simple;
	bh=qt5sSLI8mEL2xDASgkEbhwWOO/rAUjjLi4cBTEJnCHw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=A82DrNTMClr4AJlkTyjW2JsBRFiPYzNyD+4MH4qRZw8OR7Nd/Kh2vxJtH03gwp2h9Vq4i8iy41c78/fokr/o/Nzcxwo2PbXRHsYaXr1MAdAxMAksmlZbgsTWftM/X02/C/UZAZbamfy/b70fMqVGKDf9kqgiIvpHEGVzQLusPz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGeaF/GH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFE8Z012504;
	Wed, 10 Sep 2025 11:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o8Yyrm2oQhPPsXlJZ5n+1l
	vn6Vg98FlNvPqZypR2fvQ=; b=UGeaF/GHtIk/Q49PUCQXE2OE5dW17MhxPSlEcV
	HX+6jncKbGCaOagh10kZtbIj9UfUhrVjshrrq13I6cVBfvVOHeY18YJzUgwdY922
	296MHmULPAKRXHzV136fs9HRj7YbgI97YkcmvkZ56mZdBZbBuWLAkxSmDt+9Gf4t
	Oap7f4im785xdGMqssXMg0HlkTFZKrkUn2FoF5RcWNqW+MgZOxJdz/NTDLvvx0hq
	JjQoOJ3E1CuL3pTmSVINbY3GlnGrLAD54kcoHmi2jKDV+Tnk3Lc3oDCgxXUzTes7
	+/aUouPPhz2tiKJZo+DPrYF1uLd1mxXmeABm8iAqyVi95h+Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsbqu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 11:06:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58AB6lFX014561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 11:06:47 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 10 Sep 2025 04:06:43 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Subject: [PATCH v4 0/3] Add CCI and imx577 sensor support for lemans evk
Date: Wed, 10 Sep 2025 19:06:20 +0800
Message-ID: <20250910-camss_rb8-v4-0-28f44e1880b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK1bwWgC/22Myw7CIBQFf6W5a2mwiIAr/8M0BnlYEinKVaJp+
 HexazcnmZPJLIAuB4dw6BbIrgQMaW6w23RgJj1fHQm2MQx04FRRRYyOiOd8kcQKxfbUC7/lEpp
 /z86H99o6jY2ngM+UP2u6sN/7r1IYocQII61nknuljwmxf7z0zaQY+zYw1lq/umL5Z6kAAAA=
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
	<konradybcio@kernel.org>, <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>, <vladimir.zapolskiy@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757502402; l=2403;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=qt5sSLI8mEL2xDASgkEbhwWOO/rAUjjLi4cBTEJnCHw=;
 b=e2h7ULgoYY4UNo6nVXnlHa6cm6uqxGKLAQ4LKYP9qxWa6XA6PB5de4F0iO0AhC8V66g+tqfSA
 HuDSKz8We+gCwuesuZJctNELPpQcTIC8kfhjhh/ARz8It1sU0DrWZnu
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tDE9MAU0XfPDrMZA43nRm7wywX48F8QW
X-Proofpoint-GUID: tDE9MAU0XfPDrMZA43nRm7wywX48F8QW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX7CTupzh5nYcr
 1vzg0jolMaLgq28UWCds8KotvDr2/0A8zpCHVgM5NQYVACk41xh2kPa/i3dSRfBFW0QNZwNL8Cp
 JJrK56WOFmRM3VVIDk4nhRM0mmsJPH8aBHceR5GHI6+XDPnskRFX41z7xEoq9qA9joY1pCCrdUk
 DwnYie9NiHoE5d71N4X7o1v5PQKFPI09j0c/F5FXYs811ePk/mkG27yovbmaUKuP3O+P53YRu87
 gVhh2YRqPae743qcG0bOEX1B6/qrYcTF4eKKLSQazVUPjFbyzuwhh7W3rkDvjAFWCdwUU+vsr3L
 06WL6Ol0JForbS8thC8XgBhMCRq7GEGv2Md1ZK2uuZLE/owJkgAauoqC5g25jpQ7amhCqEEVmaS
 8ZBLAGQP
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c15bc8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=L1m54Ubpix6UO_NYMN8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
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
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    | 101 ++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 268 +++++++++++++++++++++
 4 files changed, 375 insertions(+)
---
base-commit: 0292e5668a417d680b48901c0185bc191693c05c
change-id: 20250909-camss_rb8-d79360f7f158

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>



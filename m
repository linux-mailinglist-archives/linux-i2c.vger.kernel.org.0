Return-Path: <linux-i2c+bounces-10971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63591AB60C8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 04:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B2EC464884
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 02:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788801E5B97;
	Wed, 14 May 2025 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S0ry9eiR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC5C18E34A;
	Wed, 14 May 2025 02:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190434; cv=none; b=aezu2sf04/TGy58BtA41iD69QDRteu1nYoNCpYJ4QFXhmP8hiHk53T/jwk+9j/mCq4M3Gid8juBxo3fKIS+gAbD7xYL7LkKF6W02OLmAwCvkOyhFU3GHacylgyAGWvVHnXHrSdcw/yV5iiO3q9YfBeniSPO1kvZ7tcmHjIRmTH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190434; c=relaxed/simple;
	bh=Yr8heZhe7z1JJpysCkRpMDSLKG0TNdOZJhorCPIKf4Y=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=o2X0bZjmWr3XwkOM1MZl0TOGclBk1pxjjPUc+Xo3MhUQ/XWwSj6K0dbUJ390R5ploJc4PTJ5FFwa+0CtsQkXnMR8gv4/YTPOs3ygp2gnuPCRCtUw43RD8cnIigbvl3MVP/0mU52gYN3ApGfEMgycIKMFL9YfelM2ZV2mbYrTEp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S0ry9eiR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E1WGY7005917;
	Wed, 14 May 2025 02:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DzIBjDDZRftWNAQ7ccvkg3
	mWCSAVyiu+y329/h3DNkQ=; b=S0ry9eiR8tAVZ1LCFP2B+1bvRmmwO6ub86ArWG
	lqQlICW0VsBKjNEvHa/vyhhxKaOM8VXdGFmZ0qe8uPfoipFYpFKXLPmuIHjz6FD8
	WK4jyEsXr4iFgZLIYWplC1BYs3PbnMVErlONlqBLcVJImI1GI/lTPITIzJ29DeYx
	acuy6I8OIaN2iRt3XZyaerki0jzAKuyjbJ24XMRs8v+tOCGYTTDBD42G37u7epDe
	IjUK7J3lH2hwOtC2VRXNmWHII6mSGSFLoo1qGMjuIiTGd0q4d4E/JZOOxbBOljA8
	ppJPJY0R+BaJk7LKBSquq57DBAZP0/4pZvf9qSTeP0mzLxtw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcps3nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 02:40:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E2eQQv029658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 02:40:26 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 19:40:20 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [PATCH 0/4] Add dt-bindings and dtsi changes for CAMSS on
 IQ-9075-evk
Date: Wed, 14 May 2025 10:40:04 +0800
Message-ID: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIUCJGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3aIki/jkxNzUokRdczNLk7QUM8skExMLJaCGgqLUtMwKsGHRsbW
 1AEFZWJBcAAAA
X-Change-ID: 20250514-rb8_camera-7694fd69b448
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747190419; l=1361;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=Yr8heZhe7z1JJpysCkRpMDSLKG0TNdOZJhorCPIKf4Y=;
 b=+C7JZQmLnMZF9Ouyn38l9/8cZnHuwBIESY4+zTLQ2qWkjufyhI304sbbd9QfziuuJpI0MJ3ia
 Dqeq1mjx9yrBIK/1D/wvta1KgTUOnUP/Km8p/OC4AmCjuQu9OSFDlrp
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8DbIDZqyoSgBW8OipG5uWt3Spy7FkL6i
X-Proofpoint-ORIG-GUID: 8DbIDZqyoSgBW8OipG5uWt3Spy7FkL6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyMSBTYWx0ZWRfX2C65kEULc7rX
 Nl1f3nz/2nDKmoIe085ZkzvSl0dfLpbwMsnlXAVGb7C6FriY4BQ1HazhIUJx11z3EBSqhlgCFFy
 rt/adqgZ8fjuthdMUUbjOaA+hUg0ijHLJVT8R3j2Mk662R9Oy1C3H9RejYrArdhqB5XhFD45/KE
 spGSvZzZjJmZm2Wq9c92vZkP1fmSd8RJjMQC0dAgboh6D6SHfeNqJRoNwL5exNuOl4gR0+jTzWo
 Ibs304QJJ+0Dcp1d9LVQuMuxlnS/7y2F8/ThnwG8W6n6NRDd+H7IeP4VhLPEvE36TflH170wiah
 S1tU9HUbcglSBDrKQDOMMJ1optpQwzgXpswJpQoSwq2b11vm6AON6sSopvc4cK22tJiRFyj4LWI
 0TmY4vCPMYQfRq3N5rrnjRUlErG71dNSnmJOyV662XzO116yhTvAew+XamEpHJxtPJS1akFt
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=6824029b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=BZJFZCMOaDCHH_u3l5QA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=507 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140021

This series adds dt-bindings and dtsi for CAMSS on IQ-9075-evk.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC.

The IQ-9075-evk board has 4 CSI interfaces.
This change only enables the third camera interface with the imx577 sensor.

---
This patch series depends on patch series:
https://lore.kernel.org/all/20250429054906.113317-1-quic_wasimn@quicinc.com

https://lore.kernel.org/all/20250210155605.575367-1-quic_vikramsa@quicinc.com
https://lore.kernel.org/all/20250210162843.609337-1-quic_vikramsa@quicinc.com
---

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>

---
Wenmeng Liu (4):
      dt-bindings: media: camss: Add supplies for qcom,sa8775p-camss binding
      dt-bindings: media: Add sa8775p cci dt binding
      arm64: dts: qcom: sa8775p: Add CCI definitions
      arm64: dts: qcom: qcs9075-rb8: Enable IMX577 camera sensor

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,sa8775p-camss.yaml         |  13 +
 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts   | 110 ++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 400 +++++++++++++++++++++
 4 files changed, 525 insertions(+)
---
base-commit: c77f0b49aeee66efb17322db16934f21c7eacb81
change-id: 20250514-rb8_camera-7694fd69b448

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>



Return-Path: <linux-i2c+bounces-12570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93876B41809
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 10:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323CB3A2124
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 08:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72772E62B4;
	Wed,  3 Sep 2025 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MvTBX0cx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113C02E6CA0;
	Wed,  3 Sep 2025 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756887008; cv=none; b=BDignSOi6B7lcD6xJXmxJ9UY4w+5ZpZcYSFnzJGvVHGeQmIuTnsHr/nRmdAyhhiFuLGhCIseTTTcChSFJo96fp56a/ZBTmigSRGZJlplTvUBhd1zxV6XgFu2El9CT9o4coYsaPMhuujjxPBOk6a2KHMikuT5SWRFYxl5bwXEutY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756887008; c=relaxed/simple;
	bh=f/9KSlxeADd+BxcOEy0zzs31V+CRoVc1x4zWOR/cSWI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mxTs6r5ApqGQB+cPJPz6h73JBeDyHN+pmlu5LgJaY07Og78bUoafLQ+8KsRUEHZo7QUMGg7VCfWMqft0fZo1XJ8TP3g/BVvKTx6X6MNNq2sVpQiTaEjOgtNYWxSEayntOhO6uQJD+rWeLofLUmaQ420/FfkhcAG2Slb/6FhzPJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MvTBX0cx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832I63I032375;
	Wed, 3 Sep 2025 08:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iKvPFeCscjIiNJgRvronMD
	1fj4+R1j1QQGD4iniX5Cg=; b=MvTBX0cxcEDullHB8RH8RQhirjWdtYNtasKNT8
	HmjzbMtD17VNGutaObC1U7gs29eqLwIpkNdhxd0ej8tZX37kX6RwVyTChi62gRAM
	RDGFynz6EAuHkTSbk/y3pL5YgpxQOW2LPP7sELVBke0xfbn9IeL2NJI6U7dlbQ7B
	xX5g4MKliylgBMMQz4g2Hojg2bBYtxGeMTLG0RNwPtHUNwe1eq5YXOhbOrxzPChq
	cNR9mOJIr2D5jaSV4loYuxc5Z1bjXEXPIRYUOjpQBOHCLGrBcV27rP34orBDuQPX
	N6/DL3+DxeCiu5ozprSB008zDypUnpYRJBAZeHmpPEX4B0pA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8tqsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:10:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5838A2MR013520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 08:10:02 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 3 Sep 2025 01:09:58 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_vdadhani@quicinc.com>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add I2C support for IPQ5424
Date: Wed, 3 Sep 2025 13:39:46 +0530
Message-ID: <20250903080948.3898671-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XV9PT-qLq2p1t28IPBQK9kjVgghDLaUP
X-Proofpoint-GUID: XV9PT-qLq2p1t28IPBQK9kjVgghDLaUP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX+KqzGZfLCJ+K
 f/5o/kURTPpzq43Ezsx629ql/kyv34bQme6WPINFGePWPd2/GdKntTTYdCnUfft7QHc2UsHaQhJ
 3SaAxtomF88pwnV8G1zVI9ZLZQAWutJq6/8oy8Slg524kGZkRoaUpoTeVwPngrjNL6O4uxuyHuZ
 +vYIOvEbEp5sxUzsf6/LGuAqEBEQ0uPBRvT8Q9571lyA9fYL8ooNB0Ya7AruahAzdauqUR/Padf
 TmS4ok8vX37AtTUfc+KaFRdCvqgPDDpviIfsqM2Hqomq2mr/3pD9+FW4lsDeLB1et23mRboMaH0
 6bpRDyxas34b+a2OyFPOk/k6G/yQJ9J8upieXOFnoL6sXXdW80/4SNKHDIJfC5woeJWYcpY7oWC
 W11cCwPJ
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b7f7db cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=cJbgMxHC_RsU7aObswgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

Serial engines 2 and 3 on the IPQ5424 support I2C. The I2C instance
operates on serial engine 2, designated as i2c0, and on serial engine 3,
designated as i2c1. Add both the i2c nodes.

v2: * Remove assigned-clock and add opp table to configure the frequency of se clock.
    * Add opp table support in the GENI I2C driver and reordered variable declarations
      in geni_i2c_probe() using reverse Xmas order.

v1: https://lore.kernel.org/linux-arm-msm/20250711111418.3980520-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (2):
  i2c: qcom-geni: add OPP table support
  arm64: dts: qcom: ipq5424: add i2c nodes

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 28 +++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-qcom-geni.c    | 27 +++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 3 deletions(-)


base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
-- 
2.34.1



Return-Path: <linux-i2c+bounces-12791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36848B4A17A
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 07:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A70B1B25A1C
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 05:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05C12FABFE;
	Tue,  9 Sep 2025 05:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cb+wjxKD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1B579DA;
	Tue,  9 Sep 2025 05:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757396909; cv=none; b=MfsBpmqK8Ev/8sccse2QNWQmLIKiA9j3VXK8uLCYqqUPkAZ6KmegvcGrXUDoWdj3QLkFAkAdIMnCaRI8KRAgClq3fmCw8+o9/IR9WTTT6c1QXaxim8jnjwVV6skwuFt4fBtFRF50zNeS95SYmEHLlXMJdZISCEdRuY6F5WFUt8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757396909; c=relaxed/simple;
	bh=WINNx3eWJz8cAlfPPoawH5Z0jYMwElQz4sl1NcoH8P4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZNqpc7uxlyfb43K/Ai/ahJC+FjEvaNti9ijDJ3UOJbkSmotkL4LmyYddmnxf5FAi4FFYVqVBp37wO4A920bJ+SqH0Ur40REWnFvHhl+BjK7OhjPTyar2/Pmcd6llw53WdC+MyNJhSPmDbvTO4gIdlliFU32ttr+3An97SKQOoSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cb+wjxKD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5895aOam022902;
	Tue, 9 Sep 2025 05:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wWfrwIlqmFX5w8P4Z6jsOp
	gi0ADB2gY1JtPF4LC/2TU=; b=cb+wjxKDW4fCmpGoSfzJqbsi5SsxdaU8XaUPUv
	yvY6+ZlGKLdkZFn6abQxIzVKLGJg1AYakagyr1Rtmv8nAcIXOSSDlfiv/aCBCSaP
	b4OZZafTHKO7xqMlFGjDS5j0R5zEL4AUXT8pWzEMycK6rKaJQL5/IY5fAJW6uL4C
	KWR3IrBhm3ae0FjTaCVFDWHz8rqjLSQCMiUCqq8lsUjMH7crA5TtRV0LiWzgi14m
	M76tfpJGW4gimdBkG7mEVkCWKcNK7H9Q6z18XsYAhrFbM0Abtf1Xnw2J2cmojNSF
	tvUpQGWM2vI5T3OTGqnK52P8SFQKYyHP2RV6V0/pvPdh2y1A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kxx25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 05:48:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5895mONM003358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 05:48:24 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 8 Sep 2025 22:48:20 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_vdadhani@quicinc.com>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add I2C support for IPQ5424
Date: Tue, 9 Sep 2025 11:18:09 +0530
Message-ID: <20250909054811.3991901-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXxT9eC3YfEAPf
 QzfMhddvfV2d9AEErTEqcC03p3qCJtDpg0AKGWplh3bKC226xRuqkdq/OUxtetKVfrGmQHA7F8Q
 3S40gOglnKn8BKJBxcvhVw+62LJwRYiLhwh3K2IPBVshWjkDuugP2znS1tyiZPGEETzRbSGVsZz
 iZES8afQ17XK+ry+YLzrvf8skPVt21RqTP7brtbgWAiQ9OGnDh2uTMrburM2GxuZnD+sw9UPOVS
 ma3NUTRjHRzz5x7kPARIqz3rMLahZcgdUfFLFWmzAIiP8a00YKA5d9zpclViql+NfEMDcr3kEQS
 +7T7z9ol2j/57LQ7SFWhbv2yWgc/8N7Ii/ajjJ7YCw6bqaeD1GwvzA72api1x4cY5c35Ra6PMJM
 OB/n0EJE
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bfbfa9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=6LalJhrV3jZtuP9h-eEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: W289eeaIT9b1nHekKwVMLXu27yRqmK9K
X-Proofpoint-ORIG-GUID: W289eeaIT9b1nHekKwVMLXu27yRqmK9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

Serial engines 2 and 3 on the IPQ5424 support I2C. The I2C instance
operates on serial engine 2, designated as i2c0, and on serial engine 3,
designated as i2c1. Add both the i2c nodes.

v3: * Pick up R-b tag.
    * Fix the format-specifier to correctly display the clock rate and change
      '&pdev->dev' to 'dev' as per suggestions from Andi Shyti.

v2: https://lore.kernel.org/linux-arm-msm/20250903080948.3898671-1-quic_mmanikan@quicinc.com/

v1: https://lore.kernel.org/linux-arm-msm/20250711111418.3980520-1-quic_mmanikan@quicinc.com/


Manikanta Mylavarapu (2):
  i2c: qcom-geni: add OPP table support
  arm64: dts: qcom: ipq5424: add i2c nodes

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 28 +++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-qcom-geni.c    | 27 +++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 3 deletions(-)


base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
-- 
2.34.1



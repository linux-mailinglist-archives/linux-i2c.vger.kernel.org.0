Return-Path: <linux-i2c+bounces-8322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D39E3D96
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 16:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0793F280D11
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5532B20B80F;
	Wed,  4 Dec 2024 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LBz0K0Dv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8054B1B87CA;
	Wed,  4 Dec 2024 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324621; cv=none; b=VmJ3q8hXPt2YKgQjzYQYK/bYXB+IBnaXKG2AZN3UICuLbWqoM+E3uly7kbw6w4myK3vWUqgFDNkKXJv2yKG2IhDH9kSi5KY3aIRel7vYSUUIMRjCJwpiIefHkOSOpRHRObtDoasB8GK14fGolt3RlvyrG/GnjaZpJ1WHc2fGZMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324621; c=relaxed/simple;
	bh=RJZpRdXklt9afDLfyrX0kbFxsMEnivc1AyA4R+ZkLNk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mDNA7wP7gU+pMVhHMbI0rmEdbwtMMfc4RPtt+Vn9uIomo5l1yUe0BEpgIf6j7mFwDZacDG389x+z2YfXE5Lw9X8OQoxcWl20pwj6Bu+tNp6goJBbcE5OnZPgwccYPnc35K3SovkXwJYCRWkiaqy/Tg4gSSWPsOmnEwD0Ul/81DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LBz0K0Dv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46qpTC024061;
	Wed, 4 Dec 2024 15:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7pWlAWVrXj0TJ0a5lUMNguM4peO0VQ6AkqY
	khPgM/WM=; b=LBz0K0DvvSg8F4PGc9xipn8lwTgdzeb2v1V6eD61loGNM5HYrLu
	3sKeAOq4/NMoYmDrf61QLVuLn1oZpBU5I1cchQStx7C6aAadiX/SnzyO/0bfh8EH
	EPv8/WesRChi4XCkm/2G7Sa2QDuQLsTp/PQNFMnSRkhun2sPqckveRqbgXwMu5OM
	0oywPRvqDldH+beBA1K/CRcMdGz1qus8wvamncH5/AlLMOY+4XgDa56+QEGRdcWD
	chpLco2irFowrGuS22nsWDpVcnl+/LN82gEDLTgcARyQk3VuFn/FVMcRSH2U1KXN
	dM92KqV7aYthdxRqFQct9VbQ+YhygbZ16VQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnyvkam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4F3U8R025562;
	Wed, 4 Dec 2024 15:03:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 437uskx4tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:30 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B4F3Tmp025554;
	Wed, 4 Dec 2024 15:03:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4B4F3TWC025547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:29 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id EAC01503; Wed,  4 Dec 2024 20:33:28 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: =quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v1 0/7] Add support to load QUP SE firmware from
Date: Wed,  4 Dec 2024 20:33:19 +0530
Message-Id: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: Z05rgUxWlbQ_1pqq0XpWAVQkHOj1gUP0
X-Proofpoint-GUID: Z05rgUxWlbQ_1pqq0XpWAVQkHOj1gUP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040115

In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
hardware has traditionally been managed by TrustZone (TZ). This setup
handled Serial Engines(SE) assignments and access control permissions,
ensuring a high level of security but limiting flexibility and
accessibility.
 
This limitation poses a significant challenge for developers who need more
flexibility to enable any protocol on any of the SEs within the QUP
hardware.
 
To address this, we are introducing a change that opens the firmware
loading mechanism to the Linux environment. This enhancement increases
flexibility and allows for more streamlined and efficient management. We
can now handle SE assignments and access control permissions directly
within Linux, eliminating the dependency on TZ.
 
We propose an alternative method for firmware loading and SE
ownership/transfer mode configuration based on device tree configuration.
This method does not rely on other execution environments, making it
accessible to all developers.
 
For SEs used prior to the kernel, their firmware will be loaded by the
respective image drivers (e.g., Debug UART, Secure or trusted SE).
Additionally, the GSI firmware, which is common to all SEs per QUPV3 core,
will not be loaded by Linux driver but TZ only. At the kernel level, only
the SE protocol driver should load the respective protocol firmware.

Viken Dadhaniya (7):
  dt-bindings: i2c: qcom,i2c-geni: Document DT properties for QUP
    firmware loading
  spi: dt-bindings: Document DT properties for QUP firmware loading
  dt-bindings: serial: Document DT properties for QUP firmware loading
  soc: qcom: geni-se:: Add support to load QUP SE Firmware via Linux
    subsystem
  i2c: qcom-geni: Load i2c qup Firmware from linux side
  spi: geni-qcom: Load spi qup Firmware from linux side
  serial: qcom-geni: Load UART qup Firmware from linux side

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  11 +
 .../serial/qcom,serial-geni-qcom.yaml         |  12 +
 .../bindings/spi/qcom,spi-geni-qcom.yaml      |  11 +
 drivers/i2c/busses/i2c-qcom-geni.c            |  11 +-
 drivers/soc/qcom/qcom-geni-se.c               | 445 ++++++++++++++++++
 drivers/spi/spi-geni-qcom.c                   |   7 +-
 drivers/tty/serial/qcom_geni_serial.c         |   7 +-
 include/linux/soc/qcom/geni-se.h              |  17 +
 include/linux/soc/qcom/qup-fw-load.h          | 179 +++++++
 9 files changed, 692 insertions(+), 8 deletions(-)
 create mode 100644 include/linux/soc/qcom/qup-fw-load.h

-- 
2.34.1



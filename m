Return-Path: <linux-i2c+bounces-9164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A26FFA1B3FB
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 11:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EF39188750F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 10:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B0221ADA3;
	Fri, 24 Jan 2025 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SwdFc4Yy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50461CDFC1;
	Fri, 24 Jan 2025 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716010; cv=none; b=UJyO9OESnVod0nVxFePpa6F2sNgeeo0h2w0i6e1EG6i4/uT3VUIyiHR+EfeWCoZHaG0mK5MI/WQwIKl4VRAsXDh0UgESPOqWSVXLbG4ns9p9Tcj6q5qwflGqajDZnbkbyxLiY4bjod/7X+QtZiaPm3t+xhjlpDupBVsD5AOLsnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716010; c=relaxed/simple;
	bh=WVWjUCSc47y6PnPs/G9SHhPVzgiZqsqiHnmHFtGJgIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oR2zI71y7GGTj/9/EOueWuGBtcubnfre7QtAreO1/hO5kKLiEaTxA9abv8PrkneWuF0jDXgYY89pigLEZKi3Wq7v91Pp18rYPOUPFoU7usm7DydzrtPqq4XbRy5uC/MM0YKF842Ego8LmN7/Ds/YKTM6zDb18H31L9sMWP1w7GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SwdFc4Yy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O8bhZN031191;
	Fri, 24 Jan 2025 10:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Jy4Hvt7jmQzw8aWfAybkyE5v/OpYevXOZNg
	4OTxJEoI=; b=SwdFc4YyK8ZI5AXoGETOzgzR0Wh0WGDdIi+FLepxZFgtlvdg4P8
	Z/fCLLc4LDpDP3etEamRU+9VFlV4ICN5A3QwJwgtoTtZNjyxkqEzBc6jaLfHs4Ku
	gyUVbmpK81tmFiBjcPm/4cJgbj2YMrz5Jin195nuy1LBP0SY9MvlsXnrtKZ5HLeT
	qzmWqrAwQh1l/fAzQkrhdV2I+4DW2zl7hTZa4xL9gxTC8ZZ+v3qqDGlwuZ8AQmdD
	xbBsR0ISAPV4q5Zm8xI/3TAbxE8W9MAIpzEP2mkoXBQ+xcx5O+SSQXA1q/x46Jph
	xMD3a2Ny8/fjaLzjGX1/MlXguy6tNIPooVQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c7h50d8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAnGJ5013012;
	Fri, 24 Jan 2025 10:53:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485cm9h01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:19 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50OArItJ016260;
	Fri, 24 Jan 2025 10:53:18 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 50OArITk016259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:18 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id B379C55C; Fri, 24 Jan 2025 16:23:17 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v2 0/8] Add support to load QUP SE firmware from
Date: Fri, 24 Jan 2025 16:23:01 +0530
Message-Id: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Aw1mGwVMO12_ZGrgCsC6a4o1gNHkDmi0
X-Proofpoint-GUID: Aw1mGwVMO12_ZGrgCsC6a4o1gNHkDmi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240078

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
---
v1 -> v2:

- Drop the qcom,load-firmware property.
- Remove the fixed firmware path.
- Add the 'firmware-name' property in the QUP common driver.
- Add logic to read the firmware path from the device tree.
- Resolve kernel test robot warnings.
- Update the 'qcom,xfer-mode' property description.

v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-1-quic_vdadhani@quicinc.com/ 
---
Viken Dadhaniya (8):
  dt-bindings: qcom: geni-se: Add 'firmware-name' property for firmware
    loading
  dt-bindings: i2c: qcom,i2c-geni: Add support for selecting data
    transfer mode
  spi: dt-bindings: Add support for selecting data transfer mode
  dt-bindings: serial: Add support for selecting data transfer mode
  soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux
    subsystem
  i2c: qcom-geni: Load i2c qup Firmware from linux side
  spi: geni-qcom: Load spi qup Firmware from linux side
  serial: qcom-geni: Load UART qup Firmware from linux side

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |   7 +
 .../serial/qcom,serial-geni-qcom.yaml         |   8 +
 .../bindings/soc/qcom/qcom,geni-se.yaml       |   5 +
 .../bindings/spi/qcom,spi-geni-qcom.yaml      |   7 +
 drivers/i2c/busses/i2c-qcom-geni.c            |   7 +-
 drivers/soc/qcom/qcom-geni-se.c               | 444 ++++++++++++++++++
 drivers/spi/spi-geni-qcom.c                   |   7 +-
 drivers/tty/serial/qcom_geni_serial.c         |   7 +-
 include/linux/soc/qcom/geni-se.h              |  17 +
 include/linux/soc/qcom/qup-fw-load.h          | 179 +++++++
 10 files changed, 682 insertions(+), 6 deletions(-)
 create mode 100644 include/linux/soc/qcom/qup-fw-load.h

-- 
2.34.1


